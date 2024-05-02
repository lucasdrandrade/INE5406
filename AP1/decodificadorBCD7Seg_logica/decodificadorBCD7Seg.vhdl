LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY decodificadorBCD7Seg IS
	PORT (
		bcd : IN std_logic_vector(3 DOWNTO 0);
		a, b, c, d, e, f, g : OUT std_logic
);
END decodificadorBCD7Seg;

ARCHITECTURE arch OF decodificadorBCD7Seg IS
BEGIN
	
    a <= (NOT bcd(3) AND NOT bcd(2) AND NOT bcd(1) AND NOT bcd(0)) OR 	
         (NOT bcd(3) AND NOT bcd(2) AND bcd(1) AND NOT bcd(0)) OR    	
         (NOT bcd(3) AND bcd(2) AND NOT bcd(1) AND NOT bcd(0)) OR    	
         (NOT bcd(3) AND bcd(2) AND bcd(1) AND NOT bcd(0));          	


    b <= (NOT bcd(3) AND NOT bcd(2) AND NOT bcd(1) AND bcd(0)) OR    	
         (NOT bcd(3) AND NOT bcd(2) AND bcd(1) AND bcd(0)) OR        	
         (NOT bcd(3) AND bcd(2) AND NOT bcd(1) AND bcd(0)) OR        	
         (NOT bcd(3) AND bcd(2) AND bcd(1) AND bcd(0));              


    c <= (NOT bcd(3) AND NOT bcd(2) AND bcd(1) AND NOT bcd(0)) OR    	
         (NOT bcd(3) AND bcd(2) AND NOT bcd(1) AND NOT bcd(0)) OR    	
         (NOT bcd(3) AND bcd(2) AND NOT bcd(1) AND bcd(0)) OR        	
         (NOT bcd(3) AND bcd(2) AND bcd(1) AND NOT bcd(0));          	


    d <= (NOT bcd(3) AND NOT bcd(2) AND bcd(1) AND bcd(0)) OR        	
         (NOT bcd(3) AND bcd(2) AND NOT bcd(1) AND bcd(0)) OR        	
         (NOT bcd(3) AND bcd(2) AND bcd(1) AND NOT bcd(0)) OR        	
         (bcd(3) AND NOT bcd(2) AND NOT bcd(1) AND NOT bcd(0)) OR    	
         (bcd(3) AND NOT bcd(2) AND NOT bcd(1) AND bcd(0)) OR         
         (bcd(3) AND NOT bcd(2) AND bcd(1) AND bcd(0));          	


    e <= (NOT bcd(3) AND NOT bcd(2) AND NOT bcd(1) AND bcd(0)) OR    	
         (NOT bcd(3) AND bcd(2) AND NOT bcd(1) AND NOT bcd(0)) OR    	
         (NOT bcd(3) AND bcd(2) AND bcd(1) AND NOT bcd(0)) OR        	
         (bcd(3) AND NOT bcd(2) AND NOT bcd(1) AND NOT bcd(0)) OR    	
         (bcd(3) AND NOT bcd(2) AND NOT bcd(1) AND bcd(0)) OR        	
         (bcd(3) AND NOT bcd(2) AND bcd(1) AND NOT bcd(0));          	

    f <= (NOT bcd(3) AND NOT bcd(2) AND NOT bcd(1) AND NOT bcd(0)) OR  	
         (NOT bcd(3) AND NOT bcd(2) AND NOT bcd(1) AND bcd(0)) OR    	
         (NOT bcd(3) AND bcd(2) AND NOT bcd(1) AND NOT bcd(0)) OR    	
         (bcd(3) AND NOT bcd(2) AND NOT bcd(1) AND NOT bcd(0)) OR    	
         (bcd(3) AND NOT bcd(2) AND NOT bcd(1) AND bcd(0)) OR        	
         (bcd(3) AND NOT bcd(2) AND bcd(1) AND NOT bcd(0));          	

    
    g <= (NOT bcd(3) AND NOT bcd(2) AND NOT bcd(1) AND NOT bcd(0)) OR  	
         (NOT bcd(3) AND NOT bcd(2) AND bcd(1) AND NOT bcd(0)) OR    	
         (NOT bcd(3) AND bcd(2) AND NOT bcd(1) AND NOT bcd(0)) OR    	
         (NOT bcd(3) AND bcd(2) AND bcd(1) AND NOT bcd(0)) OR        	
         (bcd(3) AND NOT bcd(2) AND NOT bcd(1) AND NOT bcd(0)) OR    	
         (bcd(3) AND NOT bcd(2) AND NOT bcd(1) AND bcd(0)) OR    	
         (bcd(3) AND NOT bcd(2) AND bcd(1) AND NOT bcd(0)); 	
					
END ARCHITECTURE;