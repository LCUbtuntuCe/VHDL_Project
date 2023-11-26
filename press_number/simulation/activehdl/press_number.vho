-- Copyright (C) 1991-2009 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II"
-- VERSION "Version 9.1 Build 222 10/21/2009 SJ Web Edition"

-- DATE "11/20/2023 20:09:40"

-- 
-- Device: Altera EP2C70F896C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for Active-HDL (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	press_number IS
    PORT (
	sw : IN std_logic;
	led : OUT std_logic_vector(3 DOWNTO 0)
	);
END press_number;

-- Design Ports Information
-- led[0]	=>  Location: PIN_W27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[1]	=>  Location: PIN_W25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[2]	=>  Location: PIN_W23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[3]	=>  Location: PIN_Y27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sw	=>  Location: PIN_T29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default

ARCHITECTURE structure OF press_number IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_sw : std_logic;
SIGNAL ww_led : std_logic_vector(3 DOWNTO 0);
SIGNAL \sw~combout\ : std_logic;
SIGNAL \count[0]~3_combout\ : std_logic;
SIGNAL \led[0]~reg0_regout\ : std_logic;
SIGNAL \count[1]~0_combout\ : std_logic;
SIGNAL \led[1]~reg0feeder_combout\ : std_logic;
SIGNAL \led[1]~reg0_regout\ : std_logic;
SIGNAL \count[2]~1_combout\ : std_logic;
SIGNAL \led[2]~reg0feeder_combout\ : std_logic;
SIGNAL \led[2]~reg0_regout\ : std_logic;
SIGNAL \count[3]~2_combout\ : std_logic;
SIGNAL \led[3]~reg0feeder_combout\ : std_logic;
SIGNAL \led[3]~reg0_regout\ : std_logic;
SIGNAL count : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_sw <= sw;
led <= ww_led;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_T29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sw~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sw,
	combout => \sw~combout\);

-- Location: LCCOMB_X94_Y20_N8
\count[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \count[0]~3_combout\ = !count(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => count(0),
	combout => \count[0]~3_combout\);

-- Location: LCFF_X94_Y20_N9
\count[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \sw~combout\,
	datain => \count[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count(0));

-- Location: LCFF_X94_Y20_N17
\led[0]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \sw~combout\,
	sdata => count(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \led[0]~reg0_regout\);

-- Location: LCCOMB_X94_Y20_N18
\count[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \count[1]~0_combout\ = count(1) $ (count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => count(1),
	datad => count(0),
	combout => \count[1]~0_combout\);

-- Location: LCFF_X94_Y20_N19
\count[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \sw~combout\,
	datain => \count[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count(1));

-- Location: LCCOMB_X94_Y20_N10
\led[1]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \led[1]~reg0feeder_combout\ = count(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count(1),
	combout => \led[1]~reg0feeder_combout\);

-- Location: LCFF_X94_Y20_N11
\led[1]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \sw~combout\,
	datain => \led[1]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \led[1]~reg0_regout\);

-- Location: LCCOMB_X94_Y20_N12
\count[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \count[2]~1_combout\ = count(2) $ (((count(0) & count(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(0),
	datac => count(2),
	datad => count(1),
	combout => \count[2]~1_combout\);

-- Location: LCFF_X94_Y20_N13
\count[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \sw~combout\,
	datain => \count[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count(2));

-- Location: LCCOMB_X94_Y20_N20
\led[2]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \led[2]~reg0feeder_combout\ = count(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count(2),
	combout => \led[2]~reg0feeder_combout\);

-- Location: LCFF_X94_Y20_N21
\led[2]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \sw~combout\,
	datain => \led[2]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \led[2]~reg0_regout\);

-- Location: LCCOMB_X94_Y20_N6
\count[3]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \count[3]~2_combout\ = count(3) $ (((count(0) & (count(1) & count(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(0),
	datab => count(1),
	datac => count(3),
	datad => count(2),
	combout => \count[3]~2_combout\);

-- Location: LCFF_X94_Y20_N7
\count[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \sw~combout\,
	datain => \count[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => count(3));

-- Location: LCCOMB_X94_Y20_N22
\led[3]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \led[3]~reg0feeder_combout\ = count(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => count(3),
	combout => \led[3]~reg0feeder_combout\);

-- Location: LCFF_X94_Y20_N23
\led[3]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \sw~combout\,
	datain => \led[3]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \led[3]~reg0_regout\);

-- Location: PIN_W27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \led[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(0));

-- Location: PIN_W25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \led[1]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(1));

-- Location: PIN_W23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \led[2]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(2));

-- Location: PIN_Y27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \led[3]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(3));
END structure;


