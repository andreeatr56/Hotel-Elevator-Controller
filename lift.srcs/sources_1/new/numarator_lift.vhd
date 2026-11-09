----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2025 08:26:13 PM
-- Design Name: 
-- Module Name: numarator_lift - Behavioral
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

entity numarator_lift is
    Port ( rst: in STD_LOGIC;
           clk: in STD_LOGIC;
           sens: in STD_LOGIC;
           en: in STD_LOGIC;
           nivel_crt: out STD_LOGIC_VECTOR (3 downto 0));--incepem de la parter
end numarator_lift;

architecture Behavioral of numarator_lift is
signal tmp : STD_LOGIC_VECTOR (3 downto 0) :="0000" ;
begin

process(clk,rst)

begin

    if rst='1' then --cel mai prioritar semnal 
        tmp <= "0000";--parter
        elsif rising_edge(clk) then
            if en='1' then
                if sens='0' and tmp < "1100" then
                     tmp<=tmp+1; --liftul urca
                elsif sens='1' and tmp > "0000" then
                     tmp<=tmp-1; --liftul coboara
                end if;
            end if;
    end if;
end process;
nivel_crt <= tmp;
end Behavioral;
