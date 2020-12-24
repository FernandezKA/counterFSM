@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Wed Dec 23 11:39:43 +0300 2020
REM SW Build 3064766 on Wed Nov 18 09:12:45 MST 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim countFSM_behav -key {Behavioral:sim_1:Functional:countFSM} -tclbatch countFSM.tcl -view C:/dev/FPGA/countFSM/countFSM_tb_behav.wcfg -log simulate.log"
call xsim  countFSM_behav -key {Behavioral:sim_1:Functional:countFSM} -tclbatch countFSM.tcl -view C:/dev/FPGA/countFSM/countFSM_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
