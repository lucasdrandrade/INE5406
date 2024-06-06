LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity sad_operativo is
	port (
			Mem_A, Mem_B: in unsigned(7 downto 0);
			clk,zi,ci,cpA,cpB,zsoma,csoma,csad_reg: in std_logic;
			addr: out unsigned(5 downto 0);
			menor: out std_logic;
			SAD: out unsigned(13 downto 0)
			);
end sad_operativo;

architecture rtl of sad_operativo is
signal A,B: unsigned(7 downto 0);
signal AD: unsigned(7 downto 0);
signal AD_14,sum,parcial_sum,reg_sum: unsigned(13 downto 0);
signal unused_carry,carry: std_logic;
signal counter,reg_counter,iter: unsigned(6 downto 0);
signal count_sum,parcial_counter: unsigned(5 downto 0);


	component multiplexador
	generic (N : integer := 1);
		port (
             A: in unsigned(N - 1 downto 0);
             sel : in std_logic;
            y : out unsigned (N - 1 downto 0)
           );
	end component;
	
	component abs_subtractor is
	generic ( N : integer := 8 );
	port (
			add1 : in unsigned(N - 1 downto 0);
			add2 : in unsigned(N - 1 downto 0);
			result : out unsigned(N - 1 downto 0)
			);
	end component;
	
	component u_somador is
	generic ( N : INTEGER := 8 );
	port (
			add1 : in unsigned(N - 1 downto 0);
			add2 : in unsigned(N - 1 downto 0);
			sum : out unsigned(N - 1 downto 0);
			carry: out std_logic
			);
	end component;
	
	component registrador is
	generic (N : integer:= 8);
	PORT (
			clk,load : in std_logic;
			D : in unsigned(N-1 downto 0);
			Q : out unsigned(N-1 downto 0)
			);
	END component;


begin

-- Bloco do Cálculo

IA: registrador
	generic map(N => 8)
	port map(clk,cpA,Mem_A,A);
	
IB: registrador
	generic map(N => 8)
	port map(clk,cpB,Mem_B,B);
	
IAD: abs_subtractor
	 generic map(N => 8)
	 port map(A,B,AD);
	 
AD_14 <= "000000" & AD;

ISum: u_somador
	  generic map(N => 14)
	  port map(sum,AD_14,parcial_sum,unused_carry);
	 
ISum_Mux: multiplexador
			generic map(N => 14)
			port map(parcial_sum,zsoma,reg_sum);

ISoma: registrador
		generic map(N => 14)
		port map(clk,csoma,reg_sum,sum);

ISAD_reg: registrador
			generic map(N => 14)
			port map(clk,csad_reg,sum,SAD);
			
-- Bloco do counter

ICount_Mux: multiplexador
			  generic map(N => 7)
			  port map(counter,zi,reg_counter);
Ii: registrador
	 generic map(N => 7)
	 port map(clk,ci,reg_counter,iter);

count_sum <= iter(5 downto 0);
menor <= NOT iter(6);
addr <= iter(5 downto 0);

ICounter_Sum: u_somador
				  generic map(N => 6)
				  port map("000001",count_sum,parcial_counter,carry);

counter <= carry & parcial_counter;
 

end rtl;