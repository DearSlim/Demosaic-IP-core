# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "Cols" -parent ${Page_0}
  ipgui::add_param $IPINST -name "Lines" -parent ${Page_0}
  ipgui::add_param $IPINST -name "hblank_length" -parent ${Page_0}
  ipgui::add_param $IPINST -name "lengthTotal" -parent ${Page_0}
  ipgui::add_param $IPINST -name "vblank_length" -parent ${Page_0}


}

proc update_PARAM_VALUE.Cols { PARAM_VALUE.Cols } {
	# Procedure called to update Cols when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Cols { PARAM_VALUE.Cols } {
	# Procedure called to validate Cols
	return true
}

proc update_PARAM_VALUE.Lines { PARAM_VALUE.Lines } {
	# Procedure called to update Lines when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Lines { PARAM_VALUE.Lines } {
	# Procedure called to validate Lines
	return true
}

proc update_PARAM_VALUE.hblank_length { PARAM_VALUE.hblank_length } {
	# Procedure called to update hblank_length when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.hblank_length { PARAM_VALUE.hblank_length } {
	# Procedure called to validate hblank_length
	return true
}

proc update_PARAM_VALUE.lengthTotal { PARAM_VALUE.lengthTotal } {
	# Procedure called to update lengthTotal when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.lengthTotal { PARAM_VALUE.lengthTotal } {
	# Procedure called to validate lengthTotal
	return true
}

proc update_PARAM_VALUE.vblank_length { PARAM_VALUE.vblank_length } {
	# Procedure called to update vblank_length when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.vblank_length { PARAM_VALUE.vblank_length } {
	# Procedure called to validate vblank_length
	return true
}


proc update_MODELPARAM_VALUE.lengthTotal { MODELPARAM_VALUE.lengthTotal PARAM_VALUE.lengthTotal } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.lengthTotal}] ${MODELPARAM_VALUE.lengthTotal}
}

proc update_MODELPARAM_VALUE.vblank_length { MODELPARAM_VALUE.vblank_length PARAM_VALUE.vblank_length } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.vblank_length}] ${MODELPARAM_VALUE.vblank_length}
}

proc update_MODELPARAM_VALUE.hblank_length { MODELPARAM_VALUE.hblank_length PARAM_VALUE.hblank_length } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.hblank_length}] ${MODELPARAM_VALUE.hblank_length}
}

proc update_MODELPARAM_VALUE.Lines { MODELPARAM_VALUE.Lines PARAM_VALUE.Lines } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Lines}] ${MODELPARAM_VALUE.Lines}
}

proc update_MODELPARAM_VALUE.Cols { MODELPARAM_VALUE.Cols PARAM_VALUE.Cols } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Cols}] ${MODELPARAM_VALUE.Cols}
}

