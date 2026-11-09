----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2025 07:13:52 PM
-- Design Name: 
-- Module Name: memorie_RAM_lift - Behavioral
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

entity memorie_RAM_lift is
    Port ( clk : in STD_LOGIC;
           A_RAM: in STD_LOGIC_VECTOR (3 downto 0);
           CS_RAM: in STD_LOGIC;--Chip Select
           WE: in STD_LOGIC;--Write Enable
           D_RAM1: in STD_LOGIC_VECTOR (3 downto 0);
           D_RAM2: out STD_LOGIC_VECTOR (3 downto 0));
end memorie_RAM_lift;

architecture Behavioral of memorie_RAM_lift is

begin

process(clk,A_RAM,CS_RAM,WE)

type Mem_Ram is array (0 to 12) of STD_LOGIC_VECTOR (3 downto 0);
variable mem: Mem_Ram:=("0000","0001","0010","0011","0100","0101",
"0110","0111","1000","1001","1010","1011","1100");

begin

if CS_RAM='1' then
    if rising_edge(clk) then
       if WE='0' then
        case A_RAM is
            when "0000"=>
            D_RAM2<=mem(0);
            when "0001"=>
            D_RAM2<=mem(1);
            when "0010"=>
            D_RAM2<=mem(2);
            when "0011"=>
            D_RAM2<=mem(3);
            when "0100"=>
            D_RAM2<=mem(4);
            when "0101"=>
            D_RAM2<=mem(5);
            when "0110"=>
            D_RAM2<=mem(6);
            when "0111"=>
            D_RAM2<=mem(7);
            when "1000"=>
            D_RAM2<=mem(8);
            when "1001"=>
            D_RAM2<=mem(9);
            when "1010"=>
            D_RAM2<=mem(10);
            when "1011"=>
            D_RAM2<=mem(11);
            when "1100"=>
            D_RAM2<=mem(12);
            when others=>
            null;
        end case;
    elsif WE='1' then
        case A_RAM is
            when "0000"=>
            mem(0):=D_RAM1;
            when "0001"=>
            mem(1):=D_RAM1;
            when "0010"=>
            mem(2):=D_RAM1;
            when "0011"=>
            mem(3):=D_RAM1;
            when "0100"=>
            mem(4):=D_RAM1;
            when "0101"=>
            mem(5):=D_RAM1;
            when "0110"=>
            mem(6):=D_RAM1;
            when "0111"=>
            mem(7):=D_RAM1;
            when "1000"=>
            mem(8):=D_RAM1;
            when "1001"=>
            mem(9):=D_RAM1;
            when "1010"=>
            mem(10):=D_RAM1;
            when "1011"=>
            mem(11):=D_RAM1;
            when "1100"=>
            mem(12):=D_RAM1;
            when others=>
            null;
        end case;
    end if;
end if;
end if;
end process;
end Behavioral;
