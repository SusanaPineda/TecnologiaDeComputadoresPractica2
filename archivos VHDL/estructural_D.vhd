library ieee;  
use ieee.std_logic_1164.all;

entity practica_2 is
  port (clk, rst, x: in std_logic;
        z: out std_logic);
end practica_2;


architecture estructural_D of practica_2 is
signal inD2, inD1, inD0: std_logic;
signal Q2, Q1, Q0, notQ2, notQ1, notQ0, notX: std_logic;
begin
     		 inv_x: entity work.not1 port map(x, notX); 
		 inv_q2: entity work.not1 port map(Q2, notQ2);
		 inv_q1: entity work.not1 port map(Q1, notQ1);
		 inv_q0: entity work.not1 port map(Q0, notQ0);
		 inD2 <= ((notQ2 AND Q1 AND Q0 AND X)  OR (Q2 AND notQ1 AND notQ0 AND X));
		 D2: entity work.flipflopD port map(clk, rst, inD2, Q2);
		 inD1 <= ((Q2 AND notQ1 AND notX) OR ( notQ1 AND Q0 AND notX) OR (notQ2 AND Q1 AND notQ0 AND notX) );
		 D1: entity work.flipflopD port map(clk, rst, inD1, Q1); 
		 inD0 <= ((notQ1 AND X) OR (notQ2 AND Q1 AND notQ0));
     		 D0: entity work.flipflopD port map(clk, rst, inD0, Q0);
		 Z <= (Q2 AND notQ1 AND Q0);
      
end estructural_D;

