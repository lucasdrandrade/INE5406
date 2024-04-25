LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY decodificadorBCD7Seg IS
		PORT (
			bcd : IN std_logic_vector(3 DOWNTO 0);
			abcdefg : OUT std_logic_vector(6 DOWNTO 0)
		);
END decodificadorBCD7Seg;

ARCHITECTURE arch OF decodificadorBCD7Seg IS
BEGIN

	PROCESS(bcd)
		BEGIN
        
			abcdefg <= "0000000";

			CASE bcd IS
					WHEN "0000" =>
						abcdefg <= "1111110";  
					 
					WHEN "0001" =>
						abcdefg <= "0110000";  
            
					WHEN "0010" =>
						abcdefg <= "1101101";  
            
					WHEN "0011" =>
						abcdefg <= "1111001";  
            
					WHEN "0100" =>
						abcdefg <= "0110011"; 
            
					WHEN "0101" =>
						abcdefg <= "1011011"; 
            
					WHEN "0110" =>
						abcdefg <= "1011111"; 
            
					WHEN "0111" =>
						abcdefg <= "1110000"; 
            
					WHEN "1000" =>
						abcdefg <= "1111111";  
            
					WHEN "1001" =>
						abcdefg <= "1111011";  
            
					WHEN "1010" =>
						abcdefg <= "1110111"; 
						
					WHEN "1011" =>
						abcdefg <= "0001111"; 
            
					WHEN "1100" =>
						abcdefg <= "1001110";  
            
					WHEN "1101" =>
						abcdefg <= "1100111";  
            
					WHEN "1110" =>
						abcdefg <= "1001111"; 
            
					WHEN "1111" =>
						abcdefg <= "1000111"; 
						
					WHEN OTHERS =>
						abcdefg <= "0000000";  
        END CASE;
    END PROCESS;
END ARCHITECTURE; -- arch