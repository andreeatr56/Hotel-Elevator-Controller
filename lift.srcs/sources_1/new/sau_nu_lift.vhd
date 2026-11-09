----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2025 05:37:18 PM
-- Design Name: 
-- Module Name: sau_nu_lift - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sau_nu_lift is
    Port ( greutate : in STD_LOGIC;
           usi : in STD_LOGIC;
           en : out STD_LOGIC);
end sau_nu_lift;

architecture Behavioral of sau_nu_lift is

begin

    en<=not(greutate or usi);

end Behavioral;
