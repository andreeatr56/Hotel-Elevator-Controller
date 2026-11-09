----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2025 11:39:30 PM
-- Design Name: 
-- Module Name: divizor_de_frecventa_lift - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divizor_de_frecventa_lift is
    Port ( clk_in : in STD_LOGIC;--clk cu frecventa de 100mhz
           rst : in STD_LOGIC;--reset asincron (activ pe 1)
           clk_out: out STD_LOGIC);--clk cu frecventa de 1hz
end divizor_de_frecventa_lift;

architecture Behavioral of divizor_de_frecventa_lift is

constant max_count: unsigned (26 downto 0) :=  to_unsigned(99999999,27);
signal counter: unsigned(26 downto 0) := (others=>'0');
signal new_clk: STD_LOGIC := '0';

begin

process(rst,clk_in)

begin

    if rst='1' then
        counter <= (others=>'0');
        new_clk<='0';
    elsif rising_edge(clk_in) then
        counter <= counter+1;
        if counter=max_count then
            counter <= (others=>'0');
            new_clk <= not new_clk;--mentinem noul semnal de ceas neschimbat pana cand numaratorul termina bucla de numarare
        end if;
    end if;
end process;

clk_out <= new_clk;

end Behavioral;
