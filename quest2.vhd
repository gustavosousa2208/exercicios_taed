-- nÃƒÂ£o bulindo a parada funciona do jeitinho q a quest 1 pede
-- count = 50000000 	1s (perÃƒÂ­odo)
-- count = 100000000 	2s (perÃƒÂ­odo)
-- count = 25000000		2Hz
-- usar dois process buga o modelsim
-- esse aqui funciona como um contador de FF mesmo, no quinto led
-- ele da so um pulso e para.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity quest2 is
	generic (clock_hz : integer := 32);
	port (clk, reset: in std_logic;
			leds_out: out std_logic_vector (4 downto 0));
end quest2;
  
architecture teste of quest2 is
  
signal count	: integer range 32 downto 0 := 1;
signal leds    : integer range 16 downto 0 := 0;
  
begin
	process(clk, reset)
	begin
		if (reset = '1') then
			count <= 1;
			leds <= 0;
		elsif (clk'event and clk = '1') then
			if (count = 32) then
				count <= 1;
				leds <= leds + 1;
			else
				count <= count + 1;
			end if;
		end if;
		
		if (leds = 16) then
			leds <= 0;
		end if;
	end process;

    leds_out <= std_logic_vector(to_unsigned(leds, leds_out'length));
end teste;