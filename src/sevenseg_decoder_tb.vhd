
--| COPYRIGHT 2017 United States Air Force Academy All rights reserved.
--| 
--| United States Air Force Academy     __  _______ ___    _________ 
--| Dept of Electrical &               / / / / ___//   |  / ____/   |
--| Computer Engineering              / / / /\__ \/ /| | / /_  / /| |
--| 2354 Fairchild Drive Ste 2F6     / /_/ /___/ / ___ |/ __/ / ___ |
--| USAF Academy, CO 80840           \____//____/_/  |_/_/   /_/  |_|
--| 
--| ---------------------------------------------------------------------------
--|
--| FILENAME      : thirtyOneDayMonth_tb.vhd (TEST BENCH)
--| AUTHOR(S)     : Capt Dan Johnson, Kimi Cahoon
--| CREATED       : 12/12/2019 Last Modified 06/24/2020
--| DESCRIPTION   : This file tests to ensure thirtyOneDayMonthMux works properly
--|
--|
--+----------------------------------------------------------------------------
--|
--| REQUIRED FILES :
--|
--|    Libraries : ieee
--|    Packages  : std_logic_1164, numeric_std, unisim
--|    Files     : thirtyOneDayMonth.vhd
--|
--+----------------------------------------------------------------------------
--|
--| NAMING CONVENSIONS :
--|
--|    xb_<port name>           = off-chip bidirectional port ( _pads file )
--|    xi_<port name>           = off-chip input port         ( _pads file )
--|    xo_<port name>           = off-chip output port        ( _pads file )
--|    b_<port name>            = on-chip bidirectional port
--|    i_<port name>            = on-chip input port
--|    o_<port name>            = on-chip output port
--|    c_<signal name>          = combinatorial signal
--|    f_<signal name>          = synchronous signal
--|    ff_<signal name>         = pipeline stage (ff_, fff_, etc.)
--|    <signal name>_n          = active low signal
--|    w_<signal name>          = top level wiring signal
--|    g_<generic name>         = generic
--|    k_<constant name>        = constant
--|    v_<variable name>        = variable
--|    sm_<state machine type>  = state machine type definition
--|    s_<signal name>          = state name
--|
--+----------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is
component sevenseg_decoder is
    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
end component sevenseg_decoder;

signal w_sw    : std_logic_vector(3 downto 0);
signal w_seg_n : std_logic_vector(6 downto 0);

begin
 u_decoder : sevenseg_decoder
    port map(
      i_Hex   => w_sw,
      o_seg_n => w_seg_n
    );	

	
-- PROCESSES ----------------------------------------	
	-- Test Plan Process --------------------------------
	-- Implement the test plan here.  Body of process is continuous from time = 0  
	test_process : process 
	begin
	-- Place test cases here. The first two have been written for you
		w_sw <= x"0"; wait for 10 ns;
            assert w_seg_n = "1000000" report "error on 0" severity failure;
        w_sw <= x"1"; wait for 10 ns;
            assert w_seg_n = "1111001" report "error on 1" severity failure;  
        w_sw <= x"2"; wait for 10 ns;
            assert w_seg_n = "0100100" report "error on 2" severity failure;   
        w_sw <= x"3"; wait for 10 ns;
            assert w_seg_n = "0110000" report "error on 3" severity failure;   
        w_sw <= x"4"; wait for 10 ns;
            assert w_seg_n = "0011001" report "error on 4" severity failure;   
        w_sw <= x"5"; wait for 10 ns;
            assert w_seg_n = "0010010" report "error on 5" severity failure;   
        w_sw <= x"6"; wait for 10 ns;
            assert w_seg_n = "0000010" report "error on 6" severity failure;   
        w_sw <= x"7"; wait for 10 ns;
            assert w_seg_n = "1111000" report "error on 7" severity failure;   
        w_sw <= x"8"; wait for 10 ns;
            assert w_seg_n = "0000000" report "error on 8" severity failure;   
        w_sw <= x"9"; wait for 10 ns;
            assert w_seg_n = "0011000" report "error on 9" severity failure;   
        w_sw <= x"A"; wait for 10 ns;
            assert w_seg_n = "0001000" report "error on A" severity failure;   
        w_sw <= x"B"; wait for 10 ns;
            assert w_seg_n = "0000011" report "error on B" severity failure;   
        w_sw <= x"C"; wait for 10 ns;
            assert w_seg_n = "0100111" report "error on C" severity failure;
        w_sw <= x"D"; wait for 10 ns;
            assert w_seg_n = "0100001" report "error on D" severity failure;
        w_sw <= x"E"; wait for 10 ns;
            assert w_seg_n = "0000110" report "error on E" severity failure;
        w_sw <= x"F"; wait for 10 ns;
            assert w_seg_n = "0001110" report "error on F" severity failure;              
       
		wait; -- wait forever
	end process;
end test_bench;
