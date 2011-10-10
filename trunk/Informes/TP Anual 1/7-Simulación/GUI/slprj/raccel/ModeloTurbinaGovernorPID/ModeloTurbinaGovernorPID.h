#ifndef RTW_HEADER_ModeloTurbinaGovernorPID_h_
#define RTW_HEADER_ModeloTurbinaGovernorPID_h_
#ifndef ModeloTurbinaGovernorPID_COMMON_INCLUDES_
# define ModeloTurbinaGovernorPID_COMMON_INCLUDES_
#include <stdlib.h>
#include <stddef.h>
#include <string.h>
#include "rtwtypes.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "rt_logging.h"
#include "dt_info.h"
#include "ext_work.h"
#include "mwmathutil.h"
#include "rt_SATURATE.h"
#include "rt_look.h"
#include "rt_look1d.h"
#include "rt_nonfinite.h"
#endif

#include "ModeloTurbinaGovernorPID_types.h"
#define MODEL_NAME                     ModeloTurbinaGovernorPID
#define NSAMPLE_TIMES                  (2)
#define NINPUTS                        (0)
#define NOUTPUTS                       (0)
#define NBLOCKIO                       (67)
#define NUM_ZC_EVENTS                  (0)
#ifndef NCSTATES
# define NCSTATES                      (29)
#elif NCSTATES != 29
# error Invalid specification of NCSTATES defined in compiler command
#endif

#ifndef rtmGetDataMapInfo
# define rtmGetDataMapInfo(rtm)        (NULL)
#endif

#ifndef rtmSetDataMapInfo
# define rtmSetDataMapInfo(rtm, val)
#endif

typedef struct {
  real_T phimd;
  real_T DataTypeConversion;
  real_T DataTypeConversion1;
  real_T Sum;
  real_T ib[3];
  real_T SineWaveA;
  real_T SineWaveB;
  real_T SineWaveC;
  real_T StateSpace_o1[7];
  real_T StateSpace_o2[3];
  real_T Product;
  real_T n;
  real_T StateSpace;
  real_T Vfdmax;
  real_T Sum_d;
  real_T DataTypeConversion_j;
  real_T Product1;
  real_T DataTypeConversion2;
  real_T Sum1;
  real_T StateSpace_i;
  real_T is_a;
  real_T is_b;
  real_T is_c;
  real_T Sum_f;
  real_T StateSpace_d;
  real_T PositiveSequenceVoltage;
  real_T Sum1_e;
  real_T Integral;
  real_T Sum4;
  real_T servomotor;
  real_T speedlimit;
  real_T Gain2;
  real_T web_psb;
  real_T web_psb_l;
  real_T web_psb_e;
  real_T web_psb_lb;
  real_T web_psb_d;
  real_T web_psb_h;
  real_T _2H;
  real_T web1;
  real_T web3;
  real_T Gain;
  real_T Gain2_i;
  real_T LookUpTable;
  real_T LookUpTable_i;
  real_T Switch3;
  real_T Sfunction;
  real_T Derivative;
  real_T LookUpTable_d;
  real_T Switch3_m;
  real_T Sfunction_k;
  real_T Derivative_n;
  real_T LookUpTable_h;
  real_T Switch3_h;
  real_T Sfunction_j;
  real_T Derivative_h;
  real_T Derivative_o;
  real_T int_f;
  real_T Sum_a;
  real_T Switch;
  real_T Switch1;
  real_T Switch_c;
  boolean_T DataTypeConversion3;
  boolean_T DataTypeConversion2_g;
  boolean_T DataTypeConversion1_k;
  boolean_T RelationalOperator;
  boolean_T RelationalOperator_a;
} BlockIO;

typedef struct {
  real_T Sfunction_DSTATE[2];
  real_T Sfunction_DSTATE_b[2];
  real_T Sfunction_DSTATE_k[2];
  struct {
    real_T TimeStampA;
    real_T LastUAtTimeA;
    real_T TimeStampB;
    real_T LastUAtTimeB;
  } Derivative_RWORK;

  struct {
    real_T TimeStampA;
    real_T LastUAtTimeA;
    real_T TimeStampB;
    real_T LastUAtTimeB;
  } Derivative_RWORK_h;

  struct {
    real_T TimeStampA;
    real_T LastUAtTimeA;
    real_T TimeStampB;
    real_T LastUAtTimeB;
  } Derivative_RWORK_b;

  struct {
    real_T TimeStampA;
    real_T LastUAtTimeA;
    real_T TimeStampB;
    real_T LastUAtTimeB;
  } Derivative_RWORK_o;

  struct {
    void *AS;
    void *BS;
    void *CS;
    void *DS;
    void *DX_COL;
    void *BD_COL;
    void *TMP1;
    void *TMP2;
    void *SWITCH_STATUS;
    void *SWITCH_STATUS_INIT;
    void *SW_CHG;
    void *CHOPPER;
    void *G_STATE;
    void *IDX_SW_CHG;
    void *Y_SWITCH;
    void *SWITCH_TYPES;
    void *IDX_OUT_SW;
  } StateSpace_PWORK;

  struct {
    void *LoggedData;
  } labcpu_PWORK;

  struct {
    void *LoggedData;
  } PotMec_PWORK;

  struct {
    void *LoggedData;
  } Velocidadpu_PWORK;

  struct {
    void *LoggedData;
  } Vfpu_PWORK;

  struct {
    void *LoggedData;
  } corrienteEstator_PWORK;

  struct {
    void *LoggedData;
  } potMec_PWORK;

  struct {
    void *LoggedData;
  } velocidadRotor_PWORK;

  struct {
    void *LoggedData;
  } Vapu_PWORK;

  struct {
    void *LoggedData;
  } vain_PWORK;

  struct {
    void *LoggedData;
  } Vapu1_PWORK;

  struct {
    void *LoggedData;
  } vaout_PWORK;

  int_T StateSpace_IWORK[4];
  int_T StateSpace_MODE[3];
  int_T position_MODE;
  int_T speedlimit_MODE;
  int8_T Enabledintegrator_SubsysRanBC;
  int8_T dqaxissaturation_SubsysRanBC;
  int8_T daxissaturation_SubsysRanBC;
  boolean_T RelationalOperator2_Mode;
  boolean_T RelationalOperator1_Mode;
  boolean_T RelationalOperator_Mode;
  boolean_T RelationalOperator_Mode_e;
  boolean_T Enabledintegrator_MODE;
  boolean_T dqaxissaturation_MODE;
  boolean_T daxissaturation_MODE;
} D_Work;

typedef struct {
  real_T Rotorangledtheta_CSTATE;
  real_T int_CSTATE;
  real_T int_CSTATE_n;
  real_T int_CSTATE_e;
  real_T int1_CSTATE;
  real_T int_CSTATE_j;
  real_T StateSpace_CSTATE[12];
  real_T Rotorspeeddeviationdw_CSTATE;
  real_T position_CSTATE;
  real_T Integrator_CSTATE;
  real_T StateSpace_CSTATE_n;
  real_T StateSpace_CSTATE_k;
  real_T StateSpace_CSTATE_km;
  real_T Derivative_CSTATE;
  real_T Integrator1_CSTATE;
  real_T servomotor_CSTATE;
  real_T theta_CSTATE;
  real_T int_CSTATE_k;
} ContinuousStates;

typedef struct {
  real_T Rotorangledtheta_CSTATE;
  real_T int_CSTATE;
  real_T int_CSTATE_n;
  real_T int_CSTATE_e;
  real_T int1_CSTATE;
  real_T int_CSTATE_j;
  real_T StateSpace_CSTATE[12];
  real_T Rotorspeeddeviationdw_CSTATE;
  real_T position_CSTATE;
  real_T Integrator_CSTATE;
  real_T StateSpace_CSTATE_n;
  real_T StateSpace_CSTATE_k;
  real_T StateSpace_CSTATE_km;
  real_T Derivative_CSTATE;
  real_T Integrator1_CSTATE;
  real_T servomotor_CSTATE;
  real_T theta_CSTATE;
  real_T int_CSTATE_k;
} StateDerivatives;

typedef struct {
  boolean_T Rotorangledtheta_CSTATE;
  boolean_T int_CSTATE;
  boolean_T int_CSTATE_n;
  boolean_T int_CSTATE_e;
  boolean_T int1_CSTATE;
  boolean_T int_CSTATE_j;
  boolean_T StateSpace_CSTATE[12];
  boolean_T Rotorspeeddeviationdw_CSTATE;
  boolean_T position_CSTATE;
  boolean_T Integrator_CSTATE;
  boolean_T StateSpace_CSTATE_n;
  boolean_T StateSpace_CSTATE_k;
  boolean_T StateSpace_CSTATE_km;
  boolean_T Derivative_CSTATE;
  boolean_T Integrator1_CSTATE;
  boolean_T servomotor_CSTATE;
  boolean_T theta_CSTATE;
  boolean_T int_CSTATE_k;
} StateDisabled;

typedef struct {
  real_T StateSpace_Sf0_ZC[6];
  real_T position_IntgUpLimit_ZC;
  real_T position_IntgLoLimit_ZC;
  real_T position_LeaveSaturate_ZC;
  real_T RelationalOperator2_RelopInput_ZC;
  real_T RelationalOperator1_RelopInput_ZC;
  real_T speedlimit_UprLim_ZC;
  real_T speedlimit_LwrLim_ZC;
  real_T Sfunction_Sf0_ZC[2];
  real_T HitCrossing_HitNoOutput_ZC;
  real_T Sfunction_Sf0_ZC_e[2];
  real_T HitCrossing_HitNoOutput_ZC_p;
  real_T Sfunction_Sf0_ZC_k[2];
  real_T HitCrossing_HitNoOutput_ZC_a;
  real_T HitCrossing_HitNoOutput_ZC_g;
  real_T RelationalOperator_RelopInput_ZC;
  real_T RelationalOperator_RelopInput_ZC_m;
} ZCSignalValues;

typedef struct {
  ZCSigState StateSpace_Sf0_ZCE[6];
  ZCSigState position_IntgUpLimit_ZCE;
  ZCSigState position_IntgLoLimit_ZCE;
  ZCSigState position_LeaveSaturate_ZCE;
  ZCSigState RelationalOperator2_RelopInput_ZCE;
  ZCSigState RelationalOperator1_RelopInput_ZCE;
  ZCSigState speedlimit_UprLim_ZCE;
  ZCSigState speedlimit_LwrLim_ZCE;
  ZCSigState Sfunction_Sf0_ZCE[2];
  ZCSigState HitCrossing_HitNoOutput_ZCE;
  ZCSigState Sfunction_Sf0_ZCE_g[2];
  ZCSigState HitCrossing_HitNoOutput_ZCE_h;
  ZCSigState Sfunction_Sf0_ZCE_i[2];
  ZCSigState HitCrossing_HitNoOutput_ZCE_m;
  ZCSigState HitCrossing_HitNoOutput_ZCE_e;
  ZCSigState RelationalOperator_RelopInput_ZCE;
  ZCSigState RelationalOperator_RelopInput_ZCE_p;
} PrevZCSigStates;

struct Parameters_ {
  real_T Gain_Gain;
  real_T LadLmd_Gain;
  real_T phimdsat_Y0;
  real_T Vs_Value;
  real_T LaqLmq_Gain;
  real_T LadLmd_Gain_k;
  real_T phimqsat_Y0;
  real_T phimdsat_Y0_m;
  real_T Vs_Value_f;
  real_T Out1_Y0;
  real_T int_IC;
  real_T SwitchCurrents_Value[3];
  real_T Rotorangledtheta_IC;
  real_T web2_Gain;
  real_T int_IC_g;
  real_T Lad_Ll_Gain;
  real_T int_IC_c;
  real_T Lad_Llfd_Gain;
  real_T int_IC_m;
  real_T Lad_Llkd_Gain;
  real_T int1_IC;
  real_T Laq_Ll_Gain;
  real_T int_IC_p;
  real_T Laq_Llkq1_Gain;
  real_T Laq_Llkq2_Gain;
  real_T Switch_Threshold;
  real_T u_Ll_Gain;
  real_T Gain_Gain_a;
  real_T Gain1_Gain;
  real_T u_Ll_Gain_m;
  real_T ib_Gain;
  real_T SineWaveA_Amp;
  real_T SineWaveA_Bias;
  real_T SineWaveA_Freq;
  real_T SineWaveA_Phase;
  real_T SineWaveB_Amp;
  real_T SineWaveB_Bias;
  real_T SineWaveB_Freq;
  real_T SineWaveB_Phase;
  real_T SineWaveC_Amp;
  real_T SineWaveC_Bias;
  real_T SineWaveC_Freq;
  real_T SineWaveC_Phase;
  real_T Rotorspeeddeviationdw_IC;
  real_T beta_Gain;
  real_T position_IC;
  real_T position_UpperSat;
  real_T position_LowerSat;
  real_T turbinegain_Gain;
  real_T Integrator_IC;
  real_T nomspeed_Value;
  real_T units_Gain;
  real_T StateSpace_A;
  real_T StateSpace_C;
  real_T StateSpace_X0;
  real_T Constant1_Value;
  real_T StateSpace_A_d;
  real_T StateSpace_C_o;
  real_T StateSpace_X0_f;
  real_T Vfdmax1_Gain;
  real_T Constant_Value;
  real_T Constant3_Value;
  real_T Vfdmax_Gain;
  real_T StateSpace_D_k;
  real_T outputformatting_Gain;
  real_T outputformatting1_Gain;
  real_T outputformatting2_Gain;
  real_T StateSpace_A_o;
  real_T StateSpace_C_o2;
  real_T StateSpace_D_n;
  real_T StateSpace_X0_l;
  real_T Vderef_Value;
  real_T Vf0ka_Value;
  real_T StateSpace_D_e;
  real_T _Vb_Gain;
  real_T outputformatting9_Gain;
  real_T outputformatting8_Gain;
  real_T Constant1_Value_o;
  real_T Derivative_A;
  real_T Derivative_C;
  real_T velocidadRef_Value;
  real_T potenciaMecRef_Value;
  real_T Switch_Threshold_h;
  real_T permanentdroop_Gain;
  real_T Integral_Gain;
  real_T Integrator1_IC;
  real_T Proportional_Gain;
  real_T servomotor_A;
  real_T servomotor_C;
  real_T speedlimit_UpperSat;
  real_T speedlimit_LowerSat;
  real_T Constant_Value_g;
  real_T Gain2_Gain;
  real_T Constant_Value_d;
  real_T Switch_Threshold_d;
  real_T Switch1_Threshold;
  real_T Rs_Ll_Gain;
  real_T web_psb_Gain;
  real_T N_Gain;
  real_T Rf_Llfd_Gain;
  real_T web_psb_Gain_h;
  real_T Rkd_Llkd_Gain;
  real_T web_psb_Gain_m;
  real_T Rkq1_Llkq1_Gain;
  real_T web_psb_Gain_l;
  real_T Rkq2_Llkq2_Gain;
  real_T web_psb_Gain_p;
  real_T Rs_Ll_Gain_k;
  real_T web_psb_Gain_a;
  real_T _Pb_Gain;
  real_T F1_Gain;
  real_T _2H_Gain;
  real_T theta_IC;
  real_T web1_Gain;
  real_T web3_Gain;
  real_T donotdeletethisgain_Gain;
  real_T Gain_Gain_l;
  real_T donotdeletethisgain_Gain_i;
  real_T Gain2_Gain_l;
  real_T C4_Value;
  real_T com_Value;
  real_T C4_Value_j;
  real_T LookUpTable_XData[7];
  real_T LookUpTable_YData[7];
  real_T Switch3_Threshold;
  real_T Constant1_Value_e;
  real_T LookUpTable_XData_a[7];
  real_T LookUpTable_YData_a[7];
  real_T Switch3_Threshold_k;
  real_T Sfunction_P1_Size[2];
  real_T Sfunction_P1;
  real_T HitCrossing_Offset;
  real_T C4_Value_h;
  real_T Constant2_Value;
  real_T LookUpTable_XData_h[7];
  real_T LookUpTable_YData_l[7];
  real_T Switch3_Threshold_d;
  real_T Sfunction_P1_Size_f[2];
  real_T Sfunction_P1_k;
  real_T HitCrossing_Offset_h;
  real_T C4_Value_b;
  real_T Constant3_Value_d;
  real_T LookUpTable_XData_j[7];
  real_T LookUpTable_YData_m[7];
  real_T Switch3_Threshold_f;
  real_T Sfunction_P1_Size_n[2];
  real_T Sfunction_P1_h;
  real_T HitCrossing_Offset_e;
  real_T HitCrossing_Offset_l;
  boolean_T wref_Value;
  boolean_T Vs4_Value;
  boolean_T Vs5_Value;
};

extern Parameters rtP;
extern const char *RT_MEMORY_ALLOCATION_ERROR;
extern BlockIO rtB;
extern ContinuousStates rtX;
extern D_Work rtDWork;
extern PrevZCSigStates rtPrevZCSigState;
extern SimStruct *const rtS;
extern const int_T gblNumToFiles;
extern const int_T gblNumFrFiles;
extern const int_T gblNumFrWksBlocks;
extern rtInportTUtable *gblInportTUtables;
extern const char *gblInportFileName;
extern const int_T gblNumRootInportBlks;
extern const int_T gblNumModelInputs;
extern const int_T gblInportDataTypeIdx[];
extern const int_T gblInportDims[];
extern const int_T gblInportComplex[];
extern const int_T gblInportInterpoFlag[];
extern const int_T gblInportContinuous[];

#endif
