----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2025 05:02:18 PM
-- Design Name: 
-- Module Name: organigrama_lift - Behavioral
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

entity organigrama_lift is
    Port ( rst: in STD_LOGIC;
           clk: in STD_LOGIC;
           en : in STD_LOGIC;
           usi_inchise, sens, usi_deschise_1,usi_deschise_2: in STD_LOGIC;
           afisor_1,afisor_2,afisor_3,afisor_4: out STD_LOGIC);
end organigrama_lift;

architecture Behavioral of organigrama_lift is
type t_states is (S1,S2,S3,S4);
signal state: t_states;

begin

process(rst,clk)
--intrarile care influenteaza iesirile si starile viitoare
begin

    if rst='1' then
        state<=S1;
    elsif rising_edge(clk) then
        if en='1' then
        afisor_1<='0';
        afisor_2<='0';
        afisor_3<='0';
        afisor_4<='0';
        
        case state is
            when S1 =>
            if usi_inchise='0' then
                state<=S1; --daca greutatea maxima este depasita, daca usile nu sunt inchise
            else 
                state<=S2;
            end if;
            
            when S2 =>
            if sens='0' then
                state<=S3; --liftul urca
            else 
                state<=S4; --liftul coboara
            end if;
            
            when S3 =>--suntem in cazul in care liftul urca
                if usi_deschise_1='0' then
                    state<=S1 after 5000 ms; --usile se vor inchide mereu dupa 5 secunde
                    afisor_1<='1';--etajul va fi afisat
                else
                   state<=S2;
                   afisor_3<='1';
                end if;
                
            when S4 =>--suntem in cazul in care liftul coboara
                if usi_deschise_2='0' then
                    state<=S1 after 5000 ms;
                    afisor_2<='1';
                else 
                    state<=S2;
                    afisor_4<='1';
                end if;
                
        end case;
        end if;
    end if;
end process;
end Behavioral;
