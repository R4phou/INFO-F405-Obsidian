library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity myLogicFunctionEx1_tb is
end entity;

architecture ben of myLogicFunctionEx1_tb is
component myLogicFunctionEx1 is port(
    a,b,c,d,e     : in  std_logic;
    o         : out std_logic);
end component;
-- These are the internal wires
signal a,b,c,d,e,o : std_logic;
begin
    uut : myLogicFunctionEx1 port map(a => a, b => b, c => c, d => d, e => e, o => o);
    stim : process
    variable inputs : std_logic_vector(4 downto 0);
    begin
        for i in 0 to 2**inputs'length - 1 loop
            inputs := std_logic_vector(to_unsigned(i, inputs'length));
            (a, b, c, d, e) <= inputs;
            wait for 10 ns;
            report "inputs: " & std_logic'image(a) & std_logic'image(b) & std_logic'image(c) & std_logic'image(d) & std_logic'image(e);
            report "outputs: " & std_logic'image(o);
        end loop;
    end process;
end ben;