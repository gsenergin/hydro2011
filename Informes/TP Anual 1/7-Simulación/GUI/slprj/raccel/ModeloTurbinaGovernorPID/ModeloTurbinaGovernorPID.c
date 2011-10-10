#include <math.h>
#include "ModeloTurbinaGovernorPID.h"
#include "ModeloTurbinaGovernorPID_private.h"
#include "ModeloTurbinaGovernorPID_dt.h"

const int_T gblNumToFiles = 0;
const int_T gblNumFrFiles = 0;
const int_T gblNumFrWksBlocks = 0;

#ifdef RSIM_WITH_SOLVER_MULTITASKING

const boolean_T gbl_raccel_isMultitasking = 1;

#else

const boolean_T gbl_raccel_isMultitasking = 0;

#endif

const boolean_T gbl_raccel_tid01eq = 0;
const int_T gbl_raccel_NumST = 2;
const char_T *gbl_raccel_Version = "7.5  (R2010a)  25-Jan-2010";
void raccel_setup_MMIStateLog(SimStruct* S)
{

#ifdef UseMMIDataLogging

  rt_FillStateSigInfoFromMMI(ssGetRTWLogInfo(S),&ssGetErrorStatus(S));

#endif

}

const char *gblSlvrJacPatternFileName =
  "slprj\\raccel\\ModeloTurbinaGovernorPID\\ModeloTurbinaGovernorPID_Jpattern.mat";
const int_T gblNumRootInportBlks = 0;
const int_T gblNumModelInputs = 0;
extern rtInportTUtable *gblInportTUtables;
extern const char *gblInportFileName;
const int_T gblInportDataTypeIdx[] = { -1 };

const int_T gblInportDims[] = { -1 } ;

const int_T gblInportComplex[] = { -1 };

const int_T gblInportInterpoFlag[] = { -1 };

const int_T gblInportContinuous[] = { -1 };

#include "simstruc.h"
#include "fixedpoint.h"

BlockIO rtB;
ContinuousStates rtX;
D_Work rtDWork;
static SimStruct model_S;
SimStruct *const rtS = &model_S;
void MdlInitialize(void)
{
  rtX.Rotorangledtheta_CSTATE = rtP.Rotorangledtheta_IC;
  rtX.int_CSTATE = rtP.int_IC_g;
  rtX.int_CSTATE_n = rtP.int_IC_c;
  rtX.int_CSTATE_e = rtP.int_IC_m;
  rtX.int1_CSTATE = rtP.int1_IC;
  rtX.int_CSTATE_j = rtP.int_IC_p;

  {
    real_T *As = (real_T*)rtDWork.StateSpace_PWORK.AS;
    real_T *Bs = (real_T*)rtDWork.StateSpace_PWORK.BS;
    real_T *Cs = (real_T*)rtDWork.StateSpace_PWORK.CS;
    real_T *Ds = (real_T*)rtDWork.StateSpace_PWORK.DS;
    int_T *Chopper = (int_T*) rtDWork.StateSpace_PWORK.CHOPPER;
    rtX.StateSpace_CSTATE[0] = 2.3934927512240130E+004;
    rtX.StateSpace_CSTATE[1] = -2.4890573465467314E+003;
    rtX.StateSpace_CSTATE[2] = -5.9499758372906069E+000;
    rtX.StateSpace_CSTATE[3] = 1.2368104233124175E+004;
    rtX.StateSpace_CSTATE[4] = -1.2841253154713322E+003;
    rtX.StateSpace_CSTATE[5] = 1.1711454348054568E+001;
    rtX.StateSpace_CSTATE[6] = -3.6303031745301552E+004;
    rtX.StateSpace_CSTATE[7] = 3.7731826620111356E+003;
    rtX.StateSpace_CSTATE[8] = -5.7614785107743147E+000;
    rtX.StateSpace_CSTATE[9] = -7.4706683979836584E+005;
    rtX.StateSpace_CSTATE[10] = -7.5060927016878093E+005;
    rtX.StateSpace_CSTATE[11] = 1.4976761099671414E+006;
    As[0] = -1.9640806398270489E+006;
    As[1] = -1.8893743377439771E+007;
    As[2] = 1.9634954084936208E+006;
    As[3] = 2.8868867589698272E+002;
    As[4] = 0.0;
    As[5] = 0.0;
    As[6] = 2.8868867589698272E+002;
    As[7] = 0.0;
    As[8] = 0.0;
    As[9] = 0.0;
    As[10] = 0.0;
    As[11] = 0.0;
    As[12] = -2.0405242847634951E+005;
    As[13] = -1.9635048213939487E+006;
    As[14] = 2.0405242847634951E+005;
    As[15] = 0.0;
    As[16] = -1.5589185333832280E-016;
    As[17] = 0.0;
    As[18] = 0.0;
    As[19] = -1.5589185333832280E-016;
    As[20] = 0.0;
    As[21] = 1.5589186939518371E+000;
    As[22] = 1.5589185333832280E-016;
    As[23] = 1.5589185333832280E-016;
    As[24] = 3.1415926535897938E+002;
    As[25] = 3.0229989403903637E+003;
    As[26] = -3.1415926535897938E+002;
    As[27] = 0.0;
    As[28] = 0.0;
    As[29] = 0.0;
    As[30] = 0.0;
    As[31] = 0.0;
    As[32] = 0.0;
    As[33] = 0.0;
    As[34] = 0.0;
    As[35] = 0.0;
    As[36] = 2.8868867589698272E+002;
    As[37] = 0.0;
    As[38] = 0.0;
    As[39] = -1.9640806398270489E+006;
    As[40] = -1.8893743377439771E+007;
    As[41] = 1.9634954084936208E+006;
    As[42] = 2.8868867589698272E+002;
    As[43] = 0.0;
    As[44] = 0.0;
    As[45] = 0.0;
    As[46] = 0.0;
    As[47] = 0.0;
    As[48] = 0.0;
    As[49] = -1.5589185333832280E-016;
    As[50] = 0.0;
    As[51] = -2.0405242847634951E+005;
    As[52] = -1.9635048213939487E+006;
    As[53] = 2.0405242847634951E+005;
    As[54] = 0.0;
    As[55] = -1.5589185333832280E-016;
    As[56] = 0.0;
    As[57] = 1.5589185333832280E-016;
    As[58] = 1.5589186939518371E+000;
    As[59] = 1.5589185333832280E-016;
    As[60] = 0.0;
    As[61] = 0.0;
    As[62] = 0.0;
    As[63] = 3.1415926535897938E+002;
    As[64] = 3.0229989403903637E+003;
    As[65] = -3.1415926535897938E+002;
    As[66] = 0.0;
    As[67] = 0.0;
    As[68] = 0.0;
    As[69] = 0.0;
    As[70] = 0.0;
    As[71] = 0.0;
    As[72] = 2.8868867589698272E+002;
    As[73] = 0.0;
    As[74] = 0.0;
    As[75] = 2.8868867589698272E+002;
    As[76] = 0.0;
    As[77] = 0.0;
    As[78] = -1.9640806398270489E+006;
    As[79] = -1.8893743377439771E+007;
    As[80] = 1.9634954084936208E+006;
    As[81] = 0.0;
    As[82] = 0.0;
    As[83] = 0.0;
    As[84] = 0.0;
    As[85] = -1.5589185333832280E-016;
    As[86] = 0.0;
    As[87] = 0.0;
    As[88] = -1.5589185333832280E-016;
    As[89] = 0.0;
    As[90] = -2.0405242847634951E+005;
    As[91] = -1.9635048213939487E+006;
    As[92] = 2.0405242847634951E+005;
    As[93] = 1.5589185333832280E-016;
    As[94] = 1.5589185333832280E-016;
    As[95] = 1.5589186939518371E+000;
    As[96] = 0.0;
    As[97] = 0.0;
    As[98] = 0.0;
    As[99] = 0.0;
    As[100] = 0.0;
    As[101] = 0.0;
    As[102] = 3.1415926535897938E+002;
    As[103] = 3.0229989403903637E+003;
    As[104] = -3.1415926535897938E+002;
    As[105] = 0.0;
    As[106] = 0.0;
    As[107] = 0.0;
    As[108] = 0.0;
    As[109] = 5.0265477430888956E+002;
    As[110] = 0.0;
    As[111] = 0.0;
    As[112] = 5.0265472253545308E-014;
    As[113] = 0.0;
    As[114] = 0.0;
    As[115] = 5.0265472253545308E-014;
    As[116] = 0.0;
    As[117] = -5.4753466936017230E+002;
    As[118] = -5.0265472253545308E-014;
    As[119] = -5.0265472253545308E-014;
    As[120] = 0.0;
    As[121] = 5.0265472253545308E-014;
    As[122] = 0.0;
    As[123] = 0.0;
    As[124] = 5.0265477430888956E+002;
    As[125] = 0.0;
    As[126] = 0.0;
    As[127] = 5.0265472253545308E-014;
    As[128] = 0.0;
    As[129] = -5.0265472253545308E-014;
    As[130] = -5.4753466936017230E+002;
    As[131] = -5.0265472253545308E-014;
    As[132] = 0.0;
    As[133] = 5.0265472253545308E-014;
    As[134] = 0.0;
    As[135] = 0.0;
    As[136] = 5.0265472253545308E-014;
    As[137] = 0.0;
    As[138] = 0.0;
    As[139] = 5.0265477430888956E+002;
    As[140] = 0.0;
    As[141] = -5.0265472253545308E-014;
    As[142] = -5.0265472253545308E-014;
    As[143] = -5.4753466936017230E+002;
    Bs[0] = 0.0;
    Bs[1] = 0.0;
    Bs[2] = 0.0;
    Bs[3] = 2.8868867589698272E+002;
    Bs[4] = -2.8868867589698272E+002;
    Bs[5] = 0.0;
    Bs[6] = 0.0;
    Bs[7] = 0.0;
    Bs[8] = -1.5589186923929184E+000;
    Bs[9] = 1.5589185333832284E-009;
    Bs[10] = 1.5589185333832284E-009;
    Bs[11] = 0.0;
    Bs[12] = 0.0;
    Bs[13] = 0.0;
    Bs[14] = 0.0;
    Bs[15] = 0.0;
    Bs[16] = 0.0;
    Bs[17] = 0.0;
    Bs[18] = 0.0;
    Bs[19] = 0.0;
    Bs[20] = 0.0;
    Bs[21] = 0.0;
    Bs[22] = 0.0;
    Bs[23] = 0.0;
    Bs[24] = 0.0;
    Bs[25] = 0.0;
    Bs[26] = 0.0;
    Bs[27] = 2.8868867589698272E+002;
    Bs[28] = 5.7737735179396543E+002;
    Bs[29] = 0.0;
    Bs[30] = 0.0;
    Bs[31] = 0.0;
    Bs[32] = 1.5589185333832284E-009;
    Bs[33] = -1.5589186923929184E+000;
    Bs[34] = 1.5589185333832284E-009;
    Bs[35] = 0.0;
    Bs[36] = 0.0;
    Bs[37] = 0.0;
    Bs[38] = 0.0;
    Bs[39] = 0.0;
    Bs[40] = 0.0;
    Bs[41] = 0.0;
    Bs[42] = 0.0;
    Bs[43] = 0.0;
    Bs[44] = 0.0;
    Bs[45] = 0.0;
    Bs[46] = 0.0;
    Bs[47] = 0.0;
    Bs[48] = 0.0;
    Bs[49] = 0.0;
    Bs[50] = 0.0;
    Bs[51] = -5.7737735179396543E+002;
    Bs[52] = -2.8868867589698272E+002;
    Bs[53] = 0.0;
    Bs[54] = 0.0;
    Bs[55] = 0.0;
    Bs[56] = 1.5589185333832284E-009;
    Bs[57] = 1.5589185333832284E-009;
    Bs[58] = -1.5589186923929184E+000;
    Bs[59] = 0.0;
    Bs[60] = 0.0;
    Bs[61] = 0.0;
    Bs[62] = 0.0;
    Bs[63] = 0.0;
    Bs[64] = 0.0;
    Bs[65] = 0.0;
    Bs[66] = 0.0;
    Bs[67] = 0.0;
    Bs[68] = 0.0;
    Bs[69] = 0.0;
    Bs[70] = 0.0;
    Bs[71] = 0.0;
    Bs[72] = 5.0265477380623474E+002;
    Bs[73] = -5.0265472253545309E-007;
    Bs[74] = -5.0265472253545309E-007;
    Bs[75] = 0.0;
    Bs[76] = 0.0;
    Bs[77] = 5.0265482457436692E+003;
    Bs[78] = 0.0;
    Bs[79] = 0.0;
    Bs[80] = -5.0265472253545309E-007;
    Bs[81] = 5.0265477380623474E+002;
    Bs[82] = -5.0265472253545309E-007;
    Bs[83] = 0.0;
    Bs[84] = 0.0;
    Bs[85] = 0.0;
    Bs[86] = 5.0265482457436692E+003;
    Bs[87] = 0.0;
    Bs[88] = -5.0265472253545309E-007;
    Bs[89] = -5.0265472253545309E-007;
    Bs[90] = 5.0265477380623474E+002;
    Bs[91] = 0.0;
    Bs[92] = 0.0;
    Bs[93] = 0.0;
    Bs[94] = 0.0;
    Bs[95] = 5.0265482457436692E+003;
    Cs[0] = 0.0;
    Cs[1] = -9.9999989900001016E-002;
    Cs[2] = 0.0;
    Cs[3] = 0.0;
    Cs[4] = 9.9999979700003091E-011;
    Cs[5] = 0.0;
    Cs[6] = 0.0;
    Cs[7] = 9.9999979700003091E-011;
    Cs[8] = 0.0;
    Cs[9] = 9.9999989900001016E-002;
    Cs[10] = -9.9999979700003091E-011;
    Cs[11] = -9.9999979700003091E-011;
    Cs[12] = 0.0;
    Cs[13] = 9.9999979700003091E-011;
    Cs[14] = 0.0;
    Cs[15] = 0.0;
    Cs[16] = -9.9999989900001016E-002;
    Cs[17] = 0.0;
    Cs[18] = 0.0;
    Cs[19] = 9.9999979700003091E-011;
    Cs[20] = 0.0;
    Cs[21] = -9.9999979700003091E-011;
    Cs[22] = 9.9999989900001016E-002;
    Cs[23] = -9.9999979700003091E-011;
    Cs[24] = 0.0;
    Cs[25] = 9.9999979700003091E-011;
    Cs[26] = 0.0;
    Cs[27] = 0.0;
    Cs[28] = 9.9999979700003091E-011;
    Cs[29] = 0.0;
    Cs[30] = 0.0;
    Cs[31] = -9.9999989900001016E-002;
    Cs[32] = 0.0;
    Cs[33] = -9.9999979700003091E-011;
    Cs[34] = -9.9999979700003091E-011;
    Cs[35] = 9.9999989900001016E-002;
    Cs[36] = -0.4;
    Cs[37] = 0.0;
    Cs[38] = 0.0;
    Cs[39] = 0.2;
    Cs[40] = 0.0;
    Cs[41] = 0.0;
    Cs[42] = 0.2;
    Cs[43] = 0.0;
    Cs[44] = 0.0;
    Cs[45] = 0.0;
    Cs[46] = 0.0;
    Cs[47] = 0.0;
    Cs[48] = 0.2;
    Cs[49] = 0.0;
    Cs[50] = 0.0;
    Cs[51] = -0.4;
    Cs[52] = 0.0;
    Cs[53] = 0.0;
    Cs[54] = 0.2;
    Cs[55] = 0.0;
    Cs[56] = 0.0;
    Cs[57] = 0.0;
    Cs[58] = 0.0;
    Cs[59] = 0.0;
    Cs[60] = -0.2;
    Cs[61] = 0.0;
    Cs[62] = 0.0;
    Cs[63] = 0.0;
    Cs[64] = 0.0;
    Cs[65] = 0.0;
    Cs[66] = 0.2;
    Cs[67] = 0.0;
    Cs[68] = 0.0;
    Cs[69] = 0.0;
    Cs[70] = 0.0;
    Cs[71] = 0.0;
    Cs[72] = 0.0;
    Cs[73] = -9.9999990000001010E-002;
    Cs[74] = 0.0;
    Cs[75] = 0.0;
    Cs[76] = -9.9999979700003086E-018;
    Cs[77] = 0.0;
    Cs[78] = 0.0;
    Cs[79] = -9.9999979700003086E-018;
    Cs[80] = 0.0;
    Cs[81] = 9.9999990000001010E-002;
    Cs[82] = 9.9999979700003086E-018;
    Cs[83] = 9.9999979700003086E-018;
    Ds[0] = -1.0099998979700103E-001;
    Ds[1] = -9.9999979700003097E-004;
    Ds[2] = -9.9999979700003097E-004;
    Ds[3] = 0.0;
    Ds[4] = 0.0;
    Ds[5] = 0.0;
    Ds[6] = 0.0;
    Ds[7] = 0.0;
    Ds[8] = -9.9999979700003097E-004;
    Ds[9] = -1.0099998979700103E-001;
    Ds[10] = -9.9999979700003097E-004;
    Ds[11] = 0.0;
    Ds[12] = 0.0;
    Ds[13] = 0.0;
    Ds[14] = 0.0;
    Ds[15] = 0.0;
    Ds[16] = -9.9999979700003097E-004;
    Ds[17] = -9.9999979700003097E-004;
    Ds[18] = -1.0099998979700103E-001;
    Ds[19] = 0.0;
    Ds[20] = 0.0;
    Ds[21] = 0.0;
    Ds[22] = 0.0;
    Ds[23] = 0.0;
    Ds[24] = 0.0;
    Ds[25] = 0.0;
    Ds[26] = 0.0;
    Ds[27] = 0.2;
    Ds[28] = -0.2;
    Ds[29] = 0.0;
    Ds[30] = 0.0;
    Ds[31] = 0.0;
    Ds[32] = 0.0;
    Ds[33] = 0.0;
    Ds[34] = 0.0;
    Ds[35] = 0.2;
    Ds[36] = 0.4;
    Ds[37] = 0.0;
    Ds[38] = 0.0;
    Ds[39] = 0.0;
    Ds[40] = 0.0;
    Ds[41] = 0.0;
    Ds[42] = 0.0;
    Ds[43] = 0.2;
    Ds[44] = 0.0;
    Ds[45] = 0.0;
    Ds[46] = 0.0;
    Ds[47] = 0.0;
    Ds[48] = -9.9999989900001016E-002;
    Ds[49] = 9.9999979700003104E-011;
    Ds[50] = 9.9999979700003104E-011;
    Ds[51] = 0.0;
    Ds[52] = 0.0;
    Ds[53] = 0.0;
    Ds[54] = 0.0;
    Ds[55] = 0.0;

    {
      int_T i1;
      for (i1=0; i1 < 7; i1++) {
        Chopper[i1] = 1;
      }
    }

    {
      int_T *switch_status = (int_T*) rtDWork.StateSpace_PWORK.SWITCH_STATUS;
      int_T *gState = (int_T*)rtDWork.StateSpace_PWORK.G_STATE;
      real_T *yswitch = (real_T*)rtDWork.StateSpace_PWORK.Y_SWITCH;
      int_T *switchTypes = (int_T*)rtDWork.StateSpace_PWORK.SWITCH_TYPES;
      int_T *idxOutSw = (int_T*)rtDWork.StateSpace_PWORK.IDX_OUT_SW;
      int_T *switch_status_init = (int_T*)
        rtDWork.StateSpace_PWORK.SWITCH_STATUS_INIT;
      switch_status[0] = 0;
      switch_status_init[0] = 0;
      gState[0] = (int_T) 0.0;
      yswitch[0] = 1/0.001;
      switchTypes[0] = (int_T)2.0;
      idxOutSw[0] = ((int_T)0.0) - 1;
      switch_status[1] = 0;
      switch_status_init[1] = 0;
      gState[1] = (int_T) 0.0;
      yswitch[1] = 1/0.001;
      switchTypes[1] = (int_T)2.0;
      idxOutSw[1] = ((int_T)0.0) - 1;
      switch_status[2] = 0;
      switch_status_init[2] = 0;
      gState[2] = (int_T) 0.0;
      yswitch[2] = 1/0.001;
      switchTypes[2] = (int_T)2.0;
      idxOutSw[2] = ((int_T)0.0) - 1;
    }
  }

  rtX.Rotorspeeddeviationdw_CSTATE = rtP.Rotorspeeddeviationdw_IC;
  rtX.position_CSTATE = rtP.position_IC;
  rtX.Integrator_CSTATE = rtP.Integrator_IC;
  rtX.StateSpace_CSTATE_n = rtP.StateSpace_X0;
  rtX.StateSpace_CSTATE_k = rtP.StateSpace_X0_f;
  rtX.StateSpace_CSTATE_km = rtP.StateSpace_X0_l;
  rtX.Derivative_CSTATE = 0.0;
  rtX.Integrator1_CSTATE = rtP.Integrator1_IC;
  rtX.servomotor_CSTATE = 0.0;
  rtX.theta_CSTATE = rtP.theta_IC;
  rtDWork.Derivative_RWORK.TimeStampA = rtInf;
  rtDWork.Derivative_RWORK.TimeStampB = rtInf;
  rtDWork.Derivative_RWORK_h.TimeStampA = rtInf;
  rtDWork.Derivative_RWORK_h.TimeStampB = rtInf;
  rtDWork.Derivative_RWORK_b.TimeStampA = rtInf;
  rtDWork.Derivative_RWORK_b.TimeStampB = rtInf;
  rtDWork.Derivative_RWORK_o.TimeStampA = rtInf;
  rtDWork.Derivative_RWORK_o.TimeStampB = rtInf;
}

void MdlStart(void)
{
  rtDWork.Enabledintegrator_MODE = FALSE;
  ssSetSolverNeedsReset(rtS);
  ((StateDisabled *) ssGetContStateDisabled(rtS))->int_CSTATE_k = 1;
  rtX.int_CSTATE_k = rtP.int_IC;
  rtB.int_f = rtP.Out1_Y0;
  rtDWork.dqaxissaturation_MODE = FALSE;
  ssSetSolverNeedsReset(rtS);
  rtB.Switch1 = rtP.phimqsat_Y0;
  rtB.Switch = rtP.phimdsat_Y0_m;
  rtDWork.daxissaturation_MODE = FALSE;
  ssSetSolverNeedsReset(rtS);
  rtB.Switch_c = rtP.phimdsat_Y0;

  {
    rtDWork.StateSpace_PWORK.AS = (real_T*)calloc(12 * 12, sizeof(real_T));
    rtDWork.StateSpace_PWORK.BS = (real_T*)calloc(12 * 8, sizeof(real_T));
    rtDWork.StateSpace_PWORK.CS = (real_T*)calloc(7 * 12, sizeof(real_T));
    rtDWork.StateSpace_PWORK.DS = (real_T*)calloc(7 * 8, sizeof(real_T));
    rtDWork.StateSpace_PWORK.DX_COL = (real_T*)calloc(7, sizeof(real_T));
    rtDWork.StateSpace_PWORK.BD_COL = (real_T*)calloc(12, sizeof(real_T));
    rtDWork.StateSpace_PWORK.TMP1 = (real_T*)calloc(12, sizeof(real_T));
    rtDWork.StateSpace_PWORK.TMP2 = (real_T*)calloc(8, sizeof(real_T));
    rtDWork.StateSpace_PWORK.CHOPPER = (int_T*)calloc(7, sizeof(int_T));
    rtDWork.StateSpace_PWORK.SWITCH_STATUS = (int_T*)calloc(3, sizeof(int_T));
    rtDWork.StateSpace_PWORK.SW_CHG = (int_T*)calloc(3, sizeof(int_T));
    rtDWork.StateSpace_PWORK.G_STATE = (int_T*)calloc(3, sizeof(int_T));
    rtDWork.StateSpace_PWORK.Y_SWITCH = (real_T*)calloc(3, sizeof(real_T));
    rtDWork.StateSpace_PWORK.SWITCH_TYPES = (int_T*)calloc(3, sizeof(int_T));
    rtDWork.StateSpace_PWORK.IDX_OUT_SW = (int_T*)calloc(3, sizeof(int_T));
    rtDWork.StateSpace_PWORK.SWITCH_STATUS_INIT = (int_T*)calloc(3, sizeof(int_T));
  }

  {
    static int_T rt_ToWksWidths[] = { 3 };

    static int_T rt_ToWksNumDimensions[] = { 1 };

    static int_T rt_ToWksDimensions[] = { 3 };

    static boolean_T rt_ToWksIsVarDims[] = { 0 };

    static int_T *rt_ToWksCurrSigDims[] = { (NULL) };

    static BuiltInDTypeId rt_ToWksDataTypeIds[] = { SS_DOUBLE };

    static int_T rt_ToWksComplexSignals[] = { 0 };

    static int_T rt_ToWksFrameData[] = { 0 };

    static const char_T *rt_ToWksLabels[] = { "<Stator current>" };

    static RTWLogSignalInfo rt_ToWksSignalInfo = {
      1,
      rt_ToWksWidths,
      rt_ToWksNumDimensions,
      rt_ToWksDimensions,
      rt_ToWksIsVarDims,
      rt_ToWksCurrSigDims,
      rt_ToWksDataTypeIds,
      rt_ToWksComplexSignals,
      rt_ToWksFrameData,

      { rt_ToWksLabels },
      (NULL),
      (NULL),
      (NULL),

      { (NULL) },

      { (NULL) },
      (NULL),
      (NULL)
    };

    static const char_T rt_ToWksBlockName[] =
      "ModeloTurbinaGovernorPID/corrienteEstator";
    rtDWork.corrienteEstator_PWORK.LoggedData = rt_CreateStructLogVar(
      ssGetRTWLogInfo(rtS),
      ssGetTStart(rtS),
      ssGetTFinal(rtS),
      0.0,
      (&ssGetErrorStatus(rtS)),
      "corrienteEstator",
      0,
      0,
      1,
      0.0,
      &rt_ToWksSignalInfo,
      rt_ToWksBlockName);
    if (rtDWork.corrienteEstator_PWORK.LoggedData == (NULL))
      return;
  }

  {
    static int_T rt_ToWksWidths[] = { 1 };

    static int_T rt_ToWksNumDimensions[] = { 1 };

    static int_T rt_ToWksDimensions[] = { 1 };

    static boolean_T rt_ToWksIsVarDims[] = { 0 };

    static int_T *rt_ToWksCurrSigDims[] = { (NULL) };

    static BuiltInDTypeId rt_ToWksDataTypeIds[] = { SS_DOUBLE };

    static int_T rt_ToWksComplexSignals[] = { 0 };

    static int_T rt_ToWksFrameData[] = { 0 };

    static const char_T *rt_ToWksLabels[] = { "" };

    static RTWLogSignalInfo rt_ToWksSignalInfo = {
      1,
      rt_ToWksWidths,
      rt_ToWksNumDimensions,
      rt_ToWksDimensions,
      rt_ToWksIsVarDims,
      rt_ToWksCurrSigDims,
      rt_ToWksDataTypeIds,
      rt_ToWksComplexSignals,
      rt_ToWksFrameData,

      { rt_ToWksLabels },
      (NULL),
      (NULL),
      (NULL),

      { (NULL) },

      { (NULL) },
      (NULL),
      (NULL)
    };

    static const char_T rt_ToWksBlockName[] = "ModeloTurbinaGovernorPID/potMec";
    rtDWork.potMec_PWORK.LoggedData = rt_CreateStructLogVar(
      ssGetRTWLogInfo(rtS),
      ssGetTStart(rtS),
      ssGetTFinal(rtS),
      0.0,
      (&ssGetErrorStatus(rtS)),
      "potenciaMecRotor",
      0,
      0,
      1,
      0.0,
      &rt_ToWksSignalInfo,
      rt_ToWksBlockName);
    if (rtDWork.potMec_PWORK.LoggedData == (NULL))
      return;
  }

  {
    int_T dimensions[1] = { 1 };

    rtDWork.velocidadRotor_PWORK.LoggedData = rt_CreateLogVar(
      ssGetRTWLogInfo(rtS),
      ssGetTStart(rtS),
      ssGetTFinal(rtS),
      0.0,
      (&ssGetErrorStatus(rtS)),
      "velocidadRotor",
      SS_DOUBLE,
      0,
      0,
      0,
      1,
      1,
      dimensions,
      NO_LOGVALDIMS,
      (NULL),
      0,
      1,
      0.0,
      1);
    if (rtDWork.velocidadRotor_PWORK.LoggedData == (NULL))
      return;
  }

  {
    static int_T rt_ToWksWidths[] = { 1 };

    static int_T rt_ToWksNumDimensions[] = { 1 };

    static int_T rt_ToWksDimensions[] = { 1 };

    static boolean_T rt_ToWksIsVarDims[] = { 0 };

    static int_T *rt_ToWksCurrSigDims[] = { (NULL) };

    static BuiltInDTypeId rt_ToWksDataTypeIds[] = { SS_DOUBLE };

    static int_T rt_ToWksComplexSignals[] = { 0 };

    static int_T rt_ToWksFrameData[] = { 0 };

    static const char_T *rt_ToWksLabels[] = { "" };

    static RTWLogSignalInfo rt_ToWksSignalInfo = {
      1,
      rt_ToWksWidths,
      rt_ToWksNumDimensions,
      rt_ToWksDimensions,
      rt_ToWksIsVarDims,
      rt_ToWksCurrSigDims,
      rt_ToWksDataTypeIds,
      rt_ToWksComplexSignals,
      rt_ToWksFrameData,

      { rt_ToWksLabels },
      (NULL),
      (NULL),
      (NULL),

      { (NULL) },

      { (NULL) },
      (NULL),
      (NULL)
    };

    static const char_T rt_ToWksBlockName[] = "ModeloTurbinaGovernorPID/vain";
    rtDWork.vain_PWORK.LoggedData = rt_CreateStructLogVar(
      ssGetRTWLogInfo(rtS),
      ssGetTStart(rtS),
      ssGetTFinal(rtS),
      0.0,
      (&ssGetErrorStatus(rtS)),
      "tensionVaIn",
      0,
      0,
      1,
      0.0,
      &rt_ToWksSignalInfo,
      rt_ToWksBlockName);
    if (rtDWork.vain_PWORK.LoggedData == (NULL))
      return;
  }

  {
    static int_T rt_ToWksWidths[] = { 1 };

    static int_T rt_ToWksNumDimensions[] = { 1 };

    static int_T rt_ToWksDimensions[] = { 1 };

    static boolean_T rt_ToWksIsVarDims[] = { 0 };

    static int_T *rt_ToWksCurrSigDims[] = { (NULL) };

    static BuiltInDTypeId rt_ToWksDataTypeIds[] = { SS_DOUBLE };

    static int_T rt_ToWksComplexSignals[] = { 0 };

    static int_T rt_ToWksFrameData[] = { 0 };

    static const char_T *rt_ToWksLabels[] = { "" };

    static RTWLogSignalInfo rt_ToWksSignalInfo = {
      1,
      rt_ToWksWidths,
      rt_ToWksNumDimensions,
      rt_ToWksDimensions,
      rt_ToWksIsVarDims,
      rt_ToWksCurrSigDims,
      rt_ToWksDataTypeIds,
      rt_ToWksComplexSignals,
      rt_ToWksFrameData,

      { rt_ToWksLabels },
      (NULL),
      (NULL),
      (NULL),

      { (NULL) },

      { (NULL) },
      (NULL),
      (NULL)
    };

    static const char_T rt_ToWksBlockName[] = "ModeloTurbinaGovernorPID/vaout";
    rtDWork.vaout_PWORK.LoggedData = rt_CreateStructLogVar(
      ssGetRTWLogInfo(rtS),
      ssGetTStart(rtS),
      ssGetTFinal(rtS),
      0.0,
      (&ssGetErrorStatus(rtS)),
      "tensionVaOut",
      0,
      0,
      1,
      0.0,
      &rt_ToWksSignalInfo,
      rt_ToWksBlockName);
    if (rtDWork.vaout_PWORK.LoggedData == (NULL))
      return;
  }

  {
    SimStruct *rts = ssGetSFunction(rtS, 0);
    sfcnStart(rts);
    if (ssGetErrorStatus(rts) != (NULL))
      return;
  }

  {
    SimStruct *rts = ssGetSFunction(rtS, 1);
    sfcnStart(rts);
    if (ssGetErrorStatus(rts) != (NULL))
      return;
  }

  {
    SimStruct *rts = ssGetSFunction(rtS, 2);
    sfcnStart(rts);
    if (ssGetErrorStatus(rts) != (NULL))
      return;
  }

  MdlInitialize();
}

void MdlOutputs(int_T tid)
{
  real_T rtb_int;
  real_T rtb_int_b;
  real_T rtb_int_o;
  real_T rtb_int1;
  real_T rtb_int_m;
  real_T rtb_dw;
  real_T rtb_ElementaryMath;
  real_T rtb_Teelectricaltorque;
  real_T rtb_n;
  real_T rtb_ElementaryMath1;
  real_T rtb_Integrator1;
  real_T rtb_Clock;
  real_T rtb_Lad_Ll;
  real_T rtb_Lad_Llfd;
  boolean_T rtb_RelationalOperator2;
  real_T rtb_iq;
  real_T tmp;
  real_T rtb_id;
  real_T rtb_is_b;
  real_T rtb_beta;
  real_T rtb_div;
  boolean_T rtb_RelationalOperator1;
  real_T rtb_phimq;
  srClearBC(rtDWork.daxissaturation_SubsysRanBC);
  srClearBC(rtDWork.dqaxissaturation_SubsysRanBC);
  srClearBC(rtDWork.Enabledintegrator_SubsysRanBC);
  rtb_ElementaryMath1 = rtX.Rotorangledtheta_CSTATE;
  rtb_ElementaryMath = ssGetT(rtS);
  rtb_ElementaryMath1 += rtP.web2_Gain * rtb_ElementaryMath;
  rtb_ElementaryMath = muDoubleScalarSin(rtb_ElementaryMath1);
  rtb_ElementaryMath1 = muDoubleScalarCos(rtb_ElementaryMath1);
  rtb_int = rtX.int_CSTATE;
  rtb_Lad_Ll = rtP.Lad_Ll_Gain * rtb_int;
  rtb_int_b = rtX.int_CSTATE_n;
  rtb_Lad_Llfd = rtP.Lad_Llfd_Gain * rtb_int_b;
  rtb_int_o = rtX.int_CSTATE_e;
  rtB.phimd = (rtb_Lad_Ll + rtb_Lad_Llfd) + rtP.Lad_Llkd_Gain * rtb_int_o;
  rtb_int1 = rtX.int1_CSTATE;
  rtb_Lad_Ll = rtP.Laq_Ll_Gain * rtb_int1;
  rtb_int_m = rtX.int_CSTATE_j;
  rtb_Lad_Llfd = rtP.Laq_Llkq1_Gain * rtb_int_m;
  if (ssIsSampleHit(rtS, 1, 0) && ssIsMajorTimeStep(rtS)) {
    if (rtP.wref_Value) {
      if (!((int32_T)rtDWork.Enabledintegrator_MODE != 0)) {
        ((StateDisabled *) ssGetContStateDisabled(rtS))->int_CSTATE_k = 0;
        if (ssGetTaskTime(rtS,0) != ssGetTStart(rtS)) {
          ssSetSolverNeedsReset(rtS);
        }

        rtDWork.Enabledintegrator_MODE = TRUE;
      }
    } else {
      if ((int32_T)rtDWork.Enabledintegrator_MODE) {
        ssSetSolverNeedsReset(rtS);
        ((StateDisabled *) ssGetContStateDisabled(rtS))->int_CSTATE_k = 1;
        rtDWork.Enabledintegrator_MODE = FALSE;
      }
    }
  }

  if ((int32_T)rtDWork.Enabledintegrator_MODE) {
    rtB.int_f = rtX.int_CSTATE_k;
    if (ssIsMajorTimeStep(rtS)) {
      srUpdateBC(rtDWork.Enabledintegrator_SubsysRanBC);
    }
  }

  rtb_phimq = (rtb_Lad_Ll + rtb_Lad_Llfd) + rtP.Laq_Llkq2_Gain * rtB.int_f;
  if (ssIsSampleHit(rtS, 1, 0)) {
    rtb_RelationalOperator2 = !rtP.Vs4_Value;
    rtB.DataTypeConversion = (real_T)(rtb_RelationalOperator2 && (!rtP.Vs5_Value));
    if (ssIsMajorTimeStep(rtS)) {
      if (rtB.DataTypeConversion > 0.0) {
        if (!((int32_T)rtDWork.dqaxissaturation_MODE != 0)) {
          if (ssGetTaskTime(rtS,0) != ssGetTStart(rtS)) {
            ssSetSolverNeedsReset(rtS);
          }

          rtDWork.dqaxissaturation_MODE = TRUE;
        }
      } else {
        if ((int32_T)rtDWork.dqaxissaturation_MODE) {
          ssSetSolverNeedsReset(rtS);
          rtB.Switch1 = rtP.phimqsat_Y0;
          rtB.Switch = rtP.phimdsat_Y0_m;
          rtDWork.dqaxissaturation_MODE = FALSE;
        }
      }
    }
  }

  if ((int32_T)rtDWork.dqaxissaturation_MODE) {
    rtB.Sum_a = rtB.phimd * rtB.phimd + rtb_phimq * rtb_phimq;
    rtb_Lad_Ll = 0.0 * rtB.Sum_a * rtB.Sum_a * rtB.Sum_a * rtB.Sum_a * rtB.Sum_a;
    if (ssIsSampleHit(rtS, 1, 0)) {
      if (ssIsMajorTimeStep(rtS)) {
        rtDWork.RelationalOperator_Mode = (rtB.Sum_a > rtP.Vs_Value_f);
      }

      rtB.RelationalOperator = rtDWork.RelationalOperator_Mode;
    }

    if (rtB.RelationalOperator) {
      rtB.Switch = rtB.phimd - rtB.phimd * rtb_Lad_Ll * rtP.LadLmd_Gain_k;
    } else {
      rtB.Switch = rtB.phimd;
    }

    if (rtB.RelationalOperator) {
      rtB.Switch1 = rtb_phimq - rtb_Lad_Ll * rtb_phimq * rtP.LaqLmq_Gain;
    } else {
      rtB.Switch1 = rtb_phimq;
    }

    if (ssIsMajorTimeStep(rtS)) {
      srUpdateBC(rtDWork.dqaxissaturation_SubsysRanBC);
    }
  }

  if (rtB.DataTypeConversion >= rtP.Switch_Threshold) {
    rtb_phimq = rtB.Switch1;
  }

  rtb_iq = (rtb_int1 - rtb_phimq) * rtP.u_Ll_Gain;
  if (ssIsSampleHit(rtS, 1, 0)) {
    rtB.DataTypeConversion1 = (real_T)(rtP.Vs5_Value && rtb_RelationalOperator2);
    rtB.Sum = (rtP.Gain_Gain_a * rtB.DataTypeConversion1 +
               rtB.DataTypeConversion) + rtP.Gain1_Gain * (real_T)rtP.Vs4_Value;
    if (ssIsMajorTimeStep(rtS)) {
      if (rtB.DataTypeConversion1 > 0.0) {
        if (!((int32_T)rtDWork.daxissaturation_MODE != 0)) {
          if (ssGetTaskTime(rtS,0) != ssGetTStart(rtS)) {
            ssSetSolverNeedsReset(rtS);
          }

          rtDWork.daxissaturation_MODE = TRUE;
        }
      } else {
        if ((int32_T)rtDWork.daxissaturation_MODE) {
          ssSetSolverNeedsReset(rtS);
          rtDWork.daxissaturation_MODE = FALSE;
        }
      }
    }
  }

  if ((int32_T)rtDWork.daxissaturation_MODE) {
    if (ssIsSampleHit(rtS, 1, 0)) {
      if (ssIsMajorTimeStep(rtS)) {
        rtDWork.RelationalOperator_Mode_e = (rtB.phimd > rtP.Vs_Value);
      }

      rtB.RelationalOperator_a = rtDWork.RelationalOperator_Mode_e;
    }

    if (rtB.RelationalOperator_a) {
      rtB.Switch_c = rtB.phimd - 0.0 * rtB.phimd * rtB.phimd * rtB.phimd *
        rtB.phimd * rtB.phimd * rtP.LadLmd_Gain;
    } else {
      rtB.Switch_c = rtB.phimd;
    }

    if (ssIsMajorTimeStep(rtS)) {
      srUpdateBC(rtDWork.daxissaturation_SubsysRanBC);
    }
  }

  if (ssIsMajorTimeStep(rtS)) {
    switch ((int32_T)rtB.Sum) {
     case 1:
      tmp = rtB.Switch;
      break;

     case 2:
      tmp = rtB.Switch_c;
      break;

     default:
      tmp = rtB.phimd;
      break;
    }
  } else {
    switch (rt_SATURATE((int32_T)rtB.Sum, 1, 3)) {
     case 1:
      tmp = rtB.Switch;
      break;

     case 2:
      tmp = rtB.Switch_c;
      break;

     default:
      tmp = rtB.phimd;
      break;
    }
  }

  rtb_id = (rtb_int - tmp) * rtP.u_Ll_Gain_m;
  rtb_Lad_Llfd = rtb_iq * rtb_ElementaryMath1 + rtb_id * rtb_ElementaryMath;
  rtb_is_b = (((-rtb_iq) - 1.7320508075688772 * rtb_id) * rtb_ElementaryMath1 +
              (1.7320508075688772 * rtb_iq - rtb_id) * rtb_ElementaryMath) * 0.5;
  rtb_Integrator1 = (0.0 - rtb_Lad_Llfd) - rtb_is_b;
  rtB.ib[0] = rtP.ib_Gain * rtb_Lad_Llfd;
  rtB.ib[1] = rtP.ib_Gain * rtb_is_b;
  rtB.ib[2] = rtP.ib_Gain * rtb_Integrator1;
  rtB.SineWaveA = muDoubleScalarSin(rtP.SineWaveA_Freq * ssGetTaskTime(rtS,0) +
    rtP.SineWaveA_Phase) * rtP.SineWaveA_Amp + rtP.SineWaveA_Bias;
  rtB.SineWaveB = muDoubleScalarSin(rtP.SineWaveB_Freq * ssGetTaskTime(rtS,0) +
    rtP.SineWaveB_Phase) * rtP.SineWaveB_Amp + rtP.SineWaveB_Bias;
  rtB.SineWaveC = muDoubleScalarSin(rtP.SineWaveC_Freq * ssGetTaskTime(rtS,0) +
    rtP.SineWaveC_Phase) * rtP.SineWaveC_Amp + rtP.SineWaveC_Bias;

  {
    real_T accum;
    int_T *switch_status = (int_T*) rtDWork.StateSpace_PWORK.SWITCH_STATUS;
    int_T *switch_status_init = (int_T*)
      rtDWork.StateSpace_PWORK.SWITCH_STATUS_INIT;
    int_T *SwitchChange = (int_T*) rtDWork.StateSpace_PWORK.SW_CHG;
    int_T *Chopper = (int_T*) rtDWork.StateSpace_PWORK.CHOPPER;
    int_T *gState = (int_T*) rtDWork.StateSpace_PWORK.G_STATE;
    real_T *yswitch = (real_T*)rtDWork.StateSpace_PWORK.Y_SWITCH;
    int_T *switchTypes = (int_T*) rtDWork.StateSpace_PWORK.SWITCH_TYPES;
    int_T *idxOutSw = (int_T*) rtDWork.StateSpace_PWORK.IDX_OUT_SW;
    real_T *DxCol = (real_T*)rtDWork.StateSpace_PWORK.DX_COL;
    real_T *BDcol = (real_T*)rtDWork.StateSpace_PWORK.BD_COL;
    real_T *tmp1 = (real_T*)rtDWork.StateSpace_PWORK.TMP1;
    real_T *tmp2 = (real_T*)rtDWork.StateSpace_PWORK.TMP2;
    int_T newState;
    int_T swChanged = 0;
    int loopsToDo = 20;
    real_T temp;
    memcpy(switch_status_init, switch_status, 3 * sizeof(int_T));
    do {
      if (loopsToDo == 1) {
        swChanged = 0;

        {
          int_T i1;
          for (i1=0; i1 < 3; i1++) {
            swChanged = ((SwitchChange[i1] = switch_status_init[i1] -
                          switch_status[i1]) != 0) | swChanged;
            switch_status[i1] = switch_status_init[i1];
          }
        }
      } else {
        real_T *Cs = (real_T*)rtDWork.StateSpace_PWORK.CS;
        real_T *Ds = (real_T*)rtDWork.StateSpace_PWORK.DS;

        {
          int_T i1;
          real_T *y0 = rtB.StateSpace_o1;
          for (i1=0; i1 < 7; i1++) {
            accum = 0.0;

            {
              int_T i2;
              real_T *xc = &rtX.StateSpace_CSTATE[0];
              for (i2=0; i2 < 12; i2++) {
                accum += *(Cs++) * xc[i2];
              }
            }

            accum += *(Ds++) * rtP.SwitchCurrents_Value[0];
            accum += *(Ds++) * rtP.SwitchCurrents_Value[1];
            accum += *(Ds++) * rtP.SwitchCurrents_Value[2];
            accum += *(Ds++) * rtB.ib[0];
            accum += *(Ds++) * rtB.ib[1];
            accum += *(Ds++) * rtB.SineWaveA;
            accum += *(Ds++) * rtB.SineWaveB;
            accum += *(Ds++) * rtB.SineWaveC;
            y0[i1] = accum * Chopper[i1];
          }
        }

        if (ssIsMajorTimeStep(rtS)) {
          rtDWork.StateSpace_MODE[0] = rtB.StateSpace_o1[0] > 0.0 ? GTZERO :
            ((rtB.StateSpace_o1[0] < 0.0) ? LTZERO : NOCHANGE);
          rtDWork.StateSpace_MODE[1] = rtB.StateSpace_o1[1] > 0.0 ? GTZERO :
            ((rtB.StateSpace_o1[1] < 0.0) ? LTZERO : NOCHANGE);
          rtDWork.StateSpace_MODE[2] = rtB.StateSpace_o1[2] > 0.0 ? GTZERO :
            ((rtB.StateSpace_o1[2] < 0.0) ? LTZERO : NOCHANGE);
        }

        swChanged = 0;
        newState = gState[0] > 0 ? 1 : 0;
        swChanged = ((SwitchChange[0] = newState - switch_status[0]) != 0) |
          swChanged;
        switch_status[0] = newState;
        newState = gState[1] > 0 ? 1 : 0;
        swChanged = ((SwitchChange[1] = newState - switch_status[1]) != 0) |
          swChanged;
        switch_status[1] = newState;
        newState = gState[2] > 0 ? 1 : 0;
        swChanged = ((SwitchChange[2] = newState - switch_status[2]) != 0) |
          swChanged;
        switch_status[2] = newState;
      }

      if (swChanged) {
        real_T *As = (real_T*)rtDWork.StateSpace_PWORK.AS;
        real_T *Cs = (real_T*)rtDWork.StateSpace_PWORK.CS;
        real_T *Bs = (real_T*)rtDWork.StateSpace_PWORK.BS;
        real_T *Ds = (real_T*)rtDWork.StateSpace_PWORK.DS;
        real_T a1;

        {
          int_T i1;
          for (i1=0; i1 < 3; i1++) {
            if (SwitchChange[i1] != 0) {
              if (idxOutSw[i1] > -1 ) {
                Chopper[idxOutSw[i1]] = switch_status[i1];
              }

              a1 = 1000.0*SwitchChange[i1];
              temp = 1/(1-Ds[i1*9]*a1);

              {
                int_T i2;
                for (i2=0; i2 < 7; i2++) {
                  DxCol[i2]= Ds[i2 * 8 + i1]*temp*a1;
                }
              }

              DxCol[i1] = temp;

              {
                int_T i2;
                for (i2=0; i2 < 12; i2++) {
                  BDcol[i2]= Bs[i2 * 8 + i1]*a1;
                }
              }

              memcpy(tmp1, &Cs[i1 * 12], 12 * sizeof(real_T));
              memset(&Cs[i1 * 12], '\0', 12 * sizeof(real_T));
              memcpy(tmp2, &Ds[i1 * 8], 8 * sizeof(real_T));
              memset(&Ds[i1 * 8], '\0', 8 * sizeof(real_T));

              {
                int_T i2;
                for (i2=0; i2 < 7; i2++) {
                  a1 = DxCol[i2];

                  {
                    int_T i3;
                    for (i3=0; i3 < 12; i3++) {
                      Cs[i2 * 12 + i3] += a1 * tmp1[i3];
                    }
                  }

                  {
                    int_T i3;
                    for (i3=0; i3 < 8; i3++) {
                      Ds[i2 * 8 + i3] += a1 * tmp2[i3];
                    }
                  }
                }
              }

              {
                int_T i2;
                for (i2=0; i2 < 12; i2++) {
                  a1 = BDcol[i2];

                  {
                    int_T i3;
                    for (i3=0; i3 < 12; i3++) {
                      As[i2 * 12 + i3] += a1 * Cs[i1 * 12 + i3];
                    }
                  }

                  {
                    int_T i3;
                    for (i3=0; i3 < 8; i3++) {
                      Bs[i2 * 8 + i3] += a1 * Ds[i1 * 8 + i3];
                    }
                  }
                }
              }
            }
          }
        }
      }
    } while (swChanged > 0 && --loopsToDo > 0);

    if (loopsToDo == 0) {
      real_T *Cs = (real_T*)rtDWork.StateSpace_PWORK.CS;
      real_T *Ds = (real_T*)rtDWork.StateSpace_PWORK.DS;

      {
        int_T i1;
        real_T *y0 = rtB.StateSpace_o1;
        for (i1=0; i1 < 7; i1++) {
          accum = 0.0;

          {
            int_T i2;
            real_T *xc = &rtX.StateSpace_CSTATE[0];
            for (i2=0; i2 < 12; i2++) {
              accum += *(Cs++) * xc[i2];
            }
          }

          accum += *(Ds++) * rtP.SwitchCurrents_Value[0];
          accum += *(Ds++) * rtP.SwitchCurrents_Value[1];
          accum += *(Ds++) * rtP.SwitchCurrents_Value[2];
          accum += *(Ds++) * rtB.ib[0];
          accum += *(Ds++) * rtB.ib[1];
          accum += *(Ds++) * rtB.SineWaveA;
          accum += *(Ds++) * rtB.SineWaveB;
          accum += *(Ds++) * rtB.SineWaveC;
          y0[i1] = accum * Chopper[i1];
        }
      }
    }

    rtB.StateSpace_o2[0] = (real_T)switch_status[0];
    rtB.StateSpace_o2[1] = (real_T)switch_status[1];
    rtB.StateSpace_o2[2] = (real_T)switch_status[2];
  }

  if (ssIsSampleHit(rtS, 1, 0)) {
  }

  rtb_dw = rtX.Rotorspeeddeviationdw_CSTATE;
  rtb_beta = rtP.beta_Gain * rtb_dw;
  if (ssIsMajorTimeStep(rtS)) {
    if (rtX.position_CSTATE >= rtP.position_UpperSat ) {
      rtX.position_CSTATE = rtP.position_UpperSat;
    } else if (rtX.position_CSTATE <= rtP.position_LowerSat ) {
      rtX.position_CSTATE = rtP.position_LowerSat;
    }
  }

  rtb_Teelectricaltorque = rtX.position_CSTATE;
  rtb_div = rtP.turbinegain_Gain * rtb_Teelectricaltorque;
  rtb_n = rtX.Integrator_CSTATE;
  rtb_div = muDoubleScalarPower(rtb_n / rtb_div, 2.0) - rtb_beta;
  rtB.Product = rtb_div * rtb_n;
  rtb_n = rtP.nomspeed_Value + rtb_dw;
  rtB.n = rtP.units_Gain * rtb_n;

  {
    rtB.StateSpace = rtP.StateSpace_C*rtX.StateSpace_CSTATE_n;
  }

  if (ssIsSampleHit(rtS, 1, 0)) {
    if (ssIsMajorTimeStep(rtS)) {
      rtDWork.RelationalOperator2_Mode = (rtB.StateSpace > rtP.Constant1_Value);
    }

    rtb_RelationalOperator2 = rtDWork.RelationalOperator2_Mode;
  }

  {
    rtb_Clock = rtP.StateSpace_C_o*rtX.StateSpace_CSTATE_k;
  }

  if (ssIsSampleHit(rtS, 1, 0)) {
    rtB.Vfdmax = (real_T)(rtP.Constant_Value == rtP.Constant3_Value) *
      rtP.Vfdmax_Gain;
  }

  rtB.Sum_d = rtP.Vfdmax1_Gain * rtb_Clock + rtB.Vfdmax;
  if (ssIsSampleHit(rtS, 1, 0)) {
    if (ssIsMajorTimeStep(rtS)) {
      rtDWork.RelationalOperator1_Mode = (rtB.StateSpace < rtB.Sum_d);
    }

    rtb_RelationalOperator1 = rtDWork.RelationalOperator1_Mode;
    rtB.DataTypeConversion_j = (real_T)(rtb_RelationalOperator2 &&
      rtDWork.RelationalOperator1_Mode);
  }

  if (ssIsSampleHit(rtS, 1, 0)) {
    rtB.Product1 = rtP.Constant1_Value * (real_T)!rtb_RelationalOperator2;
    rtB.DataTypeConversion2 = (real_T)!rtb_RelationalOperator1;
  }

  rtB.Sum1 = (rtB.StateSpace * rtB.DataTypeConversion_j + rtB.Product1) +
    rtB.DataTypeConversion2 * rtB.Sum_d;

  {
    rtB.StateSpace_i = rtP.StateSpace_D_k*rtB.Sum1;
  }

  rtB.is_a = rtP.outputformatting_Gain * rtb_Lad_Llfd;
  rtB.is_b = rtP.outputformatting1_Gain * rtb_is_b;
  rtB.is_c = rtP.outputformatting2_Gain * rtb_Integrator1;

  {
    real_T u[3];
    u[0] = rtB.is_a;
    u[1] = rtB.is_b;
    u[2] = rtB.is_c;
    if (ssGetLogOutput(rtS)) {
      rt_UpdateStructLogVar((StructLogVar *)
                            rtDWork.corrienteEstator_PWORK.LoggedData, (NULL), u);
    }
  }

  if (ssGetLogOutput(rtS)) {
    rt_UpdateStructLogVar((StructLogVar *)rtDWork.potMec_PWORK.LoggedData, (NULL),
                          &rtB.Product);
  }

  if (ssGetLogOutput(rtS)) {
    rt_UpdateLogVar((LogVar *)(LogVar*) (rtDWork.velocidadRotor_PWORK.LoggedData),
                    &rtB.n, 0);
  }

  {
    rtb_Integrator1 = rtP.StateSpace_D_n*rtB.StateSpace_i;
    rtb_Integrator1 += rtP.StateSpace_C_o2*rtX.StateSpace_CSTATE_km;
  }

  rtB.Sum_f = (((rtP.Vderef_Value + rtP.Vf0ka_Value) - rtb_Clock) + 0.0) -
    rtb_Integrator1;

  {
    rtB.StateSpace_d = rtP.StateSpace_D_e*rtB.Sum_f;
  }

  rtb_Lad_Ll = rtP._Vb_Gain * rtB.StateSpace_o1[3];
  rtb_Lad_Llfd = rtP._Vb_Gain * rtB.StateSpace_o1[4];
  rtb_is_b = ((2.0 * rtb_Lad_Ll + rtb_Lad_Llfd) * rtb_ElementaryMath +
              -1.7320508075688772E+000 * rtb_Lad_Llfd * rtb_ElementaryMath1) *
    0.33333333333333331;
  rtb_Clock = rtP.outputformatting9_Gain * rtb_is_b;
  rtb_beta = ((2.0 * rtb_Lad_Ll + rtb_Lad_Llfd) * rtb_ElementaryMath1 +
              1.7320508075688772 * rtb_Lad_Llfd * rtb_ElementaryMath) *
    0.33333333333333331;
  rtb_Integrator1 = rtP.outputformatting8_Gain * rtb_beta;
  rtb_Lad_Ll = muDoubleScalarPower(rtb_Clock, 2.0) + muDoubleScalarPower
    (rtb_Integrator1, 2.0);
  if (rtb_Lad_Ll < 0.0) {
    rtB.PositiveSequenceVoltage = -muDoubleScalarSqrt(-rtb_Lad_Ll);
  } else {
    rtB.PositiveSequenceVoltage = muDoubleScalarSqrt(rtb_Lad_Ll);
  }

  rtb_Clock = rtP.Derivative_C*rtX.Derivative_CSTATE;
  if (rtP.Constant1_Value_o >= rtP.Switch_Threshold_h) {
    rtb_Integrator1 = rtb_Teelectricaltorque;
  } else {
    rtb_Integrator1 = (rtb_beta * rtb_iq + rtb_is_b * rtb_id) * rtP.Gain_Gain -
      rtP.potenciaMecRef_Value;
  }

  rtB.Sum1_e = (rtP.velocidadRef_Value - rtB.n) - rtP.permanentdroop_Gain *
    rtb_Integrator1;
  rtB.Integral = rtP.Integral_Gain * rtB.Sum1_e;
  rtb_Integrator1 = rtX.Integrator1_CSTATE;
  rtB.Sum4 = ((rtP.Proportional_Gain * rtB.Sum1_e + rtb_Integrator1) + rtb_Clock)
    - rtb_Teelectricaltorque;
  rtB.servomotor = rtP.servomotor_C*rtX.servomotor_CSTATE;
  if (ssIsMajorTimeStep(rtS)) {
    rtDWork.speedlimit_MODE = rtB.servomotor >= rtP.speedlimit_UpperSat ? 1 :
      rtB.servomotor > rtP.speedlimit_LowerSat ? 0 : -1;
  }

  rtB.speedlimit = rtDWork.speedlimit_MODE == 1 ? rtP.speedlimit_UpperSat :
    rtDWork.speedlimit_MODE == -1 ? rtP.speedlimit_LowerSat : rtB.servomotor;
  rtB.Gain2 = (rtP.Constant_Value_g - rtb_div) * rtP.Gain2_Gain;
  if (rtP.Constant_Value_d >= rtP.Switch_Threshold_d) {
    rtb_Clock = rtB.StateSpace_i;
  } else {
    rtb_Clock = 0.0;
  }

  if (rtP.Constant_Value_d >= rtP.Switch1_Threshold) {
    rtb_div = 0.0;
  } else {
    rtb_div = rtB.StateSpace_i;
  }

  rtb_Teelectricaltorque = rtb_int * rtb_iq - rtb_int1 * rtb_id;
  rtB.web_psb = ((rtb_n * rtb_int1 + rtb_is_b) + (tmp - rtb_int) *
                 rtP.Rs_Ll_Gain) * rtP.web_psb_Gain;
  rtB.web_psb_l = ((tmp - rtb_int_b) * rtP.Rf_Llfd_Gain + rtP.N_Gain * rtb_div) *
    rtP.web_psb_Gain_h;
  rtB.web_psb_e = ((tmp - rtb_int_o) * rtP.Rkd_Llkd_Gain + 0.0) *
    rtP.web_psb_Gain_m;
  rtB.web_psb_lb = ((rtb_phimq - rtb_int_m) * rtP.Rkq1_Llkq1_Gain + rtb_Clock) *
    rtP.web_psb_Gain_l;
  rtB.web_psb_d = ((rtb_phimq - rtB.int_f) * rtP.Rkq2_Llkq2_Gain + 0.0) *
    rtP.web_psb_Gain_p;
  rtB.web_psb_h = ((rtb_beta - rtb_n * rtb_int) + (rtb_phimq - rtb_int1) *
                   rtP.Rs_Ll_Gain_k) * rtP.web_psb_Gain_a;
  rtb_Clock = rtP._Pb_Gain * rtB.Product;
  rtB._2H = ((rtb_Clock / rtb_n - rtb_Teelectricaltorque) - rtP.F1_Gain * rtb_n)
    * rtP._2H_Gain;
  rtb_Clock = rtX.theta_CSTATE;
  rtB.web1 = rtP.web1_Gain * rtb_dw;
  rtB.web3 = rtP.web3_Gain * rtb_n;
  rtB.Gain = rtP.donotdeletethisgain_Gain * rtB.StateSpace_o1[5] *
    rtP.Gain_Gain_l;
  if (ssGetLogOutput(rtS)) {
    rt_UpdateStructLogVar((StructLogVar *)rtDWork.vain_PWORK.LoggedData, (NULL),
                          &rtB.Gain);
  }

  rtB.Gain2_i = rtP.donotdeletethisgain_Gain_i * rtB.StateSpace_o1[6] *
    rtP.Gain2_Gain_l;
  if (ssGetLogOutput(rtS)) {
    rt_UpdateStructLogVar((StructLogVar *)rtDWork.vaout_PWORK.LoggedData, (NULL),
                          &rtB.Gain2_i);
  }

  rtb_Clock = ssGetT(rtS);
  rtB.LookUpTable = rt_Lookup((const real_T *)(&rtP.LookUpTable_XData[0]), 7,
    rtb_Clock, (const real_T *)(&rtP.LookUpTable_YData[0]));
  if (rtP.C4_Value_j >= rtP.Switch3_Threshold) {
    rtb_Clock = rtP.com_Value;
  } else {
    rtb_Clock = rtB.LookUpTable;
  }

  rtb_RelationalOperator2 = (rtb_Clock != 0.0);
  if (ssIsSampleHit(rtS, 1, 0)) {
    rtB.DataTypeConversion3 = (rtP.Constant1_Value_e != 0.0);
  }

  rtb_Clock = ssGetT(rtS);
  rtB.LookUpTable_i = rt_Lookup((const real_T *)(&rtP.LookUpTable_XData_a[0]), 7,
    rtb_Clock, (const real_T *)(&rtP.LookUpTable_YData_a[0]));
  if (rtP.C4_Value >= rtP.Switch3_Threshold_k) {
    rtB.Switch3 = (real_T)(rtb_RelationalOperator2 && rtB.DataTypeConversion3);
  } else {
    rtB.Switch3 = rtB.LookUpTable_i;
  }

  if (ssIsSampleHit(rtS, 1, 0)) {
    {
      SimStruct *rts = ssGetSFunction(rtS, 0);
      sfcnOutputs(rts, 0);
    }
  }

  {
    real_T t = ssGetTaskTime(rtS,0);
    real_T timeStampA = rtDWork.Derivative_RWORK.TimeStampA;
    real_T timeStampB = rtDWork.Derivative_RWORK.TimeStampB;
    real_T *lastU = &rtDWork.Derivative_RWORK.LastUAtTimeA;
    if (timeStampA >= t && timeStampB >= t) {
      rtB.Derivative = 0.0;
    } else {
      real_T deltaT;
      real_T lastTime = timeStampA;
      if (timeStampA < timeStampB) {
        if (timeStampB < t) {
          lastTime = timeStampB;
          lastU = &rtDWork.Derivative_RWORK.LastUAtTimeB;
        }
      } else if (timeStampA >= t) {
        lastTime = timeStampB;
        lastU = &rtDWork.Derivative_RWORK.LastUAtTimeB;
      }

      deltaT = t - lastTime;
      rtB.Derivative = (rtB.LookUpTable_i - *lastU++) / deltaT;
    }
  }

  if (ssIsSampleHit(rtS, 1, 0)) {
    rtB.DataTypeConversion2_g = (rtP.Constant2_Value != 0.0);
  }

  rtb_Clock = ssGetT(rtS);
  rtB.LookUpTable_d = rt_Lookup((const real_T *)(&rtP.LookUpTable_XData_h[0]), 7,
    rtb_Clock, (const real_T *)(&rtP.LookUpTable_YData_l[0]));
  if (rtP.C4_Value_h >= rtP.Switch3_Threshold_d) {
    rtB.Switch3_m = (real_T)(rtb_RelationalOperator2 &&
      rtB.DataTypeConversion2_g);
  } else {
    rtB.Switch3_m = rtB.LookUpTable_d;
  }

  if (ssIsSampleHit(rtS, 1, 0)) {
    {
      SimStruct *rts = ssGetSFunction(rtS, 1);
      sfcnOutputs(rts, 0);
    }
  }

  {
    real_T t = ssGetTaskTime(rtS,0);
    real_T timeStampA = rtDWork.Derivative_RWORK_h.TimeStampA;
    real_T timeStampB = rtDWork.Derivative_RWORK_h.TimeStampB;
    real_T *lastU = &rtDWork.Derivative_RWORK_h.LastUAtTimeA;
    if (timeStampA >= t && timeStampB >= t) {
      rtB.Derivative_n = 0.0;
    } else {
      real_T deltaT;
      real_T lastTime = timeStampA;
      if (timeStampA < timeStampB) {
        if (timeStampB < t) {
          lastTime = timeStampB;
          lastU = &rtDWork.Derivative_RWORK_h.LastUAtTimeB;
        }
      } else if (timeStampA >= t) {
        lastTime = timeStampB;
        lastU = &rtDWork.Derivative_RWORK_h.LastUAtTimeB;
      }

      deltaT = t - lastTime;
      rtB.Derivative_n = (rtB.LookUpTable_d - *lastU++) / deltaT;
    }
  }

  if (ssIsSampleHit(rtS, 1, 0)) {
    rtB.DataTypeConversion1_k = (rtP.Constant3_Value_d != 0.0);
  }

  rtb_Clock = ssGetT(rtS);
  rtB.LookUpTable_h = rt_Lookup((const real_T *)(&rtP.LookUpTable_XData_j[0]), 7,
    rtb_Clock, (const real_T *)(&rtP.LookUpTable_YData_m[0]));
  if (rtP.C4_Value_b >= rtP.Switch3_Threshold_f) {
    rtB.Switch3_h = (real_T)(rtb_RelationalOperator2 &&
      rtB.DataTypeConversion1_k);
  } else {
    rtB.Switch3_h = rtB.LookUpTable_h;
  }

  if (ssIsSampleHit(rtS, 1, 0)) {
    {
      SimStruct *rts = ssGetSFunction(rtS, 2);
      sfcnOutputs(rts, 0);
    }
  }

  {
    real_T t = ssGetTaskTime(rtS,0);
    real_T timeStampA = rtDWork.Derivative_RWORK_b.TimeStampA;
    real_T timeStampB = rtDWork.Derivative_RWORK_b.TimeStampB;
    real_T *lastU = &rtDWork.Derivative_RWORK_b.LastUAtTimeA;
    if (timeStampA >= t && timeStampB >= t) {
      rtB.Derivative_h = 0.0;
    } else {
      real_T deltaT;
      real_T lastTime = timeStampA;
      if (timeStampA < timeStampB) {
        if (timeStampB < t) {
          lastTime = timeStampB;
          lastU = &rtDWork.Derivative_RWORK_b.LastUAtTimeB;
        }
      } else if (timeStampA >= t) {
        lastTime = timeStampB;
        lastU = &rtDWork.Derivative_RWORK_b.LastUAtTimeB;
      }

      deltaT = t - lastTime;
      rtB.Derivative_h = (rtB.LookUpTable_h - *lastU++) / deltaT;
    }
  }

  {
    real_T t = ssGetTaskTime(rtS,0);
    real_T timeStampA = rtDWork.Derivative_RWORK_o.TimeStampA;
    real_T timeStampB = rtDWork.Derivative_RWORK_o.TimeStampB;
    real_T *lastU = &rtDWork.Derivative_RWORK_o.LastUAtTimeA;
    if (timeStampA >= t && timeStampB >= t) {
      rtB.Derivative_o = 0.0;
    } else {
      real_T deltaT;
      real_T lastTime = timeStampA;
      if (timeStampA < timeStampB) {
        if (timeStampB < t) {
          lastTime = timeStampB;
          lastU = &rtDWork.Derivative_RWORK_o.LastUAtTimeB;
        }
      } else if (timeStampA >= t) {
        lastTime = timeStampB;
        lastU = &rtDWork.Derivative_RWORK_o.LastUAtTimeB;
      }

      deltaT = t - lastTime;
      rtB.Derivative_o = (rtB.LookUpTable - *lastU++) / deltaT;
    }
  }

  UNUSED_PARAMETER(tid);
}

void MdlUpdate(int_T tid)
{
  if ((int32_T)rtDWork.Enabledintegrator_MODE) {
  }

  {
    int_T *gState = (int_T*)rtDWork.StateSpace_PWORK.G_STATE;
    *(gState++) = (int_T) rtB.Sfunction;
    *(gState++) = (int_T) rtB.Sfunction_k;
    *(gState++) = (int_T) rtB.Sfunction_j;
  }

  {
    enum { INTG_NORMAL, INTG_LEAVING_UPPER_SAT, INTG_LEAVING_LOWER_SAT,
      INTG_UPPER_SAT, INTG_LOWER_SAT };

    if (rtX.position_CSTATE == rtP.position_UpperSat) {
      switch (rtDWork.position_MODE) {
       case INTG_UPPER_SAT:
        if (rtB.speedlimit < 0.0) {
          ssSetSolverNeedsReset(rtS);
          rtDWork.position_MODE = INTG_LEAVING_UPPER_SAT;
        }
        break;

       case INTG_LEAVING_UPPER_SAT:
        if (rtB.speedlimit >= 0.0) {
          rtDWork.position_MODE = INTG_UPPER_SAT;
          ssSetSolverNeedsReset(rtS);
        }
        break;

       default:
        ssSetSolverNeedsReset(rtS);
        if (rtB.speedlimit < 0.0) {
          rtDWork.position_MODE = INTG_LEAVING_UPPER_SAT;
        } else {
          rtDWork.position_MODE = INTG_UPPER_SAT;
        }
        break;
      }
    } else if (rtX.position_CSTATE == rtP.position_LowerSat) {
      switch (rtDWork.position_MODE) {
       case INTG_LOWER_SAT:
        if (rtB.speedlimit > 0.0) {
          ssSetSolverNeedsReset(rtS);
          rtDWork.position_MODE = INTG_LEAVING_LOWER_SAT;
        }
        break;

       case INTG_LEAVING_LOWER_SAT:
        if (rtB.speedlimit <= 0.0) {
          rtDWork.position_MODE = INTG_LOWER_SAT;
          ssSetSolverNeedsReset(rtS);
        }
        break;

       default:
        ssSetSolverNeedsReset(rtS);
        if (rtB.speedlimit > 0.0) {
          rtDWork.position_MODE = INTG_LEAVING_LOWER_SAT;
        } else {
          rtDWork.position_MODE = INTG_LOWER_SAT;
        }
        break;
      }
    } else {
      rtDWork.position_MODE = INTG_NORMAL;
    }
  }

  {
    real_T timeStampA = rtDWork.Derivative_RWORK.TimeStampA;
    real_T timeStampB = rtDWork.Derivative_RWORK.TimeStampB;
    real_T* lastTime = &rtDWork.Derivative_RWORK.TimeStampA;
    real_T* lastU = &rtDWork.Derivative_RWORK.LastUAtTimeA;
    if (timeStampA != rtInf) {
      if (timeStampB == rtInf) {
        lastTime = &rtDWork.Derivative_RWORK.TimeStampB;
        lastU = &rtDWork.Derivative_RWORK.LastUAtTimeB;
      } else if (timeStampA >= timeStampB) {
        lastTime = &rtDWork.Derivative_RWORK.TimeStampB;
        lastU = &rtDWork.Derivative_RWORK.LastUAtTimeB;
      }
    }

    *lastTime = ssGetTaskTime(rtS,0);
    *lastU++ = rtB.LookUpTable_i;
  }

  {
    real_T timeStampA = rtDWork.Derivative_RWORK_h.TimeStampA;
    real_T timeStampB = rtDWork.Derivative_RWORK_h.TimeStampB;
    real_T* lastTime = &rtDWork.Derivative_RWORK_h.TimeStampA;
    real_T* lastU = &rtDWork.Derivative_RWORK_h.LastUAtTimeA;
    if (timeStampA != rtInf) {
      if (timeStampB == rtInf) {
        lastTime = &rtDWork.Derivative_RWORK_h.TimeStampB;
        lastU = &rtDWork.Derivative_RWORK_h.LastUAtTimeB;
      } else if (timeStampA >= timeStampB) {
        lastTime = &rtDWork.Derivative_RWORK_h.TimeStampB;
        lastU = &rtDWork.Derivative_RWORK_h.LastUAtTimeB;
      }
    }

    *lastTime = ssGetTaskTime(rtS,0);
    *lastU++ = rtB.LookUpTable_d;
  }

  {
    real_T timeStampA = rtDWork.Derivative_RWORK_b.TimeStampA;
    real_T timeStampB = rtDWork.Derivative_RWORK_b.TimeStampB;
    real_T* lastTime = &rtDWork.Derivative_RWORK_b.TimeStampA;
    real_T* lastU = &rtDWork.Derivative_RWORK_b.LastUAtTimeA;
    if (timeStampA != rtInf) {
      if (timeStampB == rtInf) {
        lastTime = &rtDWork.Derivative_RWORK_b.TimeStampB;
        lastU = &rtDWork.Derivative_RWORK_b.LastUAtTimeB;
      } else if (timeStampA >= timeStampB) {
        lastTime = &rtDWork.Derivative_RWORK_b.TimeStampB;
        lastU = &rtDWork.Derivative_RWORK_b.LastUAtTimeB;
      }
    }

    *lastTime = ssGetTaskTime(rtS,0);
    *lastU++ = rtB.LookUpTable_h;
  }

  {
    real_T timeStampA = rtDWork.Derivative_RWORK_o.TimeStampA;
    real_T timeStampB = rtDWork.Derivative_RWORK_o.TimeStampB;
    real_T* lastTime = &rtDWork.Derivative_RWORK_o.TimeStampA;
    real_T* lastU = &rtDWork.Derivative_RWORK_o.LastUAtTimeA;
    if (timeStampA != rtInf) {
      if (timeStampB == rtInf) {
        lastTime = &rtDWork.Derivative_RWORK_o.TimeStampB;
        lastU = &rtDWork.Derivative_RWORK_o.LastUAtTimeB;
      } else if (timeStampA >= timeStampB) {
        lastTime = &rtDWork.Derivative_RWORK_o.TimeStampB;
        lastU = &rtDWork.Derivative_RWORK_o.LastUAtTimeB;
      }
    }

    *lastTime = ssGetTaskTime(rtS,0);
    *lastU++ = rtB.LookUpTable;
  }

  UNUSED_PARAMETER(tid);
}

void MdlDerivatives(void)
{
  {
    ((StateDerivatives *) ssGetdX(rtS))->Rotorangledtheta_CSTATE = rtB.web1;
  }

  {
    ((StateDerivatives *) ssGetdX(rtS))->int_CSTATE = rtB.web_psb;
  }

  {
    ((StateDerivatives *) ssGetdX(rtS))->int_CSTATE_n = rtB.web_psb_l;
  }

  {
    ((StateDerivatives *) ssGetdX(rtS))->int_CSTATE_e = rtB.web_psb_e;
  }

  {
    ((StateDerivatives *) ssGetdX(rtS))->int1_CSTATE = rtB.web_psb_h;
  }

  {
    ((StateDerivatives *) ssGetdX(rtS))->int_CSTATE_j = rtB.web_psb_lb;
  }

  if ((int32_T)rtDWork.Enabledintegrator_MODE) {
    {
      ((StateDerivatives *) ssGetdX(rtS))->int_CSTATE_k = rtB.web_psb_d;
    }
  } else {
    ((StateDerivatives *) ssGetdX(rtS))->int_CSTATE_k = 0.0;
  }

  {
    const real_T *As = (real_T*)rtDWork.StateSpace_PWORK.AS;
    const real_T *Bs = (real_T*)rtDWork.StateSpace_PWORK.BS;
    real_T accum;

    {
      int_T i1;
      real_T *xdot = &((StateDerivatives *) ssGetdX(rtS))->StateSpace_CSTATE[0];
      for (i1=0; i1 < 12; i1++) {
        accum = 0.0;

        {
          int_T i2;
          real_T *xc = &rtX.StateSpace_CSTATE[0];
          for (i2=0; i2 < 12; i2++) {
            accum += *(As++) * xc[i2];
          }
        }

        accum += *(Bs++) * rtP.SwitchCurrents_Value[0];
        accum += *(Bs++) * rtP.SwitchCurrents_Value[1];
        accum += *(Bs++) * rtP.SwitchCurrents_Value[2];
        accum += *(Bs++) * rtB.ib[0];
        accum += *(Bs++) * rtB.ib[1];
        accum += *(Bs++) * rtB.SineWaveA;
        accum += *(Bs++) * rtB.SineWaveB;
        accum += *(Bs++) * rtB.SineWaveC;
        xdot[i1] = accum;
      }
    }
  }

  {
    ((StateDerivatives *) ssGetdX(rtS))->Rotorspeeddeviationdw_CSTATE = rtB._2H;
  }

  {
    enum { INTG_NORMAL, INTG_LEAVING_UPPER_SAT, INTG_LEAVING_LOWER_SAT,
      INTG_UPPER_SAT, INTG_LOWER_SAT };

    if ((rtDWork.position_MODE != INTG_UPPER_SAT)
        && (rtDWork.position_MODE != INTG_LOWER_SAT) ) {
      ((StateDerivatives *) ssGetdX(rtS))->position_CSTATE = rtB.speedlimit;
      ((StateDisabled *) ssGetContStateDisabled(rtS))->position_CSTATE = FALSE;
    } else {
      ((StateDerivatives *) ssGetdX(rtS))->position_CSTATE = 0.0;
      if ((rtDWork.position_MODE == INTG_UPPER_SAT) || (rtDWork.position_MODE ==
           INTG_LOWER_SAT)) {
        ((StateDisabled *) ssGetContStateDisabled(rtS))->position_CSTATE = TRUE;
      }
    }
  }

  {
    ((StateDerivatives *) ssGetdX(rtS))->Integrator_CSTATE = rtB.Gain2;
  }

  {
    ((StateDerivatives *) ssGetdX(rtS))->StateSpace_CSTATE_n = rtB.StateSpace_d;
    ((StateDerivatives *) ssGetdX(rtS))->StateSpace_CSTATE_n +=
      (rtP.StateSpace_A)*rtX.StateSpace_CSTATE_n;
  }

  {
    ((StateDerivatives *) ssGetdX(rtS))->StateSpace_CSTATE_k =
      rtB.PositiveSequenceVoltage;
    ((StateDerivatives *) ssGetdX(rtS))->StateSpace_CSTATE_k +=
      (rtP.StateSpace_A_d)*rtX.StateSpace_CSTATE_k;
  }

  {
    ((StateDerivatives *) ssGetdX(rtS))->StateSpace_CSTATE_km = rtB.StateSpace_i;
    ((StateDerivatives *) ssGetdX(rtS))->StateSpace_CSTATE_km +=
      (rtP.StateSpace_A_o)*rtX.StateSpace_CSTATE_km;
  }

  {
    ((StateDerivatives *) ssGetdX(rtS))->Derivative_CSTATE = rtB.Sum1_e;
    ((StateDerivatives *) ssGetdX(rtS))->Derivative_CSTATE += (rtP.Derivative_A)*
      rtX.Derivative_CSTATE;
  }

  {
    ((StateDerivatives *) ssGetdX(rtS))->Integrator1_CSTATE = rtB.Integral;
  }

  {
    ((StateDerivatives *) ssGetdX(rtS))->servomotor_CSTATE = rtB.Sum4;
    ((StateDerivatives *) ssGetdX(rtS))->servomotor_CSTATE += (rtP.servomotor_A)*
      rtX.servomotor_CSTATE;
  }

  {
    ((StateDerivatives *) ssGetdX(rtS))->theta_CSTATE = rtB.web3;
  }
}

void MdlProjection(void)
{
}

void MdlInitSystemMatrices(void)
{
}

void MdlZeroCrossings(void)
{
  if ((int32_T)rtDWork.dqaxissaturation_MODE) {
    ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
      ->RelationalOperator_RelopInput_ZC = rtB.Sum_a - rtP.Vs_Value_f;
  } else {
    {
      ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
        ->RelationalOperator_RelopInput_ZC = 0.0;
    }
  }

  if ((int32_T)rtDWork.daxissaturation_MODE) {
    ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
      ->RelationalOperator_RelopInput_ZC_m = rtB.phimd - rtP.Vs_Value;
  } else {
    {
      ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
        ->RelationalOperator_RelopInput_ZC_m = 0.0;
    }
  }

  {
    enum { INTG_NORMAL, INTG_LEAVING_UPPER_SAT, INTG_LEAVING_LOWER_SAT,
      INTG_UPPER_SAT, INTG_LOWER_SAT };

    if (rtDWork.position_MODE == INTG_LEAVING_UPPER_SAT && rtX.position_CSTATE >=
        rtP.position_UpperSat) {
      ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
        ->position_IntgUpLimit_ZC = 0.0;
    } else {
      ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
        ->position_IntgUpLimit_ZC = rtX.position_CSTATE - rtP.position_UpperSat;
    }

    if (rtDWork.position_MODE == INTG_LEAVING_LOWER_SAT &&rtX.position_CSTATE <=
        rtP.position_LowerSat) {
      ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
        ->position_IntgLoLimit_ZC = 0.0;
    } else {
      ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
        ->position_IntgLoLimit_ZC = rtX.position_CSTATE - rtP.position_LowerSat;
    }

    {
      boolean_T anyStateSaturated = FALSE;
      if ((rtDWork.position_MODE == INTG_UPPER_SAT) ||
          (rtDWork.position_MODE == INTG_LOWER_SAT)) {
        anyStateSaturated = TRUE;
      }

      if (anyStateSaturated) {
        ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
          ->position_LeaveSaturate_ZC = rtB.speedlimit;
      } else {
        ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
          ->position_LeaveSaturate_ZC = 0.0;
      }
    }
  }

  ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
    ->RelationalOperator2_RelopInput_ZC = rtB.StateSpace - rtP.Constant1_Value;
  ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
    ->RelationalOperator1_RelopInput_ZC = rtB.StateSpace - rtB.Sum_d;
  ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))->speedlimit_UprLim_ZC =
    rtB.servomotor - rtP.speedlimit_UpperSat;
  ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))->speedlimit_LwrLim_ZC =
    rtB.servomotor - rtP.speedlimit_LowerSat;

  {
    SimStruct *rts = ssGetSFunction(rtS, 0);
    ssSetNonsampledZCs(rts, &(((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
      ->Sfunction_Sf0_ZC[0]));
    sfcnZeroCrossings(rts);
    if (ssGetErrorStatus(rts) != (NULL))
      return;
  }

  ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
    ->HitCrossing_HitNoOutput_ZC = rtB.Derivative - rtP.HitCrossing_Offset;

  {
    SimStruct *rts = ssGetSFunction(rtS, 1);
    ssSetNonsampledZCs(rts, &(((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
      ->Sfunction_Sf0_ZC_e[0]));
    sfcnZeroCrossings(rts);
    if (ssGetErrorStatus(rts) != (NULL))
      return;
  }

  ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
    ->HitCrossing_HitNoOutput_ZC_p = rtB.Derivative_n - rtP.HitCrossing_Offset_h;

  {
    SimStruct *rts = ssGetSFunction(rtS, 2);
    ssSetNonsampledZCs(rts, &(((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
      ->Sfunction_Sf0_ZC_k[0]));
    sfcnZeroCrossings(rts);
    if (ssGetErrorStatus(rts) != (NULL))
      return;
  }

  ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
    ->HitCrossing_HitNoOutput_ZC_a = rtB.Derivative_h - rtP.HitCrossing_Offset_e;
  ((ZCSignalValues *) ssGetSolverZcSignalVector(rtS))
    ->HitCrossing_HitNoOutput_ZC_g = rtB.Derivative_o - rtP.HitCrossing_Offset_l;
}

void MdlTerminate(void)
{
  {
    free(rtDWork.StateSpace_PWORK.AS);
    free(rtDWork.StateSpace_PWORK.BS);
    free(rtDWork.StateSpace_PWORK.CS);
    free(rtDWork.StateSpace_PWORK.DS);
    free(rtDWork.StateSpace_PWORK.DX_COL);
    free(rtDWork.StateSpace_PWORK.BD_COL);
    free(rtDWork.StateSpace_PWORK.TMP1);
    free(rtDWork.StateSpace_PWORK.TMP2);
    free(rtDWork.StateSpace_PWORK.CHOPPER);
    free(rtDWork.StateSpace_PWORK.G_STATE);
    free(rtDWork.StateSpace_PWORK.SWITCH_STATUS);
    free(rtDWork.StateSpace_PWORK.SW_CHG);
    free(rtDWork.StateSpace_PWORK.SWITCH_STATUS_INIT);
  }

  {
    SimStruct *rts = ssGetSFunction(rtS, 0);
    sfcnTerminate(rts);
  }

  {
    SimStruct *rts = ssGetSFunction(rtS, 1);
    sfcnTerminate(rts);
  }

  {
    SimStruct *rts = ssGetSFunction(rtS, 2);
    sfcnTerminate(rts);
  }
}

void MdlInitializeSizes(void)
{
  ssSetNumContStates(rtS, 29);
  ssSetNumY(rtS, 0);
  ssSetNumU(rtS, 0);
  ssSetDirectFeedThrough(rtS, 0);
  ssSetNumSampleTimes(rtS, 2);
  ssSetNumBlocks(rtS, 286);
  ssSetNumBlockIO(rtS, 67);
  ssSetNumBlockParams(rtS, 205);
}

void MdlInitializeSampleTimes(void)
{
  ssSetSampleTime(rtS, 0, 0.0);
  ssSetSampleTime(rtS, 1, 0.0);
  ssSetOffsetTime(rtS, 0, 0.0);
  ssSetOffsetTime(rtS, 1, 1.0);
}

void raccel_set_checksum(SimStruct *rtS)
{
  ssSetChecksumVal(rtS, 0, 579359455U);
  ssSetChecksumVal(rtS, 1, 1625338619U);
  ssSetChecksumVal(rtS, 2, 1664664728U);
  ssSetChecksumVal(rtS, 3, 2463199491U);
}

SimStruct * raccel_register_model(void)
{
  static struct _ssMdlInfo mdlInfo;
  (void) memset((char *)rtS, 0,
                sizeof(SimStruct));
  (void) memset((char *)&mdlInfo, 0,
                sizeof(struct _ssMdlInfo));
  ssSetMdlInfoPtr(rtS, &mdlInfo);

  {
    static time_T mdlPeriod[NSAMPLE_TIMES];
    static time_T mdlOffset[NSAMPLE_TIMES];
    static time_T mdlTaskTimes[NSAMPLE_TIMES];
    static int_T mdlTsMap[NSAMPLE_TIMES];
    static int_T mdlSampleHits[NSAMPLE_TIMES];
    static boolean_T mdlTNextWasAdjustedPtr[NSAMPLE_TIMES];
    static int_T mdlPerTaskSampleHits[NSAMPLE_TIMES * NSAMPLE_TIMES];
    static time_T mdlTimeOfNextSampleHit[NSAMPLE_TIMES];

    {
      int_T i;
      for (i = 0; i < NSAMPLE_TIMES; i++) {
        mdlPeriod[i] = 0.0;
        mdlOffset[i] = 0.0;
        mdlTaskTimes[i] = 0.0;
        mdlTsMap[i] = i;
        mdlSampleHits[i] = 1;
      }
    }

    ssSetSampleTimePtr(rtS, &mdlPeriod[0]);
    ssSetOffsetTimePtr(rtS, &mdlOffset[0]);
    ssSetSampleTimeTaskIDPtr(rtS, &mdlTsMap[0]);
    ssSetTPtr(rtS, &mdlTaskTimes[0]);
    ssSetSampleHitPtr(rtS, &mdlSampleHits[0]);
    ssSetTNextWasAdjustedPtr(rtS, &mdlTNextWasAdjustedPtr[0]);
    ssSetPerTaskSampleHitsPtr(rtS, &mdlPerTaskSampleHits[0]);
    ssSetTimeOfNextSampleHitPtr(rtS, &mdlTimeOfNextSampleHit[0]);
  }

  ssSetSolverMode(rtS, SOLVER_MODE_SINGLETASKING);

  {
    ssSetBlockIO(rtS, ((void *) &rtB));
    (void) memset(((void *) &rtB), 0,
                  sizeof(BlockIO));
  }

  ssSetDefaultParam(rtS, (real_T *) &rtP);

  {
    real_T *x = (real_T *) &rtX;
    ssSetContStates(rtS, x);
    (void) memset((void *)x, 0,
                  sizeof(ContinuousStates));
  }

  {
    void *dwork = (void *) &rtDWork;
    ssSetRootDWork(rtS, dwork);
    (void) memset(dwork, 0,
                  sizeof(D_Work));
  }

  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    ssSetModelMappingInfo(rtS, &dtInfo);
    dtInfo.numDataTypes = 14;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];
    dtInfo.B = &rtBTransTable;
    dtInfo.P = &rtPTransTable;
  }

  ssSetRootSS(rtS, rtS);
  ssSetVersion(rtS, SIMSTRUCT_VERSION_LEVEL2);
  ssSetModelName(rtS, "ModeloTurbinaGovernorPID");
  ssSetPath(rtS, "ModeloTurbinaGovernorPID");
  ssSetTStart(rtS, 0.0);
  ssSetTFinal(rtS, 10.0);

  {
    static RTWLogInfo rt_DataLoggingInfo;
    ssSetRTWLogInfo(rtS, &rt_DataLoggingInfo);
  }

  {
    {
      static int_T rt_LoggedStateWidths[] = {
        1,
        1,
        1,
        1,
        1,
        1,
        12,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        2,
        2,
        2
      };

      static int_T rt_LoggedStateNumDimensions[] = {
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1
      };

      static int_T rt_LoggedStateDimensions[] = {
        1,
        1,
        1,
        1,
        1,
        1,
        12,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        2,
        2,
        2
      };

      static boolean_T rt_LoggedStateIsVarDims[] = {
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      };

      static BuiltInDTypeId rt_LoggedStateDataTypeIds[] = {
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE,
        SS_DOUBLE
      };

      static int_T rt_LoggedStateComplexSignals[] = {
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      };

      static const char_T *rt_LoggedStateLabels[] = {
        "CSTATE",
        "CSTATE",
        "CSTATE",
        "CSTATE",
        "CSTATE",
        "CSTATE",
        "CSTATE",
        "CSTATE",
        "CSTATE",
        "CSTATE",
        "CSTATE",
        "CSTATE",
        "CSTATE",
        "CSTATE",
        "CSTATE",
        "CSTATE",
        "CSTATE",
        "CSTATE",
        "DSTATE",
        "DSTATE",
        "DSTATE"
      };

      static const char_T *rt_LoggedStateBlockNames[] = {
        "ModeloTurbinaGovernorPID/generador/Mechanical model/Continuous Pm input/Rotor angle dtheta",
        "ModeloTurbinaGovernorPID/generador/Electrical model/Continuous/phid/int",
        "ModeloTurbinaGovernorPID/generador/Electrical model/Continuous/phifd/int",
        "ModeloTurbinaGovernorPID/generador/Electrical model/Continuous/phikd/int",
        "ModeloTurbinaGovernorPID/generador/Electrical model/Continuous/phiq/int1",
        "ModeloTurbinaGovernorPID/generador/Electrical model/Continuous/phikq1/int",
        "ModeloTurbinaGovernorPID/powergui/EquivalentModel1/State-Space",
        "ModeloTurbinaGovernorPID/generador/Mechanical model/Continuous Pm input/Rotor speed\ndeviation (dw)",
        "ModeloTurbinaGovernorPID/Turbina y Controlador/Source/servo-motor/position",
        "ModeloTurbinaGovernorPID/Turbina y Controlador/Source/turbine/Integrator",
        "ModeloTurbinaGovernorPID/Sistema de Excitación/Source/Main Regulator\nka | (ta.s +1)/State Space",
        "ModeloTurbinaGovernorPID/Sistema de Excitación/Source/Low Pass Filter\n1 | (tr.s+1)/State Space",
        "ModeloTurbinaGovernorPID/Sistema de Excitación/Source/Damping\nkf.s | (tf.s+1)/State Space",
        "ModeloTurbinaGovernorPID/Turbina y Controlador/Source/PID/Derivative",
        "ModeloTurbinaGovernorPID/Turbina y Controlador/Source/PID/Integrator1",
        "ModeloTurbinaGovernorPID/Turbina y Controlador/Source/servo-motor/servo-\nmotor",
        "ModeloTurbinaGovernorPID/generador/Mechanical model/Continuous Pm input/theta",
        "ModeloTurbinaGovernorPID/generador/Electrical model/Continuous/phikq2/Enabled\nintegrator/int",
        "ModeloTurbinaGovernorPID/Three-Phase Fault/Fault A/Model/Continuous/Sfunction",
        "ModeloTurbinaGovernorPID/Three-Phase Fault/Fault B/Model/Continuous/Sfunction",
        "ModeloTurbinaGovernorPID/Three-Phase Fault/Fault C/Model/Continuous/Sfunction"
      };

      static const char_T *rt_LoggedStateNames[] = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""
      };

      static boolean_T rt_LoggedStateCrossMdlRef[] = {
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      };

      static RTWLogDataTypeConvert rt_RTWLogDataTypeConvert[] = {
        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 },

        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 }
      };

      static RTWLogSignalInfo rt_LoggedStateSignalInfo = {
        21,
        rt_LoggedStateWidths,
        rt_LoggedStateNumDimensions,
        rt_LoggedStateDimensions,
        rt_LoggedStateIsVarDims,
        (NULL),
        rt_LoggedStateDataTypeIds,
        rt_LoggedStateComplexSignals,
        (NULL),

        { rt_LoggedStateLabels },
        (NULL),
        (NULL),
        (NULL),

        { rt_LoggedStateBlockNames },

        { rt_LoggedStateNames },
        rt_LoggedStateCrossMdlRef,
        rt_RTWLogDataTypeConvert
      };

      static void * rt_LoggedStateSignalPtrs[21];
      rtliSetLogXSignalPtrs(ssGetRTWLogInfo(rtS), (LogSignalPtrsType)
                            rt_LoggedStateSignalPtrs);
      rtliSetLogXSignalInfo(ssGetRTWLogInfo(rtS), &rt_LoggedStateSignalInfo);
      rt_LoggedStateSignalPtrs[0] = (void*)&rtX.Rotorangledtheta_CSTATE;
      rt_LoggedStateSignalPtrs[1] = (void*)&rtX.int_CSTATE;
      rt_LoggedStateSignalPtrs[2] = (void*)&rtX.int_CSTATE_n;
      rt_LoggedStateSignalPtrs[3] = (void*)&rtX.int_CSTATE_e;
      rt_LoggedStateSignalPtrs[4] = (void*)&rtX.int1_CSTATE;
      rt_LoggedStateSignalPtrs[5] = (void*)&rtX.int_CSTATE_j;
      rt_LoggedStateSignalPtrs[6] = (void*)&rtX.StateSpace_CSTATE[0];
      rt_LoggedStateSignalPtrs[7] = (void*)&rtX.Rotorspeeddeviationdw_CSTATE;
      rt_LoggedStateSignalPtrs[8] = (void*)&rtX.position_CSTATE;
      rt_LoggedStateSignalPtrs[9] = (void*)&rtX.Integrator_CSTATE;
      rt_LoggedStateSignalPtrs[10] = (void*)&rtX.StateSpace_CSTATE_n;
      rt_LoggedStateSignalPtrs[11] = (void*)&rtX.StateSpace_CSTATE_k;
      rt_LoggedStateSignalPtrs[12] = (void*)&rtX.StateSpace_CSTATE_km;
      rt_LoggedStateSignalPtrs[13] = (void*)&rtX.Derivative_CSTATE;
      rt_LoggedStateSignalPtrs[14] = (void*)&rtX.Integrator1_CSTATE;
      rt_LoggedStateSignalPtrs[15] = (void*)&rtX.servomotor_CSTATE;
      rt_LoggedStateSignalPtrs[16] = (void*)&rtX.theta_CSTATE;
      rt_LoggedStateSignalPtrs[17] = (void*)&rtX.int_CSTATE_k;
      rt_LoggedStateSignalPtrs[18] = (void*)&rtDWork.Sfunction_DSTATE[0];
      rt_LoggedStateSignalPtrs[19] = (void*)&rtDWork.Sfunction_DSTATE_b[0];
      rt_LoggedStateSignalPtrs[20] = (void*)&rtDWork.Sfunction_DSTATE_k[0];
    }

    rtliSetLogT(ssGetRTWLogInfo(rtS), "tout");
    rtliSetLogX(ssGetRTWLogInfo(rtS), "tmp_raccel_xout");
    rtliSetLogXFinal(ssGetRTWLogInfo(rtS), "xFinal");
    rtliSetSigLog(ssGetRTWLogInfo(rtS), "");
    rtliSetLogVarNameModifier(ssGetRTWLogInfo(rtS), "none");
    rtliSetLogFormat(ssGetRTWLogInfo(rtS), 0);
    rtliSetLogMaxRows(ssGetRTWLogInfo(rtS), 1000);
    rtliSetLogDecimation(ssGetRTWLogInfo(rtS), 1);
    rtliSetLogY(ssGetRTWLogInfo(rtS), "");
    rtliSetLogYSignalInfo(ssGetRTWLogInfo(rtS), (NULL));
    rtliSetLogYSignalPtrs(ssGetRTWLogInfo(rtS), (NULL));
  }

  {
    static ssSolverInfo slvrInfo;
    static boolean_T contStatesDisabled[29];
    static real_T solverAbsTol[29] = { 1.0E-006, 1.0E-006, 1.0E-006, 1.0E-006,
      1.0E-006, 1.0E-006, 1.0E-006, 1.0E-006, 1.0E-006, 1.0E-006, 1.0E-006,
      1.0E-006, 1.0E-006, 1.0E-006, 1.0E-006, 1.0E-006, 1.0E-006, 1.0E-006,
      1.0E-006, 1.0E-006, 1.0E-006, 1.0E-006, 1.0E-006, 1.0E-006, 1.0E-006,
      1.0E-006, 1.0E-006, 1.0E-006, 1.0E-006 };

    static boolean_T solverAutoAbsTol[29] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 };

    static uint8_T zcAttributes[25] = { (ZC_EVENT_ALL), (ZC_EVENT_ALL),
      (ZC_EVENT_ALL), (ZC_EVENT_ALL), (ZC_EVENT_ALL), (ZC_EVENT_ALL),
      (ZC_EVENT_ALL_UP), (ZC_EVENT_ALL_DN), (ZC_EVENT_ALL), (ZC_EVENT_ALL),
      (ZC_EVENT_ALL), (ZC_EVENT_ALL), (ZC_EVENT_ALL), (ZC_EVENT_ALL),
      (ZC_EVENT_ALL), (ZC_EVENT_ALL), (ZC_EVENT_ALL), (ZC_EVENT_ALL),
      (ZC_EVENT_ALL), (ZC_EVENT_ALL), (ZC_EVENT_ALL), (ZC_EVENT_ALL),
      (ZC_EVENT_ALL), (ZC_EVENT_ALL), (ZC_EVENT_ALL) };

    static ssNonContDerivSigInfo nonContDerivSigInfo[5] = {
      { 1*sizeof(real_T), (char*)(&rtB.DataTypeConversion2), (NULL) }
      , { 1*sizeof(real_T), (char*)(&rtB.Product1), (NULL) }
      , { 1*sizeof(real_T), (char*)(&rtB.DataTypeConversion_j), (NULL) }
      , { 1*sizeof(boolean_T), (char*)(&rtB.RelationalOperator), (NULL) }
      , { 1*sizeof(boolean_T), (char*)(&rtB.RelationalOperator_a), (NULL) }
    };

    ssSetSolverRelTol(rtS, 0.001);
    ssSetSolverAbsTol(rtS, solverAbsTol);
    ssSetSolverAutoAbsTol(rtS, solverAutoAbsTol);
    ssSetStepSize(rtS, 0.0);
    ssSetMinStepSize(rtS, 0.0);
    ssSetMaxNumMinSteps(rtS, -1);
    ssSetMinStepViolatedError(rtS, 0);
    ssSetMaxStepSize(rtS, 0.2);
    ssSetSolverMaxOrder(rtS, -1);
    ssSetSolverRefineFactor(rtS, 1);
    ssSetOutputTimes(rtS, (NULL));
    ssSetNumOutputTimes(rtS, 0);
    ssSetOutputTimesOnly(rtS, 0);
    ssSetOutputTimesIndex(rtS, 0);
    ssSetZCCacheNeedsReset(rtS, 1);
    ssSetDerivCacheNeedsReset(rtS, 0);
    ssSetNumNonContDerivSigInfos(rtS, 5);
    ssSetNonContDerivSigInfos(rtS, nonContDerivSigInfo);
    ssSetSolverInfo(rtS, &slvrInfo);
    ssSetSolverName(rtS, "ode45");
    ssSetVariableStepSolver(rtS, 1);
    ssSetSolverConsistencyChecking(rtS, 0);
    ssSetSolverAdaptiveZcDetection(rtS, 0);
    ssSetSolverRobustResetMethod(rtS, 0);
    ssSetSolverStateProjection(rtS, 0);
    ssSetSolverMassMatrixType(rtS, (ssMatrixType)0);
    ssSetSolverMassMatrixNzMax(rtS, 0);
    ssSetModelOutputs(rtS, MdlOutputs);
    ssSetModelLogData(rtS, rt_UpdateTXYLogVars);
    ssSetModelUpdate(rtS, MdlUpdate);
    ssSetModelDerivatives(rtS, MdlDerivatives);
    ssSetSolverZcSignalAttrib(rtS, zcAttributes);
    ssSetSolverNumZcSignals(rtS, 25);
    ssSetModelZeroCrossings(rtS, MdlZeroCrossings);
    ssSetSolverConsecutiveZCsStepRelTol(rtS, 2.8421709430404007E-013);
    ssSetSolverMaxConsecutiveZCs(rtS, 1000);
    ssSetSolverConsecutiveZCsError(rtS, 2);
    ssSetSolverMaxConsecutiveMinStep(rtS, 1);
    ssSetSolverShapePreserveControl(rtS, 2);
    ssSetTNextTid(rtS, INT_MIN);
    ssSetTNext(rtS, rtMinusInf);
    ssSetSolverNeedsReset(rtS);
    ssSetNumNonsampledZCs(rtS, 25);
    ssSetContStateDisabled(rtS, contStatesDisabled);
    ssSetSolverMaxConsecutiveMinStep(rtS, 1);
  }

  ssSetChecksumVal(rtS, 0, 579359455U);
  ssSetChecksumVal(rtS, 1, 1625338619U);
  ssSetChecksumVal(rtS, 2, 1664664728U);
  ssSetChecksumVal(rtS, 3, 2463199491U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[11];
    ssSetRTWExtModeInfo(rtS, &rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = &rtAlwaysEnabled;
    systemRan[2] = &rtAlwaysEnabled;
    systemRan[3] = &rtAlwaysEnabled;
    systemRan[4] = &rtAlwaysEnabled;
    systemRan[5] = (sysRanDType *)&rtDWork.daxissaturation_SubsysRanBC;
    systemRan[6] = (sysRanDType *)&rtDWork.daxissaturation_SubsysRanBC;
    systemRan[7] = (sysRanDType *)&rtDWork.dqaxissaturation_SubsysRanBC;
    systemRan[8] = (sysRanDType *)&rtDWork.dqaxissaturation_SubsysRanBC;
    systemRan[9] = (sysRanDType *)&rtDWork.dqaxissaturation_SubsysRanBC;
    systemRan[10] = (sysRanDType *)&rtDWork.Enabledintegrator_SubsysRanBC;
    rteiSetModelMappingInfoPtr(ssGetRTWExtModeInfo(rtS), &ssGetModelMappingInfo
      (rtS));
    rteiSetChecksumsPtr(ssGetRTWExtModeInfo(rtS), ssGetChecksums(rtS));
    rteiSetTPtr(ssGetRTWExtModeInfo(rtS), ssGetTPtr(rtS));
  }

  ssSetNumSFunctions(rtS, 3);

  {
    static SimStruct childSFunctions[3];
    static SimStruct *childSFunctionPtrs[3];
    (void) memset((void *)&childSFunctions[0], 0,
                  sizeof(childSFunctions));
    ssSetSFunctions(rtS, &childSFunctionPtrs[0]);
    ssSetSFunction(rtS, 0, &childSFunctions[0]);
    ssSetSFunction(rtS, 1, &childSFunctions[1]);
    ssSetSFunction(rtS, 2, &childSFunctions[2]);

    {
      SimStruct *rts = ssGetSFunction(rtS, 0);
      static time_T sfcnPeriod[1];
      static time_T sfcnOffset[1];
      static int_T sfcnTsMap[1];
      (void) memset((void*)sfcnPeriod, 0,
                    sizeof(time_T)*1);
      (void) memset((void*)sfcnOffset, 0,
                    sizeof(time_T)*1);
      ssSetSampleTimePtr(rts, &sfcnPeriod[0]);
      ssSetOffsetTimePtr(rts, &sfcnOffset[0]);
      ssSetSampleTimeTaskIDPtr(rts, sfcnTsMap);
      ssSetMdlInfoPtr(rts, ssGetMdlInfoPtr(rtS));

      {
        static struct _ssSFcnModelMethods2 methods2;
        ssSetModelMethods2(rts, &methods2);
      }

      {
        static struct _ssSFcnModelMethods3 methods3;
        ssSetModelMethods3(rts, &methods3);
      }

      {
        static struct _ssPortInputs inputPortInfo[2];
        _ssSetNumInputPorts(rts, 2);
        ssSetPortInfoForInputs(rts, &inputPortInfo[0]);

        {
          static real_T const *sfcnUPtrs[1];
          sfcnUPtrs[0] = &rtB.StateSpace_o1[0];
          ssSetInputPortSignalPtrs(rts, 0, (InputPtrsType)&sfcnUPtrs[0]);
          _ssSetInputPortNumDimensions(rts, 0, 1);
          ssSetInputPortWidth(rts, 0, 1);
        }

        {
          static real_T const *sfcnUPtrs[1];
          sfcnUPtrs[0] = &rtB.Switch3;
          ssSetInputPortSignalPtrs(rts, 1, (InputPtrsType)&sfcnUPtrs[0]);
          _ssSetInputPortNumDimensions(rts, 1, 1);
          ssSetInputPortWidth(rts, 1, 1);
        }
      }

      {
        static struct _ssPortOutputs outputPortInfo[1];
        ssSetPortInfoForOutputs(rts, &outputPortInfo[0]);
        _ssSetNumOutputPorts(rts, 1);

        {
          _ssSetOutputPortNumDimensions(rts, 0, 1);
          ssSetOutputPortWidth(rts, 0, 1);
          ssSetOutputPortSignal(rts, 0, ((real_T *) &rtB.Sfunction));
        }
      }

      ssSetDiscStates(rts, (real_T *) &rtDWork.Sfunction_DSTATE[0]);
      ssSetModelName(rts, "Sfunction");
      ssSetPath(rts,
                "ModeloTurbinaGovernorPID/Three-Phase Fault/Fault A/Model/Continuous/Sfunction");
      if (ssGetRTModel(rtS) == (NULL)) {
        ssSetParentSS(rts, rtS);
        ssSetRootSS(rts, ssGetRootSS(rtS));
      } else {
        ssSetRTModel(rts,ssGetRTModel(rtS));
        ssSetParentSS(rts, (NULL));
        ssSetRootSS(rts, rts);
      }

      ssSetVersion(rts, SIMSTRUCT_VERSION_LEVEL2);

      {
        static mxArray *sfcnParams[1];
        ssSetSFcnParamsCount(rts, 1);
        ssSetSFcnParamsPtr(rts, &sfcnParams[0]);
        ssSetSFcnParam(rts, 0, (mxArray*)&rtP.Sfunction_P1_Size[0]);
      }

      {
        static struct _ssDWorkRecord dWorkRecord[1];
        static struct _ssDWorkAuxRecord dWorkAuxRecord[1];
        ssSetSFcnDWork(rts, dWorkRecord);
        ssSetSFcnDWorkAux(rts, dWorkAuxRecord);
        _ssSetNumDWork(rts, 1);
        ssSetDWorkWidth(rts, 0, 2);
        ssSetDWorkDataType(rts, 0,SS_DOUBLE);
        ssSetDWorkComplexSignal(rts, 0, 0);
        ssSetDWorkUsedAsDState(rts, 0, 1);
        ssSetDWork(rts, 0, &rtDWork.Sfunction_DSTATE[0]);
      }

      sfun_psbbreaker(rts);
      sfcnInitializeSizes(rts);
      sfcnInitializeSampleTimes(rts);
      ssSetSampleTime(rts, 0, 0.0);
      ssSetOffsetTime(rts, 0, 1.0);
      sfcnTsMap[0] = 1;
      ssSetInputPortWidth(rts, 0, 1);
      ssSetInputPortDataType(rts, 0, SS_DOUBLE);
      ssSetInputPortComplexSignal(rts, 0, 0);
      ssSetInputPortFrameData(rts, 0, 0);
      ssSetInputPortWidth(rts, 1, 1);
      ssSetInputPortDataType(rts, 1, SS_DOUBLE);
      ssSetInputPortComplexSignal(rts, 1, 0);
      ssSetInputPortFrameData(rts, 1, 0);
      ssSetOutputPortWidth(rts, 0, 1);
      ssSetOutputPortDataType(rts, 0, SS_DOUBLE);
      ssSetOutputPortComplexSignal(rts, 0, 0);
      ssSetOutputPortFrameData(rts, 0, 0);
      ssSetNumDiscStates(rts, 2);
      ssSetNumNonsampledZCs(rts, 2);
      _ssSetInputPortConnected(rts, 0, 1);
      _ssSetInputPortConnected(rts, 1, 1);
      _ssSetOutputPortConnected(rts, 0, 1);
      _ssSetOutputPortBeingMerged(rts, 0, 0);
      ssSetInputPortBufferDstPort(rts, 0, -1);
      ssSetInputPortBufferDstPort(rts, 1, -1);
    }

    {
      SimStruct *rts = ssGetSFunction(rtS, 1);
      static time_T sfcnPeriod[1];
      static time_T sfcnOffset[1];
      static int_T sfcnTsMap[1];
      (void) memset((void*)sfcnPeriod, 0,
                    sizeof(time_T)*1);
      (void) memset((void*)sfcnOffset, 0,
                    sizeof(time_T)*1);
      ssSetSampleTimePtr(rts, &sfcnPeriod[0]);
      ssSetOffsetTimePtr(rts, &sfcnOffset[0]);
      ssSetSampleTimeTaskIDPtr(rts, sfcnTsMap);
      ssSetMdlInfoPtr(rts, ssGetMdlInfoPtr(rtS));

      {
        static struct _ssSFcnModelMethods2 methods2;
        ssSetModelMethods2(rts, &methods2);
      }

      {
        static struct _ssSFcnModelMethods3 methods3;
        ssSetModelMethods3(rts, &methods3);
      }

      {
        static struct _ssPortInputs inputPortInfo[2];
        _ssSetNumInputPorts(rts, 2);
        ssSetPortInfoForInputs(rts, &inputPortInfo[0]);

        {
          static real_T const *sfcnUPtrs[1];
          sfcnUPtrs[0] = &rtB.StateSpace_o1[1];
          ssSetInputPortSignalPtrs(rts, 0, (InputPtrsType)&sfcnUPtrs[0]);
          _ssSetInputPortNumDimensions(rts, 0, 1);
          ssSetInputPortWidth(rts, 0, 1);
        }

        {
          static real_T const *sfcnUPtrs[1];
          sfcnUPtrs[0] = &rtB.Switch3_m;
          ssSetInputPortSignalPtrs(rts, 1, (InputPtrsType)&sfcnUPtrs[0]);
          _ssSetInputPortNumDimensions(rts, 1, 1);
          ssSetInputPortWidth(rts, 1, 1);
        }
      }

      {
        static struct _ssPortOutputs outputPortInfo[1];
        ssSetPortInfoForOutputs(rts, &outputPortInfo[0]);
        _ssSetNumOutputPorts(rts, 1);

        {
          _ssSetOutputPortNumDimensions(rts, 0, 1);
          ssSetOutputPortWidth(rts, 0, 1);
          ssSetOutputPortSignal(rts, 0, ((real_T *) &rtB.Sfunction_k));
        }
      }

      ssSetDiscStates(rts, (real_T *) &rtDWork.Sfunction_DSTATE_b[0]);
      ssSetModelName(rts, "Sfunction");
      ssSetPath(rts,
                "ModeloTurbinaGovernorPID/Three-Phase Fault/Fault B/Model/Continuous/Sfunction");
      if (ssGetRTModel(rtS) == (NULL)) {
        ssSetParentSS(rts, rtS);
        ssSetRootSS(rts, ssGetRootSS(rtS));
      } else {
        ssSetRTModel(rts,ssGetRTModel(rtS));
        ssSetParentSS(rts, (NULL));
        ssSetRootSS(rts, rts);
      }

      ssSetVersion(rts, SIMSTRUCT_VERSION_LEVEL2);

      {
        static mxArray *sfcnParams[1];
        ssSetSFcnParamsCount(rts, 1);
        ssSetSFcnParamsPtr(rts, &sfcnParams[0]);
        ssSetSFcnParam(rts, 0, (mxArray*)&rtP.Sfunction_P1_Size_f[0]);
      }

      {
        static struct _ssDWorkRecord dWorkRecord[1];
        static struct _ssDWorkAuxRecord dWorkAuxRecord[1];
        ssSetSFcnDWork(rts, dWorkRecord);
        ssSetSFcnDWorkAux(rts, dWorkAuxRecord);
        _ssSetNumDWork(rts, 1);
        ssSetDWorkWidth(rts, 0, 2);
        ssSetDWorkDataType(rts, 0,SS_DOUBLE);
        ssSetDWorkComplexSignal(rts, 0, 0);
        ssSetDWorkUsedAsDState(rts, 0, 1);
        ssSetDWork(rts, 0, &rtDWork.Sfunction_DSTATE_b[0]);
      }

      sfun_psbbreaker(rts);
      sfcnInitializeSizes(rts);
      sfcnInitializeSampleTimes(rts);
      ssSetSampleTime(rts, 0, 0.0);
      ssSetOffsetTime(rts, 0, 1.0);
      sfcnTsMap[0] = 1;
      ssSetInputPortWidth(rts, 0, 1);
      ssSetInputPortDataType(rts, 0, SS_DOUBLE);
      ssSetInputPortComplexSignal(rts, 0, 0);
      ssSetInputPortFrameData(rts, 0, 0);
      ssSetInputPortWidth(rts, 1, 1);
      ssSetInputPortDataType(rts, 1, SS_DOUBLE);
      ssSetInputPortComplexSignal(rts, 1, 0);
      ssSetInputPortFrameData(rts, 1, 0);
      ssSetOutputPortWidth(rts, 0, 1);
      ssSetOutputPortDataType(rts, 0, SS_DOUBLE);
      ssSetOutputPortComplexSignal(rts, 0, 0);
      ssSetOutputPortFrameData(rts, 0, 0);
      ssSetNumDiscStates(rts, 2);
      ssSetNumNonsampledZCs(rts, 2);
      _ssSetInputPortConnected(rts, 0, 1);
      _ssSetInputPortConnected(rts, 1, 1);
      _ssSetOutputPortConnected(rts, 0, 1);
      _ssSetOutputPortBeingMerged(rts, 0, 0);
      ssSetInputPortBufferDstPort(rts, 0, -1);
      ssSetInputPortBufferDstPort(rts, 1, -1);
    }

    {
      SimStruct *rts = ssGetSFunction(rtS, 2);
      static time_T sfcnPeriod[1];
      static time_T sfcnOffset[1];
      static int_T sfcnTsMap[1];
      (void) memset((void*)sfcnPeriod, 0,
                    sizeof(time_T)*1);
      (void) memset((void*)sfcnOffset, 0,
                    sizeof(time_T)*1);
      ssSetSampleTimePtr(rts, &sfcnPeriod[0]);
      ssSetOffsetTimePtr(rts, &sfcnOffset[0]);
      ssSetSampleTimeTaskIDPtr(rts, sfcnTsMap);
      ssSetMdlInfoPtr(rts, ssGetMdlInfoPtr(rtS));

      {
        static struct _ssSFcnModelMethods2 methods2;
        ssSetModelMethods2(rts, &methods2);
      }

      {
        static struct _ssSFcnModelMethods3 methods3;
        ssSetModelMethods3(rts, &methods3);
      }

      {
        static struct _ssPortInputs inputPortInfo[2];
        _ssSetNumInputPorts(rts, 2);
        ssSetPortInfoForInputs(rts, &inputPortInfo[0]);

        {
          static real_T const *sfcnUPtrs[1];
          sfcnUPtrs[0] = &rtB.StateSpace_o1[2];
          ssSetInputPortSignalPtrs(rts, 0, (InputPtrsType)&sfcnUPtrs[0]);
          _ssSetInputPortNumDimensions(rts, 0, 1);
          ssSetInputPortWidth(rts, 0, 1);
        }

        {
          static real_T const *sfcnUPtrs[1];
          sfcnUPtrs[0] = &rtB.Switch3_h;
          ssSetInputPortSignalPtrs(rts, 1, (InputPtrsType)&sfcnUPtrs[0]);
          _ssSetInputPortNumDimensions(rts, 1, 1);
          ssSetInputPortWidth(rts, 1, 1);
        }
      }

      {
        static struct _ssPortOutputs outputPortInfo[1];
        ssSetPortInfoForOutputs(rts, &outputPortInfo[0]);
        _ssSetNumOutputPorts(rts, 1);

        {
          _ssSetOutputPortNumDimensions(rts, 0, 1);
          ssSetOutputPortWidth(rts, 0, 1);
          ssSetOutputPortSignal(rts, 0, ((real_T *) &rtB.Sfunction_j));
        }
      }

      ssSetDiscStates(rts, (real_T *) &rtDWork.Sfunction_DSTATE_k[0]);
      ssSetModelName(rts, "Sfunction");
      ssSetPath(rts,
                "ModeloTurbinaGovernorPID/Three-Phase Fault/Fault C/Model/Continuous/Sfunction");
      if (ssGetRTModel(rtS) == (NULL)) {
        ssSetParentSS(rts, rtS);
        ssSetRootSS(rts, ssGetRootSS(rtS));
      } else {
        ssSetRTModel(rts,ssGetRTModel(rtS));
        ssSetParentSS(rts, (NULL));
        ssSetRootSS(rts, rts);
      }

      ssSetVersion(rts, SIMSTRUCT_VERSION_LEVEL2);

      {
        static mxArray *sfcnParams[1];
        ssSetSFcnParamsCount(rts, 1);
        ssSetSFcnParamsPtr(rts, &sfcnParams[0]);
        ssSetSFcnParam(rts, 0, (mxArray*)&rtP.Sfunction_P1_Size_n[0]);
      }

      {
        static struct _ssDWorkRecord dWorkRecord[1];
        static struct _ssDWorkAuxRecord dWorkAuxRecord[1];
        ssSetSFcnDWork(rts, dWorkRecord);
        ssSetSFcnDWorkAux(rts, dWorkAuxRecord);
        _ssSetNumDWork(rts, 1);
        ssSetDWorkWidth(rts, 0, 2);
        ssSetDWorkDataType(rts, 0,SS_DOUBLE);
        ssSetDWorkComplexSignal(rts, 0, 0);
        ssSetDWorkUsedAsDState(rts, 0, 1);
        ssSetDWork(rts, 0, &rtDWork.Sfunction_DSTATE_k[0]);
      }

      sfun_psbbreaker(rts);
      sfcnInitializeSizes(rts);
      sfcnInitializeSampleTimes(rts);
      ssSetSampleTime(rts, 0, 0.0);
      ssSetOffsetTime(rts, 0, 1.0);
      sfcnTsMap[0] = 1;
      ssSetInputPortWidth(rts, 0, 1);
      ssSetInputPortDataType(rts, 0, SS_DOUBLE);
      ssSetInputPortComplexSignal(rts, 0, 0);
      ssSetInputPortFrameData(rts, 0, 0);
      ssSetInputPortWidth(rts, 1, 1);
      ssSetInputPortDataType(rts, 1, SS_DOUBLE);
      ssSetInputPortComplexSignal(rts, 1, 0);
      ssSetInputPortFrameData(rts, 1, 0);
      ssSetOutputPortWidth(rts, 0, 1);
      ssSetOutputPortDataType(rts, 0, SS_DOUBLE);
      ssSetOutputPortComplexSignal(rts, 0, 0);
      ssSetOutputPortFrameData(rts, 0, 0);
      ssSetNumDiscStates(rts, 2);
      ssSetNumNonsampledZCs(rts, 2);
      _ssSetInputPortConnected(rts, 0, 1);
      _ssSetInputPortConnected(rts, 1, 1);
      _ssSetOutputPortConnected(rts, 0, 1);
      _ssSetOutputPortBeingMerged(rts, 0, 0);
      ssSetInputPortBufferDstPort(rts, 0, -1);
      ssSetInputPortBufferDstPort(rts, 1, -1);
    }
  }

  return rtS;
}
