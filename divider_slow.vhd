library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- divides the 150 MHz clock into 0.375 MHz
entity divider_slow is
    Port ( CLK : in  STD_LOGIC;
           CLK3 : out  STD_LOGIC);
end divider_slow;

architecture arch of divider_slow is
constant div_value : integer := 199;
signal counter: integer range 0 to div_value := 0;
signal new_clk : STD_LOGIC := '0';
begin

process (CLK, new_clk) is
begin
	if rising_edge(CLK) then -- divide further by processing only on rising edge
		if(counter < div_value) then
			counter <= counter + 1;
		else
			counter <= 0;
			new_clk <= not new_clk;
		end if;
	end if;
	CLK3 <= new_clk;
end process;

end arch;

