LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY disp7seg IS
	PORT(
		h : IN std_logic;
		bcd : IN std_logic_vector(3 DOWNTO 0);
		disp : OUT std_logic_vector(7 DOWNTO 0)
		--o primeiro bit em disp é de validação, os outros a saída do display
	);
END disp7seg;
	
ARCHITECTURE behavior OF disp7seg IS
BEGIN 

		WITH h&bcd SELECT 
			disp <= "10000001" WHEN "10000", --0
				"11001111" WHEN "10001", --1
				"10010010" WHEN "10010", --2
				"10000110" WHEN "10011", --3
				"11001100" WHEN "10100", --4
				"10100100" WHEN "10101", --5
				"10100000" WHEN "10110", --6
				"10000111" WHEN "10111", --7
				"10000000" WHEN "11000", --8
				"10001100" WHEN "11001", --9
				"00000000" WHEN "1----", -- habilitado mas ultrapassa 9
				"00000000" WHEN OTHERS;
				
				
END behavior;