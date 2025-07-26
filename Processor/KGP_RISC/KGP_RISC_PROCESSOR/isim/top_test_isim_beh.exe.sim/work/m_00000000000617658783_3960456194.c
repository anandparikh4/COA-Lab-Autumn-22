/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Admin/Desktop/Sem 5/COA Lab/Processor/KGP_RISC/KGP_RISC_PROCESSOR/branch_control.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {4U, 0U};
static unsigned int ng6[] = {5U, 0U};



static void Always_7_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 3648U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(7, ng0);
    t2 = (t0 + 3968);
    *((int *)t2) = 1;
    t3 = (t0 + 3680);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(7, ng0);

LAB5:    xsi_set_current_line(8, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 3);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB15;

LAB16:
LAB17:    goto LAB2;

LAB7:    xsi_set_current_line(9, ng0);
    t7 = (t0 + 1368U);
    t8 = *((char **)t7);
    t7 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t7, t8, 0, 0, 32, 0LL);
    goto LAB17;

LAB9:    xsi_set_current_line(10, ng0);

LAB18:    xsi_set_current_line(11, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);

LAB19:    t3 = ((char*)((ng1)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 5, t3, 5);
    if (t9 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t6 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t6 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t6 == 1)
        goto LAB26;

LAB27:
LAB28:    goto LAB17;

LAB11:    xsi_set_current_line(33, ng0);
    t3 = (t0 + 1688U);
    t11 = *((char **)t3);
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t11, 0, 0, 32, 0LL);
    goto LAB17;

LAB13:    xsi_set_current_line(34, ng0);

LAB50:    xsi_set_current_line(35, ng0);
    t3 = (t0 + 2328U);
    t11 = *((char **)t3);

LAB51:    t3 = ((char*)((ng1)));
    t9 = xsi_vlog_unsigned_case_compare(t11, 1, t3, 1);
    if (t9 == 1)
        goto LAB52;

LAB53:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t11, 1, t2, 1);
    if (t6 == 1)
        goto LAB54;

LAB55:
LAB56:    goto LAB17;

LAB15:    xsi_set_current_line(40, ng0);

LAB57:    xsi_set_current_line(41, ng0);
    t3 = (t0 + 2328U);
    t12 = *((char **)t3);

LAB58:    t3 = ((char*)((ng2)));
    t9 = xsi_vlog_unsigned_case_compare(t12, 1, t3, 1);
    if (t9 == 1)
        goto LAB59;

LAB60:    t2 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t12, 1, t2, 1);
    if (t6 == 1)
        goto LAB61;

LAB62:
LAB63:    goto LAB17;

LAB20:    xsi_set_current_line(12, ng0);
    t7 = (t0 + 1848U);
    t8 = *((char **)t7);
    t7 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t7, t8, 0, 0, 32, 0LL);
    goto LAB28;

LAB22:    xsi_set_current_line(13, ng0);

LAB29:    xsi_set_current_line(14, ng0);
    t3 = (t0 + 2168U);
    t7 = *((char **)t3);

LAB30:    t3 = ((char*)((ng1)));
    t9 = xsi_vlog_unsigned_case_compare(t7, 1, t3, 1);
    if (t9 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t7, 1, t2, 1);
    if (t6 == 1)
        goto LAB33;

LAB34:
LAB35:    goto LAB28;

LAB24:    xsi_set_current_line(19, ng0);

LAB36:    xsi_set_current_line(20, ng0);
    t3 = (t0 + 2008U);
    t8 = *((char **)t3);

LAB37:    t3 = ((char*)((ng1)));
    t9 = xsi_vlog_unsigned_case_compare(t8, 1, t3, 1);
    if (t9 == 1)
        goto LAB38;

LAB39:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 1, t2, 1);
    if (t6 == 1)
        goto LAB40;

LAB41:
LAB42:    goto LAB28;

LAB26:    xsi_set_current_line(25, ng0);

LAB43:    xsi_set_current_line(26, ng0);
    t3 = (t0 + 2008U);
    t10 = *((char **)t3);

LAB44:    t3 = ((char*)((ng2)));
    t9 = xsi_vlog_unsigned_case_compare(t10, 1, t3, 1);
    if (t9 == 1)
        goto LAB45;

LAB46:    t2 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t10, 1, t2, 1);
    if (t6 == 1)
        goto LAB47;

LAB48:
LAB49:    goto LAB28;

LAB31:    xsi_set_current_line(15, ng0);
    t8 = (t0 + 1368U);
    t10 = *((char **)t8);
    t8 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t8, t10, 0, 0, 32, 0LL);
    goto LAB35;

LAB33:    xsi_set_current_line(16, ng0);
    t3 = (t0 + 1528U);
    t8 = *((char **)t3);
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t8, 0, 0, 32, 0LL);
    goto LAB35;

LAB38:    xsi_set_current_line(21, ng0);
    t10 = (t0 + 1368U);
    t11 = *((char **)t10);
    t10 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t10, t11, 0, 0, 32, 0LL);
    goto LAB42;

LAB40:    xsi_set_current_line(22, ng0);
    t3 = (t0 + 1528U);
    t10 = *((char **)t3);
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t10, 0, 0, 32, 0LL);
    goto LAB42;

LAB45:    xsi_set_current_line(27, ng0);
    t11 = (t0 + 1368U);
    t12 = *((char **)t11);
    t11 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t11, t12, 0, 0, 32, 0LL);
    goto LAB49;

LAB47:    xsi_set_current_line(28, ng0);
    t3 = (t0 + 1528U);
    t11 = *((char **)t3);
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t11, 0, 0, 32, 0LL);
    goto LAB49;

LAB52:    xsi_set_current_line(36, ng0);
    t12 = (t0 + 1368U);
    t13 = *((char **)t12);
    t12 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t12, t13, 0, 0, 32, 0LL);
    goto LAB56;

LAB54:    xsi_set_current_line(37, ng0);
    t3 = (t0 + 1688U);
    t12 = *((char **)t3);
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t12, 0, 0, 32, 0LL);
    goto LAB56;

LAB59:    xsi_set_current_line(42, ng0);
    t13 = (t0 + 1368U);
    t14 = *((char **)t13);
    t13 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t13, t14, 0, 0, 32, 0LL);
    goto LAB63;

LAB61:    xsi_set_current_line(43, ng0);
    t3 = (t0 + 1688U);
    t13 = *((char **)t3);
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t13, 0, 0, 32, 0LL);
    goto LAB63;

}


extern void work_m_00000000000617658783_3960456194_init()
{
	static char *pe[] = {(void *)Always_7_0};
	xsi_register_didat("work_m_00000000000617658783_3960456194", "isim/top_test_isim_beh.exe.sim/work/m_00000000000617658783_3960456194.didat");
	xsi_register_executes(pe);
}
