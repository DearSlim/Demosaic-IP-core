/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_5(char*, char *);
extern void execute_6(char*, char *);
extern void execute_7(char*, char *);
extern void execute_8(char*, char *);
extern void execute_9(char*, char *);
extern void execute_10(char*, char *);
extern void execute_11(char*, char *);
extern void execute_12(char*, char *);
extern void execute_13(char*, char *);
extern void execute_14(char*, char *);
extern void execute_15(char*, char *);
extern void execute_16(char*, char *);
extern void execute_17(char*, char *);
extern void execute_18(char*, char *);
extern void execute_19(char*, char *);
extern void execute_20(char*, char *);
extern void execute_21(char*, char *);
extern void execute_22(char*, char *);
extern void execute_23(char*, char *);
extern void execute_905(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_27(char*, char *);
extern void execute_909(char*, char *);
extern void execute_910(char*, char *);
extern void execute_30(char*, char *);
extern void execute_31(char*, char *);
extern void execute_32(char*, char *);
extern void execute_33(char*, char *);
extern void execute_34(char*, char *);
extern void execute_35(char*, char *);
extern void execute_913(char*, char *);
extern void execute_914(char*, char *);
extern void execute_38(char*, char *);
extern void execute_39(char*, char *);
extern void execute_90(char*, char *);
extern void execute_93(char*, char *);
extern void execute_101(char*, char *);
extern void execute_102(char*, char *);
extern void execute_103(char*, char *);
extern void execute_105(char*, char *);
extern void execute_106(char*, char *);
extern void execute_107(char*, char *);
extern void execute_109(char*, char *);
extern void execute_110(char*, char *);
extern void execute_111(char*, char *);
extern void execute_113(char*, char *);
extern void execute_114(char*, char *);
extern void execute_115(char*, char *);
extern void execute_117(char*, char *);
extern void execute_118(char*, char *);
extern void execute_119(char*, char *);
extern void execute_121(char*, char *);
extern void execute_122(char*, char *);
extern void execute_123(char*, char *);
extern void execute_125(char*, char *);
extern void execute_126(char*, char *);
extern void execute_127(char*, char *);
extern void execute_129(char*, char *);
extern void execute_130(char*, char *);
extern void execute_131(char*, char *);
extern void execute_135(char*, char *);
extern void execute_136(char*, char *);
extern void execute_137(char*, char *);
extern void execute_139(char*, char *);
extern void execute_140(char*, char *);
extern void execute_141(char*, char *);
extern void execute_143(char*, char *);
extern void execute_144(char*, char *);
extern void execute_145(char*, char *);
extern void execute_147(char*, char *);
extern void execute_148(char*, char *);
extern void execute_149(char*, char *);
extern void execute_151(char*, char *);
extern void execute_152(char*, char *);
extern void execute_153(char*, char *);
extern void execute_155(char*, char *);
extern void execute_156(char*, char *);
extern void execute_157(char*, char *);
extern void execute_159(char*, char *);
extern void execute_160(char*, char *);
extern void execute_161(char*, char *);
extern void execute_163(char*, char *);
extern void execute_164(char*, char *);
extern void execute_165(char*, char *);
extern void execute_169(char*, char *);
extern void execute_170(char*, char *);
extern void execute_171(char*, char *);
extern void execute_173(char*, char *);
extern void execute_174(char*, char *);
extern void execute_175(char*, char *);
extern void execute_177(char*, char *);
extern void execute_178(char*, char *);
extern void execute_179(char*, char *);
extern void execute_181(char*, char *);
extern void execute_182(char*, char *);
extern void execute_183(char*, char *);
extern void execute_185(char*, char *);
extern void execute_186(char*, char *);
extern void execute_187(char*, char *);
extern void execute_189(char*, char *);
extern void execute_190(char*, char *);
extern void execute_191(char*, char *);
extern void execute_193(char*, char *);
extern void execute_194(char*, char *);
extern void execute_195(char*, char *);
extern void execute_197(char*, char *);
extern void execute_198(char*, char *);
extern void execute_199(char*, char *);
extern void execute_204(char*, char *);
extern void execute_205(char*, char *);
extern void execute_206(char*, char *);
extern void execute_208(char*, char *);
extern void execute_209(char*, char *);
extern void execute_210(char*, char *);
extern void execute_212(char*, char *);
extern void execute_213(char*, char *);
extern void execute_214(char*, char *);
extern void execute_216(char*, char *);
extern void execute_217(char*, char *);
extern void execute_218(char*, char *);
extern void execute_220(char*, char *);
extern void execute_221(char*, char *);
extern void execute_222(char*, char *);
extern void execute_224(char*, char *);
extern void execute_225(char*, char *);
extern void execute_226(char*, char *);
extern void execute_228(char*, char *);
extern void execute_229(char*, char *);
extern void execute_230(char*, char *);
extern void execute_232(char*, char *);
extern void execute_233(char*, char *);
extern void execute_234(char*, char *);
extern void execute_898(char*, char *);
extern void execute_899(char*, char *);
extern void execute_900(char*, char *);
extern void execute_926(char*, char *);
extern void execute_902(char*, char *);
extern void execute_903(char*, char *);
extern void execute_904(char*, char *);
extern void execute_930(char*, char *);
extern void execute_931(char*, char *);
extern void execute_932(char*, char *);
extern void execute_933(char*, char *);
extern void execute_934(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_3(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_14(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_15(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_16(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_17(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_18(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_19(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_126(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_205(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_284(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_363(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_442(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[158] = {(funcp)execute_5, (funcp)execute_6, (funcp)execute_7, (funcp)execute_8, (funcp)execute_9, (funcp)execute_10, (funcp)execute_11, (funcp)execute_12, (funcp)execute_13, (funcp)execute_14, (funcp)execute_15, (funcp)execute_16, (funcp)execute_17, (funcp)execute_18, (funcp)execute_19, (funcp)execute_20, (funcp)execute_21, (funcp)execute_22, (funcp)execute_23, (funcp)execute_905, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_27, (funcp)execute_909, (funcp)execute_910, (funcp)execute_30, (funcp)execute_31, (funcp)execute_32, (funcp)execute_33, (funcp)execute_34, (funcp)execute_35, (funcp)execute_913, (funcp)execute_914, (funcp)execute_38, (funcp)execute_39, (funcp)execute_90, (funcp)execute_93, (funcp)execute_101, (funcp)execute_102, (funcp)execute_103, (funcp)execute_105, (funcp)execute_106, (funcp)execute_107, (funcp)execute_109, (funcp)execute_110, (funcp)execute_111, (funcp)execute_113, (funcp)execute_114, (funcp)execute_115, (funcp)execute_117, (funcp)execute_118, (funcp)execute_119, (funcp)execute_121, (funcp)execute_122, (funcp)execute_123, (funcp)execute_125, (funcp)execute_126, (funcp)execute_127, (funcp)execute_129, (funcp)execute_130, (funcp)execute_131, (funcp)execute_135, (funcp)execute_136, (funcp)execute_137, (funcp)execute_139, (funcp)execute_140, (funcp)execute_141, (funcp)execute_143, (funcp)execute_144, (funcp)execute_145, (funcp)execute_147, (funcp)execute_148, (funcp)execute_149, (funcp)execute_151, (funcp)execute_152, (funcp)execute_153, (funcp)execute_155, (funcp)execute_156, (funcp)execute_157, (funcp)execute_159, (funcp)execute_160, (funcp)execute_161, (funcp)execute_163, (funcp)execute_164, (funcp)execute_165, (funcp)execute_169, (funcp)execute_170, (funcp)execute_171, (funcp)execute_173, (funcp)execute_174, (funcp)execute_175, (funcp)execute_177, (funcp)execute_178, (funcp)execute_179, (funcp)execute_181, (funcp)execute_182, (funcp)execute_183, (funcp)execute_185, (funcp)execute_186, (funcp)execute_187, (funcp)execute_189, (funcp)execute_190, (funcp)execute_191, (funcp)execute_193, (funcp)execute_194, (funcp)execute_195, (funcp)execute_197, (funcp)execute_198, (funcp)execute_199, (funcp)execute_204, (funcp)execute_205, (funcp)execute_206, (funcp)execute_208, (funcp)execute_209, (funcp)execute_210, (funcp)execute_212, (funcp)execute_213, (funcp)execute_214, (funcp)execute_216, (funcp)execute_217, (funcp)execute_218, (funcp)execute_220, (funcp)execute_221, (funcp)execute_222, (funcp)execute_224, (funcp)execute_225, (funcp)execute_226, (funcp)execute_228, (funcp)execute_229, (funcp)execute_230, (funcp)execute_232, (funcp)execute_233, (funcp)execute_234, (funcp)execute_898, (funcp)execute_899, (funcp)execute_900, (funcp)execute_926, (funcp)execute_902, (funcp)execute_903, (funcp)execute_904, (funcp)execute_930, (funcp)execute_931, (funcp)execute_932, (funcp)execute_933, (funcp)execute_934, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_3, (funcp)transaction_14, (funcp)transaction_15, (funcp)transaction_16, (funcp)transaction_17, (funcp)transaction_18, (funcp)transaction_19, (funcp)transaction_126, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_205, (funcp)transaction_284, (funcp)transaction_363, (funcp)transaction_442};
const int NumRelocateId= 158;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/demosaic_wrapper_behav/xsim.reloc",  (void **)funcTab, 158);
	iki_vhdl_file_variable_register(dp + 927736);
	iki_vhdl_file_variable_register(dp + 927792);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/demosaic_wrapper_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/demosaic_wrapper_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 961120, dp + 931224, 0, 7, 0, 7, 8, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 997616, dp + 931280, 0, 7, 0, 7, 8, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1034112, dp + 931336, 0, 7, 0, 7, 8, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1070608, dp + 931392, 0, 7, 0, 7, 8, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1107104, dp + 931448, 0, 7, 0, 7, 8, 1);
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/demosaic_wrapper_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/demosaic_wrapper_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/demosaic_wrapper_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
