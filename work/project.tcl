set projDir "/home/emrys/mojo/Test3-Alu/work/planAhead"
set projName "Test3-Alu"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/emrys/mojo/Test3-Alu/work/verilog/mojo_top_0.v" "/home/emrys/mojo/Test3-Alu/work/verilog/reset_conditioner_1.v" "/home/emrys/mojo/Test3-Alu/work/verilog/edge_detector_2.v" "/home/emrys/mojo/Test3-Alu/work/verilog/alu_3.v" "/home/emrys/mojo/Test3-Alu/work/verilog/tst_4.v" "/home/emrys/mojo/Test3-Alu/work/verilog/multi_seven_seg_5.v" "/home/emrys/mojo/Test3-Alu/work/verilog/add_6.v" "/home/emrys/mojo/Test3-Alu/work/verilog/cmp_7.v" "/home/emrys/mojo/Test3-Alu/work/verilog/bol_8.v" "/home/emrys/mojo/Test3-Alu/work/verilog/sft_9.v" "/home/emrys/mojo/Test3-Alu/work/verilog/mul_10.v" "/home/emrys/mojo/Test3-Alu/work/verilog/edge_detector_11.v" "/home/emrys/mojo/Test3-Alu/work/verilog/counter_12.v" "/home/emrys/mojo/Test3-Alu/work/verilog/seven_seg_13.v" "/home/emrys/mojo/Test3-Alu/work/verilog/decoder_14.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "/home/emrys/Desktop/mojo-ide-B1.3.6/library/components/mojo.ucf" "/home/emrys/Desktop/mojo-ide-B1.3.6/library/components/io_shield.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1