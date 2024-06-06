library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity testbench is
end testbench;

architecture tb of testbench is
	signal finished: std_logic := '0';
	signal clk: std_logic := '0';
	signal rst: std_logic;
	signal iniciar: std_logic;
	signal pronto: std_logic;
	signal ler: std_logic;
	signal addr: std_logic_vector(5 downto 0);
	CONSTANT MemAFirstValue: std_logic_vector(7 downto 0) := "00000001";
	CONSTANT MemBFirstValue: std_logic_vector(7 downto 0) := "00000010";
	CONSTANT MemALastValue: std_logic_vector(7 downto 0) := "11111111";
	CONSTANT MemBLastValue: std_logic_vector(7 downto 0) := "00000000";
	signal memA: std_logic_vector(7 downto 0);
	signal memB: std_logic_vector(7 downto 0);
	signal SadOutput: std_logic_vector(13 downto 0);
	CONSTANT period : TIME := 6.4 ns;

 begin

 -- Connect DUV
	 DUV: entity work.sad
	 port map(clk,rst,iniciar,memA,memB,pronto,ler,addr,SadOutput);
	 
	 clk <= not clk after period/2 when finished /= '1' else '0';
	 
	 process
	 begin
	 
		 memA <= MemAFirstValue;
		 memB <= MemBFirstValue;
		 rst <= '0';
		 iniciar <= '1';
		 wait for 20 ns;
		 iniciar <= '0';
		 wait for 10 ns;
		 rst <= '1';
		 wait for 10 ns;
		 rst <= '0';
		 wait for 10 ns;
		 iniciar <= '1';
		 wait for 100 ns;
		 iniciar <= '0';
		 wait until pronto = '1';
		 wait for 30 ns;
		 assert(SadOutput="00000001000000") 
		 report "Error in First SAD calculation" severity error;
		 wait for 150 ns;
		 memA <= MemALastValue;
		 memB <= MemBLastValue;
		 iniciar <= '1';
		 wait for 150 ns;
		 iniciar <= '0';
		 wait until pronto = '1';
		 wait for 30 ns;
		 assert(SadOutput="11111111000000") 
		 report "Error in Second SAD calculation" severity error;
		 wait for 20 ns;
		 report "All Tests Passed." severity note;
		 wait;
		 
	 end process;
end tb;