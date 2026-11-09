----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2025 05:33:32 PM
-- Design Name: 
-- Module Name: stop_go_lift - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stop_go_lift is
    Port ( nivel_curent : in STD_LOGIC_VECTOR (3 downto 0);
           nivel_solicitat : in STD_LOGIC_VECTOR (3 downto 0);
           usi : out STD_LOGIC);
end stop_go_lift;

architecture Behavioral of stop_go_lift is

begin

process(nivel_curent,nivel_solicitat)

begin
    if nivel_curent=nivel_solicitat then
        usi<='1';
    else
        usi<='0';
    end if;
    
end process;

end Behavioral;
