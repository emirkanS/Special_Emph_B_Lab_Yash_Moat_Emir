/******************************************************************************/
/*                                                                            */
/* main.c -- Project                                         				  */
/*                                                                            */
/******************************************************************************/
#include "PmodTMP3.h"
#include <stdio.h>
#include "platform.h"
#include "sleep.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "xparameters.h"
#include <stdio.h>
#include "PmodCLS.h"
#include "string.h"
#include "xgpio.h"
#include "PmodHYGRO.h"
#include "PmodPIR.h"

#ifdef __MICROBLAZE__
#define TIMER_FREQ_HZ XPAR_CPU_M_AXI_DP_FREQ_HZ
#else
#define TIMER_FREQ_HZ 100000000
#endif

PmodTMP3 pmodTmp3Device;
PmodCLS pmodClsDevice;
PmodHYGRO humiditySensor;
PmodPIR InfraredSensor;

#define GPIO_DEVICE_ID  XPAR_AXI_SEVENSEG_0_DEVICE_ID
#define LED_CHANNEL   1
#define ANODE_CHANNEL 2

float tmp_degc, hum_perrh, tmp_degf;
uint8_t detect = 0;
XGpio Gpio;
int status;

void InitializePIR();
uint8_t RunPIR();
void InitializeHYGRO();
void HygroRun();

uint8_t AppInitialize();
void AppRun();
void AppCleanup();
void EnableCaches();
void DisableCaches();
char int_to_char(uint8_t num);
void display_number(XGpio* Gpio, int number, int section1, int section2);
void display_digit(XGpio* Gpio, int digit);
void display_other(XGpio* Gpio);
void print_temperature_and_humidity_on_pmod_cls(int temperatur, int humidity);



int main(void) {
   init_platform();
   print("Hello!\n\r");
   print("Successfully ran PmodTMP3 application\n\r");

   AppInitialize();

   AppRun();

   AppCleanup();

   cleanup_platform();
   return 0;
}

uint8_t AppInitialize() {
   EnableCaches();

   // Initialize the GPIO driver
   status = XGpio_Initialize(&Gpio, GPIO_DEVICE_ID);
   if (status != XST_SUCCESS) {
       return XST_FAILURE;
   }

   // Set the direction for all signals to be outputs
   XGpio_SetDataDirection(&Gpio, LED_CHANNEL, 0x00);
   XGpio_SetDataDirection(&Gpio, ANODE_CHANNEL, 0x00);


   xil_printf("\x1B[H");  // Move terminal cursor to top left
   xil_printf("\x1B[1K"); // Clear terminal
   xil_printf("Connected to PmodTMP3 over UART\n\r");

   // Initialize PmodTMP3
   TMP3_begin(&pmodTmp3Device, XPAR_PMODTMP3_0_AXI_LITE_IIC_BASEADDR, TMP3_ADDR);
   xil_printf("Connected to PmodTMP3 over IIC on JB\n\r\n\r");

   // Initialize PmodCLS
   CLS_begin(&pmodClsDevice, XPAR_PMODCLS_0_AXI_LITE_SPI_BASEADDR);
   CLS_DisplayMode(&pmodClsDevice, 1); // Wrap line at 16 characters
   CLS_DisplayClear(&pmodClsDevice);
   // usleep(500000);

   // Initialize PmodPIR
   PIR_begin(&InfraredSensor, XPAR_PMODPIR_0_AXI_LITE_GPIO_BASEADDR);

   // Initialize PmodPIR
   InitializeHYGRO();

   return 1;
}

void AppRun() {
   double tmp = 0.0;
   double tmp_celsius = 0.0;
   double tmp_fahrenheit = 0.0;

   int tmp_celsius_round = 0;
   int tmp_celsius_int = 0;
   int tmp_celsius_frac = 0;

   int tmp_fahrenheit_round = 0;
   int tmp_fahrenheit_int = 0;
   int tmp_fahrenheit_frac = 0;

   while (1) {
      // Run PmodPIR
      xil_printf("Running PmodPIR\n\r");
      detect = PIR_getState(&InfraredSensor);
     
      if (detect == 1)
      {
          xil_printf("Motion Detected \n\r");
          
          // Run PmodTMP3
          tmp = TMP3_getTemp(&pmodTmp3Device);
          tmp_fahrenheit = TMP3_CtoF(tmp);
          tmp_celsius = TMP3_FtoC(tmp_fahrenheit);

          // Round to nearest hundredth, multiply by 100
          if (tmp_celsius < 0) {
              tmp_celsius_round = (int)(tmp_celsius * 1000 - 5) / 10;
              tmp_celsius_frac = -tmp_celsius_round % 100;
          }
          else {
              tmp_celsius_round = (int)(tmp_celsius * 1000 + 5) / 10;
              tmp_celsius_frac = tmp_celsius_round % 100;
          }
          tmp_celsius_int = tmp_celsius_round / 100;

          if (tmp_fahrenheit < 0) {
              tmp_fahrenheit_round = (int)(tmp_fahrenheit * 1000 - 5) / 10;
              tmp_fahrenheit_frac = -tmp_fahrenheit_round % 100;
          }
          else {
              tmp_fahrenheit_round = (int)(tmp_fahrenheit * 1000 + 5) / 10;
              tmp_fahrenheit_frac = tmp_fahrenheit_round % 100;
          }
          tmp_fahrenheit_int = tmp_fahrenheit_round / 100;

          // Run PmodHYGRO
          HygroRun();

          // Print temperature via UART
          xil_printf("Temperature: %d.%d in Fahrenheit\n\r", tmp_fahrenheit_int, tmp_fahrenheit_frac);
          xil_printf("Temperature: %d.%d in Celsius\n\r", tmp_celsius_int, tmp_celsius_frac);
          xil_printf("Humidity: %d %%\n\r", (int) hum_perrh);
          print("\n\r");

          // For Pmod CLS
          CLS_begin(&pmodClsDevice, XPAR_PMODCLS_0_AXI_LITE_SPI_BASEADDR);
          CLS_DisplayMode(&pmodClsDevice, 1); // Wrap line at 16 characters
          CLS_DisplayClear(&pmodClsDevice);
          print_temperature_and_humidity_on_pmod_cls(tmp_celsius_int, hum_perrh);


          for (int i = 0; i < 1000; ++i)
          {
              display_other(&Gpio);
              display_number(&Gpio, tmp_celsius_int, 0xF7, 0xFB); // Display variable1 on sections 4 and 3
              display_number(&Gpio, hum_perrh, 0x7F, 0xBF); // Display variable2 on sections 8 and 7
              usleep(1000);
              XGpio_DiscreteWrite(&Gpio, ANODE_CHANNEL, 0xFF);
          }

          sleep(1); // Delay
      }
      else
      {
          xil_printf("NO Motion Detected \n\r");
          xil_printf("Sleep mode is on\n\r");
          // Stop the PmodCLS device
          CLS_DisplayClear(&pmodClsDevice);
          CLS_end(&pmodClsDevice);
          // Turn off the 7 segments
          XGpio_DiscreteWrite(&Gpio, ANODE_CHANNEL, 0xFF);
          XGpio_DiscreteWrite(&Gpio, LED_CHANNEL, ~(0b00000000));
          
      }
   }
}


void print_temperature_and_humidity_on_pmod_cls(int temperature, int humidity)
{
    // For Pmod CLS
    char info1[32];
    char info2[2];
    strcpy(info2, "");
    uint8_t length1 = 0;
    uint8_t length2 = 0;

    CLS_DisplayClear(&pmodClsDevice);
    CLS_DisplayClear(&pmodClsDevice);
    usleep(500000);

    strcpy(info1, "Temp: ");
    info2[0] = int_to_char(temperature / 10); // Digit 2
    strcat(info1, info2);
    info2[0] = int_to_char(temperature % 10); // Digit 1
    strcat(info1, info2);
    strcat(info1, " Celsius");

    strcat(info1, "  Humidity: ");
    info2[0] = int_to_char(humidity / 10); // Digit 2
    strcat(info1, info2);
    info2[0] = int_to_char(humidity % 10); // Digit 1
    strcat(info1, info2);
    strcat(info1, "%");

    length1 = strlen(info1);

    for (int i = 0; i < length1; ++i)
    {
        strcpy(info2, "");
        info2[0] = info1[i];
        length2 = strlen(info2);
        CLS_WriteSpi(&pmodClsDevice, (u8*)info2, length2);
        usleep(100);
    }
}

void AppCleanup() {
   TMP3_end(&pmodTmp3Device);
   xil_printf("PmodTMP3 Disconnected\n\r");
   xil_printf("Closing UART Connection\n\r");
   CLS_end(&pmodClsDevice);
   DisableCaches();
}

char int_to_char(uint8_t num)
{
    switch(num)
    {
        case 0:
            return '0';
        case 1:
            return '1';
        case 2:
            return '2';
        case 3:
            return '3';
        case 4:
            return '4';
        case 5:
            return '5';
        case 6:
            return '6';
        case 7:
            return '7';
        case 8:
            return '8';
        case 9:
            return '9';
        default:
            break;
    }

    return '0';
}

void InitializeHYGRO() {
    xil_printf("HYGRO Init Started\n\r");
    HYGRO_begin(
        &humiditySensor,
        XPAR_PMODHYGRO_0_AXI_LITE_IIC_BASEADDR,
        0x40, // Chip address of PmodHYGRO IIC
        XPAR_PMODHYGRO_0_AXI_LITE_TMR_BASEADDR,
        XPAR_PMODHYGRO_0_DEVICE_ID,
        TIMER_FREQ_HZ // Clock frequency of AXI bus, used to convert timer data
    );
    xil_printf("HYGRO Init Done\n\r");
}

uint8_t RunPIR()
{
    u32 state = 0;
    xil_printf("Running PmodPIR\n\r");
    state = PIR_getState(&InfraredSensor);
    if (state == 1)
    {
        xil_printf("Motion Detected \n\r");
        return 1;
    }
    else
    {
        xil_printf("NO Motion Detected \n\r");
        return 0;
    }
}

void HygroRun()
{
    tmp_degc = HYGRO_getTemperature(&humiditySensor);
    tmp_degf = HYGRO_tempC2F(tmp_degc);
    hum_perrh = HYGRO_getHumidity(&humiditySensor);
}


void display_number(XGpio* Gpio, int number, int section1, int section2) {
    int digit1 = number / 10; // First digit
    int digit2 = number % 10; // Second digit

    // Display the digits on the seven-segment display
    usleep(1000);
    XGpio_DiscreteWrite(Gpio, ANODE_CHANNEL, section1); // Select the first section
    display_digit(Gpio, digit1);
    usleep(1000);
    XGpio_DiscreteWrite(Gpio, ANODE_CHANNEL, section2); // Select the second section
    display_digit(Gpio, digit2);
}


void display_digit(XGpio* Gpio, int digit) {
    // Lookup table for digits 0-9 on a seven-segment display
    // For a common cathode display, '1' turns the segment off and '0' turns it on
    int segment_patterns[10] = {
        0b0111111, // 0
        0b0000110, // 1
        0b1011011, // 2
        0b1001111, // 3
        0b1100110, // 4
        0b1101101, // 5
        0b1111101, // 6
        0b0000111, // 7
        0b1111111, // 8
        0b1101111  // 9
    };


    // Display the digit on the seven-segment display
    XGpio_DiscreteWrite(Gpio, LED_CHANNEL, ~segment_patterns[digit]);
}

void display_other(XGpio* Gpio) {
    usleep(1000);
    XGpio_DiscreteWrite(Gpio, ANODE_CHANNEL, 0xDF);
    XGpio_DiscreteWrite(Gpio, LED_CHANNEL, ~(0b1110011));
    usleep(1000);
    XGpio_DiscreteWrite(Gpio, ANODE_CHANNEL, 0xFD);
    XGpio_DiscreteWrite(Gpio, LED_CHANNEL, ~(0b1011110));
    usleep(1000);
    XGpio_DiscreteWrite(Gpio, ANODE_CHANNEL, 0xFE);
    XGpio_DiscreteWrite(Gpio, LED_CHANNEL, ~(0b0111001));
}

void EnableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheEnable();
#endif
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheEnable();
#endif
#endif
}

void DisableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheDisable();
#endif
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheDisable();
#endif
#endif
}
