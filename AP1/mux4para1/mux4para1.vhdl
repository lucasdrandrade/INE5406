LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY mux4para1 IS
	GENERIC (N : POSITIVE := 1);
	PORT (
		a, b, c, d : IN std_logic_vector (N-1 DOWNTO 0);
		sel : IN std_logic_vector (1 DOWNTO 0);
		y : OUT std_logic_vector (N - 1 DOWNTO 0)
	);
END mux4para1;

ARCHITECTURE arch OF mux4para1 IS
BEGIN
PROCESS (sel, a, b, c, d)
    BEGIN
        CASE sel IS
            WHEN "00" =>
                y <= a;
            WHEN "01" =>
                y <= b;
            WHEN "10" =>
                y <= c;
            WHEN "11" =>
                y <= d;
            WHEN OTHERS =>
                y <= (OTHERS => '0');  -- Default all zeroes
        END CASE;
    END PROCESS;
END arch;