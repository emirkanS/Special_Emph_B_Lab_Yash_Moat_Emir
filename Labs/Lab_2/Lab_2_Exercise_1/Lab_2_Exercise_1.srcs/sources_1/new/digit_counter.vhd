library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock is
    Port ( clk : in STD_LOGIC;
            digit1 : in STD_LOGIC_VECTOR (3 downto 0);
           cathode : out STD_LOGIC_VECTOR (6 downto 0);
           anode : out std_logic_vector (1  downto 0);    
           anodeothr: out std_logic_vector( 5 downto 0)) ;
end clock;

architecture Behavioral of clock is

signal clockcounter : natural range 0 to 50000000 := 0;
signal blinker : std_logic := '1'; 


begin
anodeothr <= "111111";
process (clk) 
begin
if rising_edge(clk) then
    clockcounter <= clockcounter + 1;
    if clockcounter >= 1000000 then
    clockcounter <= 0;
    blinker <= not blinker;
     end if;
    end if;
end process;

process (blinker) 
begin
anode(0) <= blinker ; 
case digit1 is
when "0000" => cathode <= "1000000";
when "0001" => cathode <= "1111001";
when "0010" => cathode <= "0100100";
when "0011" => cathode <= "0110000";
when "0100" => cathode <= "0011001";
when "0101" => cathode <= "0010010";
when "0110" => cathode <= "0000010";
when "0111" => cathode <= "1111000";
when "1000" => cathode <= "0000000";
when "1001" => cathode <= "0010000";
when others => cathode <= "1000000";
end case;

end process;
end Behavioral;

