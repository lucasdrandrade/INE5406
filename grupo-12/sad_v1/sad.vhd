LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all; 

ENTITY sad IS
	PORT
		(clk, rst, iniciar: IN STD_LOGIC;
		memA,memB: in std_logic_vector(7 downto 0);
		pronto,ler : OUT STD_LOGIC;
		addr: out std_logic_vector(5 downto 0);
		sad: out std_logic_vector(13 downto 0)
		);
END sad;

architecture rtl of sad is
signal Szi,Sci,ScpA,ScpB,Szsoma,Scsoma,Scsad_reg,Smenor: std_logic;
signal unmemA,unmemB: unsigned(7 downto 0);
signal unaddr: unsigned(5 downto 0);
signal unsad: unsigned(13 downto 0);
	component sad_operativo is
		port (
				Mem_A, Mem_B: in unsigned(7 downto 0);
				clk,zi,ci,cpA,cpB,zsoma,csoma,csad_reg: in std_logic;
				addr: out unsigned(5 downto 0);
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

unmemA <= unsigned(memA);
unmemB <= unsigned(memB);

	
Idatapath: sad_operativo port map(unmemA,unmemB,clk,Szi,Sci,ScpA,ScpB,Szsoma,Scsoma,Scsad_reg,unaddr,Smenor,unsad);
Icontrol: sad_controle port map(clk,rst,iniciar,Smenor,pronto,ler,Szi,ScpA,ScpB,Sci,Szsoma,Scsoma,Scsad_reg);
	
addr <= std_logic_vector(unaddr);
sad <= std_logic_vector(unsad);
	
end rtl;