----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2025 06:42:32 PM
-- Design Name: 
-- Module Name: afisare_etaj_lift - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity afisare_etaj_lift is
     port(clk : in STD_LOGIC;
          nivel_curent: in STD_LOGIC_VECTOR (3 downto 0);--0-12
          catod_out: out STD_LOGIC_VECTOR (0 to 6);
          anod_out: out std_logic_vector (7 downto 0));
end afisare_etaj_lift;

architecture Behavioral of afisare_etaj_lift is

component bcd7segment is
Port ( BCDin : in STD_LOGIC_VECTOR (3 downto 0);
       Seven_Segment : out STD_LOGIC_VECTOR (0 to 6);
       Anod_in : in STD_LOGIC_VECTOR (7 downto 0);
       Anod_out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

    signal BCDin : STD_LOGIC_VECTOR (3 downto 0);
    signal state : STD_LOGIC := '0';--0 pentru zeci si 1 pentru unitati
    signal anod_in : STD_LOGIC_VECTOR (7 downto 0) ;
begin

c1: bcd7segment port map (BCDin,catod_out,anod_in,anod_out);

process 
 begin
    if rising_edge(clk) then 
        if to_integer(unsigned(nivel_curent)) < 10  then
             BCDin <= nivel_curent;
             anod_in <= "01111111";
        elsif (state='0') then
                BCDin <= "0001";
                anod_in <= "01111111";
                state <='1';
        elsif (state='1') then
                BCDin <= nivel_curent - "1010";
                anod_in <= "10111111";
                state <= '0';
            end if;
       end if;
end process;
end Behavioral;
