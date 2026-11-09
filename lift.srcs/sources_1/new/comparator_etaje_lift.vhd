----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2025 05:21:32 PM
-- Design Name: 
-- Module Name: comparator_etaje_lift - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator_etaje_lift is
    Port ( nivel_solicitat : inout STD_LOGIC_VECTOR (3 downto 0);
           nivel_curent: inout STD_LOGIC_VECTOR (3 downto 0);
           sens: out STD_LOGIC);
end comparator_etaje_lift;

architecture Behavioral of comparator_etaje_lift is

begin

process(nivel_curent,nivel_solicitat)

begin

    if unsigned(nivel_solicitat)<unsigned(nivel_curent) then
        sens<='1';--liftul coboara
    elsif unsigned(nivel_solicitat)>unsigned(nivel_curent) then
        sens<='0';--liftul urca
    else
        null;
    end if;
end process;
end Behavioral;
