/******************************************************************************/
/*                                                                            */
/* main.c -- PmodTMP3 example project                                         */
/*                                                                            */
/******************************************************************************/
#include "PmodTMP3.h"
#include "sleep.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpio.h"

void AppInitialize();
void AppRun();
void AppCleanup();
void EnableCaches();
void DisableCaches();
void read_temp_and_print_it();

PmodTMP3 pmodTmp3Device;
#define GPIO_DEVICE_ID  XPAR_AXI_GPIO_0_DEVICE_ID
XGpio Gpio;
#define LEDS 1

int main(void) {
   print("Hello\n");
   AppInitialize();
   AppRun();
   AppCleanup();
   return 0;
}

void AppInitialize() {
   EnableCaches();

   xil_printf("\x1B[H");  // Move terminal cursor to top left
   xil_printf("\x1B[1K"); // Clear terminal
   xil_printf("Connected to PmodTMP3 Demo over UART\n\r");

   TMP3_begin(&pmodTmp3Device, XPAR_PMODTMP3_0_AXI_LITE_IIC_BASEADDR, TMP3_ADDR);
   xil_printf("Connected to PmodTMP3 over IIC on JB\n\r\n\r");

   // Initialization of LEDs
   int status = XGpio_Initialize(&Gpio, GPIO_DEVICE_ID);
   if (status != XST_SUCCESS) {
       return XST_FAILURE;
   }

   // Set the direction for all LEDs to be outputs
   XGpio_SetDataDirection(&Gpio, LEDS, 0x0000);
}

void AppRun() {
   while (1) {
	  // read temperature and print it
	  read_temp_and_print_it();

	  // Turn on the LEDs
	  XGpio_DiscreteWrite(&Gpio, LEDS, 0xFFFF);
	  print("LEDs are on\n\n\r");

	  // Sleep for 1 second
	  sleep(1);

	  // Turn off the LEDs
	  XGpio_DiscreteWrite(&Gpio, LEDS, 0x0000);
	  print("LEDs are off\n\n\r");

	  // Sleep for 1 second
	  sleep(1);
   }
}

void read_temp_and_print_it()
{
	double temp  = 0.0;
	double temp2 = 0.0;
	double temp3 = 0.0;

	temp  = TMP3_getTemp(&pmodTmp3Device);
	temp2 = TMP3_CtoF(temp);
	temp3 = TMP3_FtoC(temp2);

	int temp2_round = 0;
	int temp2_int   = 0;
	int temp2_frac  = 0;
	// Round to nearest hundredth, multiply by 100
	if (temp2 < 0) {
	    temp2_round = (int) (temp2 * 1000 - 5) / 10;
	    temp2_frac  = -temp2_round % 100;
	} else {
		temp2_round = (int) (temp2 * 1000 + 5) / 10;
		temp2_frac  = temp2_round % 100;
	}
	temp2_int = temp2_round / 100;

	int temp3_round = 0;
	int temp3_int   = 0;
	int temp3_frac  = 0;
	if (temp3 < 0) {
	    temp3_round = (int) (temp3 * 1000 - 5) / 10;
	    temp3_frac  = -temp3_round % 100;
	} else {
	    temp3_round = (int) (temp3 * 1000 + 5) / 10;
	    temp3_frac  = temp3_round % 100;
	}
	temp3_int = temp3_round / 100;

	xil_printf("Temperature: %d.%d in Fahrenheit\n\r", temp2_int, temp2_frac);
	xil_printf("Temperature: %d.%d in Celsius\n\r", temp3_int, temp3_frac);
	print("\n\r");
}

void AppCleanup() {
   TMP3_end(&pmodTmp3Device);
   xil_printf("PmodTMP3 Disconnected\n\r");
   xil_printf("Closing UART Connection\n\r");
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