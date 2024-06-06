LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity u_somador is
generic ( N : INTEGER := 8 );
	port (
			add1 : in unsigned(N - 1 downto 0);
			add2 : in unsigned(N - 1 downto 0);
			sum : out unsigned(N - 1 downto 0);
			carry: out std_logic
			);
end u_somador;

architecture rtl of u_somador is
signal inner_sum: unsigned(N downto 0);
begin
inner_sum <= resize(add1, N + 1) + resize(add2, N + 1);
sum <= inner_sum(N - 1 downto 0);
carry <= inner_sum(N);
END rtl;