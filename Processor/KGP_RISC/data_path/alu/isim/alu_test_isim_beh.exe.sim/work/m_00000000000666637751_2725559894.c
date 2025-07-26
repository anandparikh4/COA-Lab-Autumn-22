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
static const char *ng0 = "C:/Users/SHIVANI/Desktop/Processor/KGP_RISC/data_path/alu/alu.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {0U, 0U};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {3U, 0U};
static unsigned int ng6[] = {4U, 0U};
static unsigned int ng7[] = {5U, 0U};
static unsigned int ng8[] = {6U, 0U};
static unsigned int ng9[] = {7U, 0U};



static void Always_26_0(char *t0)
{
    char t6[8];
    char t15[8];
    char t16[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    int t40;

LAB0:    t1 = (t0 + 4768U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 5336);
    *((int *)t2) = 1;
    t3 = (t0 + 4800);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(26, ng0);

LAB5:    xsi_set_current_line(28, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t6 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 31);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 31);
    t13 = (t12 & 1);
    *((unsigned int *)t4) = t13;
    t14 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t14, t6, 0, 0, 1, 0LL);
    xsi_set_current_line(29, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t16, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t5);
    t13 = (t11 ^ t12);
    t17 = (t10 | t13);
    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t5);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB9;

LAB6:    if (t20 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t16) = 1;

LAB9:    memset(t15, 0, 8);
    t14 = (t16 + 4);
    t23 = *((unsigned int *)t14);
    t24 = (~(t23));
    t25 = *((unsigned int *)t16);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t14) != 0)
        goto LAB12;

LAB13:    t29 = (t15 + 4);
    t30 = *((unsigned int *)t15);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB14;

LAB15:    t34 = *((unsigned int *)t15);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t29) > 0)
        goto LAB18;

LAB19:    if (*((unsigned int *)t15) > 0)
        goto LAB20;

LAB21:    memcpy(t6, t38, 8);

LAB22:    t39 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t39, t6, 0, 0, 1, 0LL);
    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);

LAB23:    t2 = ((char*)((ng3)));
    t40 = xsi_vlog_unsigned_case_compare(t3, 3, t2, 3);
    if (t40 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng2)));
    t40 = xsi_vlog_unsigned_case_compare(t3, 3, t2, 3);
    if (t40 == 1)
        goto LAB26;

LAB27:    t2 = ((char*)((ng4)));
    t40 = xsi_vlog_unsigned_case_compare(t3, 3, t2, 3);
    if (t40 == 1)
        goto LAB28;

LAB29:    t2 = ((char*)((ng5)));
    t40 = xsi_vlog_unsigned_case_compare(t3, 3, t2, 3);
    if (t40 == 1)
        goto LAB30;

LAB31:    t2 = ((char*)((ng6)));
    t40 = xsi_vlog_unsigned_case_compare(t3, 3, t2, 3);
    if (t40 == 1)
        goto LAB32;

LAB33:    t2 = ((char*)((ng7)));
    t40 = xsi_vlog_unsigned_case_compare(t3, 3, t2, 3);
    if (t40 == 1)
        goto LAB34;

LAB35:    t2 = ((char*)((ng8)));
    t40 = xsi_vlog_unsigned_case_compare(t3, 3, t2, 3);
    if (t40 == 1)
        goto LAB36;

LAB37:    t2 = ((char*)((ng9)));
    t40 = xsi_vlog_unsigned_case_compare(t3, 3, t2, 3);
    if (t40 == 1)
        goto LAB38;

LAB39:
LAB40:    goto LAB2;

LAB8:    t7 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB9;

LAB10:    *((unsigned int *)t15) = 1;
    goto LAB13;

LAB12:    t28 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB13;

LAB14:    t33 = ((char*)((ng2)));
    goto LAB15;

LAB16:    t38 = ((char*)((ng3)));
    goto LAB17;

LAB18:    xsi_vlog_unsigned_bit_combine(t6, 1, t33, 1, t38, 1);
    goto LAB22;

LAB20:    memcpy(t6, t33, 8);
    goto LAB22;

LAB24:    xsi_set_current_line(33, ng0);

LAB41:    xsi_set_current_line(34, ng0);
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 32, 0LL);
    xsi_set_current_line(35, ng0);
    t2 = (t0 + 2808U);
    t4 = *((char **)t2);
    t2 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t2, t4, 0, 0, 1, 0LL);
    goto LAB40;

LAB26:    xsi_set_current_line(38, ng0);
    t4 = (t0 + 1688U);
    t5 = *((char **)t4);
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 32, 0LL);
    goto LAB40;

LAB28:    xsi_set_current_line(40, ng0);
    t4 = (t0 + 1848U);
    t5 = *((char **)t4);
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 32, 0LL);
    goto LAB40;

LAB30:    xsi_set_current_line(42, ng0);
    t4 = (t0 + 2008U);
    t5 = *((char **)t4);
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 32, 0LL);
    goto LAB40;

LAB32:    xsi_set_current_line(44, ng0);
    t4 = (t0 + 2168U);
    t5 = *((char **)t4);
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 32, 0LL);
    goto LAB40;

LAB34:    xsi_set_current_line(46, ng0);
    t4 = (t0 + 2648U);
    t5 = *((char **)t4);
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 32, 0LL);
    goto LAB40;

LAB36:    xsi_set_current_line(48, ng0);
    t4 = (t0 + 2328U);
    t5 = *((char **)t4);
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 32, 0LL);
    goto LAB40;

LAB38:    xsi_set_current_line(50, ng0);
    t4 = (t0 + 2488U);
    t5 = *((char **)t4);
    t4 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 32, 0LL);
    goto LAB40;

}

static void implSig1_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 5016U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng3)));
    t3 = (t0 + 5416);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}


extern void work_m_00000000000666637751_2725559894_init()
{
	static char *pe[] = {(void *)Always_26_0,(void *)implSig1_execute};
	xsi_register_didat("work_m_00000000000666637751_2725559894", "isim/alu_test_isim_beh.exe.sim/work/m_00000000000666637751_2725559894.didat");
	xsi_register_executes(pe);
}
