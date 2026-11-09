----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2025 11:05:08 PM
-- Design Name: 
-- Module Name: divizor_fracventa_dual - Behavioral
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

entity divizor_frecventa_dual is
    Port ( clk_in : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk_1Hz : out STD_LOGIC;
           clk_10kHz : out STD_LOGIC);
end divizor_frecventa_dual;

architecture Behavioral of divizor_frecventa_dual is

    constant div_1Hz : integer := 100_000_000/2;--1Hz
    constant div_10khz : integer := 100_000_000/(2*10_000);--5000
    signal count_1Hz : integer range 0 to div_1Hz := 0;
    signal count_10kHz : integer range 0 to div_10kHz := 0;
    signal clk1 : STD_LOGIC :='0';
    signal clk10k : STD_LOGIC :='0';

begin

    process(rst,clk_in)
    
    begin
        if rst = '1' then
             count_1Hz <= 0;
             count_10kHz <= 0;
             clk1 <= '0';
             clk10k <= '0';
        elsif rising_edge(clk_in) then
            --1 Hz
            count_1Hz <= count_1Hz + 1;
            if count_1Hz = div_1Hz then
                count_1Hz <= 0;
                clk1 <= not clk1;
            end if;
            -- 10 kHz
            count_10kHz <= count_10kHz + 1;
            if count_10kHz = div_10kHz then
                count_10kHz <= 0;
                clk10k <= not clk10k;
            end if;
        end if;
    end process;
    clk_1Hz <= clk1;
    clk_10kHz <= clk10k;
end Behavioral;
