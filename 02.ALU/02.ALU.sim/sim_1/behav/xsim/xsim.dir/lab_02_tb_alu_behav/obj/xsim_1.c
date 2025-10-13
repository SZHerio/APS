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
extern void execute_91(char*, char *);
extern void execute_112(char*, char *);
extern void svlog_sampling_process_execute(char*, char*, char*);
extern void sequence_expr_m_936afbc3_5c6ca80d_1(char*, char *);
extern void sequence_expr_m_936afbc3_5c6ca80d_2(char*, char *);
extern void vlog_sv_sequence_execute_0 (char*, char*, char*);
extern void assertion_action_m_936afbc3_5c6ca80d_1(char*, char *);
extern void execute_433(char*, char *);
extern void execute_434(char*, char *);
extern void execute_435(char*, char *);
extern void execute_436(char*, char *);
extern void execute_437(char*, char *);
extern void execute_438(char*, char *);
extern void execute_439(char*, char *);
extern void execute_440(char*, char *);
extern void execute_441(char*, char *);
extern void execute_442(char*, char *);
extern void execute_89(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_366(char*, char *);
extern void execute_157(char*, char *);
extern void execute_254(char*, char *);
extern void execute_255(char*, char *);
extern void execute_256(char*, char *);
extern void execute_257(char*, char *);
extern void execute_258(char*, char *);
extern void execute_259(char*, char *);
extern void execute_260(char*, char *);
extern void execute_158(char*, char *);
extern void execute_167(char*, char *);
extern void execute_168(char*, char *);
extern void execute_169(char*, char *);
extern void execute_159(char*, char *);
extern void execute_160(char*, char *);
extern void execute_368(char*, char *);
extern void execute_369(char*, char *);
extern void execute_370(char*, char *);
extern void execute_371(char*, char *);
extern void execute_372(char*, char *);
extern void execute_373(char*, char *);
extern void execute_374(char*, char *);
extern void execute_375(char*, char *);
extern void execute_376(char*, char *);
extern void execute_377(char*, char *);
extern void execute_378(char*, char *);
extern void execute_379(char*, char *);
extern void execute_380(char*, char *);
extern void execute_381(char*, char *);
extern void execute_382(char*, char *);
extern void execute_383(char*, char *);
extern void execute_384(char*, char *);
extern void execute_385(char*, char *);
extern void execute_386(char*, char *);
extern void execute_387(char*, char *);
extern void execute_388(char*, char *);
extern void execute_389(char*, char *);
extern void execute_390(char*, char *);
extern void execute_391(char*, char *);
extern void execute_392(char*, char *);
extern void execute_393(char*, char *);
extern void execute_394(char*, char *);
extern void execute_395(char*, char *);
extern void execute_396(char*, char *);
extern void execute_397(char*, char *);
extern void execute_398(char*, char *);
extern void execute_399(char*, char *);
extern void execute_400(char*, char *);
extern void execute_401(char*, char *);
extern void execute_402(char*, char *);
extern void execute_403(char*, char *);
extern void execute_404(char*, char *);
extern void execute_405(char*, char *);
extern void execute_406(char*, char *);
extern void execute_407(char*, char *);
extern void execute_408(char*, char *);
extern void execute_409(char*, char *);
extern void execute_410(char*, char *);
extern void execute_411(char*, char *);
extern void execute_412(char*, char *);
extern void execute_413(char*, char *);
extern void execute_414(char*, char *);
extern void execute_415(char*, char *);
extern void execute_416(char*, char *);
extern void execute_417(char*, char *);
extern void execute_418(char*, char *);
extern void execute_419(char*, char *);
extern void execute_420(char*, char *);
extern void execute_421(char*, char *);
extern void execute_422(char*, char *);
extern void execute_423(char*, char *);
extern void execute_424(char*, char *);
extern void execute_425(char*, char *);
extern void execute_426(char*, char *);
extern void execute_427(char*, char *);
extern void execute_154(char*, char *);
extern void execute_155(char*, char *);
extern void execute_156(char*, char *);
extern void execute_443(char*, char *);
extern void execute_444(char*, char *);
extern void execute_445(char*, char *);
extern void execute_446(char*, char *);
extern void execute_447(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_2(char*, char*, unsigned, unsigned, unsigned);
extern void vlog_transfunc_eventcallback_2state(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[106] = {(funcp)execute_5, (funcp)execute_91, (funcp)execute_112, (funcp)svlog_sampling_process_execute, (funcp)sequence_expr_m_936afbc3_5c6ca80d_1, (funcp)sequence_expr_m_936afbc3_5c6ca80d_2, (funcp)vlog_sv_sequence_execute_0 , (funcp)assertion_action_m_936afbc3_5c6ca80d_1, (funcp)execute_433, (funcp)execute_434, (funcp)execute_435, (funcp)execute_436, (funcp)execute_437, (funcp)execute_438, (funcp)execute_439, (funcp)execute_440, (funcp)execute_441, (funcp)execute_442, (funcp)execute_89, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_366, (funcp)execute_157, (funcp)execute_254, (funcp)execute_255, (funcp)execute_256, (funcp)execute_257, (funcp)execute_258, (funcp)execute_259, (funcp)execute_260, (funcp)execute_158, (funcp)execute_167, (funcp)execute_168, (funcp)execute_169, (funcp)execute_159, (funcp)execute_160, (funcp)execute_368, (funcp)execute_369, (funcp)execute_370, (funcp)execute_371, (funcp)execute_372, (funcp)execute_373, (funcp)execute_374, (funcp)execute_375, (funcp)execute_376, (funcp)execute_377, (funcp)execute_378, (funcp)execute_379, (funcp)execute_380, (funcp)execute_381, (funcp)execute_382, (funcp)execute_383, (funcp)execute_384, (funcp)execute_385, (funcp)execute_386, (funcp)execute_387, (funcp)execute_388, (funcp)execute_389, (funcp)execute_390, (funcp)execute_391, (funcp)execute_392, (funcp)execute_393, (funcp)execute_394, (funcp)execute_395, (funcp)execute_396, (funcp)execute_397, (funcp)execute_398, (funcp)execute_399, (funcp)execute_400, (funcp)execute_401, (funcp)execute_402, (funcp)execute_403, (funcp)execute_404, (funcp)execute_405, (funcp)execute_406, (funcp)execute_407, (funcp)execute_408, (funcp)execute_409, (funcp)execute_410, (funcp)execute_411, (funcp)execute_412, (funcp)execute_413, (funcp)execute_414, (funcp)execute_415, (funcp)execute_416, (funcp)execute_417, (funcp)execute_418, (funcp)execute_419, (funcp)execute_420, (funcp)execute_421, (funcp)execute_422, (funcp)execute_423, (funcp)execute_424, (funcp)execute_425, (funcp)execute_426, (funcp)execute_427, (funcp)execute_154, (funcp)execute_155, (funcp)execute_156, (funcp)execute_443, (funcp)execute_444, (funcp)execute_445, (funcp)execute_446, (funcp)execute_447, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_2, (funcp)vlog_transfunc_eventcallback_2state};
const int NumRelocateId= 106;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/lab_02_tb_alu_behav/xsim.reloc",  (void **)funcTab, 106);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/lab_02_tb_alu_behav/xsim.reloc");
}

void simulate(char *dp)
{
iki_register_root_pointers(8, 44976, 10,0,45984, 13,0,43296, 6,0,45816, 12,0,43464, 7,0,44640, 9,0,44304, 8,0,45312, 11,0) ; 
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/lab_02_tb_alu_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void subprog_m_936afbc3_5c6ca80d_12() ;
void subprog_m_936afbc3_5c6ca80d_11() ;
void subprog_m_936afbc3_5c6ca80d_10() ;
void subprog_m_936afbc3_5c6ca80d_17() ;
void subprog_m_936afbc3_5c6ca80d_16() ;
void subprog_m_936afbc3_5c6ca80d_15() ;
void subprog_m_936afbc3_5c6ca80d_22() ;
void subprog_m_936afbc3_5c6ca80d_21() ;
void subprog_m_936afbc3_5c6ca80d_20() ;
void subprog_m_936afbc3_5c6ca80d_27() ;
void subprog_m_936afbc3_5c6ca80d_26() ;
void subprog_m_936afbc3_5c6ca80d_25() ;
void subprog_m_936afbc3_5c6ca80d_32() ;
void subprog_m_936afbc3_5c6ca80d_31() ;
void subprog_m_936afbc3_5c6ca80d_30() ;
void subprog_m_936afbc3_5c6ca80d_37() ;
void subprog_m_936afbc3_5c6ca80d_36() ;
void subprog_m_936afbc3_5c6ca80d_35() ;
void subprog_m_936afbc3_5c6ca80d_42() ;
void subprog_m_936afbc3_5c6ca80d_41() ;
void subprog_m_936afbc3_5c6ca80d_40() ;
void subprog_m_936afbc3_5c6ca80d_47() ;
void subprog_m_936afbc3_5c6ca80d_46() ;
void subprog_m_936afbc3_5c6ca80d_45() ;
static char* ng60[] = {(void *)subprog_m_936afbc3_5c6ca80d_12, (void *)subprog_m_936afbc3_5c6ca80d_11, (void *)subprog_m_936afbc3_5c6ca80d_10};
static char* ng70[] = {(void *)subprog_m_936afbc3_5c6ca80d_17, (void *)subprog_m_936afbc3_5c6ca80d_16, (void *)subprog_m_936afbc3_5c6ca80d_15};
static char* ng80[] = {(void *)subprog_m_936afbc3_5c6ca80d_22, (void *)subprog_m_936afbc3_5c6ca80d_21, (void *)subprog_m_936afbc3_5c6ca80d_20};
static char* ng90[] = {(void *)subprog_m_936afbc3_5c6ca80d_27, (void *)subprog_m_936afbc3_5c6ca80d_26, (void *)subprog_m_936afbc3_5c6ca80d_25};
static char* ng100[] = {(void *)subprog_m_936afbc3_5c6ca80d_32, (void *)subprog_m_936afbc3_5c6ca80d_31, (void *)subprog_m_936afbc3_5c6ca80d_30};
static char* ng110[] = {(void *)subprog_m_936afbc3_5c6ca80d_37, (void *)subprog_m_936afbc3_5c6ca80d_36, (void *)subprog_m_936afbc3_5c6ca80d_35};
static char* ng120[] = {(void *)subprog_m_936afbc3_5c6ca80d_42, (void *)subprog_m_936afbc3_5c6ca80d_41, (void *)subprog_m_936afbc3_5c6ca80d_40};
static char* ng130[] = {(void *)subprog_m_936afbc3_5c6ca80d_47, (void *)subprog_m_936afbc3_5c6ca80d_46, (void *)subprog_m_936afbc3_5c6ca80d_45};
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/lab_02_tb_alu_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/lab_02_tb_alu_behav/xsim.crvsdump");
    iki_svlog_initialize_virtual_tables(8, 6, ng60, 7, ng70, 8, ng80, 9, ng90, 10, ng100, 11, ng110, 12, ng120, 13, ng130);
    void* design_handle = iki_create_design("xsim.dir/lab_02_tb_alu_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
