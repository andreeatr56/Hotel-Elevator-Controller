----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2025 07:13:20 PM
-- Design Name: 
-- Module Name: lift - Behavioral
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

entity lift is
    Port ( clk: in STD_LOGIC;
           en :in STD_LOGIC;--enable la lift
           rst:in STD_LOGIC;
           nivel_solicitat_1: in STD_LOGIC_VECTOR(3 downto 0);
           nivel_lift: in STD_LOGIC_VECTOR(3 downto 0);--componenta data_in a memoriei ram
           greutate: in STD_LOGIC;
           viteza_in: in STD_LOGIC;
           viteza_out : out STD_LOGIC;
           etaj: out STD_LOGIC_VECTOR (0 to 6);
           anod_out: out STD_LOGIC_VECTOR (7 downto 0)
           );
end lift;

architecture Behavioral of lift is

component MPG is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : out STD_LOGIC);
end component; 

component organigrama_lift is
    Port ( rst: in STD_LOGIC;
           clk: in STD_LOGIC;
           en : in STD_LOGIC;
           usi_inchise, sens, usi_deschise_1,usi_deschise_2: in STD_LOGIC;
           afisor_1,afisor_2,afisor_3,afisor_4: out STD_LOGIC);
end component;

component memorie_RAM_lift is
    Port ( clk : in STD_LOGIC;
           A_RAM: in STD_LOGIC_VECTOR (3 downto 0);
           CS_RAM: in STD_LOGIC;--Chip Select
           WE: in STD_LOGIC;--Write Enable
           D_RAM1: in STD_LOGIC_VECTOR (3 downto 0);
           D_RAM2: out STD_LOGIC_VECTOR (3 downto 0));
end component;

component numarator_lift is
    Port ( rst: in STD_LOGIC;
           clk: in STD_LOGIC;
           sens: in STD_LOGIC;
           en: in STD_LOGIC;
           nivel_crt: out STD_LOGIC_VECTOR (3 downto 0) :="0000");--incepem de la parter
end component;

component comparator_etaje_lift is
    Port ( nivel_solicitat : inout STD_LOGIC_VECTOR(3 downto 0);
           nivel_curent: inout STD_LOGIC_VECTOR (3 downto 0);
           sens: inout STD_LOGIC);
end component;

component stop_go_lift is
    Port ( nivel_curent : in STD_LOGIC_VECTOR(3 downto 0);
           nivel_solicitat : in STD_LOGIC_VECTOR (3 downto 0);
           usi : out STD_LOGIC);
end component;

component check_greutate_lift is
    Port ( greutate : in STD_LOGIC;
           usi : in STD_LOGIC;
           en : out STD_LOGIC);
end component;

component divizor_frecventa_dual is
    Port ( clk_in : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk_1Hz : out STD_LOGIC;
           clk_10kHz : out STD_LOGIC);
end component;


component afisare_etaj_lift is
     port(clk : in STD_LOGIC;
          nivel_curent: in STD_LOGIC_VECTOR (3 downto 0);--0-12
          catod_out: out STD_LOGIC_VECTOR (0 to 6);
          anod_out: out std_logic_vector (7 downto 0));
end component;

signal enf,rstf: STD_LOGIC; --semnalele filtrate
signal clk_10kHz, clk_1Hz : STD_LOGIC; --semnalele de tact pentru numarator si afisor
signal enable: STD_LOGIC; --enable-ul numaratorului si al organigramei, rezultat din poarta sau-nu
signal WE: STD_LOGIC := '0';
signal sens: STD_LOGIC;
signal nivel_solicitat_2: STD_LOGIC_VECTOR (3 downto 0);--nivelul care a fost selectat din memorie
signal nivel_curent: STD_LOGIC_VECTOR (3 downto 0);
signal usi: STD_LOGIC;
signal afisor_1, afisor_2, afisor_3, afisor_4: STD_LOGIC;

begin

btn1: MPG port map (en,clk,enf);
btn2: MPG port map (rst,clk,rstf);
mem: memorie_RAM_lift port map(clk_1Hz,nivel_solicitat_1,'1',WE,nivel_lift,nivel_solicitat_2);
nr: numarator_lift port map (rstf,clk_1Hz,sens,enable,nivel_curent);
div_dual: divizor_frecventa_dual port map (clk,rstf,clk_1Hz,clk_10kHz);
org: organigrama_lift port map (rstf,clk_1Hz,enf,enable,sens,usi,usi,afisor_1,afisor_2,afisor_3,afisor_4);
comp: comparator_etaje_lift port map (nivel_solicitat_2,nivel_curent,sens);
sau_nu: check_greutate_lift port map (greutate,usi,enable);
stop_go: stop_go_lift port map (nivel_curent,nivel_solicitat_2,usi);
seven_seg: afisare_etaj_lift port map (clk_10kHz,nivel_curent,etaj,anod_out);
viteza_out <= viteza_in;

end Behavioral;
