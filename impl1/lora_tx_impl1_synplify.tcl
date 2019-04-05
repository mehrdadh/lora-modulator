#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file

#device options
set_option -technology ECP5U
set_option -part LFE5U_25F
set_option -package BG256I
set_option -speed_grade -6

#compilation/mapping options
set_option -symbolic_fsm_compiler true
set_option -resource_sharing true

#use verilog 2001 standard option
set_option -vlog_std v2001

#map options
set_option -frequency 64
set_option -maxfan 1000
set_option -auto_constrain_io 0
set_option -disable_io_insertion false
set_option -retiming false; set_option -pipe true
set_option -force_gsr false
set_option -compiler_compatible 0
set_option -dup false

set_option -default_enum_encoding default

#simulation options


#timing analysis options
set_option -num_critical_paths 20


#automatic place and route (vendor) options
set_option -write_apr_constraint 1

#synplifyPro options
set_option -fix_gated_and_generated_clocks 1
set_option -update_models_cp 0
set_option -resolve_multiple_driver 0


#-- add_file options
set_option -hdl_define -set SBP_SYNTHESIS
set_option -include_path {C:/work/tinysdr_fpga_lora_tx}
add_file -verilog {C:/work/tinysdr_fpga_lora_tx/impl1/source/accInc.v}
add_file -verilog {C:/work/tinysdr_fpga_lora_tx/impl1/source/chirpGenerator.v}
add_file -verilog {C:/work/tinysdr_fpga_lora_tx/impl1/source/clockDivider.v}
add_file -verilog {C:/work/tinysdr_fpga_lora_tx/impl1/source/constant.v}
add_file -verilog {C:/work/tinysdr_fpga_lora_tx/impl1/source/cosIdeal.v}
add_file -verilog {C:/work/tinysdr_fpga_lora_tx/impl1/source/counter.v}
add_file -verilog {C:/work/tinysdr_fpga_lora_tx/impl1/source/DEDFF.v}
add_file -verilog {C:/work/tinysdr_fpga_lora_tx/impl1/source/initialPhase.v}
add_file -verilog {C:/work/tinysdr_fpga_lora_tx/impl1/source/IQSerializer.v}
add_file -verilog {C:/work/tinysdr_fpga_lora_tx/impl1/source/loRaModulator.v}
add_file -verilog {C:/work/tinysdr_fpga_lora_tx/impl1/source/loraPacketGenerator.v}
add_file -verilog {C:/work/tinysdr_fpga_lora_tx/impl1/source/LoRaTXDefines.v}
add_file -verilog {C:/work/tinysdr_fpga_lora_tx/impl1/source/phaseInc.v}
add_file -verilog {C:/work/tinysdr_fpga_lora_tx/impl1/source/radioDefines.v}
add_file -verilog {C:/work/tinysdr_fpga_lora_tx/impl1/source/sinIdeal.v}
add_file -verilog {C:/work/tinysdr_fpga_lora_tx/lora_tx_clarity/my_pll_64mhz/my_pll_64mhz.v}
add_file -verilog {C:/work/tinysdr_fpga_lora_tx/impl1/source/topModule.v}

#-- top module name
set_option -top_module topModule

#-- set result format/file last
project -result_file {C:/work/tinysdr_fpga_lora_tx/impl1/lora_tx_impl1.edi}

#-- error message log file
project -log_file {lora_tx_impl1.srf}

#-- set any command lines input by customer


#-- run Synplify with 'arrange HDL file'
project -run
