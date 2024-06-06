LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

entity abs_subtractor is
	generic ( N : integer := 8 );
	port (
			add1 : in unsigned(N - 1 downto 0);
			add2 : in unsigned(N - 1 downto 0);
			result : out unsigned(N - 1 downto 0)
			);
end abs_subtractor;


architecture rtl of abs_subtractor is
signal diff: signed(N downto 0);
signal udiff: signed(N downto 0);
begin
	diff <= signed('0'&add1) - signed('0'&add2);
	udiff <= abs(diff);
	result <= unsigned(udiff(N - 1 downto 0));
end rtl;