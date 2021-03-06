library ieee;
use ieee.std_logic_1164.all; 

entity GRP is
    generic(NBIT: integer);
    port (D: in std_logic_vector(NBIT-1 downto 0);
          CLK: in std_logic;
          RESET: in std_logic;
          EN : in std_logic;
          Q: out std_logic_vector(NBIT-1 downto 0));
end GRP;

architecture ASYNCHRONOUS of GRP is -- register with asyncronous reset

begin
    p_asynch: process(CLK, RESET)
    begin
        if RESET='0' then
            Q <= (OTHERS => '0'); 
        elsif CLK'event and CLK='1' then -- positive edge triggered
            if(EN='1') then
                Q <= D; -- input is written on output
            end if;
        end if;
    end process;

end ASYNCHRONOUS;

