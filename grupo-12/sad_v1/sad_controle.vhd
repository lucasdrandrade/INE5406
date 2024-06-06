LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sad_controle IS
	PORT
		(clk, rst, iniciar, menor : IN STD_LOGIC;
		pronto,ler,zi,cpA,cpB,ci,zsoma,csoma,csad_reg : OUT STD_LOGIC
		);
END sad_controle;

ARCHITECTURE behavior of sad_controle is
	TYPE State is (S0,S1,S2,S3,S4,S5);
	SIGNAL Current_State, Next_State : State;
	Begin
		PROCESS (menor,iniciar)
		BEGIN
			CASE Current_State is
				WHEN S0 => 	
						IF iniciar = '0' THEN
						Next_State <= S0;
						ELSE
						Next_State <= S1;
						END IF;
				WHEN S1 => 	
						Next_State <= S2;
				WHEN S2 =>
						IF menor = '1' THEN
						Next_State <= S3;
						ELSE
						Next_State <= S5;
						END IF;
				WHEN S3 => 
						Next_State <= S4;
				WHEN S4 =>
						Next_State <= S2;
				WHEN S5 => Next_State <= S0;
			END CASE;
		END PROCESS;
		
		PROCESS (clk,rst)
		BEGIN
			IF rst = '1' THEN
					Current_State <= S0;
			ELSIF (rising_edge(clk)) THEN
					Current_State <= Next_State;
			END IF;
		END PROCESS;

		pronto <= '1' WHEN Current_State = S0
		ELSE '0';
		ler <= '1' WHEN Current_State = S3
		ELSE '0';
		zi <= '1' WHEN Current_State = S1
		ELSE '0';
		zsoma <= '1' WHEN Current_State = S1
		ELSE '0';
		csad_reg <= '1' WHEN Current_State = S5
		ELSE '0';
		cpA <= '1' WHEN Current_State = S3
		ELSE '0';
		cpB <= '1' WHEN Current_State = S3
		ELSE '0';

		WITH Current_State SELECT
		csoma <= '1' WHEN S1,
					'1' WHEN S4,
					'0' WHEN OTHERS;
		WITH Current_State SELECT
		ci <= '1' WHEN S1,
				'1' WHEN S4,
				'0' WHEN OTHERS;

END behavior;