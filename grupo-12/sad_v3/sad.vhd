LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all; 

ENTITY sad IS
	PORT
		(clk, rst, iniciar: IN STD_LOGIC;
		memA,memB: in std_logic_vector(31 downto 0);
		pronto,ler : OUT STD_LOGIC;
		addr: out std_logic_vector(3 downto 0);
		sad: out std_logic_vector(13 downto 0)
		);
END sad;

architecture rtl of sad is
signal Szi,Sci,ScpA,ScpB,Szsoma,Scsoma,Scsad_reg,Smenor: std_logic;
signal UmemA,UmemB:  unsigned(31 downto 0);
signal unaddr: unsigned(3 downto 0);
signal unsad: unsigned(13 downto 0);
	component sad_operativo is
	port (
			Mem_A0, Mem_B0: in unsigned(7 downto 0);
			Mem_A1, Mem_B1: in unsigned(7 downto 0);
			Mem_A2, Mem_B2: in unsigned(7 downto 0);
			Mem_A3, Mem_B3: in unsigned(7 downto 0);
			clk,zi,ci,cpA,cpB,zsoma,csoma,csad_reg: in std_logic;
			addr: out unsigned(3 downto 0);
			menor: out std_logic;
			SAD: out unsigned(13 downto 0)
			);
	end component;
	
	component sad_controle IS
	PORT
		(clk, rst, iniciar, menor : IN STD_LOGIC;
		pronto,ler,zi,cpA,cpB,ci,zsoma,csoma,csad_reg : OUT STD_LOGIC
		);
	END component;
begin 

UmemA <= unsigned(memA);
UmemB <= unsigned(memB);

Idatapath: sad_operativo port map(UmemA(31 downto 24),UmemB(31 downto 24),UmemA(23 downto 16),UmemB(23 downto 16),UmemA(15 downto 8),UmemB(15 downto 8)
													,UmemA(7 downto 0),UmemB(7 downto 0),clk,Szi,Sci,ScpA,ScpB,Szsoma,Scsoma,Scsad_reg,unaddr,Smenor,unsad);
Icontrol: sad_controle port map(clk,rst,iniciar,Smenor,pronto,ler,Szi,ScpA,ScpB,Sci,Szsoma,Scsoma,Scsad_reg);

addr <= std_logic_vector(unaddr);
sad <= std_logic_vector(unsad);
	
	
end rtl;