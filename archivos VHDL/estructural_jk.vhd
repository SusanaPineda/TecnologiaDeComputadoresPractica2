library ieee;
use ieee.std_logic_1164.all;

entity practica_2 is
  port (clk, rst, x: in std_logic;
        z: out std_logic);
end practica_2;

architecture estructural_JK of practica_2 is
signal inJ2, inJ1, inJ0: std_logic;
signal inK2, inK1, inK0: std_logic;
signal Q2, Q1, Q0, notQ2, notQ1, notQ0, notX: std_logic;
begin 
		 
   		inv_x: entity work.not1 port map(x, notX); 
		inv_q2: entity work.not1 port map(Q2, notQ2);
		inv_q1: entity work.not1 port map(Q1, notQ1);
		inv_q0: entity work.not1 port map(Q0, notQ0);
		inJ2 <= (Q1 AND Q0 AND X);
		inK2 <= ((Q0 AND X) OR notX);
		JK2: entity work.flipflopJK port map(clk, rst, inJ2, ink2, Q2);
		inJ1 <= ((Q0 AND notX) OR (notQ2 AND Q1 AND X));
	  	inK1 <= (notX);
	  	JK1: entity work.flipflopJK port map(clk, rst, inJ1, ink1, Q1);
    		inJ0 <= (Q1 OR (notQ0 AND X) OR (Q0 AND notX));
		inK0 <= ((notQ0 AND X) OR (Q0 AND notX));
		JK0: entity work.flipflopJK port map(clk, rst, inJ0, ink0, Q0);
		Z <= (Q2 AND notQ1 AND Q0);

end estructural_JK;
