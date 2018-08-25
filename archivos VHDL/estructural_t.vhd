library ieee;  
use ieee.std_logic_1164.all;

architecture estructural_T of practica_2 is 
  signal inT2, inT1, inT0 : std_logic;
  signal Q2, Q1, Q0, notQ2, notQ1, notQ0, notX: std_logic;
	signal inDeco: std_logic_vector(3 downto 0);
  	signal outDeco: std_logic_vector(15 downto 0);
	signal enabl: std_logic;
  begin
     		 inv_x: entity work.not1 port map(x, notX); 
		 inv_q2: entity work.not1 port map(Q2, notQ2);
		 inv_q1: entity work.not1 port map(Q1, notQ1);
		 inv_q0: entity work.not1 port map(Q0, notQ0);
     		 
		 inDeco(3) <= Q2;
		 inDeco(2) <= Q1;
		 inDeco(1) <= Q0;
		 inDeco(0) <= X;
		 Deco_4a16: entity work.deco4a16 port map(enabl, inDeco, outDeco);
		 inT2 <= (outDeco(7) OR outDeco(8) OR outDeco(10) OR outDeco(11));
		 T2: entity work.flipflopT port map(clk, rst, inT2, Q2); 
     		 inT1 <= (outDeco(2) OR outDeco(5) OR outDeco(6) OR outDeco (7) OR outDeco(8) OR outDeco(10));
		 T1: entity work.flipflopT port map(clk, rst, inT1, Q1);
		 inT0 <= (outDeco(1) OR outDeco(2) OR outDeco(4) OR outDeco (5) OR outDeco(6) OR outDeco(7) OR outDeco (9) OR outDeco(10));
		 T0: entity work.flipflopT port map(clk, rst, inT0, Q0);


		 Z <= (Q2 AND notQ1 AND Q0) ;

end estructural_T;

