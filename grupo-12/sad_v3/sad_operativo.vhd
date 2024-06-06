LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity sad_operativo is
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
end sad_operativo;

architecture rtl of sad_operativo is
signal A0,B0: unsigned(7 downto 0);
signal A1,B1: unsigned(7 downto 0);
signal A2,B2: unsigned(7 downto 0);
signal A3,B3: unsigned(7 downto 0);
signal AD0: unsigned(7 downto 0);
signal AD1: unsigned(7 downto 0);
signal AD2: unsigned(7 downto 0);
signal AD3: unsigned(7 downto 0);
signal parcial_sum01, parcial_sum23: unsigned(7 downto 0);
signal parcial_sum0123: unsigned(8 downto 0);
signal AD_14,reg_sum, parcial_sum, sum: unsigned(13 downto 0);
signal unused_carry,unused_carry01,unused_carry23, unused_carry0123 ,carry: std_logic;
signal counter,reg_counter,iter: unsigned(4 downto 0);
signal count_sum,parcial_counter: unsigned(3 downto 0);
signal sum01: unsigned(8 downto 0);
signal sum23: unsigned(8 downto 0);
signal sum0123: unsigned(9 downto 0);


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

IA0: registrador
	generic map(N => 8)
	port map(clk,cpA,Mem_A0,A0);
	
IB0: registrador
	generic map(N => 8)
	port map(clk,cpB,Mem_B0,B0);
	
IAD0: abs_subtractor
	 generic map(N => 8)
	 port map(A0,B0,AD0);
	 
IA1: registrador
	generic map(N => 8)
	port map(clk,cpA,Mem_A1,A1);
	
IB1: registrador
	generic map(N => 8)
	port map(clk,cpB,Mem_B1,B1);
	
IAD1: abs_subtractor
	 generic map(N => 8)
	 port map(A1,B1,AD1);	 
	 
IA2: registrador
	generic map(N => 8)
	port map(clk,cpA,Mem_A2,A2);
	
IB2: registrador
	generic map(N => 8)
	port map(clk,cpB,Mem_B2,B2);
	
IAD2: abs_subtractor
	 generic map(N => 8)
	 port map(A2,B2,AD2);
	 
IA3: registrador
	generic map(N => 8)
	port map(clk,cpA,Mem_A3,A3);
	
IB3: registrador
	generic map(N => 8)
	port map(clk,cpB,Mem_B3,B3);
	
IAD3: abs_subtractor
	 generic map(N => 8)
	 port map(A3,B3,AD3);
	 
ISum01: u_somador
	  generic map(N => 8)
	  port map(AD0,AD1,parcial_sum01,unused_carry01);
	  
sum01 <= unused_carry01 & parcial_sum01;
	  
ISum23: u_somador
	  generic map(N => 8)
	  port map(AD2,AD3,parcial_sum23,unused_carry23);
	
sum23 <=  unused_carry23 & parcial_sum23 ;
	
ISum0123: u_somador
	  generic map(N => 9)
	  port map(sum01,sum23,parcial_sum0123,unused_carry0123);
	 
sum0123 <= unused_carry0123 & parcial_sum0123;
	 
AD_14 <= "0000" & sum0123;

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
			  generic map(N => 5)
			  port map(counter,zi,reg_counter);
Ii: registrador
	 generic map(N => 5)
	 port map(clk,ci,reg_counter,iter);

count_sum <= iter(3 downto 0);
menor <= not iter(4);
addr <= iter(3 downto 0);

ICounter_Sum: u_somador
				  generic map(N => 4)
				  port map("0001",count_sum,parcial_counter,carry);

counter <= carry & parcial_counter;
 

end rtl;