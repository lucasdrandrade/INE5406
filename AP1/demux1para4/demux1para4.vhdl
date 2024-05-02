LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY demux1para4 IS
	PORT (
		f : IN std_logic;
		sel : IN std_logic_vector (1 DOWNTO 0);
		a, b, c, d : OUT std_logic
		);
END demux1para4;
	
ARCHITECTURE arch OF demux1para4 IS
BEGIN
    PROCESS (sel, f)
    BEGIN
        CASE sel IS
            WHEN "00" =>
                a <= f;
                b <= '0';
                c <= '0';
                d <= '0';
            WHEN "01" =>
                a <= '0';
                b <= f;
                c <= '0';
                d <= '0';
            WHEN "10" =>
                a <= '0';
                b <= '0';
                c <= f;
                d <= '0';
            WHEN "11" =>
                a <= '0';
                b <= '0';
                c <= '0';
                d <= f;
            WHEN OTHERS =>
                a <= '0';
                b <= '0';
                c <= '0';
                d <= '0';
        END CASE;
    END PROCESS;
END arch;
