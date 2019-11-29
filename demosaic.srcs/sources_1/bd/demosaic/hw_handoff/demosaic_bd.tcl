
################################################################
# This is a generated script based on design: demosaic
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2017.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source demosaic_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# Demosaic_calG_RB, Demosaic_getBayer, Demosaic_pre_G_RB, Demosaic_tb_writeG_RB, tb_calG_RB

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg400-2
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name demosaic

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports

  # Create instance: Demosaic_calG_RB_0, and set properties
  set block_name Demosaic_calG_RB
  set block_cell_name Demosaic_calG_RB_0
  if { [catch {set Demosaic_calG_RB_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Demosaic_calG_RB_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Demosaic_getBayer_0, and set properties
  set block_name Demosaic_getBayer
  set block_cell_name Demosaic_getBayer_0
  if { [catch {set Demosaic_getBayer_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Demosaic_getBayer_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Demosaic_pre_G_RB_0, and set properties
  set block_name Demosaic_pre_G_RB
  set block_cell_name Demosaic_pre_G_RB_0
  if { [catch {set Demosaic_pre_G_RB_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Demosaic_pre_G_RB_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.Cols {532} \
 ] $Demosaic_pre_G_RB_0

  # Create instance: Demosaic_tb_writeG_RB_0, and set properties
  set block_name Demosaic_tb_writeG_RB
  set block_cell_name Demosaic_tb_writeG_RB_0
  if { [catch {set Demosaic_tb_writeG_RB_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Demosaic_tb_writeG_RB_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: c_shift_ram_3, and set properties
  set c_shift_ram_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_3 ]
  set_property -dict [ list \
   CONFIG.AsyncInitVal {00000000} \
   CONFIG.DefaultData {00000000} \
   CONFIG.Depth {512} \
   CONFIG.SyncInitVal {00000000} \
   CONFIG.Width {8} \
 ] $c_shift_ram_3

  # Create instance: c_shift_ram_6, and set properties
  set c_shift_ram_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_6 ]
  set_property -dict [ list \
   CONFIG.AsyncInitVal {00000000} \
   CONFIG.DefaultData {00000000} \
   CONFIG.Depth {512} \
   CONFIG.SyncInitVal {00000000} \
   CONFIG.Width {8} \
 ] $c_shift_ram_6

  # Create instance: c_shift_ram_7, and set properties
  set c_shift_ram_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_7 ]
  set_property -dict [ list \
   CONFIG.AsyncInitVal {00000000} \
   CONFIG.DefaultData {00000000} \
   CONFIG.Depth {512} \
   CONFIG.SyncInitVal {00000000} \
   CONFIG.Width {8} \
 ] $c_shift_ram_7

  # Create instance: c_shift_ram_8, and set properties
  set c_shift_ram_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_8 ]
  set_property -dict [ list \
   CONFIG.AsyncInitVal {00000000} \
   CONFIG.DefaultData {00000000} \
   CONFIG.Depth {512} \
   CONFIG.SyncInitVal {00000000} \
   CONFIG.Width {8} \
 ] $c_shift_ram_8

  # Create instance: c_shift_ram_9, and set properties
  set c_shift_ram_9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_9 ]
  set_property -dict [ list \
   CONFIG.AsyncInitVal {00000000} \
   CONFIG.DefaultData {00000000} \
   CONFIG.Depth {512} \
   CONFIG.SyncInitVal {00000000} \
   CONFIG.Width {8} \
 ] $c_shift_ram_9

  # Create instance: tb_calG_RB_0, and set properties
  set block_name tb_calG_RB
  set block_cell_name tb_calG_RB_0
  if { [catch {set tb_calG_RB_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $tb_calG_RB_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net Demosaic_calG_RB_0_O_DATA [get_bd_pins Demosaic_calG_RB_0/O_DATA] [get_bd_pins Demosaic_tb_writeG_RB_0/DATA]
  connect_bd_net -net Demosaic_calG_RB_0_O_EN [get_bd_pins Demosaic_calG_RB_0/O_EN] [get_bd_pins Demosaic_tb_writeG_RB_0/IN_EN]
  connect_bd_net -net Demosaic_getBayer_0_CAL_EN [get_bd_pins Demosaic_getBayer_0/CAL_EN] [get_bd_pins Demosaic_pre_G_RB_0/DATA_EN]
  connect_bd_net -net Demosaic_getBayer_0_O_DATA [get_bd_pins Demosaic_getBayer_0/O_DATA] [get_bd_pins c_shift_ram_3/D]
  connect_bd_net -net Demosaic_pre_G_RB_0_DD [get_bd_pins Demosaic_calG_RB_0/DD] [get_bd_pins Demosaic_pre_G_RB_0/DD]
  connect_bd_net -net Demosaic_pre_G_RB_0_DOWNDATA [get_bd_pins Demosaic_calG_RB_0/DOWNDATA] [get_bd_pins Demosaic_pre_G_RB_0/DOWNDATA]
  connect_bd_net -net Demosaic_pre_G_RB_0_LEFTDATA [get_bd_pins Demosaic_calG_RB_0/LEFTDATA] [get_bd_pins Demosaic_pre_G_RB_0/LEFTDATA]
  connect_bd_net -net Demosaic_pre_G_RB_0_LL [get_bd_pins Demosaic_calG_RB_0/LL] [get_bd_pins Demosaic_pre_G_RB_0/LL]
  connect_bd_net -net Demosaic_pre_G_RB_0_MID [get_bd_pins Demosaic_calG_RB_0/MID] [get_bd_pins Demosaic_pre_G_RB_0/MID]
  connect_bd_net -net Demosaic_pre_G_RB_0_O_EN [get_bd_pins Demosaic_calG_RB_0/IN_EN] [get_bd_pins Demosaic_pre_G_RB_0/O_EN]
  connect_bd_net -net Demosaic_pre_G_RB_0_RIGHTDATA [get_bd_pins Demosaic_calG_RB_0/RIGHTDATA] [get_bd_pins Demosaic_pre_G_RB_0/RIGHTDATA]
  connect_bd_net -net Demosaic_pre_G_RB_0_RR [get_bd_pins Demosaic_calG_RB_0/RR] [get_bd_pins Demosaic_pre_G_RB_0/RR]
  connect_bd_net -net Demosaic_pre_G_RB_0_UPDATA [get_bd_pins Demosaic_calG_RB_0/UPDATA] [get_bd_pins Demosaic_pre_G_RB_0/UPDATA]
  connect_bd_net -net Demosaic_pre_G_RB_0_UU [get_bd_pins Demosaic_calG_RB_0/UU] [get_bd_pins Demosaic_pre_G_RB_0/UU]
  connect_bd_net -net c_shift_ram_3_Q [get_bd_pins Demosaic_pre_G_RB_0/DATA5] [get_bd_pins c_shift_ram_3/Q] [get_bd_pins c_shift_ram_9/D]
  connect_bd_net -net c_shift_ram_6_Q [get_bd_pins Demosaic_pre_G_RB_0/DATA1] [get_bd_pins c_shift_ram_6/Q]
  connect_bd_net -net c_shift_ram_7_Q [get_bd_pins Demosaic_pre_G_RB_0/DATA2] [get_bd_pins c_shift_ram_6/D] [get_bd_pins c_shift_ram_7/Q]
  connect_bd_net -net c_shift_ram_8_Q [get_bd_pins Demosaic_pre_G_RB_0/DATA3] [get_bd_pins c_shift_ram_7/D] [get_bd_pins c_shift_ram_8/Q]
  connect_bd_net -net c_shift_ram_9_Q [get_bd_pins Demosaic_pre_G_RB_0/DATA4] [get_bd_pins c_shift_ram_8/D] [get_bd_pins c_shift_ram_9/Q]
  connect_bd_net -net tb_calG_RB_0_CLK [get_bd_pins Demosaic_calG_RB_0/INCLK] [get_bd_pins Demosaic_getBayer_0/PCLK] [get_bd_pins Demosaic_pre_G_RB_0/INCLK] [get_bd_pins Demosaic_tb_writeG_RB_0/INCLK] [get_bd_pins c_shift_ram_3/CLK] [get_bd_pins c_shift_ram_6/CLK] [get_bd_pins c_shift_ram_7/CLK] [get_bd_pins c_shift_ram_8/CLK] [get_bd_pins c_shift_ram_9/CLK] [get_bd_pins tb_calG_RB_0/CLK]
  connect_bd_net -net tb_calG_RB_0_HSYNC [get_bd_pins Demosaic_getBayer_0/HSYNC] [get_bd_pins Demosaic_pre_G_RB_0/HSYNC] [get_bd_pins tb_calG_RB_0/HSYNC]
  connect_bd_net -net tb_calG_RB_0_O_DATA [get_bd_pins Demosaic_getBayer_0/BAYERDATA] [get_bd_pins tb_calG_RB_0/O_DATA]
  connect_bd_net -net tb_calG_RB_0_RSTN [get_bd_pins Demosaic_calG_RB_0/RSTN] [get_bd_pins Demosaic_getBayer_0/RSTN] [get_bd_pins Demosaic_pre_G_RB_0/RSTN] [get_bd_pins Demosaic_tb_writeG_RB_0/RSTN] [get_bd_pins tb_calG_RB_0/RSTN]
  connect_bd_net -net tb_calG_RB_0_VSYNC [get_bd_pins Demosaic_getBayer_0/VSYNC] [get_bd_pins tb_calG_RB_0/VSYNC]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


