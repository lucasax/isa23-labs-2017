library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity tta0_input_socket_cons_3 is

  generic (
    BUSW_0 : integer := 32;
    BUSW_1 : integer := 32;
    BUSW_2 : integer := 32;
    DATAW : integer := 32);
  port (
    databus0 : in std_logic_vector(BUSW_0-1 downto 0);
    databus1 : in std_logic_vector(BUSW_1-1 downto 0);
    databus2 : in std_logic_vector(BUSW_2-1 downto 0);
    data : out std_logic_vector(DATAW-1 downto 0);
    databus_cntrl : in std_logic_vector(1 downto 0));

end tta0_input_socket_cons_3;

architecture input_socket of tta0_input_socket_cons_3 is
begin

    -- If width of input bus is greater than width of output,
    -- using the LSB bits.
    -- If width of input bus is smaller than width of output,
    -- using zero extension to generate extra bits.

  sel : process (databus_cntrl, databus0, databus1, databus2)
  begin
    case databus_cntrl is
      when "00" =>
        data <= ext(databus0, data'length);
      when "01" =>
        data <= ext(databus1, data'length);
      when others =>
        data <= ext(databus2, data'length);
    end case;
  end process sel;
end input_socket;
