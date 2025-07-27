% Set constant species by scaling to air number density
N2  =  0.780800000.*M;
O2  =  0.209500000.*M;
H2  =  0.000000560.*M;
% CH4 =  0.000001850.*M;
% methane is set to a constant global background of 1850 ppb in CMAQ but is
% modified in the F0AM mechanism to evolve freely

SpeciesToAdd = {...
'APANS'; 'LVKS_OH'; 'ACRO'; 'HCHO'; 'CO'; 'RDNO3_HV'; 'xBALD'; 'PBZN'; 'ACETL'; ...
'OLEA2_HV'; 'BUDAL_OH'; 'C2BEN'; 'FURNS'; 'OXYL'; 'AFG2B_OH'; 'RCHO'; 'zPAN2'; 'xACRO'; 'xRDNO3'; ...
'KET2'; 'ACRLNT'; 'ISOP_N3'; 'ACET'; 'HPCRB'; 'BUT13'; 'R2NO3'; 'SumRO2'; 'zRCNO3'; 'BZO2'; ...
'TERP_O3'; 'RPNO3'; 'ACRO_HV'; 'MACR_N3'; 'ETHEN'; 'RCHO_HV'; 'MXYL'; 'HNO4'; 'RCNO3_HV'; 'ALK5_OH'; ...
'ETOX'; 'xETCHO'; 'OLE2_O3'; 'xHCHO'; 'xBENX'; 'xOH'; 'OLEA2_O3'; 'MACR'; 'ETHAN'; 'O3P'; ...
'RO2C'; 'BENZ'; 'OLE4_O3'; 'RPNO3_HV'; 'xOACID'; 'RCHO2'; 'CRES'; 'xGLCHO'; 'NO'; ...
'ALK6'; 'H2'; 'xMECO3'; 'zRDNO3'; 'PNAMIN'; 'ETO2'; 'AMINS'; 'BZ123'; 'OLEA1_OH'; 'R2NO3_HV'; ...
'NPHE'; 'OTHN'; 'PCLBEN'; 'OLE1'; 'AFG2B'; 'M'; 'NO2'; 'xHO2'; 'xFURNS'; 'xPAN2'; ...
'TAMNS'; 'BUT13_O3'; 'xBUDAL'; 'PAN2'; 'xKET2'; 'ISOP_OH'; 'BENX'; 'OLEA2'; 'xR2CO3'; 'ALK4'; ...
'N2O5'; 'BALD'; 'xRCHO'; 'PROPE_O3'; 'xAMINS'; 'zRPNO3'; 'yRUOOH'; 'ETCHO'; 'RHNO3'; 'AFG1_OH'; ...
'BACL'; 'TERP_N3'; 'MGLY'; 'SumRCO3'; 'ACRO_OH'; 'RCNO3'; 'RDNO3'; 'ISOP'; 'xMEK'; 'NAPPRD'; ...
'AFG1'; 'xBZO'; 'PACID'; 'CO2'; 'BZO'; 'OLE4'; 'MECHO2'; 'xTBUO'; 'O1D'; 'CATL3'; ...
'xACET'; 'R1NO3'; 'AFG2A'; 'SULF'; 'MACO3'; 'PHEN'; 'RNNO3'; 'TBUO'; 'xNO3'; 'xOLEP'; ...
'xRPNO3'; 'xBACL'; 'yHPCRB'; 'xAFG2B'; 'BPINE'; 'BZ135'; 'xETO2'; 'MEOOH'; 'NC4'; 'NAPS'; ...
'yROOH'; 'CH4'; 'xMEO2'; 'RANO3'; 'RUOOH'; 'H2O'; 'zRHNO3'; 'xRHNO3'; 'SESQ_OH'; 'OH'; ...
'OLEA1'; 'HONO'; 'TOLU'; 'OLEP'; 'xHCOOH'; 'xMECHO'; 'HPCRB_HV'; 'zR2NO3'; 'BUDAL'; 'OLEA2_OH'; ...
'xPACID'; 'PROPE'; 'LVKS'; 'HV'; 'MEOH'; 'xHPCRB'; 'zR1NO3'; 'NPRAD'; 'OACID'; 'SO2'; ...
'LVKS_O3'; 'BPINE_OH'; 'SESQ'; 'HCHO2'; 'PAN'; 'IMINE'; 'OLEA2_N3'; 'yRPNO3'; 'CLETHE'; 'MTBE'; ...
'RCNO3_OH'; 'OLE2'; 'HO2H'; 'NO3'; 'APINE_OH'; 'RAOOH'; 'yRAOOH'; 'OLE3'; 'ALK1'; 'MECO3'; ...
'xMVK'; 'xOLEA2'; 'APINE'; 'NROG'; 'zRANO3'; 'STYRS'; 'xMACR'; 'GLY'; 'PCE'; 'O2'; ...
'MEO2'; 'MECL2'; 'xGLY'; 'xMACO3'; 'MACR_OH'; 'MECHO'; 'xNO2'; 'O3'; 'ROOH'; 'MALAH'; ...
'R2CO3'; 'RO2XC'; 'GLCHO'; 'ALK2'; 'HO2'; 'XYNL'; 'xAFG3'; 'HNO3'; 'xLVKS'; 'MEK'; ...
'AFG1_HV'; 'HCOOH'; 'ALK5'; 'ETBR2'; 'TERP_OH'; 'xAFG1'; 'PROP'; 'BZCO3'; 'PHOT'; 'CHCL3'; ...
'zRNNO3'; 'ALK3'; 'ARO1'; 'xOLEA1'; 'xRCNO3'; 'BUT13_OH'; 'BZ124'; 'ARO2'; 'xAFG2A'; 'NAMIN'; ...
'xMGLY'; 'ETOH'; 'ETCL2'; 'CATL'; 'AFG3'; 'PXYL'; 'MVK'; 'TERP'; 'SESQ_O3';'XYLRO2';'TOLRO2'};

AddSpecies

i=i+1;
Rnames{i} = 'NO2 + HV = NO + O3P';
k(:,i) = JNO2_06;
Gstr{i,1} = 'NO2';
fNO2(i)=fNO2(i)-1; fNO(i)=fNO(i)+1; fO3P(i)=fO3P(i)+1;

i=i+1;
Rnames{i} = 'O3P + O2 + M = O3';
k(:,i) = 5.68e-34.*(T./300).^-2.60.*M.*0.21.*M; %SAPRC07 rate
Gstr{i,1} = 'O3P';
fO3P(i)=fO3P(i)-1; fO3(i)=fO3(i)+1;

i=i+1;
Rnames{i} = 'O3P + O3 = ';
k(:,i) = 8.00e-12.*exp(-2060./T);
Gstr{i,1} = 'O3P'; Gstr{i,2} = 'O3';
fO3P(i)=fO3P(i)-1; fO3(i)=fO3(i)-1;
 
i=i+1;
Rnames{i} = 'O3P + NO = NO2';
k(:,i) = kf_O3P_NO;
Gstr{i,1} = 'O3P'; Gstr{i,2} = 'NO';
fO3P(i)=fO3P(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1;
 
i=i+1;
Rnames{i} = 'O3P + NO2 = NO';
k(:,i) = 5.10e-12.*exp(209.843./T);
Gstr{i,1} = 'O3P'; Gstr{i,2} = 'NO2';
fO3P(i)=fO3P(i)-1; fNO2(i)=fNO2(i)-1; fNO(i)=fNO(i)+1;

i=i+1;
Rnames{i} = 'O3P + NO2 = NO3';
k(:,i) = kf_O3P_NO2;
Gstr{i,1} = 'O3P'; Gstr{i,2} = 'NO2';
fO3P(i)=fO3P(i)-1; fNO2(i)=fNO2(i)-1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'O3 + NO = NO2';
k(:,i) = 3.00e-12.*exp(-1500.101./T);
Gstr{i,1} = 'O3'; Gstr{i,2} = 'NO';
fO3(i)=fO3(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'O3 + NO2 = NO3';
k(:,i) = 1.20e-13.*exp(-2450.181./T);
Gstr{i,1} = 'O3'; Gstr{i,2} = 'NO2';
fO3(i)=fO3(i)-1; fNO2(i)=fNO2(i)-1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'NO + NO3 = 2*NO2';
k(:,i) = 1.50e-11.*exp(170.089./T);
Gstr{i,1} = 'NO'; Gstr{i,2} = 'NO3';
fNO(i)=fNO(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+2;

i=i+1;
Rnames{i} = 'NO + NO + O2 = 2*NO2';
k(:,i) = 3.30e-39.*exp(530./ T).*0.21.*M; %SAPRC07 rate
Gstr{i,1} = 'NO'; Gstr{i,2} = 'NO';
fNO(i)=fNO(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+2;

i=i+1;
Rnames{i} = 'NO2 + NO3 = N2O5';
k(:,i) = kf_NO2_NO3;
Gstr{i,1} = 'NO2'; Gstr{i,2} = 'NO3';
fNO2(i)=fNO2(i)-1; fNO3(i)=fNO3(i)-1; fN2O5(i)=fN2O5(i)+1;

i=i+1;
Rnames{i} = 'N2O5 = NO2 + NO3';
k(:,i) = kf_N2O5;
Gstr{i,1} = 'N2O5';
fN2O5(i)=fN2O5(i)-1; fNO2(i)=fNO2(i)+1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'N2O5 + H2O = 2*HNO3';
k(:,i) = 0.00e+00;
Gstr{i,1} = 'N2O5'; Gstr{i,2} = 'H2O';
fN2O5(i)=fN2O5(i)-1; fH2O(i)=fH2O(i)-1; fHNO3(i)=fHNO3(i)+2;

i=i+1;
Rnames{i} = 'N2O5 + H2O + H2O = 2*HNO3 + H2O';
k(:,i) = 0.00e+00;
Gstr{i,1} = 'N2O5'; Gstr{i,2} = 'H2O'; Gstr{i,3} = 'H2O';
fN2O5(i)=fN2O5(i)-1; fH2O(i)=fH2O(i)-1; fH2O(i)=fH2O(i)-1; fHNO3(i)=fHNO3(i)+2; fH2O(i)=fH2O(i)+1;

i=i+1;
Rnames{i} = 'NO2 + NO3 = NO + NO2';
k(:,i) = 4.50e-14.*exp(-1260.064./T);
Gstr{i,1} = 'NO2'; Gstr{i,2} = 'NO3';
fNO2(i)=fNO2(i)-1; fNO3(i)=fNO3(i)-1; fNO(i)=fNO(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'NO3 + HV = NO';
k(:,i) = JNO3NO_06;
Gstr{i,1} = 'NO3';
fNO3(i)=fNO3(i)-1; fNO(i)=fNO(i)+1; 

i=i+1;
Rnames{i} = 'NO3 + HV = NO2 + O3P';
k(:,i) = JNO3NO2_6;
Gstr{i,1} = 'NO3';
fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+1; fO3P(i)=fO3P(i)+1;

i=i+1;
Rnames{i} = 'O3 + HV = O1D + O2';
k(:,i) = JO3O1D_06;
Gstr{i,1} = 'O3';
fO3(i)=fO3(i)-1; fO1D(i)=fO1D(i)+1; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'O3 + HV = O3P + O2';
k(:,i) = JO3O3P_06;
Gstr{i,1} = 'O3';
fO3(i)=fO3(i)-1; fO3P(i)=fO3P(i)+1; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'O1D + H2O = 2*OH';
k(:,i) = 1.63e-10.*exp(59.883./T);
Gstr{i,1} = 'O1D'; Gstr{i,2} = 'H2O';
fO1D(i)=fO1D(i)-1; fH2O(i)=fH2O(i)-1; fOH(i)=fOH(i)+2;

i=i+1;
Rnames{i} = 'O1D + M = O3P + M';
k(:,i) = 2.38e-11.*exp(96./ T).*M; %SAPRC07 rate
Gstr{i,1} = 'O1D';
fO1D(i)=fO1D(i)-1; fO3P(i)=fO3P(i)+1;

i=i+1;
Rnames{i} = 'OH + NO = HONO';
k(:,i) = kf_OH_NO;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'NO';
fOH(i)=fOH(i)-1; fNO(i)=fNO(i)-1; fHONO(i)=fHONO(i)+1;

i=i+1;
Rnames{i} = 'HONO + HV = OH + NO';
k(:,i) = JHONO_06;
Gstr{i,1} = 'HONO';
fHONO(i)=fHONO(i)-1; fOH(i)=fOH(i)+1; fNO(i)=fNO(i)+1;

i=i+1;
Rnames{i} = 'OH + HONO =  NO2';
k(:,i) = 1.80e-11.*exp(-389.996./T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'HONO';
fOH(i)=fOH(i)-1; fHONO(i)=fHONO(i)-1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'OH + NO2 = HNO3';
k(:,i) = kf_OH_NO2;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'NO2';
fOH(i)=fOH(i)-1; fNO2(i)=fNO2(i)-1; fHNO3(i)=fHNO3(i)+1;

i=i+1;
Rnames{i} = 'OH + NO3 = HO2 + NO2';
k(:,i) = 2.20e-11;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'NO3';
fOH(i)=fOH(i)-1; fNO3(i)=fNO3(i)-1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'OH + HNO3 = H2O + NO3';
k(:,i) = k_OH_HNO3;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'HNO3';
fOH(i)=fOH(i)-1; fHNO3(i)=fHNO3(i)-1; fH2O(i)=fH2O(i)+1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'HNO3 + HV = OH + NO2';
k(:,i) = JHNO3;
Gstr{i,1} = 'HNO3';
fHNO3(i)=fHNO3(i)-1; fOH(i)=fOH(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'OH + O3 = HO2';
k(:,i) = 1.70e-12.*exp(-940.016./T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'O3';
fOH(i)=fOH(i)-1; fO3(i)=fO3(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'HO2 + NO = OH + NO2';
k(:,i) = 3.30e-12.*exp(270.229./T);
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'NO';
fHO2(i)=fHO2(i)-1; fNO(i)=fNO(i)-1; fOH(i)=fOH(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'HO2 + NO = HNO3';
k(:,i) = k_HO2_NO;
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'NO';
fHO2(i)=fHO2(i)-1; fNO(i)=fNO(i)-1; fHNO3(i)=fHNO3(i)+1;

i=i+1;
Rnames{i} = 'HO2 + NO + H2O = HNO3 + H2O';
k(:,i) = 1.20e-35.*exp(2943.841./T);
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'NO'; Gstr{i,3} = 'H2O';
fHO2(i)=fHO2(i)-1; fNO(i)=fNO(i)-1; fH2O(i)=fH2O(i)-1; fHNO3(i)=fHNO3(i)+1; fH2O(i)=fH2O(i)+1;

i=i+1;
Rnames{i} = 'HO2 + NO2 = HNO4';
k(:,i) = kf_HO2_NO2;
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'NO2';
fHO2(i)=fHO2(i)-1; fNO2(i)=fNO2(i)-1; fHNO4(i)=fHNO4(i)+1;

i=i+1;
Rnames{i} = 'HNO4 = HO2 + NO2';
k(:,i) = kf_HNO4;
Gstr{i,1} = 'HNO4';
fHNO4(i)=fHNO4(i)-1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'HNO4 + HV = .8*HO2 + .8*NO2 + .2*OH + 0.2*NO3';
k(:,i) = JHNO4_06;
Gstr{i,1} = 'HNO4';
fHNO4(i)=fHNO4(i)-1; fHO2(i)=fHO2(i)+.8; fNO2(i)=fNO2(i)+.8; fOH(i)=fOH(i)+.2; fNO3(i)=fNO3(i)+0.2;

i=i+1;
Rnames{i} = 'HNO4 + OH = H2O + NO2 + O2';
k(:,i) = 1.30e-12.*exp(379.932./T);
Gstr{i,1} = 'HNO4'; Gstr{i,2} = 'OH';
fHNO4(i)=fHNO4(i)-1; fOH(i)=fOH(i)-1; fNO2(i)=fNO2(i)+1; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'HO2 + O3 = OH + 2*O2';
k(:,i) = 1.00e-14.*exp(-490.137./T);
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'O3';
fHO2(i)=fHO2(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'HO2 + HO2 = HO2H + O2';
k(:,i) = k_HO2_HO2;
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'HO2';
fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2H(i)=fHO2H(i)+1;

i=i+1;
Rnames{i} = 'HO2 + HO2 + H2O = HO2H + O2 + H2O';
k(:,i) = k_HO2_HO2_H2O;
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'HO2'; Gstr{i,3} = 'H2O';
fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)-1; fH2O(i)=fH2O(i)-1; fHO2H(i)=fHO2H(i)+1; fH2O(i)=fH2O(i)+1;

i=i+1;
Rnames{i} = 'NO3 + HO2 = OH + NO2 + O2';
k(:,i) = 3.50e-12;
Gstr{i,1} = 'NO3'; Gstr{i,2} = 'HO2';
fNO3(i)=fNO3(i)-1; fHO2(i)=fHO2(i)-1; fOH(i)=fOH(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'NO3 + NO3 = 2*NO2 + O2';
k(:,i) = 8.50e-13.*exp(-2450.181./T);
Gstr{i,1} = 'NO3'; Gstr{i,2} = 'NO3';
fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+2; 

i=i+1;
Rnames{i} = 'HO2H + HV = 2*OH';
k(:,i) = JH2O2;
Gstr{i,1} = 'HO2H';
fHO2H(i)=fHO2H(i)-1; fOH(i)=fOH(i)+2;

i=i+1;
Rnames{i} = 'HO2H + OH = HO2 + H2O';
k(:,i) = 1.80e-12;
Gstr{i,1} = 'HO2H'; Gstr{i,2} = 'OH';
fHO2H(i)=fHO2H(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; fH2O(i)=fH2O(i)+1;

i=i+1;
Rnames{i} = 'OH + HO2 = H2O + O2';
k(:,i) = 4.80e-11.*exp(250.101./T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'HO2';
fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)-1; fH2O(i)=fH2O(i)+1;

i=i+1;
Rnames{i} = 'H2 + OH = HO2 + H2O';
k(:,i) = 2.80e-12.*exp(-1800.02./T);
Gstr{i,1} = 'H2'; Gstr{i,2} = 'OH';
fH2(i)=fH2(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; fH2O(i)=fH2O(i)+1;


i=i+1;
Rnames{i} = 'CO + OH = HO2 + CO2';
k(:,i) = k_CO_OH;
Gstr{i,1} = 'CO'; Gstr{i,2} = 'OH';
fCO(i)=fCO(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; fCO2(i)=fCO2(i)+1;

Rnames{i} = 'SumRO2 + NO = NO';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'SumRO2'; Gstr{i,2} = 'NO';
fSumRO2(i)=fSumRO2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1;

i=i+1;
Rnames{i} = 'SumRO2 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'SumRO2'; Gstr{i,2} = 'HO2';
fSumRO2(i)=fSumRO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'SumRO2 + NO3 = NO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'SumRO2'; Gstr{i,2} = 'NO3';
fSumRO2(i)=fSumRO2(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'SumRO2 + SumRO2 = ';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'SumRO2'; Gstr{i,2} = 'SumRO2';
fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)-1;

i=i+1;
Rnames{i} = 'SumRCO3 + NO2 = NO2';
k(:,i) = 7.70e-12.*(T./300).^-0.20.*exp(-0.0./T);
Gstr{i,1} = 'SumRCO3'; Gstr{i,2} = 'NO2';
fSumRCO3(i)=fSumRCO3(i)-1; fNO2(i)=fNO2(i)-1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'SumRCO3 + NO = NO';
k(:,i) = 6.70e-12.*exp(340.177./T);
Gstr{i,1} = 'SumRCO3'; Gstr{i,2} = 'NO';
fSumRCO3(i)=fSumRCO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1;

i=i+1;
Rnames{i} = 'SumRCO3 + HO2 = HO2';
k(:,i) = 3.14e-12.*exp(580.213./T);
Gstr{i,1} = 'SumRCO3'; Gstr{i,2} = 'HO2';
fSumRCO3(i)=fSumRCO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'SumRCO3 + NO3 = NO3';
k(:,i) = 4.00e-12;
Gstr{i,1} = 'SumRCO3'; Gstr{i,2} = 'NO3';
fSumRCO3(i)=fSumRCO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'SumRCO3 + SumRO2 = ';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'SumRCO3'; Gstr{i,2} = 'SumRO2';
fSumRCO3(i)=fSumRCO3(i)-1; fSumRO2(i)=fSumRO2(i)-1;

i=i+1;
Rnames{i} = 'SumRCO3 + SumRCO3 = ';
k(:,i) = 1.70e-11;
Gstr{i,1} = 'SumRCO3'; Gstr{i,2} = 'SumRCO3';
fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1;

i=i+1;
Rnames{i} = 'RO2C + NO = NO2';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'RO2C'; Gstr{i,2} = 'NO';
fRO2C(i)=fRO2C(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'RO2C + HO2 = ';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'RO2C'; Gstr{i,2} = 'HO2';
fRO2C(i)=fRO2C(i)-1; fHO2(i)=fHO2(i)-1;

i=i+1;
Rnames{i} = 'RO2C + NO3 = NO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'RO2C'; Gstr{i,2} = 'NO3';
fRO2C(i)=fRO2C(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'RO2C + SumRO2 = SumRO2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'RO2C'; Gstr{i,2} = 'SumRO2';
fRO2C(i)=fRO2C(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'RO2C + SumRCO3 = SumRCO3';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'RO2C'; Gstr{i,2} = 'SumRCO3';
fRO2C(i)=fRO2C(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'RO2XC + NO = ';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'RO2XC'; Gstr{i,2} = 'NO';
fRO2XC(i)=fRO2XC(i)-1; fNO(i)=fNO(i)-1;

i=i+1;
Rnames{i} = 'RO2XC + HO2 = ';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'RO2XC'; Gstr{i,2} = 'HO2';
fRO2XC(i)=fRO2XC(i)-1; fHO2(i)=fHO2(i)-1;

i=i+1;
Rnames{i} = 'RO2XC + NO3 = NO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'RO2XC'; Gstr{i,2} = 'NO3';
fRO2XC(i)=fRO2XC(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'RO2XC + SumRO2 = SumRO2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'RO2XC'; Gstr{i,2} = 'SumRO2';
fRO2XC(i)=fRO2XC(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'RO2XC + SumRCO3 = SumRCO3';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'RO2XC'; Gstr{i,2} = 'SumRCO3';
fRO2XC(i)=fRO2XC(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'MEO2 + NO = NO2 + HCHO + HO2';
k(:,i) = 2.80e-12.*exp(299.919./T);
Gstr{i,1} = 'MEO2'; Gstr{i,2} = 'NO';
fMEO2(i)=fMEO2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fHCHO(i)=fHCHO(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'MEO2 + HO2 = .9*MEOOH + .1*HCHO + .1*H2O + O2';
k(:,i) = 3.80e-13.*exp(779.992./T);
Gstr{i,1} = 'MEO2'; Gstr{i,2} = 'HO2';
fMEO2(i)=fMEO2(i)-1; fHO2(i)=fHO2(i)-1; fMEOOH(i)=fMEOOH(i)+.9; fHCHO(i)=fHCHO(i)+.1; fH2O(i)=fH2O(i)+.1; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'MEO2 + NO3 = HCHO + HO2 + NO2';
k(:,i) = 1.20e-12;
Gstr{i,1} = 'MEO2'; Gstr{i,2} = 'NO3';
fMEO2(i)=fMEO2(i)-1; fNO3(i)=fNO3(i)-1; fHCHO(i)=fHCHO(i)+1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'MEO2 + SumRO2 = .3*HO2 + .65*HCHO + .35*MEOH';
k(:,i) = 2.16e-13;
Gstr{i,1} = 'MEO2'; Gstr{i,2} = 'SumRO2';
fMEO2(i)=fMEO2(i)-1; fSumRO2(i)=fSumRO2(i)-1; fHO2(i)=fHO2(i)+.3; fHCHO(i)=fHCHO(i)+.65; fMEOH(i)=fMEOH(i)+.35;

i=i+1;
Rnames{i} = 'MEO2 + SumRCO3 = .9*HO2 + HCHO';
k(:,i) = 2.00e-12.*exp(500.201./T);
Gstr{i,1} = 'MEO2'; Gstr{i,2} = 'SumRCO3';
fMEO2(i)=fMEO2(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fHO2(i)=fHO2(i)+.9; fHCHO(i)=fHCHO(i)+1;

i=i+1;
Rnames{i} = 'ETO2 + NO = NO2 + HO2 + MECHO';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'ETO2'; Gstr{i,2} = 'NO';
fETO2(i)=fETO2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; fMECHO(i)=fMECHO(i)+1;

i=i+1;
Rnames{i} = 'ETO2 + HO2 = ROOH';
k(:,i) = 7.44e-12;
Gstr{i,1} = 'ETO2'; Gstr{i,2} = 'HO2';
fETO2(i)=fETO2(i)-1; fHO2(i)=fHO2(i)-1; fROOH(i)=fROOH(i)+1;

i=i+1;
Rnames{i} = 'ETO2 + NO3 = NO2 + HO2 + MECHO';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'ETO2'; Gstr{i,2} = 'NO3';
fETO2(i)=fETO2(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+1; fMECHO(i)=fMECHO(i)+1;

i=i+1;
Rnames{i} = 'ETO2 + SumRO2 = .5*HO2 + .25*ETOH + .75*MECHO';
k(:,i) = 2.90e-14;
Gstr{i,1} = 'ETO2'; Gstr{i,2} = 'SumRO2';
fETO2(i)=fETO2(i)-1; fSumRO2(i)=fSumRO2(i)-1; fHO2(i)=fHO2(i)+.5; fETOH(i)=fETOH(i)+.25; fMECHO(i)=fMECHO(i)+.75;

i=i+1;
Rnames{i} = 'ETO2 + SumRCO3 = .8*HO2 + MECHO';
k(:,i) = 1.60e-11;
Gstr{i,1} = 'ETO2'; Gstr{i,2} = 'SumRCO3';
fETO2(i)=fETO2(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fHO2(i)=fHO2(i)+.8; fMECHO(i)=fMECHO(i)+1;

i=i+1;
Rnames{i} = 'BZO2 + NO = NO2 + BZO';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'BZO2'; Gstr{i,2} = 'NO';
fBZO2(i)=fBZO2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fBZO(i)=fBZO(i)+1;

i=i+1;
Rnames{i} = 'BZO2 + HO2 = ROOH + O2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'BZO2'; Gstr{i,2} = 'HO2';
fBZO2(i)=fBZO2(i)-1; fHO2(i)=fHO2(i)-1; fROOH(i)=fROOH(i)+1; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'BZO2 + NO3 = BZO + NO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'BZO2'; Gstr{i,2} = 'NO3';
fBZO2(i)=fBZO2(i)-1; fNO3(i)=fNO3(i)-1; fBZO(i)=fBZO(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'BZO2 + SumRO2 = SumRO2 + BZO';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'BZO2'; Gstr{i,2} = 'SumRO2';
fBZO2(i)=fBZO2(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fBZO(i)=fBZO(i)+1;

i=i+1;
Rnames{i} = 'BZO2 + SumRCO3 = SumRCO3 + BZO';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'BZO2'; Gstr{i,2} = 'SumRCO3';
fBZO2(i)=fBZO2(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fBZO(i)=fBZO(i)+1;

i=i+1;
Rnames{i} = 'MECO3 + NO = NO2 + MEO2 + CO2 + SumRO2';
k(:,i) = 8.10e-12.*exp(270.229./T);
Gstr{i,1} = 'MECO3'; Gstr{i,2} = 'NO';
fMECO3(i)=fMECO3(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fMEO2(i)=fMEO2(i)+1; fCO2(i)=fCO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'MECO3 + NO2 = PAN';
k(:,i) = kf_MECO3_NO2;
Gstr{i,1} = 'MECO3'; Gstr{i,2} = 'NO2';
fMECO3(i)=fMECO3(i)-1; fNO2(i)=fNO2(i)-1; fPAN(i)=fPAN(i)+1;

i=i+1;
Rnames{i} = 'MECO3 + NO3 = NO2 + MEO2 + CO2 + SumRO2';
k(:,i) = 4.00e-12;
Gstr{i,1} = 'MECO3'; Gstr{i,2} = 'NO3';
fMECO3(i)=fMECO3(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+1; fMEO2(i)=fMEO2(i)+1; fCO2(i)=fCO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'MECO3 + HO2 = .13*O3 + .5*OH + .5*MEO2 + .13*OACID + .37*PACID + .5*CO2 + .5*SumRO2';
k(:,i) = 2.20e-11;
Gstr{i,1} = 'MECO3'; Gstr{i,2} = 'HO2';
fMECO3(i)=fMECO3(i)-1; fHO2(i)=fHO2(i)-1; fO3(i)=fO3(i)+.13; fOH(i)=fOH(i)+.5; fMEO2(i)=fMEO2(i)+.5; fOACID(i)=fOACID(i)+.13; fPACID(i)=fPACID(i)+.37; fCO2(i)=fCO2(i)+.5; fSumRO2(i)=fSumRO2(i)+.5;

i=i+1;
Rnames{i} = 'MECO3 + SumRO2 = .9*MEO2 + .1*OACID + .9*CO2 + .9*SumRO2';
k(:,i) = 1.60e-11;
Gstr{i,1} = 'MECO3'; Gstr{i,2} = 'SumRO2';
fMECO3(i)=fMECO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fMEO2(i)=fMEO2(i)+.9; fOACID(i)=fOACID(i)+.1; fCO2(i)=fCO2(i)+.9; fSumRO2(i)=fSumRO2(i)+.9;

i=i+1;
Rnames{i} = 'MECO3 + SumRCO3 = MEO2 + CO2 + SumRO2';
k(:,i) = 1.40e-11;
Gstr{i,1} = 'MECO3'; Gstr{i,2} = 'SumRCO3';
fMECO3(i)=fMECO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fMEO2(i)=fMEO2(i)+1; fCO2(i)=fCO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'BZCO3 + NO2 = PBZN';
k(:,i) = 1.11e-11;
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'NO2';
fBZCO3(i)=fBZCO3(i)-1; fNO2(i)=fNO2(i)-1; fPBZN(i)=fPBZN(i)+1;

i=i+1;
Rnames{i} = 'BZCO3 + NO = NO2 + CO2 + BZO2 + SumRO2';
k(:,i) = 1.60e-11;
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'NO';
fBZCO3(i)=fBZCO3(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fCO2(i)=fCO2(i)+1; fBZO2(i)=fBZO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'BZCO3 + HO2 = .37*ALK5 + .13*O3 + .13*ALK5 + .5*OH + .5*BZO2 + .5*CO2 + .5*SumRO2';
k(:,i) = 3.14e-12.*exp(580.213./T);
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'HO2';
fBZCO3(i)=fBZCO3(i)-1; fHO2(i)=fHO2(i)-1; fALK5(i)=fALK5(i)+.37; fO3(i)=fO3(i)+.13; fALK5(i)=fALK5(i)+.13; fOH(i)=fOH(i)+.5; fBZO2(i)=fBZO2(i)+.5; fCO2(i)=fCO2(i)+.5; fSumRO2(i)=fSumRO2(i)+.5;

i=i+1;
Rnames{i} = 'BZCO3 + NO3 = NO2 + CO2 + BZO2 + O2 + SumRO2';
k(:,i) = 4.00e-12;
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'NO3';
fBZCO3(i)=fBZCO3(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+1; fCO2(i)=fCO2(i)+1; fBZO2(i)=fBZO2(i)+1; fO2(i)=fO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'BZCO3 + SumRO2 = SumRO2 + BZO2 + CO2 + SumRO2';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'SumRO2';
fBZCO3(i)=fBZCO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fBZO2(i)=fBZO2(i)+1; fCO2(i)=fCO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'BZCO3 + SumRCO3 = SumRCO3 + CO2 + BZO2 + SumRO2';
k(:,i) = 1.70e-11;
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'SumRCO3';
fBZCO3(i)=fBZCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fCO2(i)=fCO2(i)+1; fBZO2(i)=fBZO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'TBUO + NO2 = R1NO3';
k(:,i) = 3.50e-12.*exp(553.543./T);
Gstr{i,1} = 'TBUO'; Gstr{i,2} = 'NO2';
fTBUO(i)=fTBUO(i)-1; fNO2(i)=fNO2(i)-1; fR1NO3(i)=fR1NO3(i)+1;

i=i+1;
Rnames{i} = 'TBUO = ACET + MEO2 + SumRO2';
k(:,i) = 1.40e+13.*(T./300).^0.00.*exp(-6855.878./T);
Gstr{i,1} = 'TBUO';
fTBUO(i)=fTBUO(i)-1; fACET(i)=fACET(i)+1; fMEO2(i)=fMEO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'BZO + NO2 = NPHE';
k(:,i) = 2.08e-12;
Gstr{i,1} = 'BZO'; Gstr{i,2} = 'NO2';
fBZO(i)=fBZO(i)-1; fNO2(i)=fNO2(i)-1; fNPHE(i)=fNPHE(i)+1;

i=i+1;
Rnames{i} = 'BZO + HO2 = CRES';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'BZO'; Gstr{i,2} = 'HO2';
fBZO(i)=fBZO(i)-1; fHO2(i)=fHO2(i)-1; fCRES(i)=fCRES(i)+1;

i=i+1;
Rnames{i} = 'BZO + O3 = BZO2 + O2 + SumRO2';
k(:,i) = 2.86e-13;
Gstr{i,1} = 'BZO'; Gstr{i,2} = 'O3';
fBZO(i)=fBZO(i)-1; fO3(i)=fO3(i)-1; fBZO2(i)=fBZO2(i)+1; fO2(i)=fO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'BZO + BZO = ';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'BZO'; Gstr{i,2} = 'BZO';
fBZO(i)=fBZO(i)-1; fBZO(i)=fBZO(i)-1;

i=i+1;
Rnames{i} = 'NPRAD + NO2 = NPHE';
k(:,i) = 7.70e-12.*(T./300).^-0.20.*exp(-0.0./T);
Gstr{i,1} = 'NPRAD'; Gstr{i,2} = 'NO2';
fNPRAD(i)=fNPRAD(i)-1; fNO2(i)=fNO2(i)-1; fNPHE(i)=fNPHE(i)+1;

i=i+1;
Rnames{i} = 'NPRAD + HO2 = NAPPRD';
k(:,i) = 3.14e-12.*exp(580.213./T);
Gstr{i,1} = 'NPRAD'; Gstr{i,2} = 'HO2';
fNPRAD(i)=fNPRAD(i)-1; fHO2(i)=fHO2(i)-1; fNAPPRD(i)=fNAPPRD(i)+1;

i=i+1;
Rnames{i} = 'NPRAD = NAPPRD';
k(:,i) = 1.00e-03;
Gstr{i,1} = 'NPRAD';
fNPRAD(i)=fNPRAD(i)-1; fNAPPRD(i)=fNAPPRD(i)+1;

i=i+1;
Rnames{i} = 'PNAMIN + NO2 = NAMIN';
k(:,i) = 7.70e-12.*(T./300).^-0.20.*exp(-0.0./T);
Gstr{i,1} = 'PNAMIN'; Gstr{i,2} = 'NO2';
fPNAMIN(i)=fPNAMIN(i)-1; fNO2(i)=fNO2(i)-1; fNAMIN(i)=fNAMIN(i)+1;

i=i+1;
Rnames{i} = 'PNAMIN + HO2 = AMINS';
k(:,i) = 3.14e-12.*exp(580.213./T);
Gstr{i,1} = 'PNAMIN'; Gstr{i,2} = 'HO2';
fPNAMIN(i)=fPNAMIN(i)-1; fHO2(i)=fHO2(i)-1; fAMINS(i)=fAMINS(i)+1;

i=i+1;
Rnames{i} = 'PNAMIN = AMINS';
k(:,i) = 1.00e-03;
Gstr{i,1} = 'PNAMIN';
fPNAMIN(i)=fPNAMIN(i)-1; fAMINS(i)=fAMINS(i)+1;

i=i+1;
Rnames{i} = 'HCHO2 + NO2 = HCHO + NO3';
k(:,i) = 7.00e-12;
Gstr{i,1} = 'HCHO2'; Gstr{i,2} = 'NO2';
fHCHO2(i)=fHCHO2(i)-1; fNO2(i)=fNO2(i)-1; fHCHO(i)=fHCHO(i)+1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'HCHO2 + H2O = HCOOH';
k(:,i) = 2.40e-15;
Gstr{i,1} = 'HCHO2'; Gstr{i,2} = 'H2O';
fHCHO2(i)=fHCHO2(i)-1; fH2O(i)=fH2O(i)-1; fHCOOH(i)=fHCOOH(i)+1;

i=i+1;
Rnames{i} = 'MECHO2 + NO2 = MECHO + NO3';
k(:,i) = 7.00e-12;
Gstr{i,1} = 'MECHO2'; Gstr{i,2} = 'NO2';
fMECHO2(i)=fMECHO2(i)-1; fNO2(i)=fNO2(i)-1; fMECHO(i)=fMECHO(i)+1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'MECHO2 + H2O = OACID';
k(:,i) = 2.40e-15;
Gstr{i,1} = 'MECHO2'; Gstr{i,2} = 'H2O';
fMECHO2(i)=fMECHO2(i)-1; fH2O(i)=fH2O(i)-1; fOACID(i)=fOACID(i)+1;

i=i+1;
Rnames{i} = 'RCHO2 + NO2 = RCHO + NO3';
k(:,i) = 7.00e-12;
Gstr{i,1} = 'RCHO2'; Gstr{i,2} = 'NO2';
fRCHO2(i)=fRCHO2(i)-1; fNO2(i)=fNO2(i)-1; fRCHO(i)=fRCHO(i)+1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'RCHO2 + H2O = OACID';
k(:,i) = 2.40e-15;
Gstr{i,1} = 'RCHO2'; Gstr{i,2} = 'H2O';
fRCHO2(i)=fRCHO2(i)-1; fH2O(i)=fH2O(i)-1; fOACID(i)=fOACID(i)+1;

i=i+1;
Rnames{i} = 'SO2 + OH = HO2 + SULF';
k(:,i) = kf_SO2_OH;
Gstr{i,1} = 'SO2'; Gstr{i,2} = 'OH';
fSO2(i)=fSO2(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; fSULF(i)=fSULF(i)+1;

i=i+1;
Rnames{i} = 'HCHO2 + SO2 = SULF + HCHO';
k(:,i) = 3.80e-11;
Gstr{i,1} = 'HCHO2'; Gstr{i,2} = 'SO2';
fHCHO2(i)=fHCHO2(i)-1; fSO2(i)=fSO2(i)-1; fSULF(i)=fSULF(i)+1; fHCHO(i)=fHCHO(i)+1;

i=i+1;
Rnames{i} = 'MECHO2 + SO2 = SULF + MECHO';
k(:,i) = 3.80e-11;
Gstr{i,1} = 'MECHO2'; Gstr{i,2} = 'SO2';
fMECHO2(i)=fMECHO2(i)-1; fSO2(i)=fSO2(i)-1; fSULF(i)=fSULF(i)+1; fMECHO(i)=fMECHO(i)+1;

i=i+1;
Rnames{i} = 'RCHO2 + SO2 = SULF + RCHO';
k(:,i) = 3.80e-11;
Gstr{i,1} = 'RCHO2'; Gstr{i,2} = 'SO2';
fRCHO2(i)=fRCHO2(i)-1; fSO2(i)=fSO2(i)-1; fSULF(i)=fSULF(i)+1; fRCHO(i)=fRCHO(i)+1;

i=i+1;
Rnames{i} = 'CH4 + OH = MEO2 + SumRO2';
k(:,i) = 2.45e-12.*exp(-1774.859./T);
Gstr{i,1} = 'CH4'; Gstr{i,2} = 'OH';
fCH4(i)=fCH4(i)-1; fOH(i)=fOH(i)-1; fMEO2(i)=fMEO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'HCHO + HV = 2*HO2 + CO';
k(:,i) = JHCHOR_13;
Gstr{i,1} = 'HCHO';
fHCHO(i)=fHCHO(i)-1; fHO2(i)=fHO2(i)+2; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'HCHO + HV = H2 + CO';
k(:,i) = JHCHOM_13;
Gstr{i,1} = 'HCHO';
fHCHO(i)=fHCHO(i)-1; fH2(i)=fH2(i)+1; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'HCHO + OH = HO2 + CO + H2O';
k(:,i) = 5.50e-12.*exp(124.799./T);
Gstr{i,1} = 'HCHO'; Gstr{i,2} = 'OH';
fHCHO(i)=fHCHO(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; fH2O(i)=fH2O(i)+1;

i=i+1;
Rnames{i} = 'HCHO + NO3 = HNO3 + HO2 + CO';
k(:,i) = 5.80e-16;
Gstr{i,1} = 'HCHO'; Gstr{i,2} = 'NO3';
fHCHO(i)=fHCHO(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'PAN = NO2 + MECO3 + SumRCO3';
k(:,i) = kf_PAN;
Gstr{i,1} = 'PAN';
fPAN(i)=fPAN(i)-1; fNO2(i)=fNO2(i)+1; fMECO3(i)=fMECO3(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'PAN + HV = .6*NO2 + .4*NO3 + .4*MEO2 + .6*MECO3 + .4*CO2 + .4*SumRO2 + .6*SumRCO3';
k(:,i) = JPAN_11;
Gstr{i,1} = 'PAN';
fPAN(i)=fPAN(i)-1; fNO2(i)=fNO2(i)+.6; fNO3(i)=fNO3(i)+.4; fMEO2(i)=fMEO2(i)+.4; fMECO3(i)=fMECO3(i)+.6; fCO2(i)=fCO2(i)+.4; fSumRO2(i)=fSumRO2(i)+.4; fSumRCO3(i)=fSumRCO3(i)+.6;

i=i+1;
Rnames{i} = 'GLY + HV = 2*CO + 2*HO2';
k(:,i) = JGLY_I13R;
Gstr{i,1} = 'GLY';
fGLY(i)=fGLY(i)-1; fCO(i)=fCO(i)+2; fHO2(i)=fHO2(i)+2;

i=i+1;
Rnames{i} = 'GLY + HV = HCHO + CO';
k(:,i) = JGLY_I13M;
Gstr{i,1} = 'GLY';
fGLY(i)=fGLY(i)-1; fHCHO(i)=fHCHO(i)+1; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'GLY + OH = 1.7*CO + .7*HO2 + .3*OH + .3*CO2';
k(:,i) = 1.15e-11.*exp(-0.0./T);
Gstr{i,1} = 'GLY'; Gstr{i,2} = 'OH';
fGLY(i)=fGLY(i)-1; fOH(i)=fOH(i)-1; fCO(i)=fCO(i)+1.7; fHO2(i)=fHO2(i)+.7; fOH(i)=fOH(i)+.3; fCO2(i)=fCO2(i)+.3;

i=i+1;
Rnames{i} = 'GLY + NO3 = HNO3 + 1.7*CO + .7*HO2 + .3*OH + .3*CO2';
k(:,i) = 4.00e-16;
Gstr{i,1} = 'GLY'; Gstr{i,2} = 'NO3';
fGLY(i)=fGLY(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fCO(i)=fCO(i)+1.7; fHO2(i)=fHO2(i)+.7; fOH(i)=fOH(i)+.3; fCO2(i)=fCO2(i)+.3;

i=i+1;
Rnames{i} = 'BALD + OH = BZCO3 + SumRCO3';
k(:,i) = 1.20e-11;
Gstr{i,1} = 'BALD'; Gstr{i,2} = 'OH';
fBALD(i)=fBALD(i)-1; fOH(i)=fOH(i)-1; fBZCO3(i)=fBZCO3(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'BALD + HV = ';
k(:,i) = JBALD_11.*9.00e-2;
Gstr{i,1} = 'BALD';
fBALD(i)=fBALD(i)-1;

i=i+1;
Rnames{i} = 'BALD + NO3 = HNO3 + BZCO3 + SumRCO3';
k(:,i) = 4.00e-15;
Gstr{i,1} = 'BALD'; Gstr{i,2} = 'NO3';
fBALD(i)=fBALD(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fBZCO3(i)=fBZCO3(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'PBZN = BZCO3 + NO2 + SumRCO3';
k(:,i) = 2.10e+16.*(T./300).^0.00.*exp(-13600.04./T);
Gstr{i,1} = 'PBZN';
fPBZN(i)=fPBZN(i)-1; fBZCO3(i)=fBZCO3(i)+1; fNO2(i)=fNO2(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'PBZN + HV = .6*BZCO3 + .6*NO2 + .4*CO2 + .4*BZO2 + .4*NO3 + .4*SumRO2 + .6*SumRCO3';
k(:,i) = JPPN_11;
Gstr{i,1} = 'PBZN';
fPBZN(i)=fPBZN(i)-1; fBZCO3(i)=fBZCO3(i)+.6; fNO2(i)=fNO2(i)+.6; fCO2(i)=fCO2(i)+.4; fBZO2(i)=fBZO2(i)+.4; fNO3(i)=fNO3(i)+.4; fSumRO2(i)=fSumRO2(i)+.4; fSumRCO3(i)=fSumRCO3(i)+.6;

i=i+1;
Rnames{i} = 'NPHE + OH = BZO + NO2';
k(:,i) = 3.50e-12;
Gstr{i,1} = 'NPHE'; Gstr{i,2} = 'OH';
fNPHE(i)=fNPHE(i)-1; fOH(i)=fOH(i)-1; fBZO(i)=fBZO(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'NPHE + HV = HONO + PHEN';
k(:,i) = JNO2_06.*1.50e-3;
Gstr{i,1} = 'NPHE';
fNPHE(i)=fNPHE(i)-1; fHONO(i)=fHONO(i)+1; fPHEN(i)=fPHEN(i)+1;

i=i+1;
Rnames{i} = 'NAPS + OH = .741*HO2 + .707*CATL + .034*RO2C + .017*AFG2A + .017*AFG2B + .034*GLY + .330*NPRAD + .250*MACO3 + .034*SumRO2 + .250*SumRCO3';
k(:,i) = 1.55e-11.*exp(117.25./T);
Gstr{i,1} = 'NAPS'; Gstr{i,2} = 'OH';
fNAPS(i)=fNAPS(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.741; fCATL(i)=fCATL(i)+.707; fRO2C(i)=fRO2C(i)+.034; fAFG2A(i)=fAFG2A(i)+.017; fAFG2B(i)=fAFG2B(i)+.017; fGLY(i)=fGLY(i)+.034; fNPRAD(i)=fNPRAD(i)+.330; fMACO3(i)=fMACO3(i)+.250; fSumRO2(i)=fSumRO2(i)+.034; fSumRCO3(i)=fSumRCO3(i)+.250;

i=i+1;
Rnames{i} = 'CATL3 + OH = HO2 + OTHN';
k(:,i) = 5.97e-10;
Gstr{i,1} = 'CATL3'; Gstr{i,2} = 'OH';
fCATL3(i)=fCATL3(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; fOTHN(i)=fOTHN(i)+1;

i=i+1;
Rnames{i} = 'CATL3 + NO3 = HNO3 + OTHN';
k(:,i) = 4.86e-10;
Gstr{i,1} = 'CATL3'; Gstr{i,2} = 'NO3';
fCATL3(i)=fCATL3(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fOTHN(i)=fOTHN(i)+1;

i=i+1;
Rnames{i} = 'NAPPRD + OH = HO2 + OTHN';
k(:,i) = 2.00e-10;
Gstr{i,1} = 'NAPPRD'; Gstr{i,2} = 'OH';
fNAPPRD(i)=fNAPPRD(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; fOTHN(i)=fOTHN(i)+1;

i=i+1;
Rnames{i} = 'NAPPRD + NO3 = HNO3 + OTHN';
k(:,i) = 1.70e-10;
Gstr{i,1} = 'NAPPRD'; Gstr{i,2} = 'NO3';
fNAPPRD(i)=fNAPPRD(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fOTHN(i)=fOTHN(i)+1;

i=i+1;
Rnames{i} = 'PHOT + HV = 2*HO2 + 2*RO2C + 2*SumRO2 + ALK3';
k(:,i) = JBACL_11;
Gstr{i,1} = 'PHOT';
fPHOT(i)=fPHOT(i)-1; fHO2(i)=fHO2(i)+2; fRO2C(i)=fRO2C(i)+2; fSumRO2(i)=fSumRO2(i)+2; fALK3(i)=fALK3(i)+1;

i=i+1;
Rnames{i} = 'IMINE = MECHO';
k(:,i) = 2.78e-04;
Gstr{i,1} = 'IMINE';
fIMINE(i)=fIMINE(i)-1; fMECHO(i)=fMECHO(i)+1;

i=i+1;
Rnames{i} = 'CLETHE + OH = xHO2 + RO2C + xHCHO + yROOH + SumRO2';
k(:,i) = 2.54e-12.*exp(325.081./T);
Gstr{i,1} = 'CLETHE'; Gstr{i,2} = 'OH';
fCLETHE(i)=fCLETHE(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+1; fRO2C(i)=fRO2C(i)+1; fxHCHO(i)=fxHCHO(i)+1; fyROOH(i)=fyROOH(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'ACRLNT + OH = xHO2 + RO2C + xHCHO + yROOH + SumRO2';
k(:,i) = 4.13e-12;
Gstr{i,1} = 'ACRLNT'; Gstr{i,2} = 'OH';
fACRLNT(i)=fACRLNT(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+1; fRO2C(i)=fRO2C(i)+1; fxHCHO(i)=fxHCHO(i)+1; fyROOH(i)=fyROOH(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'PCE + OH = xHO2 + RO2C + yROOH + SumRO2';
k(:,i) = 3.50e-12.*exp(-919.887./T);
Gstr{i,1} = 'PCE'; Gstr{i,2} = 'OH';
fPCE(i)=fPCE(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+1; fRO2C(i)=fRO2C(i)+1; fyROOH(i)=fyROOH(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'PCLBEN + OH = xHO2 + RO2C + yROOH + SumRO2';
k(:,i) = 4.03e-13;
Gstr{i,1} = 'PCLBEN'; Gstr{i,2} = 'OH';
fPCLBEN(i)=fPCLBEN(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+1; fRO2C(i)=fRO2C(i)+1; fyROOH(i)=fyROOH(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'MECL2 + OH = xHO2 + RO2C + yROOH + SumRO2';
k(:,i) = 1.80e-12.*exp(-860.004./T);
Gstr{i,1} = 'MECL2'; Gstr{i,2} = 'OH';
fMECL2(i)=fMECL2(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+1; fRO2C(i)=fRO2C(i)+1; fyROOH(i)=fyROOH(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'ETBR2 + OH = xHO2 + RO2C + yROOH + SumRO2';
k(:,i) = 7.69e-12.*exp(-1055.757./T);
Gstr{i,1} = 'ETBR2'; Gstr{i,2} = 'OH';
fETBR2(i)=fETBR2(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+1; fRO2C(i)=fRO2C(i)+1; fyROOH(i)=fyROOH(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'ETCL2 + OH = xHO2 + RO2C + yROOH + SumRO2';
k(:,i) = 8.69e-12.*exp(-1069.847./T);
Gstr{i,1} = 'ETCL2'; Gstr{i,2} = 'OH';
fETCL2(i)=fETCL2(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+1; fRO2C(i)=fRO2C(i)+1; fyROOH(i)=fyROOH(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'ETOX + OH = xHO2 + RO2C + yROOH + SumRO2';
k(:,i) = 1.63e-12.*exp(-855.978./T);
Gstr{i,1} = 'ETOX'; Gstr{i,2} = 'OH';
fETOX(i)=fETOX(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+1; fRO2C(i)=fRO2C(i)+1; fyROOH(i)=fyROOH(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'CHCL3 + OH = xHO2 + RO2C + yROOH + SumRO2';
k(:,i) = 1.80e-12.*exp(-849.94./T);
Gstr{i,1} = 'CHCL3'; Gstr{i,2} = 'OH';
fCHCL3(i)=fCHCL3(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+1; fRO2C(i)=fRO2C(i)+1; fyROOH(i)=fyROOH(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'xHO2 + NO = NO + HO2';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xHO2'; Gstr{i,2} = 'NO';
fxHO2(i)=fxHO2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xHO2 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xHO2'; Gstr{i,2} = 'HO2';
fxHO2(i)=fxHO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xHO2 + NO3 = NO3 + HO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xHO2'; Gstr{i,2} = 'NO3';
fxHO2(i)=fxHO2(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xHO2 + SumRO2 = SumRO2 + .5*HO2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xHO2'; Gstr{i,2} = 'SumRO2';
fxHO2(i)=fxHO2(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fHO2(i)=fHO2(i)+.5;

i=i+1;
Rnames{i} = 'xHO2 + SumRCO3 = SumRCO3 + HO2';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xHO2'; Gstr{i,2} = 'SumRCO3';
fxHO2(i)=fxHO2(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xOH + NO = NO + OH';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xOH'; Gstr{i,2} = 'NO';
fxOH(i)=fxOH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'xOH + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xOH'; Gstr{i,2} = 'HO2';
fxOH(i)=fxOH(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xOH + NO3 = NO3 + OH';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xOH'; Gstr{i,2} = 'NO3';
fxOH(i)=fxOH(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'xOH + SumRO2 = SumRO2 + .5*OH';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xOH'; Gstr{i,2} = 'SumRO2';
fxOH(i)=fxOH(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fOH(i)=fOH(i)+.5;

i=i+1;
Rnames{i} = 'xOH + SumRCO3 = SumRCO3 + OH';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xOH'; Gstr{i,2} = 'SumRCO3';
fxOH(i)=fxOH(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'xNO2 + NO = NO + NO2';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xNO2'; Gstr{i,2} = 'NO';
fxNO2(i)=fxNO2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'xNO2 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xNO2'; Gstr{i,2} = 'HO2';
fxNO2(i)=fxNO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xNO2 + NO3 = NO3 + NO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xNO2'; Gstr{i,2} = 'NO3';
fxNO2(i)=fxNO2(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'xNO2 + SumRO2 = SumRO2 + .5*NO2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xNO2'; Gstr{i,2} = 'SumRO2';
fxNO2(i)=fxNO2(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fNO2(i)=fNO2(i)+.5;

i=i+1;
Rnames{i} = 'xNO2 + SumRCO3 = SumRCO3 + NO2';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xNO2'; Gstr{i,2} = 'SumRCO3';
fxNO2(i)=fxNO2(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'xNO3 + NO = NO + NO3';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xNO3'; Gstr{i,2} = 'NO';
fxNO3(i)=fxNO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'xNO3 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xNO3'; Gstr{i,2} = 'HO2';
fxNO3(i)=fxNO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xNO3 + NO3 = NO3 + NO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xNO3'; Gstr{i,2} = 'NO3';
fxNO3(i)=fxNO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'xNO3 + SumRO2 = SumRO2 + .5*NO3';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xNO3'; Gstr{i,2} = 'SumRO2';
fxNO3(i)=fxNO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fNO3(i)=fNO3(i)+.5;

i=i+1;
Rnames{i} = 'xNO3 + SumRCO3 = SumRCO3 + NO3';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xNO3'; Gstr{i,2} = 'SumRCO3';
fxNO3(i)=fxNO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'xHCHO + NO = NO + HCHO';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xHCHO'; Gstr{i,2} = 'NO';
fxHCHO(i)=fxHCHO(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fHCHO(i)=fHCHO(i)+1;

i=i+1;
Rnames{i} = 'xHCHO + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xHCHO'; Gstr{i,2} = 'HO2';
fxHCHO(i)=fxHCHO(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xHCHO + NO3 = NO3 + HCHO';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xHCHO'; Gstr{i,2} = 'NO3';
fxHCHO(i)=fxHCHO(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fHCHO(i)=fHCHO(i)+1;

i=i+1;
Rnames{i} = 'xHCHO + SumRO2 = SumRO2 + .5*HCHO';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xHCHO'; Gstr{i,2} = 'SumRO2';
fxHCHO(i)=fxHCHO(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fHCHO(i)=fHCHO(i)+.5;

i=i+1;
Rnames{i} = 'xHCHO + SumRCO3 = SumRCO3 + HCHO';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xHCHO'; Gstr{i,2} = 'SumRCO3';
fxHCHO(i)=fxHCHO(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fHCHO(i)=fHCHO(i)+1;

i=i+1;
Rnames{i} = 'xGLY + NO = NO + GLY';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xGLY'; Gstr{i,2} = 'NO';
fxGLY(i)=fxGLY(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fGLY(i)=fGLY(i)+1;

i=i+1;
Rnames{i} = 'xGLY + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xGLY'; Gstr{i,2} = 'HO2';
fxGLY(i)=fxGLY(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xGLY + NO3 = NO3 + GLY';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xGLY'; Gstr{i,2} = 'NO3';
fxGLY(i)=fxGLY(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fGLY(i)=fGLY(i)+1;

i=i+1;
Rnames{i} = 'xGLY + SumRO2 = SumRO2 + .5*GLY';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xGLY'; Gstr{i,2} = 'SumRO2';
fxGLY(i)=fxGLY(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fGLY(i)=fGLY(i)+.5;

i=i+1;
Rnames{i} = 'xGLY + SumRCO3 = SumRCO3 + GLY';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xGLY'; Gstr{i,2} = 'SumRCO3';
fxGLY(i)=fxGLY(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fGLY(i)=fGLY(i)+1;

i=i+1;
Rnames{i} = 'xHCOOH + NO = NO + HCOOH';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xHCOOH'; Gstr{i,2} = 'NO';
fxHCOOH(i)=fxHCOOH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fHCOOH(i)=fHCOOH(i)+1;

i=i+1;
Rnames{i} = 'xHCOOH + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xHCOOH'; Gstr{i,2} = 'HO2';
fxHCOOH(i)=fxHCOOH(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xHCOOH + NO3 = NO3 + HCOOH';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xHCOOH'; Gstr{i,2} = 'NO3';
fxHCOOH(i)=fxHCOOH(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fHCOOH(i)=fHCOOH(i)+1;

i=i+1;
Rnames{i} = 'xHCOOH + SumRO2 = SumRO2 + .5*HCOOH';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xHCOOH'; Gstr{i,2} = 'SumRO2';
fxHCOOH(i)=fxHCOOH(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fHCOOH(i)=fHCOOH(i)+.5;

i=i+1;
Rnames{i} = 'xHCOOH + SumRCO3 = SumRCO3 + HCOOH';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xHCOOH'; Gstr{i,2} = 'SumRCO3';
fxHCOOH(i)=fxHCOOH(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fHCOOH(i)=fHCOOH(i)+1;

i=i+1;
Rnames{i} = 'xMECHO + NO = NO + MECHO';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xMECHO'; Gstr{i,2} = 'NO';
fxMECHO(i)=fxMECHO(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fMECHO(i)=fMECHO(i)+1;

i=i+1;
Rnames{i} = 'xMECHO + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xMECHO'; Gstr{i,2} = 'HO2';
fxMECHO(i)=fxMECHO(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xMECHO + NO3 = NO3 + MECHO';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xMECHO'; Gstr{i,2} = 'NO3';
fxMECHO(i)=fxMECHO(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fMECHO(i)=fMECHO(i)+1;

i=i+1;
Rnames{i} = 'xMECHO + SumRO2 = SumRO2 + .5*MECHO';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xMECHO'; Gstr{i,2} = 'SumRO2';
fxMECHO(i)=fxMECHO(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fMECHO(i)=fMECHO(i)+.5;

i=i+1;
Rnames{i} = 'xMECHO + SumRCO3 = SumRCO3 + MECHO';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xMECHO'; Gstr{i,2} = 'SumRCO3';
fxMECHO(i)=fxMECHO(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fMECHO(i)=fMECHO(i)+1;

i=i+1;
Rnames{i} = 'xETCHO + NO = NO + ETCHO';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xETCHO'; Gstr{i,2} = 'NO';
fxETCHO(i)=fxETCHO(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fETCHO(i)=fETCHO(i)+1;

i=i+1;
Rnames{i} = 'xETCHO + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xETCHO'; Gstr{i,2} = 'HO2';
fxETCHO(i)=fxETCHO(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xETCHO + NO3 = NO3 + ETCHO';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xETCHO'; Gstr{i,2} = 'NO3';
fxETCHO(i)=fxETCHO(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fETCHO(i)=fETCHO(i)+1;

i=i+1;
Rnames{i} = 'xETCHO + SumRO2 = SumRO2 + .5*ETCHO';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xETCHO'; Gstr{i,2} = 'SumRO2';
fxETCHO(i)=fxETCHO(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fETCHO(i)=fETCHO(i)+.5;

i=i+1;
Rnames{i} = 'xETCHO + SumRCO3 = SumRCO3 + ETCHO';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xETCHO'; Gstr{i,2} = 'SumRCO3';
fxETCHO(i)=fxETCHO(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fETCHO(i)=fETCHO(i)+1;

i=i+1;
Rnames{i} = 'xGLCHO + NO = NO + GLCHO';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xGLCHO'; Gstr{i,2} = 'NO';
fxGLCHO(i)=fxGLCHO(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fGLCHO(i)=fGLCHO(i)+1;

i=i+1;
Rnames{i} = 'xGLCHO + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xGLCHO'; Gstr{i,2} = 'HO2';
fxGLCHO(i)=fxGLCHO(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xGLCHO + NO3 = NO3 + GLCHO';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xGLCHO'; Gstr{i,2} = 'NO3';
fxGLCHO(i)=fxGLCHO(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fGLCHO(i)=fGLCHO(i)+1;

i=i+1;
Rnames{i} = 'xGLCHO + SumRO2 = SumRO2 + .5*GLCHO';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xGLCHO'; Gstr{i,2} = 'SumRO2';
fxGLCHO(i)=fxGLCHO(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fGLCHO(i)=fGLCHO(i)+.5;

i=i+1;
Rnames{i} = 'xGLCHO + SumRCO3 = SumRCO3 + GLCHO';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xGLCHO'; Gstr{i,2} = 'SumRCO3';
fxGLCHO(i)=fxGLCHO(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fGLCHO(i)=fGLCHO(i)+1;

i=i+1;
Rnames{i} = 'xMEK + NO = NO + MEK';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xMEK'; Gstr{i,2} = 'NO';
fxMEK(i)=fxMEK(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fMEK(i)=fMEK(i)+1;

i=i+1;
Rnames{i} = 'xMEK + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xMEK'; Gstr{i,2} = 'HO2';
fxMEK(i)=fxMEK(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xMEK + NO3 = NO3 + MEK';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xMEK'; Gstr{i,2} = 'NO3';
fxMEK(i)=fxMEK(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fMEK(i)=fMEK(i)+1;

i=i+1;
Rnames{i} = 'xMEK + SumRO2 = SumRO2 + .5*MEK';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xMEK'; Gstr{i,2} = 'SumRO2';
fxMEK(i)=fxMEK(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fMEK(i)=fMEK(i)+.5;

i=i+1;
Rnames{i} = 'xMEK + SumRCO3 = SumRCO3 + MEK';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xMEK'; Gstr{i,2} = 'SumRCO3';
fxMEK(i)=fxMEK(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fMEK(i)=fMEK(i)+1;

i=i+1;
Rnames{i} = 'xACRO + NO = NO + ACRO';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xACRO'; Gstr{i,2} = 'NO';
fxACRO(i)=fxACRO(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fACRO(i)=fACRO(i)+1;

i=i+1;
Rnames{i} = 'xACRO + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xACRO'; Gstr{i,2} = 'HO2';
fxACRO(i)=fxACRO(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xACRO + NO3 = NO3 + ACRO';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xACRO'; Gstr{i,2} = 'NO3';
fxACRO(i)=fxACRO(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fACRO(i)=fACRO(i)+1;

i=i+1;
Rnames{i} = 'xACRO + SumRO2 = SumRO2 + .5*ACRO';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xACRO'; Gstr{i,2} = 'SumRO2';
fxACRO(i)=fxACRO(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fACRO(i)=fACRO(i)+.5;

i=i+1;
Rnames{i} = 'xACRO + SumRCO3 = SumRCO3 + ACRO';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xACRO'; Gstr{i,2} = 'SumRCO3';
fxACRO(i)=fxACRO(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fACRO(i)=fACRO(i)+1;

i=i+1;
Rnames{i} = 'xACET + NO = NO + ACET';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xACET'; Gstr{i,2} = 'NO';
fxACET(i)=fxACET(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fACET(i)=fACET(i)+1;

i=i+1;
Rnames{i} = 'xACET + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xACET'; Gstr{i,2} = 'HO2';
fxACET(i)=fxACET(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xACET + NO3 = NO3 + ACET';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xACET'; Gstr{i,2} = 'NO3';
fxACET(i)=fxACET(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fACET(i)=fACET(i)+1;

i=i+1;
Rnames{i} = 'xACET + SumRO2 = SumRO2 + .5*ACET';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xACET'; Gstr{i,2} = 'SumRO2';
fxACET(i)=fxACET(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fACET(i)=fACET(i)+.5;

i=i+1;
Rnames{i} = 'xACET + SumRCO3 = SumRCO3 + ACET';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xACET'; Gstr{i,2} = 'SumRCO3';
fxACET(i)=fxACET(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fACET(i)=fACET(i)+1;

i=i+1;
Rnames{i} = 'xMACR + NO = NO + MACR';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xMACR'; Gstr{i,2} = 'NO';
fxMACR(i)=fxMACR(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fMACR(i)=fMACR(i)+1;

i=i+1;
Rnames{i} = 'xMACR + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xMACR'; Gstr{i,2} = 'HO2';
fxMACR(i)=fxMACR(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xMACR + NO3 = NO3 + MACR';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xMACR'; Gstr{i,2} = 'NO3';
fxMACR(i)=fxMACR(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fMACR(i)=fMACR(i)+1;

i=i+1;
Rnames{i} = 'xMACR + SumRO2 = SumRO2 + .5*MACR';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xMACR'; Gstr{i,2} = 'SumRO2';
fxMACR(i)=fxMACR(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fMACR(i)=fMACR(i)+.5;

i=i+1;
Rnames{i} = 'xMACR + SumRCO3 = SumRCO3 + MACR';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xMACR'; Gstr{i,2} = 'SumRCO3';
fxMACR(i)=fxMACR(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fMACR(i)=fMACR(i)+1;

i=i+1;
Rnames{i} = 'xMVK + NO = NO + MVK';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xMVK'; Gstr{i,2} = 'NO';
fxMVK(i)=fxMVK(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fMVK(i)=fMVK(i)+1;

i=i+1;
Rnames{i} = 'xMVK + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xMVK'; Gstr{i,2} = 'HO2';
fxMVK(i)=fxMVK(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xMVK + NO3 = NO3 + MVK';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xMVK'; Gstr{i,2} = 'NO3';
fxMVK(i)=fxMVK(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fMVK(i)=fMVK(i)+1;

i=i+1;
Rnames{i} = 'xMVK + SumRO2 = SumRO2 + .5*MVK';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xMVK'; Gstr{i,2} = 'SumRO2';
fxMVK(i)=fxMVK(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fMVK(i)=fMVK(i)+.5;

i=i+1;
Rnames{i} = 'xMVK + SumRCO3 = SumRCO3 + MVK';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xMVK'; Gstr{i,2} = 'SumRCO3';
fxMVK(i)=fxMVK(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fMVK(i)=fMVK(i)+1;

i=i+1;
Rnames{i} = 'xBACL + NO = NO + BACL';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xBACL'; Gstr{i,2} = 'NO';
fxBACL(i)=fxBACL(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fBACL(i)=fBACL(i)+1;

i=i+1;
Rnames{i} = 'xBACL + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xBACL'; Gstr{i,2} = 'HO2';
fxBACL(i)=fxBACL(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xBACL + NO3 = NO3 + BACL';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xBACL'; Gstr{i,2} = 'NO3';
fxBACL(i)=fxBACL(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fBACL(i)=fBACL(i)+1;

i=i+1;
Rnames{i} = 'xBACL + SumRO2 = SumRO2 + .5*BACL';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xBACL'; Gstr{i,2} = 'SumRO2';
fxBACL(i)=fxBACL(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fBACL(i)=fBACL(i)+.5;

i=i+1;
Rnames{i} = 'xBACL + SumRCO3 = SumRCO3 + BACL';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xBACL'; Gstr{i,2} = 'SumRCO3';
fxBACL(i)=fxBACL(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fBACL(i)=fBACL(i)+1;

i=i+1;
Rnames{i} = 'xMGLY + NO = NO + MGLY';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xMGLY'; Gstr{i,2} = 'NO';
fxMGLY(i)=fxMGLY(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fMGLY(i)=fMGLY(i)+1;

i=i+1;
Rnames{i} = 'xMGLY + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xMGLY'; Gstr{i,2} = 'HO2';
fxMGLY(i)=fxMGLY(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xMGLY + NO3 = NO3 + MGLY';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xMGLY'; Gstr{i,2} = 'NO3';
fxMGLY(i)=fxMGLY(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fMGLY(i)=fMGLY(i)+1;

i=i+1;
Rnames{i} = 'xMGLY + SumRO2 = SumRO2 + .5*MGLY';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xMGLY'; Gstr{i,2} = 'SumRO2';
fxMGLY(i)=fxMGLY(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fMGLY(i)=fMGLY(i)+.5;

i=i+1;
Rnames{i} = 'xMGLY + SumRCO3 = SumRCO3 + MGLY';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xMGLY'; Gstr{i,2} = 'SumRCO3';
fxMGLY(i)=fxMGLY(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fMGLY(i)=fMGLY(i)+1;

i=i+1;
Rnames{i} = 'xBUDAL + NO = NO + BUDAL';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xBUDAL'; Gstr{i,2} = 'NO';
fxBUDAL(i)=fxBUDAL(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fBUDAL(i)=fBUDAL(i)+1;

i=i+1;
Rnames{i} = 'xBUDAL + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xBUDAL'; Gstr{i,2} = 'HO2';
fxBUDAL(i)=fxBUDAL(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xBUDAL + NO3 = NO3 + BUDAL';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xBUDAL'; Gstr{i,2} = 'NO3';
fxBUDAL(i)=fxBUDAL(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fBUDAL(i)=fBUDAL(i)+1;

i=i+1;
Rnames{i} = 'xBUDAL + SumRO2 = SumRO2 + .5*BUDAL';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xBUDAL'; Gstr{i,2} = 'SumRO2';
fxBUDAL(i)=fxBUDAL(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fBUDAL(i)=fBUDAL(i)+.5;

i=i+1;
Rnames{i} = 'xBUDAL + SumRCO3 = SumRCO3 + BUDAL';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xBUDAL'; Gstr{i,2} = 'SumRCO3';
fxBUDAL(i)=fxBUDAL(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fBUDAL(i)=fBUDAL(i)+1;

i=i+1;
Rnames{i} = 'xFURNS + NO = NO + FURNS';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xFURNS'; Gstr{i,2} = 'NO';
fxFURNS(i)=fxFURNS(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fFURNS(i)=fFURNS(i)+1;

i=i+1;
Rnames{i} = 'xFURNS + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xFURNS'; Gstr{i,2} = 'HO2';
fxFURNS(i)=fxFURNS(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xFURNS + NO3 = NO3 + FURNS';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xFURNS'; Gstr{i,2} = 'NO3';
fxFURNS(i)=fxFURNS(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fFURNS(i)=fFURNS(i)+1;

i=i+1;
Rnames{i} = 'xFURNS + SumRO2 = SumRO2 + .5*FURNS';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xFURNS'; Gstr{i,2} = 'SumRO2';
fxFURNS(i)=fxFURNS(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fFURNS(i)=fFURNS(i)+.5;

i=i+1;
Rnames{i} = 'xFURNS + SumRCO3 = SumRCO3 + FURNS';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xFURNS'; Gstr{i,2} = 'SumRCO3';
fxFURNS(i)=fxFURNS(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fFURNS(i)=fFURNS(i)+1;

i=i+1;
Rnames{i} = 'xBALD + NO = NO + BALD';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xBALD'; Gstr{i,2} = 'NO';
fxBALD(i)=fxBALD(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fBALD(i)=fBALD(i)+1;

i=i+1;
Rnames{i} = 'xBALD + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xBALD'; Gstr{i,2} = 'HO2';
fxBALD(i)=fxBALD(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xBALD + NO3 = NO3 + BALD';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xBALD'; Gstr{i,2} = 'NO3';
fxBALD(i)=fxBALD(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fBALD(i)=fBALD(i)+1;

i=i+1;
Rnames{i} = 'xBALD + SumRO2 = SumRO2 + .5*BALD';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xBALD'; Gstr{i,2} = 'SumRO2';
fxBALD(i)=fxBALD(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fBALD(i)=fBALD(i)+.5;

i=i+1;
Rnames{i} = 'xBALD + SumRCO3 = SumRCO3 + BALD';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xBALD'; Gstr{i,2} = 'SumRCO3';
fxBALD(i)=fxBALD(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fBALD(i)=fBALD(i)+1;

i=i+1;
Rnames{i} = 'xBENX + NO = NO + BENX';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xBENX'; Gstr{i,2} = 'NO';
fxBENX(i)=fxBENX(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fBENX(i)=fBENX(i)+1;

i=i+1;
Rnames{i} = 'xBENX + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xBENX'; Gstr{i,2} = 'HO2';
fxBENX(i)=fxBENX(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xBENX + NO3 = NO3 + BENX';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xBENX'; Gstr{i,2} = 'NO3';
fxBENX(i)=fxBENX(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fBENX(i)=fBENX(i)+1;

i=i+1;
Rnames{i} = 'xBENX + SumRO2 = SumRO2 + .5*BENX';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xBENX'; Gstr{i,2} = 'SumRO2';
fxBENX(i)=fxBENX(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fBENX(i)=fBENX(i)+.5;

i=i+1;
Rnames{i} = 'xBENX + SumRCO3 = SumRCO3 + BENX';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xBENX'; Gstr{i,2} = 'SumRCO3';
fxBENX(i)=fxBENX(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fBENX(i)=fBENX(i)+1;

i=i+1;
Rnames{i} = 'xRCHO + NO = NO + RCHO';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xRCHO'; Gstr{i,2} = 'NO';
fxRCHO(i)=fxRCHO(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRCHO(i)=fRCHO(i)+1;

i=i+1;
Rnames{i} = 'xRCHO + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xRCHO'; Gstr{i,2} = 'HO2';
fxRCHO(i)=fxRCHO(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xRCHO + NO3 = NO3 + RCHO';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xRCHO'; Gstr{i,2} = 'NO3';
fxRCHO(i)=fxRCHO(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fRCHO(i)=fRCHO(i)+1;

i=i+1;
Rnames{i} = 'xRCHO + SumRO2 = SumRO2 + .5*RCHO';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xRCHO'; Gstr{i,2} = 'SumRO2';
fxRCHO(i)=fxRCHO(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fRCHO(i)=fRCHO(i)+.5;

i=i+1;
Rnames{i} = 'xRCHO + SumRCO3 = SumRCO3 + RCHO';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xRCHO'; Gstr{i,2} = 'SumRCO3';
fxRCHO(i)=fxRCHO(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fRCHO(i)=fRCHO(i)+1;

i=i+1;
Rnames{i} = 'xKET2 + NO = NO + KET2';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xKET2'; Gstr{i,2} = 'NO';
fxKET2(i)=fxKET2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fKET2(i)=fKET2(i)+1;

i=i+1;
Rnames{i} = 'xKET2 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xKET2'; Gstr{i,2} = 'HO2';
fxKET2(i)=fxKET2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xKET2 + NO3 = NO3 + KET2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xKET2'; Gstr{i,2} = 'NO3';
fxKET2(i)=fxKET2(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fKET2(i)=fKET2(i)+1;

i=i+1;
Rnames{i} = 'xKET2 + SumRO2 = SumRO2 + .5*KET2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xKET2'; Gstr{i,2} = 'SumRO2';
fxKET2(i)=fxKET2(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fKET2(i)=fKET2(i)+.5;

i=i+1;
Rnames{i} = 'xKET2 + SumRCO3 = SumRCO3 + KET2';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xKET2'; Gstr{i,2} = 'SumRCO3';
fxKET2(i)=fxKET2(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fKET2(i)=fKET2(i)+1;

i=i+1;
Rnames{i} = 'xLVKS + NO = NO + LVKS';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xLVKS'; Gstr{i,2} = 'NO';
fxLVKS(i)=fxLVKS(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fLVKS(i)=fLVKS(i)+1;

i=i+1;
Rnames{i} = 'xLVKS + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xLVKS'; Gstr{i,2} = 'HO2';
fxLVKS(i)=fxLVKS(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xLVKS + NO3 = NO3 + LVKS';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xLVKS'; Gstr{i,2} = 'NO3';
fxLVKS(i)=fxLVKS(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fLVKS(i)=fLVKS(i)+1;

i=i+1;
Rnames{i} = 'xLVKS + SumRO2 = SumRO2 + .5*LVKS';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xLVKS'; Gstr{i,2} = 'SumRO2';
fxLVKS(i)=fxLVKS(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fLVKS(i)=fLVKS(i)+.5;

i=i+1;
Rnames{i} = 'xLVKS + SumRCO3 = SumRCO3 + LVKS';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xLVKS'; Gstr{i,2} = 'SumRCO3';
fxLVKS(i)=fxLVKS(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fLVKS(i)=fLVKS(i)+1;

i=i+1;
Rnames{i} = 'xOLEA1 + NO = NO + OLEA1';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xOLEA1'; Gstr{i,2} = 'NO';
fxOLEA1(i)=fxOLEA1(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fOLEA1(i)=fOLEA1(i)+1;

i=i+1;
Rnames{i} = 'xOLEA1 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xOLEA1'; Gstr{i,2} = 'HO2';
fxOLEA1(i)=fxOLEA1(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xOLEA1 + NO3 = NO3 + OLEA1';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xOLEA1'; Gstr{i,2} = 'NO3';
fxOLEA1(i)=fxOLEA1(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fOLEA1(i)=fOLEA1(i)+1;

i=i+1;
Rnames{i} = 'xOLEA1 + SumRO2 = SumRO2 + .5*OLEA1';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xOLEA1'; Gstr{i,2} = 'SumRO2';
fxOLEA1(i)=fxOLEA1(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fOLEA1(i)=fOLEA1(i)+.5;

i=i+1;
Rnames{i} = 'xOLEA1 + SumRCO3 = SumRCO3 + OLEA1';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xOLEA1'; Gstr{i,2} = 'SumRCO3';
fxOLEA1(i)=fxOLEA1(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fOLEA1(i)=fOLEA1(i)+1;

i=i+1;
Rnames{i} = 'xOLEA2 + NO = NO + OLEA2';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xOLEA2'; Gstr{i,2} = 'NO';
fxOLEA2(i)=fxOLEA2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fOLEA2(i)=fOLEA2(i)+1;

i=i+1;
Rnames{i} = 'xOLEA2 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xOLEA2'; Gstr{i,2} = 'HO2';
fxOLEA2(i)=fxOLEA2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xOLEA2 + NO3 = NO3 + OLEA2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xOLEA2'; Gstr{i,2} = 'NO3';
fxOLEA2(i)=fxOLEA2(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fOLEA2(i)=fOLEA2(i)+1;

i=i+1;
Rnames{i} = 'xOLEA2 + SumRO2 = SumRO2 + .5*OLEA2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xOLEA2'; Gstr{i,2} = 'SumRO2';
fxOLEA2(i)=fxOLEA2(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fOLEA2(i)=fOLEA2(i)+.5;

i=i+1;
Rnames{i} = 'xOLEA2 + SumRCO3 = SumRCO3 + OLEA2';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xOLEA2'; Gstr{i,2} = 'SumRCO3';
fxOLEA2(i)=fxOLEA2(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fOLEA2(i)=fOLEA2(i)+1;

i=i+1;
Rnames{i} = 'xOLEP + NO = NO + OLEP';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xOLEP'; Gstr{i,2} = 'NO';
fxOLEP(i)=fxOLEP(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fOLEP(i)=fOLEP(i)+1;

i=i+1;
Rnames{i} = 'xOLEP + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xOLEP'; Gstr{i,2} = 'HO2';
fxOLEP(i)=fxOLEP(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xOLEP + NO3 = NO3 + OLEP';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xOLEP'; Gstr{i,2} = 'NO3';
fxOLEP(i)=fxOLEP(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fOLEP(i)=fOLEP(i)+1;

i=i+1;
Rnames{i} = 'xOLEP + SumRO2 = SumRO2 + .5*OLEP';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xOLEP'; Gstr{i,2} = 'SumRO2';
fxOLEP(i)=fxOLEP(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fOLEP(i)=fOLEP(i)+.5;

i=i+1;
Rnames{i} = 'xOLEP + SumRCO3 = SumRCO3 + OLEP';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xOLEP'; Gstr{i,2} = 'SumRCO3';
fxOLEP(i)=fxOLEP(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fOLEP(i)=fOLEP(i)+1;

i=i+1;
Rnames{i} = 'xOACID + NO = NO + OACID';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xOACID'; Gstr{i,2} = 'NO';
fxOACID(i)=fxOACID(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fOACID(i)=fOACID(i)+1;

i=i+1;
Rnames{i} = 'xOACID + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xOACID'; Gstr{i,2} = 'HO2';
fxOACID(i)=fxOACID(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xOACID + NO3 = NO3 + OACID';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xOACID'; Gstr{i,2} = 'NO3';
fxOACID(i)=fxOACID(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fOACID(i)=fOACID(i)+1;

i=i+1;
Rnames{i} = 'xOACID + SumRO2 = SumRO2 + .5*OACID';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xOACID'; Gstr{i,2} = 'SumRO2';
fxOACID(i)=fxOACID(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fOACID(i)=fOACID(i)+.5;

i=i+1;
Rnames{i} = 'xOACID + SumRCO3 = SumRCO3 + OACID';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xOACID'; Gstr{i,2} = 'SumRCO3';
fxOACID(i)=fxOACID(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fOACID(i)=fOACID(i)+1;

i=i+1;
Rnames{i} = 'xPACID + NO = NO + PACID';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xPACID'; Gstr{i,2} = 'NO';
fxPACID(i)=fxPACID(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fPACID(i)=fPACID(i)+1;

i=i+1;
Rnames{i} = 'xPACID + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xPACID'; Gstr{i,2} = 'HO2';
fxPACID(i)=fxPACID(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xPACID + NO3 = NO3 + PACID';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xPACID'; Gstr{i,2} = 'NO3';
fxPACID(i)=fxPACID(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fPACID(i)=fPACID(i)+1;

i=i+1;
Rnames{i} = 'xPACID + SumRO2 = SumRO2 + .5*PACID';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xPACID'; Gstr{i,2} = 'SumRO2';
fxPACID(i)=fxPACID(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fPACID(i)=fPACID(i)+.5;

i=i+1;
Rnames{i} = 'xPACID + SumRCO3 = SumRCO3 + PACID';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xPACID'; Gstr{i,2} = 'SumRCO3';
fxPACID(i)=fxPACID(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fPACID(i)=fPACID(i)+1;

i=i+1;
Rnames{i} = 'xAMINS + NO = NO + AMINS';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xAMINS'; Gstr{i,2} = 'NO';
fxAMINS(i)=fxAMINS(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fAMINS(i)=fAMINS(i)+1;

i=i+1;
Rnames{i} = 'xAMINS + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xAMINS'; Gstr{i,2} = 'HO2';
fxAMINS(i)=fxAMINS(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xAMINS + NO3 = NO3 + AMINS';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xAMINS'; Gstr{i,2} = 'NO3';
fxAMINS(i)=fxAMINS(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fAMINS(i)=fAMINS(i)+1;

i=i+1;
Rnames{i} = 'xAMINS + SumRO2 = SumRO2 + .5*AMINS';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xAMINS'; Gstr{i,2} = 'SumRO2';
fxAMINS(i)=fxAMINS(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fAMINS(i)=fAMINS(i)+.5;

i=i+1;
Rnames{i} = 'xAMINS + SumRCO3 = SumRCO3 + AMINS';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xAMINS'; Gstr{i,2} = 'SumRCO3';
fxAMINS(i)=fxAMINS(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fAMINS(i)=fAMINS(i)+1;

i=i+1;
Rnames{i} = 'xRPNO3 + NO = NO + RPNO3';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xRPNO3'; Gstr{i,2} = 'NO';
fxRPNO3(i)=fxRPNO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRPNO3(i)=fRPNO3(i)+1;

i=i+1;
Rnames{i} = 'xRPNO3 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xRPNO3'; Gstr{i,2} = 'HO2';
fxRPNO3(i)=fxRPNO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xRPNO3 + NO3 = NO3 + RPNO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xRPNO3'; Gstr{i,2} = 'NO3';
fxRPNO3(i)=fxRPNO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fRPNO3(i)=fRPNO3(i)+1;

i=i+1;
Rnames{i} = 'xRPNO3 + SumRO2 = SumRO2 + .5*RPNO3';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xRPNO3'; Gstr{i,2} = 'SumRO2';
fxRPNO3(i)=fxRPNO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fRPNO3(i)=fRPNO3(i)+.5;

i=i+1;
Rnames{i} = 'xRPNO3 + SumRCO3 = SumRCO3 + RPNO3';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xRPNO3'; Gstr{i,2} = 'SumRCO3';
fxRPNO3(i)=fxRPNO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fRPNO3(i)=fRPNO3(i)+1;

i=i+1;
Rnames{i} = 'xRCNO3 + NO = NO + RCNO3';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xRCNO3'; Gstr{i,2} = 'NO';
fxRCNO3(i)=fxRCNO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRCNO3(i)=fRCNO3(i)+1;

i=i+1;
Rnames{i} = 'xRCNO3 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xRCNO3'; Gstr{i,2} = 'HO2';
fxRCNO3(i)=fxRCNO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xRCNO3 + NO3 = NO3 + RCNO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xRCNO3'; Gstr{i,2} = 'NO3';
fxRCNO3(i)=fxRCNO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fRCNO3(i)=fRCNO3(i)+1;

i=i+1;
Rnames{i} = 'xRCNO3 + SumRO2 = SumRO2 + .5*RCNO3';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xRCNO3'; Gstr{i,2} = 'SumRO2';
fxRCNO3(i)=fxRCNO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fRCNO3(i)=fRCNO3(i)+.5;

i=i+1;
Rnames{i} = 'xRCNO3 + SumRCO3 = SumRCO3 + RCNO3';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xRCNO3'; Gstr{i,2} = 'SumRCO3';
fxRCNO3(i)=fxRCNO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fRCNO3(i)=fRCNO3(i)+1;

i=i+1;
Rnames{i} = 'xRHNO3 + NO = NO + RHNO3';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xRHNO3'; Gstr{i,2} = 'NO';
fxRHNO3(i)=fxRHNO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRHNO3(i)=fRHNO3(i)+1;

i=i+1;
Rnames{i} = 'xRHNO3 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xRHNO3'; Gstr{i,2} = 'HO2';
fxRHNO3(i)=fxRHNO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xRHNO3 + NO3 = NO3 + RHNO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xRHNO3'; Gstr{i,2} = 'NO3';
fxRHNO3(i)=fxRHNO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fRHNO3(i)=fRHNO3(i)+1;

i=i+1;
Rnames{i} = 'xRHNO3 + SumRO2 = SumRO2 + .5*RHNO3';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xRHNO3'; Gstr{i,2} = 'SumRO2';
fxRHNO3(i)=fxRHNO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fRHNO3(i)=fRHNO3(i)+.5;

i=i+1;
Rnames{i} = 'xRHNO3 + SumRCO3 = SumRCO3 + RHNO3';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xRHNO3'; Gstr{i,2} = 'SumRCO3';
fxRHNO3(i)=fxRHNO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fRHNO3(i)=fRHNO3(i)+1;

i=i+1;
Rnames{i} = 'xRDNO3 + NO = NO + RDNO3';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xRDNO3'; Gstr{i,2} = 'NO';
fxRDNO3(i)=fxRDNO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRDNO3(i)=fRDNO3(i)+1;

i=i+1;
Rnames{i} = 'xRDNO3 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xRDNO3'; Gstr{i,2} = 'HO2';
fxRDNO3(i)=fxRDNO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xRDNO3 + NO3 = NO3 + RDNO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xRDNO3'; Gstr{i,2} = 'NO3';
fxRDNO3(i)=fxRDNO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fRDNO3(i)=fRDNO3(i)+1;

i=i+1;
Rnames{i} = 'xRDNO3 + SumRO2 = SumRO2 + .5*RDNO3';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xRDNO3'; Gstr{i,2} = 'SumRO2';
fxRDNO3(i)=fxRDNO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fRDNO3(i)=fRDNO3(i)+.5;

i=i+1;
Rnames{i} = 'xRDNO3 + SumRCO3 = SumRCO3 + RDNO3';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xRDNO3'; Gstr{i,2} = 'SumRCO3';
fxRDNO3(i)=fxRDNO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fRDNO3(i)=fRDNO3(i)+1;

i=i+1;
Rnames{i} = 'xHPCRB + NO = NO + HPCRB';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xHPCRB'; Gstr{i,2} = 'NO';
fxHPCRB(i)=fxHPCRB(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fHPCRB(i)=fHPCRB(i)+1;

i=i+1;
Rnames{i} = 'xHPCRB + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xHPCRB'; Gstr{i,2} = 'HO2';
fxHPCRB(i)=fxHPCRB(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xHPCRB + NO3 = NO3 + HPCRB';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xHPCRB'; Gstr{i,2} = 'NO3';
fxHPCRB(i)=fxHPCRB(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fHPCRB(i)=fHPCRB(i)+1;

i=i+1;
Rnames{i} = 'xHPCRB + SumRO2 = SumRO2 + .5*HPCRB';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xHPCRB'; Gstr{i,2} = 'SumRO2';
fxHPCRB(i)=fxHPCRB(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fHPCRB(i)=fHPCRB(i)+.5;

i=i+1;
Rnames{i} = 'xHPCRB + SumRCO3 = SumRCO3 + HPCRB';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xHPCRB'; Gstr{i,2} = 'SumRCO3';
fxHPCRB(i)=fxHPCRB(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fHPCRB(i)=fHPCRB(i)+1;

i=i+1;
Rnames{i} = 'xAFG1 + NO = NO + AFG1';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xAFG1'; Gstr{i,2} = 'NO';
fxAFG1(i)=fxAFG1(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fAFG1(i)=fAFG1(i)+1;

i=i+1;
Rnames{i} = 'xAFG1 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xAFG1'; Gstr{i,2} = 'HO2';
fxAFG1(i)=fxAFG1(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xAFG1 + NO3 = NO3 + AFG1';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xAFG1'; Gstr{i,2} = 'NO3';
fxAFG1(i)=fxAFG1(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fAFG1(i)=fAFG1(i)+1;

i=i+1;
Rnames{i} = 'xAFG1 + SumRO2 = SumRO2 + .5*AFG1';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xAFG1'; Gstr{i,2} = 'SumRO2';
fxAFG1(i)=fxAFG1(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fAFG1(i)=fAFG1(i)+.5;

i=i+1;
Rnames{i} = 'xAFG1 + SumRCO3 = SumRCO3 + AFG1';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xAFG1'; Gstr{i,2} = 'SumRCO3';
fxAFG1(i)=fxAFG1(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fAFG1(i)=fAFG1(i)+1;

i=i+1;
Rnames{i} = 'xAFG2A + NO = NO + AFG2A';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xAFG2A'; Gstr{i,2} = 'NO';
fxAFG2A(i)=fxAFG2A(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fAFG2A(i)=fAFG2A(i)+1;

i=i+1;
Rnames{i} = 'xAFG2A + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xAFG2A'; Gstr{i,2} = 'HO2';
fxAFG2A(i)=fxAFG2A(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xAFG2A + NO3 = NO3 + AFG2A';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xAFG2A'; Gstr{i,2} = 'NO3';
fxAFG2A(i)=fxAFG2A(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fAFG2A(i)=fAFG2A(i)+1;

i=i+1;
Rnames{i} = 'xAFG2A + SumRO2 = SumRO2 + .5*AFG2A';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xAFG2A'; Gstr{i,2} = 'SumRO2';
fxAFG2A(i)=fxAFG2A(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fAFG2A(i)=fAFG2A(i)+.5;

i=i+1;
Rnames{i} = 'xAFG2A + SumRCO3 = SumRCO3 + AFG2A';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xAFG2A'; Gstr{i,2} = 'SumRCO3';
fxAFG2A(i)=fxAFG2A(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fAFG2A(i)=fAFG2A(i)+1;

i=i+1;
Rnames{i} = 'xAFG2B + NO = NO + AFG2B';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xAFG2B'; Gstr{i,2} = 'NO';
fxAFG2B(i)=fxAFG2B(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fAFG2B(i)=fAFG2B(i)+1;

i=i+1;
Rnames{i} = 'xAFG2B + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xAFG2B'; Gstr{i,2} = 'HO2';
fxAFG2B(i)=fxAFG2B(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xAFG2B + NO3 = NO3 + AFG2B';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xAFG2B'; Gstr{i,2} = 'NO3';
fxAFG2B(i)=fxAFG2B(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fAFG2B(i)=fAFG2B(i)+1;

i=i+1;
Rnames{i} = 'xAFG2B + SumRO2 = SumRO2 + .5*AFG2B';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xAFG2B'; Gstr{i,2} = 'SumRO2';
fxAFG2B(i)=fxAFG2B(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fAFG2B(i)=fAFG2B(i)+.5;

i=i+1;
Rnames{i} = 'xAFG2B + SumRCO3 = SumRCO3 + AFG2B';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xAFG2B'; Gstr{i,2} = 'SumRCO3';
fxAFG2B(i)=fxAFG2B(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fAFG2B(i)=fAFG2B(i)+1;

i=i+1;
Rnames{i} = 'xAFG3 + NO = NO + AFG3';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xAFG3'; Gstr{i,2} = 'NO';
fxAFG3(i)=fxAFG3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fAFG3(i)=fAFG3(i)+1;

i=i+1;
Rnames{i} = 'xAFG3 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xAFG3'; Gstr{i,2} = 'HO2';
fxAFG3(i)=fxAFG3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xAFG3 + NO3 = NO3 + AFG3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xAFG3'; Gstr{i,2} = 'NO3';
fxAFG3(i)=fxAFG3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fAFG3(i)=fAFG3(i)+1;

i=i+1;
Rnames{i} = 'xAFG3 + SumRO2 = SumRO2 + .5*AFG3';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xAFG3'; Gstr{i,2} = 'SumRO2';
fxAFG3(i)=fxAFG3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fAFG3(i)=fAFG3(i)+.5;

i=i+1;
Rnames{i} = 'xAFG3 + SumRCO3 = SumRCO3 + AFG3';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xAFG3'; Gstr{i,2} = 'SumRCO3';
fxAFG3(i)=fxAFG3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fAFG3(i)=fAFG3(i)+1;

i=i+1;
Rnames{i} = 'xPAN2 + NO = NO + PAN2';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xPAN2'; Gstr{i,2} = 'NO';
fxPAN2(i)=fxPAN2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fPAN2(i)=fPAN2(i)+1;

i=i+1;
Rnames{i} = 'xPAN2 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xPAN2'; Gstr{i,2} = 'HO2';
fxPAN2(i)=fxPAN2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xPAN2 + NO3 = NO3 + PAN2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xPAN2'; Gstr{i,2} = 'NO3';
fxPAN2(i)=fxPAN2(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fPAN2(i)=fPAN2(i)+1;

i=i+1;
Rnames{i} = 'xPAN2 + SumRO2 = SumRO2 + .5*PAN2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xPAN2'; Gstr{i,2} = 'SumRO2';
fxPAN2(i)=fxPAN2(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fPAN2(i)=fPAN2(i)+.5;

i=i+1;
Rnames{i} = 'xPAN2 + SumRCO3 = SumRCO3 + PAN2';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xPAN2'; Gstr{i,2} = 'SumRCO3';
fxPAN2(i)=fxPAN2(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fPAN2(i)=fPAN2(i)+1;

i=i+1;
Rnames{i} = 'xMEO2 + NO = NO + MEO2 + SumRO2';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xMEO2'; Gstr{i,2} = 'NO';
fxMEO2(i)=fxMEO2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fMEO2(i)=fMEO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'xMEO2 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xMEO2'; Gstr{i,2} = 'HO2';
fxMEO2(i)=fxMEO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xMEO2 + NO3 = NO3 + MEO2 + SumRO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xMEO2'; Gstr{i,2} = 'NO3';
fxMEO2(i)=fxMEO2(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fMEO2(i)=fMEO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'xMEO2 + SumRO2 = SumRO2 + .5*MEO2 + .5*SumRO2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xMEO2'; Gstr{i,2} = 'SumRO2';
fxMEO2(i)=fxMEO2(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fMEO2(i)=fMEO2(i)+.5; fSumRO2(i)=fSumRO2(i)+.5;

i=i+1;
Rnames{i} = 'xMEO2 + SumRCO3 = SumRCO3 + MEO2 + SumRO2';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xMEO2'; Gstr{i,2} = 'SumRCO3';
fxMEO2(i)=fxMEO2(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fMEO2(i)=fMEO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'xETO2 + NO = NO + ETO2 + SumRO2';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xETO2'; Gstr{i,2} = 'NO';
fxETO2(i)=fxETO2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fETO2(i)=fETO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'xETO2 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xETO2'; Gstr{i,2} = 'HO2';
fxETO2(i)=fxETO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xETO2 + NO3 = NO3 + ETO2 + SumRO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xETO2'; Gstr{i,2} = 'NO3';
fxETO2(i)=fxETO2(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fETO2(i)=fETO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'xETO2 + SumRO2 = SumRO2 + .5*ETO2 + .5*SumRO2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xETO2'; Gstr{i,2} = 'SumRO2';
fxETO2(i)=fxETO2(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fETO2(i)=fETO2(i)+.5; fSumRO2(i)=fSumRO2(i)+.5;

i=i+1;
Rnames{i} = 'xETO2 + SumRCO3 = SumRCO3 + ETO2 + SumRO2';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xETO2'; Gstr{i,2} = 'SumRCO3';
fxETO2(i)=fxETO2(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fETO2(i)=fETO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'xMECO3 + NO = NO + MECO3 + SumRCO3';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xMECO3'; Gstr{i,2} = 'NO';
fxMECO3(i)=fxMECO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fMECO3(i)=fMECO3(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'xMECO3 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xMECO3'; Gstr{i,2} = 'HO2';
fxMECO3(i)=fxMECO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xMECO3 + NO3 = NO3 + MECO3 + SumRCO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xMECO3'; Gstr{i,2} = 'NO3';
fxMECO3(i)=fxMECO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fMECO3(i)=fMECO3(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'xMECO3 + SumRO2 = SumRO2 + .5*MECO3 + .5*SumRCO3';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xMECO3'; Gstr{i,2} = 'SumRO2';
fxMECO3(i)=fxMECO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fMECO3(i)=fMECO3(i)+.5; fSumRCO3(i)=fSumRCO3(i)+.5;

i=i+1;
Rnames{i} = 'xMECO3 + SumRCO3 = SumRCO3 + MECO3 + SumRCO3';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xMECO3'; Gstr{i,2} = 'SumRCO3';
fxMECO3(i)=fxMECO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fMECO3(i)=fMECO3(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'xR2CO3 + NO = NO + R2CO3 + SumRCO3';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xR2CO3'; Gstr{i,2} = 'NO';
fxR2CO3(i)=fxR2CO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fR2CO3(i)=fR2CO3(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'xR2CO3 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xR2CO3'; Gstr{i,2} = 'HO2';
fxR2CO3(i)=fxR2CO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xR2CO3 + NO3 = NO3 + R2CO3 + SumRCO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xR2CO3'; Gstr{i,2} = 'NO3';
fxR2CO3(i)=fxR2CO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fR2CO3(i)=fR2CO3(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'xR2CO3 + SumRO2 = SumRO2 + .5*R2CO3 + .5*SumRCO3';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xR2CO3'; Gstr{i,2} = 'SumRO2';
fxR2CO3(i)=fxR2CO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fR2CO3(i)=fR2CO3(i)+.5; fSumRCO3(i)=fSumRCO3(i)+.5;

i=i+1;
Rnames{i} = 'xR2CO3 + SumRCO3 = SumRCO3 + R2CO3 + SumRCO3';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xR2CO3'; Gstr{i,2} = 'SumRCO3';
fxR2CO3(i)=fxR2CO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fR2CO3(i)=fR2CO3(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'xMACO3 + NO = NO + MACO3 + SumRCO3';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xMACO3'; Gstr{i,2} = 'NO';
fxMACO3(i)=fxMACO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fMACO3(i)=fMACO3(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'xMACO3 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xMACO3'; Gstr{i,2} = 'HO2';
fxMACO3(i)=fxMACO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xMACO3 + NO3 = NO3 + MACO3 + SumRCO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xMACO3'; Gstr{i,2} = 'NO3';
fxMACO3(i)=fxMACO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fMACO3(i)=fMACO3(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'xMACO3 + SumRO2 = SumRO2 + .5*MACO3 + .5*SumRCO3';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xMACO3'; Gstr{i,2} = 'SumRO2';
fxMACO3(i)=fxMACO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fMACO3(i)=fMACO3(i)+.5; fSumRCO3(i)=fSumRCO3(i)+.5;

i=i+1;
Rnames{i} = 'xMACO3 + SumRCO3 = SumRCO3 + MACO3 + SumRCO3';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xMACO3'; Gstr{i,2} = 'SumRCO3';
fxMACO3(i)=fxMACO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fMACO3(i)=fMACO3(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'xTBUO + NO = NO + TBUO';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xTBUO'; Gstr{i,2} = 'NO';
fxTBUO(i)=fxTBUO(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fTBUO(i)=fTBUO(i)+1;

i=i+1;
Rnames{i} = 'xTBUO + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xTBUO'; Gstr{i,2} = 'HO2';
fxTBUO(i)=fxTBUO(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xTBUO + NO3 = NO3 + TBUO';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xTBUO'; Gstr{i,2} = 'NO3';
fxTBUO(i)=fxTBUO(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fTBUO(i)=fTBUO(i)+1;

i=i+1;
Rnames{i} = 'xTBUO + SumRO2 = SumRO2 + .5*TBUO';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xTBUO'; Gstr{i,2} = 'SumRO2';
fxTBUO(i)=fxTBUO(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fTBUO(i)=fTBUO(i)+.5;

i=i+1;
Rnames{i} = 'xTBUO + SumRCO3 = SumRCO3 + TBUO';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xTBUO'; Gstr{i,2} = 'SumRCO3';
fxTBUO(i)=fxTBUO(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fTBUO(i)=fTBUO(i)+1;

i=i+1;
Rnames{i} = 'xBZO + NO = NO + BZO';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'xBZO'; Gstr{i,2} = 'NO';
fxBZO(i)=fxBZO(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fBZO(i)=fBZO(i)+1;

i=i+1;
Rnames{i} = 'xBZO + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'xBZO'; Gstr{i,2} = 'HO2';
fxBZO(i)=fxBZO(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xBZO + NO3 = NO3 + BZO';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xBZO'; Gstr{i,2} = 'NO3';
fxBZO(i)=fxBZO(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fBZO(i)=fBZO(i)+1;

i=i+1;
Rnames{i} = 'xBZO + SumRO2 = SumRO2 + .5*BZO';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'xBZO'; Gstr{i,2} = 'SumRO2';
fxBZO(i)=fxBZO(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fBZO(i)=fBZO(i)+.5;

i=i+1;
Rnames{i} = 'xBZO + SumRCO3 = SumRCO3 + BZO';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'xBZO'; Gstr{i,2} = 'SumRCO3';
fxBZO(i)=fxBZO(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fBZO(i)=fBZO(i)+1;

i=i+1;
Rnames{i} = 'yROOH + NO = NO';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'yROOH'; Gstr{i,2} = 'NO';
fyROOH(i)=fyROOH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1;

i=i+1;
Rnames{i} = 'yROOH + HO2 = HO2 + ROOH';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'yROOH'; Gstr{i,2} = 'HO2';
fyROOH(i)=fyROOH(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fROOH(i)=fROOH(i)+1;

i=i+1;
Rnames{i} = 'yROOH + NO3 = NO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'yROOH'; Gstr{i,2} = 'NO3';
fyROOH(i)=fyROOH(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'yROOH + SumRO2 = SumRO2 + .5*KET2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'yROOH'; Gstr{i,2} = 'SumRO2';
fyROOH(i)=fyROOH(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fKET2(i)=fKET2(i)+.5;

i=i+1;
Rnames{i} = 'yROOH + SumRCO3 = SumRCO3';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'yROOH'; Gstr{i,2} = 'SumRCO3';
fyROOH(i)=fyROOH(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'yRUOOH + NO = NO';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'yRUOOH'; Gstr{i,2} = 'NO';
fyRUOOH(i)=fyRUOOH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1;

i=i+1;
Rnames{i} = 'yRUOOH + HO2 = HO2 + RUOOH';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'yRUOOH'; Gstr{i,2} = 'HO2';
fyRUOOH(i)=fyRUOOH(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fRUOOH(i)=fRUOOH(i)+1;

i=i+1;
Rnames{i} = 'yRUOOH + NO3 = NO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'yRUOOH'; Gstr{i,2} = 'NO3';
fyRUOOH(i)=fyRUOOH(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'yRUOOH + SumRO2 = SumRO2 + .5*OLEP';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'yRUOOH'; Gstr{i,2} = 'SumRO2';
fyRUOOH(i)=fyRUOOH(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fOLEP(i)=fOLEP(i)+.5;

i=i+1;
Rnames{i} = 'yRUOOH + SumRCO3 = SumRCO3';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'yRUOOH'; Gstr{i,2} = 'SumRCO3';
fyRUOOH(i)=fyRUOOH(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'yRAOOH + NO = NO';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'yRAOOH'; Gstr{i,2} = 'NO';
fyRAOOH(i)=fyRAOOH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1;

i=i+1;
Rnames{i} = 'yRAOOH + HO2 = HO2 + RAOOH';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'yRAOOH'; Gstr{i,2} = 'HO2';
fyRAOOH(i)=fyRAOOH(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fRAOOH(i)=fRAOOH(i)+1;

i=i+1;
Rnames{i} = 'yRAOOH + NO3 = NO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'yRAOOH'; Gstr{i,2} = 'NO3';
fyRAOOH(i)=fyRAOOH(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'yRAOOH + SumRO2 = SumRO2 + .5*OLEP';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'yRAOOH'; Gstr{i,2} = 'SumRO2';
fyRAOOH(i)=fyRAOOH(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fOLEP(i)=fOLEP(i)+.5;

i=i+1;
Rnames{i} = 'yRAOOH + SumRCO3 = SumRCO3';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'yRAOOH'; Gstr{i,2} = 'SumRCO3';
fyRAOOH(i)=fyRAOOH(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'yHPCRB + NO = NO';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'yHPCRB'; Gstr{i,2} = 'NO';
fyHPCRB(i)=fyHPCRB(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1;

i=i+1;
Rnames{i} = 'yHPCRB + HO2 = HO2 + HPCRB';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'yHPCRB'; Gstr{i,2} = 'HO2';
fyHPCRB(i)=fyHPCRB(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fHPCRB(i)=fHPCRB(i)+1;

i=i+1;
Rnames{i} = 'yHPCRB + NO3 = NO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'yHPCRB'; Gstr{i,2} = 'NO3';
fyHPCRB(i)=fyHPCRB(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'yHPCRB + SumRO2 = SumRO2 + .5*KET2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'yHPCRB'; Gstr{i,2} = 'SumRO2';
fyHPCRB(i)=fyHPCRB(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fKET2(i)=fKET2(i)+.5;

i=i+1;
Rnames{i} = 'yHPCRB + SumRCO3 = SumRCO3';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'yHPCRB'; Gstr{i,2} = 'SumRCO3';
fyHPCRB(i)=fyHPCRB(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'yRPNO3 + NO = NO';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'yRPNO3'; Gstr{i,2} = 'NO';
fyRPNO3(i)=fyRPNO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1;

i=i+1;
Rnames{i} = 'yRPNO3 + HO2 = HO2 + RPNO3';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'yRPNO3'; Gstr{i,2} = 'HO2';
fyRPNO3(i)=fyRPNO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fRPNO3(i)=fRPNO3(i)+1;

i=i+1;
Rnames{i} = 'yRPNO3 + NO3 = NO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'yRPNO3'; Gstr{i,2} = 'NO3';
fyRPNO3(i)=fyRPNO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'yRPNO3 + SumRO2 = SumRO2 + .5*R1NO3';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'yRPNO3'; Gstr{i,2} = 'SumRO2';
fyRPNO3(i)=fyRPNO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fR1NO3(i)=fR1NO3(i)+.5;

i=i+1;
Rnames{i} = 'yRPNO3 + SumRCO3 = SumRCO3';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'yRPNO3'; Gstr{i,2} = 'SumRCO3';
fyRPNO3(i)=fyRPNO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'zR1NO3 + NO = NO + R1NO3';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'zR1NO3'; Gstr{i,2} = 'NO';
fzR1NO3(i)=fzR1NO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fR1NO3(i)=fR1NO3(i)+1;

i=i+1;
Rnames{i} = 'zR1NO3 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'zR1NO3'; Gstr{i,2} = 'HO2';
fzR1NO3(i)=fzR1NO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zR1NO3 + NO3 = NO3 + KET2 + HO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'zR1NO3'; Gstr{i,2} = 'NO3';
fzR1NO3(i)=fzR1NO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fKET2(i)=fKET2(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zR1NO3 + SumRO2 = SumRO2 + .5*KET2 + .5*HO2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'zR1NO3'; Gstr{i,2} = 'SumRO2';
fzR1NO3(i)=fzR1NO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fKET2(i)=fKET2(i)+.5; fHO2(i)=fHO2(i)+.5;

i=i+1;
Rnames{i} = 'zR1NO3 + SumRCO3 = SumRCO3 + KET2 + HO2';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'zR1NO3'; Gstr{i,2} = 'SumRCO3';
fzR1NO3(i)=fzR1NO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fKET2(i)=fKET2(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zR2NO3 + NO = NO + R2NO3';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'zR2NO3'; Gstr{i,2} = 'NO';
fzR2NO3(i)=fzR2NO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fR2NO3(i)=fR2NO3(i)+1;

i=i+1;
Rnames{i} = 'zR2NO3 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'zR2NO3'; Gstr{i,2} = 'HO2';
fzR2NO3(i)=fzR2NO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zR2NO3 + NO3 = NO3 + KET2 + HO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'zR2NO3'; Gstr{i,2} = 'NO3';
fzR2NO3(i)=fzR2NO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fKET2(i)=fKET2(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zR2NO3 + SumRO2 = SumRO2 + .5*KET2 + .5*HO2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'zR2NO3'; Gstr{i,2} = 'SumRO2';
fzR2NO3(i)=fzR2NO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fKET2(i)=fKET2(i)+.5; fHO2(i)=fHO2(i)+.5;

i=i+1;
Rnames{i} = 'zR2NO3 + SumRCO3 = SumRCO3 + KET2 + HO2';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'zR2NO3'; Gstr{i,2} = 'SumRCO3';
fzR2NO3(i)=fzR2NO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fKET2(i)=fKET2(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRHNO3 + NO = NO + RHNO3';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'zRHNO3'; Gstr{i,2} = 'NO';
fzRHNO3(i)=fzRHNO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRHNO3(i)=fRHNO3(i)+1;

i=i+1;
Rnames{i} = 'zRHNO3 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'zRHNO3'; Gstr{i,2} = 'HO2';
fzRHNO3(i)=fzRHNO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRHNO3 + NO3 = NO3 + KET2 + HO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'zRHNO3'; Gstr{i,2} = 'NO3';
fzRHNO3(i)=fzRHNO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fKET2(i)=fKET2(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRHNO3 + SumRO2 = SumRO2 + .5*KET2 + .5*HO2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'zRHNO3'; Gstr{i,2} = 'SumRO2';
fzRHNO3(i)=fzRHNO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fKET2(i)=fKET2(i)+.5; fHO2(i)=fHO2(i)+.5;

i=i+1;
Rnames{i} = 'zRHNO3 + SumRCO3 = SumRCO3 + KET2 + HO2';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'zRHNO3'; Gstr{i,2} = 'SumRCO3';
fzRHNO3(i)=fzRHNO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fKET2(i)=fKET2(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRCNO3 + NO = NO + RCNO3';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'zRCNO3'; Gstr{i,2} = 'NO';
fzRCNO3(i)=fzRCNO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRCNO3(i)=fRCNO3(i)+1;

i=i+1;
Rnames{i} = 'zRCNO3 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'zRCNO3'; Gstr{i,2} = 'HO2';
fzRCNO3(i)=fzRCNO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRCNO3 + NO3 = NO3 + KET2 + HO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'zRCNO3'; Gstr{i,2} = 'NO3';
fzRCNO3(i)=fzRCNO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fKET2(i)=fKET2(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRCNO3 + SumRO2 = SumRO2 + .5*KET2 + .5*HO2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'zRCNO3'; Gstr{i,2} = 'SumRO2';
fzRCNO3(i)=fzRCNO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fKET2(i)=fKET2(i)+.5; fHO2(i)=fHO2(i)+.5;

i=i+1;
Rnames{i} = 'zRCNO3 + SumRCO3 = SumRCO3 + KET2 + HO2';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'zRCNO3'; Gstr{i,2} = 'SumRCO3';
fzRCNO3(i)=fzRCNO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fKET2(i)=fKET2(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRANO3 + NO = NO + RANO3';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'zRANO3'; Gstr{i,2} = 'NO';
fzRANO3(i)=fzRANO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRANO3(i)=fRANO3(i)+1;

i=i+1;
Rnames{i} = 'zRANO3 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'zRANO3'; Gstr{i,2} = 'HO2';
fzRANO3(i)=fzRANO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRANO3 + NO3 = NO3 + RUOOH + HO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'zRANO3'; Gstr{i,2} = 'NO3';
fzRANO3(i)=fzRANO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fRUOOH(i)=fRUOOH(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRANO3 + SumRO2 = SumRO2 + .5*RUOOH + .5*HO2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'zRANO3'; Gstr{i,2} = 'SumRO2';
fzRANO3(i)=fzRANO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fRUOOH(i)=fRUOOH(i)+.5; fHO2(i)=fHO2(i)+.5;

i=i+1;
Rnames{i} = 'zRANO3 + SumRCO3 = SumRCO3 + RUOOH + HO2';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'zRANO3'; Gstr{i,2} = 'SumRCO3';
fzRANO3(i)=fzRANO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fRUOOH(i)=fRUOOH(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRPNO3 + NO = NO + RPNO3';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'zRPNO3'; Gstr{i,2} = 'NO';
fzRPNO3(i)=fzRPNO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRPNO3(i)=fRPNO3(i)+1;

i=i+1;
Rnames{i} = 'zRPNO3 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'zRPNO3'; Gstr{i,2} = 'HO2';
fzRPNO3(i)=fzRPNO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRPNO3 + NO3 = NO3 + RUOOH + HO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'zRPNO3'; Gstr{i,2} = 'NO3';
fzRPNO3(i)=fzRPNO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fRUOOH(i)=fRUOOH(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRPNO3 + SumRO2 = SumRO2 + .5*RUOOH + .5*HO2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'zRPNO3'; Gstr{i,2} = 'SumRO2';
fzRPNO3(i)=fzRPNO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fRUOOH(i)=fRUOOH(i)+.5; fHO2(i)=fHO2(i)+.5;

i=i+1;
Rnames{i} = 'zRPNO3 + SumRCO3 = SumRCO3 + RUOOH + HO2';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'zRPNO3'; Gstr{i,2} = 'SumRCO3';
fzRPNO3(i)=fzRPNO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fRUOOH(i)=fRUOOH(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRDNO3 + NO = NO + RDNO3';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'zRDNO3'; Gstr{i,2} = 'NO';
fzRDNO3(i)=fzRDNO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRDNO3(i)=fRDNO3(i)+1;

i=i+1;
Rnames{i} = 'zRDNO3 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'zRDNO3'; Gstr{i,2} = 'HO2';
fzRDNO3(i)=fzRDNO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRDNO3 + NO3 = NO3 + R1NO3 + HO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'zRDNO3'; Gstr{i,2} = 'NO3';
fzRDNO3(i)=fzRDNO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fR1NO3(i)=fR1NO3(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRDNO3 + SumRO2 = SumRO2 + .5*R1NO3 + .5*HO2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'zRDNO3'; Gstr{i,2} = 'SumRO2';
fzRDNO3(i)=fzRDNO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fR1NO3(i)=fR1NO3(i)+.5; fHO2(i)=fHO2(i)+.5;

i=i+1;
Rnames{i} = 'zRDNO3 + SumRCO3 = SumRCO3 + R1NO3 + HO2';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'zRDNO3'; Gstr{i,2} = 'SumRCO3';
fzRDNO3(i)=fzRDNO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fR1NO3(i)=fR1NO3(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRNNO3 + NO = NO + RNNO3';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'zRNNO3'; Gstr{i,2} = 'NO';
fzRNNO3(i)=fzRNNO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRNNO3(i)=fRNNO3(i)+1;

i=i+1;
Rnames{i} = 'zRNNO3 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'zRNNO3'; Gstr{i,2} = 'HO2';
fzRNNO3(i)=fzRNNO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRNNO3 + NO3 = NO3 + OTHN + HO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'zRNNO3'; Gstr{i,2} = 'NO3';
fzRNNO3(i)=fzRNNO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fOTHN(i)=fOTHN(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRNNO3 + SumRO2 = SumRO2 + .5*OTHN + .5*HO2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'zRNNO3'; Gstr{i,2} = 'SumRO2';
fzRNNO3(i)=fzRNNO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fOTHN(i)=fOTHN(i)+.5; fHO2(i)=fHO2(i)+.5;

i=i+1;
Rnames{i} = 'zRNNO3 + SumRCO3 = SumRCO3 + OTHN + HO2';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'zRNNO3'; Gstr{i,2} = 'SumRCO3';
fzRNNO3(i)=fzRNNO3(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fOTHN(i)=fOTHN(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zPAN2 + NO = NO + PAN2';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'zPAN2'; Gstr{i,2} = 'NO';
fzPAN2(i)=fzPAN2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fPAN2(i)=fPAN2(i)+1;

i=i+1;
Rnames{i} = 'zPAN2 + HO2 = HO2';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'zPAN2'; Gstr{i,2} = 'HO2';
fzPAN2(i)=fzPAN2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zPAN2 + NO3 = NO3 + RCHO + HO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'zPAN2'; Gstr{i,2} = 'NO3';
fzPAN2(i)=fzPAN2(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fRCHO(i)=fRCHO(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zPAN2 + SumRO2 = SumRO2 + .5*RCHO + .5*HO2';
k(:,i) = 1.60e-14;
Gstr{i,1} = 'zPAN2'; Gstr{i,2} = 'SumRO2';
fzPAN2(i)=fzPAN2(i)-1; fSumRO2(i)=fSumRO2(i)-1; fSumRO2(i)=fSumRO2(i)+1; fRCHO(i)=fRCHO(i)+.5; fHO2(i)=fHO2(i)+.5;

i=i+1;
Rnames{i} = 'zPAN2 + SumRCO3 = SumRCO3 + RCHO + HO2';
k(:,i) = 4.40e-13.*exp(1069.847./T);
Gstr{i,1} = 'zPAN2'; Gstr{i,2} = 'SumRCO3';
fzPAN2(i)=fzPAN2(i)-1; fSumRCO3(i)=fSumRCO3(i)-1; fSumRCO3(i)=fSumRCO3(i)+1; fRCHO(i)=fRCHO(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'R2CO3 + NO = NO2 + .95*xHO2 + .96*RO2C + .04*RO2XC + .95*xETCHO + .04*zR1NO3 + CO2 + yROOH + SumRO2';
k(:,i) = 6.70e-12.*(T./300).^0.00.*exp(340.177./T);
Gstr{i,1} = 'R2CO3'; Gstr{i,2} = 'NO';
fR2CO3(i)=fR2CO3(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fxHO2(i)=fxHO2(i)+.95; fRO2C(i)=fRO2C(i)+.96; fRO2XC(i)=fRO2XC(i)+.04; fxETCHO(i)=fxETCHO(i)+.95; fzR1NO3(i)=fzR1NO3(i)+.04; fCO2(i)=fCO2(i)+1; fyROOH(i)=fyROOH(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'R2CO3 + NO2 = PAN2';
k(:,i) = 7.70e-12;
Gstr{i,1} = 'R2CO3'; Gstr{i,2} = 'NO2';
fR2CO3(i)=fR2CO3(i)-1; fNO2(i)=fNO2(i)-1; fPAN2(i)=fPAN2(i)+1;

i=i+1;
Rnames{i} = 'R2CO3 + NO3 = NO2 + .95*xHO2 + .96*RO2C + .04*RO2XC + .95*xETCHO + .04*zR1NO3 + CO2 + yROOH + SumRO2';
k(:,i) = 4.00e-12;
Gstr{i,1} = 'R2CO3'; Gstr{i,2} = 'NO3';
fR2CO3(i)=fR2CO3(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+1; fxHO2(i)=fxHO2(i)+.95; fRO2C(i)=fRO2C(i)+.96; fRO2XC(i)=fRO2XC(i)+.04; fxETCHO(i)=fxETCHO(i)+.95; fzR1NO3(i)=fzR1NO3(i)+.04; fCO2(i)=fCO2(i)+1; fyROOH(i)=fyROOH(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'R2CO3 + HO2 = .13*O3 + .5*OH + .48*xHO2 + .48*RO2C + .02*RO2XC + .48*xETCHO + .13*OACID + .37*PACID + .02*zR1NO3 + .5*CO2 + .5*yROOH + .5*SumRO2';
k(:,i) = 2.20e-11;
Gstr{i,1} = 'R2CO3'; Gstr{i,2} = 'HO2';
fR2CO3(i)=fR2CO3(i)-1; fHO2(i)=fHO2(i)-1; fO3(i)=fO3(i)+.13; fOH(i)=fOH(i)+.5; fxHO2(i)=fxHO2(i)+.48; fRO2C(i)=fRO2C(i)+.48; fRO2XC(i)=fRO2XC(i)+.02; fxETCHO(i)=fxETCHO(i)+.48; fOACID(i)=fOACID(i)+.13; fPACID(i)=fPACID(i)+.37; fzR1NO3(i)=fzR1NO3(i)+.02; fCO2(i)=fCO2(i)+.5; fyROOH(i)=fyROOH(i)+.5; fSumRO2(i)=fSumRO2(i)+.5;

i=i+1;
Rnames{i} = 'R2CO3 + SumRO2 = .95*xHO2 + .96*RO2C + .04*RO2XC + .95*xETCHO + .04*zR1NO3 + CO2 + yROOH + SumRO2';
k(:,i) = 1.44e-11;
Gstr{i,1} = 'R2CO3'; Gstr{i,2} = 'SumRO2';
fR2CO3(i)=fR2CO3(i)-1; fSumRO2(i)=fSumRO2(i)-1; fxHO2(i)=fxHO2(i)+.95; fRO2C(i)=fRO2C(i)+.96; fRO2XC(i)=fRO2XC(i)+.04; fxETCHO(i)=fxETCHO(i)+.95; fzR1NO3(i)=fzR1NO3(i)+.04; fCO2(i)=fCO2(i)+1; fyROOH(i)=fyROOH(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'MACO3 = .93*xHO2 + .93*RO2C + .07*RO2XC + .93*xPACID + .07*zRCNO3 + SumRO2';
k(:,i) = 7.79e+08.*(T./300).^0.00.*exp(-5003.019./T);
Gstr{i,1} = 'MACO3';
fMACO3(i)=fMACO3(i)-1; fxHO2(i)=fxHO2(i)+.93; fRO2C(i)=fRO2C(i)+.93; fRO2XC(i)=fRO2XC(i)+.07; fxPACID(i)=fxPACID(i)+.93; fzRCNO3(i)=fzRCNO3(i)+.07; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'MACO3 + NO = NO2 + MEO2 + HCHO + CO + CO2 + SumRO2';
k(:,i) = 6.70e-12.*(T./300).^0.00.*exp(340.177./T);
Gstr{i,1} = 'MACO3'; Gstr{i,2} = 'NO';
fMACO3(i)=fMACO3(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fMEO2(i)=fMEO2(i)+1; fHCHO(i)=fHCHO(i)+1; fCO(i)=fCO(i)+1; fCO2(i)=fCO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'MACO3 + NO2 = APANS';
k(:,i) = 7.70e-12;
Gstr{i,1} = 'MACO3'; Gstr{i,2} = 'NO2';
fMACO3(i)=fMACO3(i)-1; fNO2(i)=fNO2(i)-1; fAPANS(i)=fAPANS(i)+1;

i=i+1;
Rnames{i} = 'ETHAN + OH = ETO2 + SumRO2';
k(:,i) = 1.51e-12.*(T./300).^1.92.*exp(-532.911./T);
Gstr{i,1} = 'ETHAN'; Gstr{i,2} = 'OH';
fETHAN(i)=fETHAN(i)-1; fOH(i)=fOH(i)-1; fETO2(i)=fETO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'PROP + OH = .95*xHO2 + .01*xMEO2 + .96*RO2C + .04*RO2XC + .01*xMECHO + .27*xETCHO + .68*xACET + .04*zR1NO3 + yROOH + SumRO2';
k(:,i) = 2.00e-12.*(T./300).^1.76.*exp(-172.101./T);
Gstr{i,1} = 'PROP'; Gstr{i,2} = 'OH';
fPROP(i)=fPROP(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.95; fxMEO2(i)=fxMEO2(i)+.01; fRO2C(i)=fRO2C(i)+.96; fRO2XC(i)=fRO2XC(i)+.04; fxMECHO(i)=fxMECHO(i)+.01; fxETCHO(i)=fxETCHO(i)+.27; fxACET(i)=fxACET(i)+.68; fzR1NO3(i)=fzR1NO3(i)+.04; fyROOH(i)=fyROOH(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'NC4 + OH = .59*xHO2 + .33*xETO2 + 1.02*RO2C + .08*RO2XC + .33*xMECHO + .12*xRCHO + .48*xMEK + .07*zR1NO3 + .01*zRHNO3 + 1.1*yROOH + 1.1*SumRO2';
k(:,i) = 2.09e-12.*(T./300).^1.82.*exp(41.767./T);
Gstr{i,1} = 'NC4'; Gstr{i,2} = 'OH';
fNC4(i)=fNC4(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.59; fxETO2(i)=fxETO2(i)+.33; fRO2C(i)=fRO2C(i)+1.02; fRO2XC(i)=fRO2XC(i)+.08; fxMECHO(i)=fxMECHO(i)+.33; fxRCHO(i)=fxRCHO(i)+.12; fxMEK(i)=fxMEK(i)+.48; fzR1NO3(i)=fzR1NO3(i)+.07; fzRHNO3(i)=fzRHNO3(i)+.01; fyROOH(i)=fyROOH(i)+1.1; fSumRO2(i)=fSumRO2(i)+1.1;

i=i+1;
Rnames{i} = 'ETHEN + OH = xHO2 + RO2C + 1.48*xHCHO + .26*xGLCHO + yROOH + SumRO2';
k(:,i) = kf_ETHEN_OH;
Gstr{i,1} = 'ETHEN'; Gstr{i,2} = 'OH';
fETHEN(i)=fETHEN(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+1; fRO2C(i)=fRO2C(i)+1; fxHCHO(i)=fxHCHO(i)+1.48; fxGLCHO(i)=fxGLCHO(i)+.26; fyROOH(i)=fyROOH(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'ETHEN + O3 = .17*OH + .27*HO2 + .42*HCHO2 + HCHO + .18*H2 + .35*CO + .23*CO2';
k(:,i) = 6.82e-15.*(T./300).^0.00.*exp(-2500.0./T);
Gstr{i,1} = 'ETHEN'; Gstr{i,2} = 'O3';
fETHEN(i)=fETHEN(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+.17; fHO2(i)=fHO2(i)+.27; fHCHO2(i)=fHCHO2(i)+.42; fHCHO(i)=fHCHO(i)+1; fH2(i)=fH2(i)+.18; fCO(i)=fCO(i)+.35; fCO2(i)=fCO2(i)+.23;

i=i+1;
Rnames{i} = 'ETHEN + NO3 = .01*xNO2 + .99*xHO2 + RO2C + .01*xHCHO + .99*xRCNO3 + yRPNO3 + SumRO2';
k(:,i) = 3.30e-12.*(T./300).^0.00.*exp(-2879.932./T);
Gstr{i,1} = 'ETHEN'; Gstr{i,2} = 'NO3';
fETHEN(i)=fETHEN(i)-1; fNO3(i)=fNO3(i)-1; fxNO2(i)=fxNO2(i)+.01; fxHO2(i)=fxHO2(i)+.99; fRO2C(i)=fRO2C(i)+1; fxHCHO(i)=fxHCHO(i)+.01; fxRCNO3(i)=fxRCNO3(i)+.99; fyRPNO3(i)=fyRPNO3(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'ETHEN + O3P = 1.09*HO2 + .51*MEO2 + .1*MECHO + .51*CO + 4.41*NROG + .51*SumRO2';
k(:,i) = 1.07e-11.*(T./300).^0.00.*exp(-800.121./T);
Gstr{i,1} = 'ETHEN'; Gstr{i,2} = 'O3P';
fETHEN(i)=fETHEN(i)-1; fO3P(i)=fO3P(i)-1; fHO2(i)=fHO2(i)+1.09; fMEO2(i)=fMEO2(i)+.51; fMECHO(i)=fMECHO(i)+.1; fCO(i)=fCO(i)+.51; fNROG(i)=fNROG(i)+4.41; fSumRO2(i)=fSumRO2(i)+.51;

i=i+1;
Rnames{i} = 'PROPE + OH = .97*xHO2 + .97*RO2C + .03*RO2XC + .97*xHCHO + .97*xMECHO + .03*zRHNO3 + yROOH + SumRO2';
k(:,i) = 1.20e-11.*(T./300).^-0.62.*exp(209.843./T);
Gstr{i,1} = 'PROPE'; Gstr{i,2} = 'OH';
fPROPE(i)=fPROPE(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.97; fRO2C(i)=fRO2C(i)+.97; fRO2XC(i)=fRO2XC(i)+.03; fxHCHO(i)=fxHCHO(i)+.97; fxMECHO(i)=fxMECHO(i)+.97; fzRHNO3(i)=fzRHNO3(i)+.03; fyROOH(i)=fyROOH(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'PROPE + O3 = PROPE_O3 + .3*OH + .17*HO2 + .16*xHO2 + .03*MEO2 + .21*HCHO2 + .12*MECHO2 + .22*RO2C + .5*HCHO + .05*xHCHO + .05*MEOH + .5*MECHO + .09*H2 + .22*CO + .24*CO2 + .09*CH4 + .25*SumRO2';
k(:,i) = 5.77e-15.*(T./300).^0.00.*exp(-1880.032./T);
Gstr{i,1} = 'PROPE'; Gstr{i,2} = 'O3';
fPROPE(i)=fPROPE(i)-1; fO3(i)=fO3(i)-1; fPROPE_O3(i)=fPROPE_O3(i)+1; fOH(i)=fOH(i)+.3; fHO2(i)=fHO2(i)+.17; fxHO2(i)=fxHO2(i)+.16; fMEO2(i)=fMEO2(i)+.03; fHCHO2(i)=fHCHO2(i)+.21; fMECHO2(i)=fMECHO2(i)+.12; fRO2C(i)=fRO2C(i)+.22; fHCHO(i)=fHCHO(i)+.5; fxHCHO(i)=fxHCHO(i)+.05; fMEOH(i)=fMEOH(i)+.05; fMECHO(i)=fMECHO(i)+.5; fH2(i)=fH2(i)+.09; fCO(i)=fCO(i)+.22; fCO2(i)=fCO2(i)+.24; fCH4(i)=fCH4(i)+.09; fSumRO2(i)=fSumRO2(i)+.25;

i=i+1;
Rnames{i} = 'PROPE_O3 = .05*xOH + .16*xPACID + .05*CO2';
k(:,i) = 2.45e+00;
Gstr{i,1} = 'PROPE_O3';
fPROPE_O3(i)=fPROPE_O3(i)-1; fxOH(i)=fxOH(i)+.05; fxPACID(i)=fxPACID(i)+.16; fCO2(i)=fCO2(i)+.05;

i=i+1;
Rnames{i} = 'PROPE_O3 + NO = NO + .06*xHO2 + .15*xHCHO + .2*CO + .18*yHPCRB';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'PROPE_O3'; Gstr{i,2} = 'NO';
fPROPE_O3(i)=fPROPE_O3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.06; fxHCHO(i)=fxHCHO(i)+.15; fCO(i)=fCO(i)+.2; fyHPCRB(i)=fyHPCRB(i)+.18;

i=i+1;
Rnames{i} = 'PROPE + NO3 = .29*xNO2 + .68*xHO2 + .97*RO2C + .03*RO2XC + .29*xHCHO + .29*xMECHO + .68*xRCNO3 + .03*zRDNO3 + yRPNO3 + SumRO2';
k(:,i) = 4.60e-13.*(T./300).^0.00.*exp(-1154.891./T);
Gstr{i,1} = 'PROPE'; Gstr{i,2} = 'NO3';
fPROPE(i)=fPROPE(i)-1; fNO3(i)=fNO3(i)-1; fxNO2(i)=fxNO2(i)+.29; fxHO2(i)=fxHO2(i)+.68; fRO2C(i)=fRO2C(i)+.97; fRO2XC(i)=fRO2XC(i)+.03; fxHCHO(i)=fxHCHO(i)+.29; fxMECHO(i)=fxMECHO(i)+.29; fxRCNO3(i)=fxRCNO3(i)+.68; fzRDNO3(i)=fzRDNO3(i)+.03; fyRPNO3(i)=fyRPNO3(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'PROPE + O3P = .25*ETCHO + .25*ACET + .5*ALK2';
k(:,i) = 1.02e-11.*(T./300).^0.00.*exp(-279.791./T);
Gstr{i,1} = 'PROPE'; Gstr{i,2} = 'O3P';
fPROPE(i)=fPROPE(i)-1; fO3P(i)=fO3P(i)-1; fETCHO(i)=fETCHO(i)+.25; fACET(i)=fACET(i)+.25; fALK2(i)=fALK2(i)+.5;

i=i+1;
Rnames{i} = 'ISOP + OH = ISOP_OH + .57*xHO2 + .55*RO2C + .05*RO2XC + .5*xHCHO + .23*xMACR + .27*xMVK + .05*zRHNO3 + .05*xFURNS + .6*yRUOOH + .6*SumRO2';
k(:,i) = 2.70e-11.*(T./300).^0.00.*exp(389.996./T);
Gstr{i,1} = 'ISOP'; Gstr{i,2} = 'OH';
fISOP(i)=fISOP(i)-1; fOH(i)=fOH(i)-1; fISOP_OH(i)=fISOP_OH(i)+1; fxHO2(i)=fxHO2(i)+.57; fRO2C(i)=fRO2C(i)+.55; fRO2XC(i)=fRO2XC(i)+.05; fxHCHO(i)=fxHCHO(i)+.5; fxMACR(i)=fxMACR(i)+.23; fxMVK(i)=fxMVK(i)+.27; fzRHNO3(i)=fzRHNO3(i)+.05; fxFURNS(i)=fxFURNS(i)+.05; fyRUOOH(i)=fyRUOOH(i)+.6; fSumRO2(i)=fSumRO2(i)+.6;

i=i+1;
Rnames{i} = 'ISOP_OH = .06*xOH + .32*HO2 + .31*HPCRB + .06*xHPCRB';
k(:,i) = 1.31e+00;
Gstr{i,1} = 'ISOP_OH';
fISOP_OH(i)=fISOP_OH(i)-1; fxOH(i)=fxOH(i)+.06; fHO2(i)=fHO2(i)+.32; fHPCRB(i)=fHPCRB(i)+.31; fxHPCRB(i)=fxHPCRB(i)+.06;

i=i+1;
Rnames{i} = 'ISOP_OH + NO = NO + .33*xHO2 + .38*RO2C + .05*RO2XC + .03*xHCHO + .34*xOLEA1 + .05*zRHNO3 + .42*yRUOOH + .43*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'ISOP_OH'; Gstr{i,2} = 'NO';
fISOP_OH(i)=fISOP_OH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.33; fRO2C(i)=fRO2C(i)+.38; fRO2XC(i)=fRO2XC(i)+.05; fxHCHO(i)=fxHCHO(i)+.03; fxOLEA1(i)=fxOLEA1(i)+.34; fzRHNO3(i)=fzRHNO3(i)+.05; fyRUOOH(i)=fyRUOOH(i)+.42; fSumRO2(i)=fSumRO2(i)+.43;

i=i+1;
Rnames{i} = 'ISOP + O3 = .13*OH + .62*HO2 + .16*MECO3 + .23*HCHO2 + .06*RCHO2 + .4*HCHO + .39*MACR + .16*MVK + .05*OLEP + .1*H2 + .33*CO + .13*CO2 + .16*SumRCO3';
k(:,i) = 1.05e-14.*(T./300).^0.00.*exp(-1999.799./T);
Gstr{i,1} = 'ISOP'; Gstr{i,2} = 'O3';
fISOP(i)=fISOP(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+.13; fHO2(i)=fHO2(i)+.62; fMECO3(i)=fMECO3(i)+.16; fHCHO2(i)=fHCHO2(i)+.23; fRCHO2(i)=fRCHO2(i)+.06; fHCHO(i)=fHCHO(i)+.4; fMACR(i)=fMACR(i)+.39; fMVK(i)=fMVK(i)+.16; fOLEP(i)=fOLEP(i)+.05; fH2(i)=fH2(i)+.1; fCO(i)=fCO(i)+.33; fCO2(i)=fCO2(i)+.13; fSumRCO3(i)=fSumRCO3(i)+.16;

i=i+1;
Rnames{i} = 'ISOP + NO3 = ISOP_N3 + .71*xNO2 + .07*xHO2 + .91*RO2C + .1*RO2XC + .49*xHCHO + .22*xOLEA1 + .48*xMVK + .04*xRCNO3 + .1*zRDNO3 + yRPNO3 + 1.01*SumRO2';
k(:,i) = 2.95e-12.*(T./300).^0.00.*exp(-449.879./T);
Gstr{i,1} = 'ISOP'; Gstr{i,2} = 'NO3';
fISOP(i)=fISOP(i)-1; fNO3(i)=fNO3(i)-1; fISOP_N3(i)=fISOP_N3(i)+1; fxNO2(i)=fxNO2(i)+.71; fxHO2(i)=fxHO2(i)+.07; fRO2C(i)=fRO2C(i)+.91; fRO2XC(i)=fRO2XC(i)+.1; fxHCHO(i)=fxHCHO(i)+.49; fxOLEA1(i)=fxOLEA1(i)+.22; fxMVK(i)=fxMVK(i)+.48; fxRCNO3(i)=fxRCNO3(i)+.04; fzRDNO3(i)=fzRDNO3(i)+.1; fyRPNO3(i)=fyRPNO3(i)+1; fSumRO2(i)=fSumRO2(i)+1.01;

i=i+1;
Rnames{i} = 'ISOP_N3 = .11*xNO2 + .04*xRPNO3 + .12*xHPCRB';
k(:,i) = 1.07e+00;
Gstr{i,1} = 'ISOP_N3';
fISOP_N3(i)=fISOP_N3(i)-1; fxNO2(i)=fxNO2(i)+.11; fxRPNO3(i)=fxRPNO3(i)+.04; fxHPCRB(i)=fxHPCRB(i)+.12;

i=i+1;
Rnames{i} = 'ISOP_N3 + NO = NO + .11*xHO2 + .14*RO2C + .01*RO2XC + .09*xHCHO + .05*xRHNO3 + .09*xRCNO3 + .01*zRDNO3 + .11*yRPNO3 + .15*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'ISOP_N3'; Gstr{i,2} = 'NO';
fISOP_N3(i)=fISOP_N3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.11; fRO2C(i)=fRO2C(i)+.14; fRO2XC(i)=fRO2XC(i)+.01; fxHCHO(i)=fxHCHO(i)+.09; fxRHNO3(i)=fxRHNO3(i)+.05; fxRCNO3(i)=fxRCNO3(i)+.09; fzRDNO3(i)=fzRDNO3(i)+.01; fyRPNO3(i)=fyRPNO3(i)+.11; fSumRO2(i)=fSumRO2(i)+.15;

i=i+1;
Rnames{i} = 'ISOP + O3P = .25*HO2 + .25*MEO2 + .75*OLEP + .25*SumRO2';
k(:,i) = 3.50e-11;
Gstr{i,1} = 'ISOP'; Gstr{i,2} = 'O3P';
fISOP(i)=fISOP(i)-1; fO3P(i)=fO3P(i)-1; fHO2(i)=fHO2(i)+.25; fMEO2(i)=fMEO2(i)+.25; fOLEP(i)=fOLEP(i)+.75; fSumRO2(i)=fSumRO2(i)+.25;

i=i+1;
Rnames{i} = 'BUT13 + OH = BUT13_OH + .63*xHO2 + .66*RO2C + .04*RO2XC + .61*xHCHO + .58*xACRO + .02*xOLEA1 + .04*zRHNO3 + .05*xFURNS + .69*yRUOOH + .7*SumRO2';
k(:,i) = 1.12e-11.*(T./300).^0.00.*exp(529.891./T);
Gstr{i,1} = 'BUT13'; Gstr{i,2} = 'OH';
fBUT13(i)=fBUT13(i)-1; fOH(i)=fOH(i)-1; fBUT13_OH(i)=fBUT13_OH(i)+1; fxHO2(i)=fxHO2(i)+.63; fRO2C(i)=fRO2C(i)+.66; fRO2XC(i)=fRO2XC(i)+.04; fxHCHO(i)=fxHCHO(i)+.61; fxACRO(i)=fxACRO(i)+.58; fxOLEA1(i)=fxOLEA1(i)+.02; fzRHNO3(i)=fzRHNO3(i)+.04; fxFURNS(i)=fxFURNS(i)+.05; fyRUOOH(i)=fyRUOOH(i)+.69; fSumRO2(i)=fSumRO2(i)+.7;

i=i+1;
Rnames{i} = 'BUT13_OH = .02*xOH + .31*HO2 + .31*HPCRB';
k(:,i) = 1.17e+00;
Gstr{i,1} = 'BUT13_OH';
fBUT13_OH(i)=fBUT13_OH(i)-1; fxOH(i)=fxOH(i)+.02; fHO2(i)=fHO2(i)+.31; fHPCRB(i)=fHPCRB(i)+.31;

i=i+1;
Rnames{i} = 'BUT13_OH + NO = NO + .31*xHO2 + .3*RO2C + .02*RO2XC + .29*xOLEA1 + .02*zRHNO3 + .33*yRUOOH + .32*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'BUT13_OH'; Gstr{i,2} = 'NO';
fBUT13_OH(i)=fBUT13_OH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.31; fRO2C(i)=fRO2C(i)+.3; fRO2XC(i)=fRO2XC(i)+.02; fxOLEA1(i)=fxOLEA1(i)+.29; fzRHNO3(i)=fzRHNO3(i)+.02; fyRUOOH(i)=fyRUOOH(i)+.33; fSumRO2(i)=fSumRO2(i)+.32;

i=i+1;
Rnames{i} = 'BUT13 + O3 = BUT13_O3 + .08*OH + .5*HO2 + .27*xHO2 + .21*HCHO2 + .14*RCHO2 + .36*RO2C + .5*HCHO + .09*xHCHO + .5*ACRO + .09*H2 + .54*CO + .12*CO2 + .36*SumRO2';
k(:,i) = 1.34e-14.*(T./300).^0.00.*exp(-2283.112./T);
Gstr{i,1} = 'BUT13'; Gstr{i,2} = 'O3';
fBUT13(i)=fBUT13(i)-1; fO3(i)=fO3(i)-1; fBUT13_O3(i)=fBUT13_O3(i)+1; fOH(i)=fOH(i)+.08; fHO2(i)=fHO2(i)+.5; fxHO2(i)=fxHO2(i)+.27; fHCHO2(i)=fHCHO2(i)+.21; fRCHO2(i)=fRCHO2(i)+.14; fRO2C(i)=fRO2C(i)+.36; fHCHO(i)=fHCHO(i)+.5; fxHCHO(i)=fxHCHO(i)+.09; fACRO(i)=fACRO(i)+.5; fH2(i)=fH2(i)+.09; fCO(i)=fCO(i)+.54; fCO2(i)=fCO2(i)+.12; fSumRO2(i)=fSumRO2(i)+.36;

i=i+1;
Rnames{i} = 'BUT13_O3 = .09*xOH + .27*xPACID + .09*CO2';
k(:,i) = 2.63e+00;
Gstr{i,1} = 'BUT13_O3';
fBUT13_O3(i)=fBUT13_O3(i)-1; fxOH(i)=fxOH(i)+.09; fxPACID(i)=fxPACID(i)+.27; fCO2(i)=fCO2(i)+.09;

i=i+1;
Rnames{i} = 'BUT13_O3 + NO = NO + .09*xHO2 + .25*xHCHO + .02*xGLY + .33*CO + .3*yHPCRB';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'BUT13_O3'; Gstr{i,2} = 'NO';
fBUT13_O3(i)=fBUT13_O3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.09; fxHCHO(i)=fxHCHO(i)+.25; fxGLY(i)=fxGLY(i)+.02; fCO(i)=fCO(i)+.33; fyHPCRB(i)=fyHPCRB(i)+.3;

i=i+1;
Rnames{i} = 'BUT13 + NO3 = .89*xNO2 + .06*xHO2 + .94*RO2C + .06*RO2XC + .74*xHCHO + .74*xACRO + .14*xOLEA1 + .06*xRCNO3 + .06*zRDNO3 + yRPNO3 + SumRO2';
k(:,i) = 1.10e-13;
Gstr{i,1} = 'BUT13'; Gstr{i,2} = 'NO3';
fBUT13(i)=fBUT13(i)-1; fNO3(i)=fNO3(i)-1; fxNO2(i)=fxNO2(i)+.89; fxHO2(i)=fxHO2(i)+.06; fRO2C(i)=fRO2C(i)+.94; fRO2XC(i)=fRO2XC(i)+.06; fxHCHO(i)=fxHCHO(i)+.74; fxACRO(i)=fxACRO(i)+.74; fxOLEA1(i)=fxOLEA1(i)+.14; fxRCNO3(i)=fxRCNO3(i)+.06; fzRDNO3(i)=fzRDNO3(i)+.06; fyRPNO3(i)=fyRPNO3(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'BUT13 + O3P = .25*OLEA2 + .25*MVK + .5*OLEP';
k(:,i) = 2.26e-11.*(T./300).^0.00.*exp(-39.754./T);
Gstr{i,1} = 'BUT13'; Gstr{i,2} = 'O3P';
fBUT13(i)=fBUT13(i)-1; fO3P(i)=fO3P(i)-1; fOLEA2(i)=fOLEA2(i)+.25; fMVK(i)=fMVK(i)+.25; fOLEP(i)=fOLEP(i)+.5;

i=i+1;
Rnames{i} = 'APINE + OH = APINE_OH + .01*HO2 + .67*xHO2 + 1.05*RO2C + .29*RO2XC + .08*xHCHO + .51*xRCHO + .08*xOLEA2 + .17*xACET + .06*xMVK + .03*xLVKS + .01*zR2NO3 + .28*zRHNO3 + .02*xHPCRB + .53*yROOH + .7*yRUOOH + .12*yHPCRB + 1.34*SumRO2';
k(:,i) = 1.34e-11.*(T./300).^0.00.*exp(410.125./T);
Gstr{i,1} = 'APINE'; Gstr{i,2} = 'OH';
fAPINE(i)=fAPINE(i)-1; fOH(i)=fOH(i)-1; fAPINE_OH(i)=fAPINE_OH(i)+1; fHO2(i)=fHO2(i)+.01; fxHO2(i)=fxHO2(i)+.67; fRO2C(i)=fRO2C(i)+1.05; fRO2XC(i)=fRO2XC(i)+.29; fxHCHO(i)=fxHCHO(i)+.08; fxRCHO(i)=fxRCHO(i)+.51; fxOLEA2(i)=fxOLEA2(i)+.08; fxACET(i)=fxACET(i)+.17; fxMVK(i)=fxMVK(i)+.06; fxLVKS(i)=fxLVKS(i)+.03; fzR2NO3(i)=fzR2NO3(i)+.01; fzRHNO3(i)=fzRHNO3(i)+.28; fxHPCRB(i)=fxHPCRB(i)+.02; fyROOH(i)=fyROOH(i)+.53; fyRUOOH(i)=fyRUOOH(i)+.7; fyHPCRB(i)=fyHPCRB(i)+.12; fSumRO2(i)=fSumRO2(i)+1.34;

i=i+1;
Rnames{i} = 'APINE_OH = .01*xOH + .07*xHPCRB';
k(:,i) = 3.93e+00;
Gstr{i,1} = 'APINE_OH';
fAPINE_OH(i)=fAPINE_OH(i)-1; fxOH(i)=fxOH(i)+.01; fxHPCRB(i)=fxHPCRB(i)+.07;

i=i+1;
Rnames{i} = 'APINE_OH + NO = NO + .07*RO2C + .02*RO2XC + .01*xHCHO + .06*xOLEA2 + .02*zRHNO3 + .09*yHPCRB + .09*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'APINE_OH'; Gstr{i,2} = 'NO';
fAPINE_OH(i)=fAPINE_OH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRO2C(i)=fRO2C(i)+.07; fRO2XC(i)=fRO2XC(i)+.02; fxHCHO(i)=fxHCHO(i)+.01; fxOLEA2(i)=fxOLEA2(i)+.06; fzRHNO3(i)=fzRHNO3(i)+.02; fyHPCRB(i)=fyHPCRB(i)+.09; fSumRO2(i)=fSumRO2(i)+.09;

i=i+1;
Rnames{i} = 'APINE + O3 = .68*OH + .03*xOH + .01*HO2 + .16*xHO2 + .03*xMECO3 + .2*xR2CO3 + .29*RCHO2 + .79*RO2C + .26*RO2XC + .2*xHCHO + .15*xRCHO + .09*xACET + .03*KET2 + .03*xBACL + .07*xPACID + .26*zRCNO3 + .17*CO + .03*CO2 + .81*yHPCRB + 1.05*SumRO2';
k(:,i) = 8.22e-16.*(T./300).^0.00.*exp(-640.097./T);
Gstr{i,1} = 'APINE'; Gstr{i,2} = 'O3';
fAPINE(i)=fAPINE(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+.68; fxOH(i)=fxOH(i)+.03; fHO2(i)=fHO2(i)+.01; fxHO2(i)=fxHO2(i)+.16; fxMECO3(i)=fxMECO3(i)+.03; fxR2CO3(i)=fxR2CO3(i)+.2; fRCHO2(i)=fRCHO2(i)+.29; fRO2C(i)=fRO2C(i)+.79; fRO2XC(i)=fRO2XC(i)+.26; fxHCHO(i)=fxHCHO(i)+.2; fxRCHO(i)=fxRCHO(i)+.15; fxACET(i)=fxACET(i)+.09; fKET2(i)=fKET2(i)+.03; fxBACL(i)=fxBACL(i)+.03; fxPACID(i)=fxPACID(i)+.07; fzRCNO3(i)=fzRCNO3(i)+.26; fCO(i)=fCO(i)+.17; fCO2(i)=fCO2(i)+.03; fyHPCRB(i)=fyHPCRB(i)+.81; fSumRO2(i)=fSumRO2(i)+1.05;

i=i+1;
Rnames{i} = 'APINE + NO3 = .81*xNO2 + .81*RO2C + .19*RO2XC + .81*xRCHO + .19*zRDNO3 + yRPNO3 + SumRO2';
k(:,i) = 1.20e-12.*(T./300).^0.00.*exp(490.137./T);
Gstr{i,1} = 'APINE'; Gstr{i,2} = 'NO3';
fAPINE(i)=fAPINE(i)-1; fNO3(i)=fNO3(i)-1; fxNO2(i)=fxNO2(i)+.81; fRO2C(i)=fRO2C(i)+.81; fRO2XC(i)=fRO2XC(i)+.19; fxRCHO(i)=fxRCHO(i)+.81; fzRDNO3(i)=fzRDNO3(i)+.19; fyRPNO3(i)=fyRPNO3(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'APINE + O3P = .5*KET2 + .5*ALK4';
k(:,i) = 3.20e-11;
Gstr{i,1} = 'APINE'; Gstr{i,2} = 'O3P';
fAPINE(i)=fAPINE(i)-1; fO3P(i)=fO3P(i)-1; fKET2(i)=fKET2(i)+.5; fALK4(i)=fALK4(i)+.5;

i=i+1;
Rnames{i} = 'BPINE + OH = BPINE_OH + .01*xOH + .49*xHO2 + .03*xR2CO3 + 1.45*RO2C + .43*RO2XC + .35*xHCHO + .03*xRCHO + .23*xOLEA2 + .29*xACET + .11*xKET2 + .02*xPACID + .02*zR2NO3 + .31*zRHNO3 + .09*zRCNO3 + .02*xHPCRB + .32*yROOH + yRUOOH + .47*yHPCRB + 1.88*SumRO2';
k(:,i) = 1.62e-11.*(T./300).^0.00.*exp(459.944./T);
Gstr{i,1} = 'BPINE'; Gstr{i,2} = 'OH';
fBPINE(i)=fBPINE(i)-1; fOH(i)=fOH(i)-1; fBPINE_OH(i)=fBPINE_OH(i)+1; fxOH(i)=fxOH(i)+.01; fxHO2(i)=fxHO2(i)+.49; fxR2CO3(i)=fxR2CO3(i)+.03; fRO2C(i)=fRO2C(i)+1.45; fRO2XC(i)=fRO2XC(i)+.43; fxHCHO(i)=fxHCHO(i)+.35; fxRCHO(i)=fxRCHO(i)+.03; fxOLEA2(i)=fxOLEA2(i)+.23; fxACET(i)=fxACET(i)+.29; fxKET2(i)=fxKET2(i)+.11; fxPACID(i)=fxPACID(i)+.02; fzR2NO3(i)=fzR2NO3(i)+.02; fzRHNO3(i)=fzRHNO3(i)+.31; fzRCNO3(i)=fzRCNO3(i)+.09; fxHPCRB(i)=fxHPCRB(i)+.02; fyROOH(i)=fyROOH(i)+.32; fyRUOOH(i)=fyRUOOH(i)+1; fyHPCRB(i)=fyHPCRB(i)+.47; fSumRO2(i)=fSumRO2(i)+1.88;

i=i+1;
Rnames{i} = 'BPINE_OH = .04*xOH + .01*HO2 + .04*xPACID + .1*xHPCRB + .01*CO2';
k(:,i) = 3.45e+00;
Gstr{i,1} = 'BPINE_OH';
fBPINE_OH(i)=fBPINE_OH(i)-1; fxOH(i)=fxOH(i)+.04; fHO2(i)=fHO2(i)+.01; fxPACID(i)=fxPACID(i)+.04; fxHPCRB(i)=fxHPCRB(i)+.1; fCO2(i)=fCO2(i)+.01;

i=i+1;
Rnames{i} = 'BPINE_OH + NO = NO + .13*RO2C + .03*RO2XC + .02*xHCHO + .01*xRCHO + .08*xOLEA2 + .03*zRHNO3 + .01*zRCNO3 + .01*yRUOOH + .19*yHPCRB + .16*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'BPINE_OH'; Gstr{i,2} = 'NO';
fBPINE_OH(i)=fBPINE_OH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRO2C(i)=fRO2C(i)+.13; fRO2XC(i)=fRO2XC(i)+.03; fxHCHO(i)=fxHCHO(i)+.02; fxRCHO(i)=fxRCHO(i)+.01; fxOLEA2(i)=fxOLEA2(i)+.08; fzRHNO3(i)=fzRHNO3(i)+.03; fzRCNO3(i)=fzRCNO3(i)+.01; fyRUOOH(i)=fyRUOOH(i)+.01; fyHPCRB(i)=fyHPCRB(i)+.19; fSumRO2(i)=fSumRO2(i)+.16;

i=i+1;
Rnames{i} = 'BPINE + O3 = .39*OH + .19*HO2 + .19*xR2CO3 + .21*HCHO2 + .2*RCHO2 + .19*RO2C + .06*RO2XC + .5*HCHO + .5*KET2 + .06*zRCNO3 + .09*H2 + .17*CO + .12*CO2 + .21*yHPCRB + .25*SumRO2';
k(:,i) = 1.39e-15.*(T./300).^0.00.*exp(-1280.193./T);
Gstr{i,1} = 'BPINE'; Gstr{i,2} = 'O3';
fBPINE(i)=fBPINE(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+.39; fHO2(i)=fHO2(i)+.19; fxR2CO3(i)=fxR2CO3(i)+.19; fHCHO2(i)=fHCHO2(i)+.21; fRCHO2(i)=fRCHO2(i)+.2; fRO2C(i)=fRO2C(i)+.19; fRO2XC(i)=fRO2XC(i)+.06; fHCHO(i)=fHCHO(i)+.5; fKET2(i)=fKET2(i)+.5; fzRCNO3(i)=fzRCNO3(i)+.06; fH2(i)=fH2(i)+.09; fCO(i)=fCO(i)+.17; fCO2(i)=fCO2(i)+.12; fyHPCRB(i)=fyHPCRB(i)+.21; fSumRO2(i)=fSumRO2(i)+.25;

i=i+1;
Rnames{i} = 'BPINE + NO3 = .06*xOH + .18*xHO2 + .14*xR2CO3 + 2.25*RO2C + .63*RO2XC + .04*xHCHO + .02*xRCHO + .27*xACET + .14*xPACID + .23*xRCNO3 + .43*zRCNO3 + .19*zRDNO3 + .04*CO2 + yRPNO3 + 2.88*SumRO2';
k(:,i) = 2.50e-12;
Gstr{i,1} = 'BPINE'; Gstr{i,2} = 'NO3';
fBPINE(i)=fBPINE(i)-1; fNO3(i)=fNO3(i)-1; fxOH(i)=fxOH(i)+.06; fxHO2(i)=fxHO2(i)+.18; fxR2CO3(i)=fxR2CO3(i)+.14; fRO2C(i)=fRO2C(i)+2.25; fRO2XC(i)=fRO2XC(i)+.63; fxHCHO(i)=fxHCHO(i)+.04; fxRCHO(i)=fxRCHO(i)+.02; fxACET(i)=fxACET(i)+.27; fxPACID(i)=fxPACID(i)+.14; fxRCNO3(i)=fxRCNO3(i)+.23; fzRCNO3(i)=fzRCNO3(i)+.43; fzRDNO3(i)=fzRDNO3(i)+.19; fCO2(i)=fCO2(i)+.04; fyRPNO3(i)=fyRPNO3(i)+1; fSumRO2(i)=fSumRO2(i)+2.88;

i=i+1;
Rnames{i} = 'BPINE + O3P = .5*RCHO + .5*ALK5';
k(:,i) = 2.70e-11;
Gstr{i,1} = 'BPINE'; Gstr{i,2} = 'O3P';
fBPINE(i)=fBPINE(i)-1; fO3P(i)=fO3P(i)-1; fRCHO(i)=fRCHO(i)+.5; fALK5(i)=fALK5(i)+.5;

i=i+1;
Rnames{i} = 'ACETL + OH = .67*OH + .33*HO2 + .33*HCOOH + .67*GLY + .33*CO*5.50e-30*0.000*0.00*8.30e-13*0.000*2.00*0.60*1.00';
k(:,i) = kf_ACETL_OH;
Gstr{i,1} = 'ACETL'; Gstr{i,2} = 'OH';
fACETL(i)=fACETL(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+.67; fHO2(i)=fHO2(i)+.33; fHCOOH(i)=fHCOOH(i)+.33; fGLY(i)=fGLY(i)+.67; fCO(i)=fCO(i)-.33;

i=i+1;
Rnames{i} = 'ACETL + O3 = .26*HO2 + .34*RCHO2 + .34*HCHO + .18*HCOOH + .31*CO + .47*CO2';
k(:,i) = 1.00e-20;
Gstr{i,1} = 'ACETL'; Gstr{i,2} = 'O3';
fACETL(i)=fACETL(i)-1; fO3(i)=fO3(i)-1; fHO2(i)=fHO2(i)+.26; fRCHO2(i)=fRCHO2(i)+.34; fHCHO(i)=fHCHO(i)+.34; fHCOOH(i)=fHCOOH(i)+.18; fCO(i)=fCO(i)+.31; fCO2(i)=fCO2(i)+.47;

i=i+1;
Rnames{i} = 'BENZ + OH = .69*HO2 + .28*xHO2 + .28*RO2C + .04*RO2XC + .28*xGLY + .12*OLEA2 + .57*PHEN + .28*xBUDAL + .04*zRANO3 + .31*yRAOOH + .32*SumRO2';
k(:,i) = 2.30e-12.*(T./300).^0.00.*exp(-190.217./T);
Gstr{i,1} = 'BENZ'; Gstr{i,2} = 'OH';
fBENZ(i)=fBENZ(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.69; fxHO2(i)=fxHO2(i)+.28; fRO2C(i)=fRO2C(i)+.28; fRO2XC(i)=fRO2XC(i)+.04; fxGLY(i)=fxGLY(i)+.28; fOLEA2(i)=fOLEA2(i)+.12; fPHEN(i)=fPHEN(i)+.57; fxBUDAL(i)=fxBUDAL(i)+.28; fzRANO3(i)=fzRANO3(i)+.04; fyRAOOH(i)=fyRAOOH(i)+.31; fSumRO2(i)=fSumRO2(i)+.32;

i=i+1;
Rnames{i} = 'TOLU + OH = .41*HO2 + .5*xHO2 + .5*RO2C + .08*RO2XC + .22*xGLY + .22*xMGLY + .01*OLEA1 + .2*OLEA2 + .19*CRES + .06*xBALD + .22*xBUDAL + .02*xAFG1 + .19*xAFG2A + .01*zR1NO3 + .07*zRANO3 + .08*yROOH + .51*yRAOOH + .58*SumRO2';
k(:,i) = 1.80e-12.*(T./300).^0.00.*exp(340.177./T);
Gstr{i,1} = 'TOLU'; Gstr{i,2} = 'OH';
fTOLU(i)=fTOLU(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.41; fxHO2(i)=fxHO2(i)+.5; fRO2C(i)=fRO2C(i)+.5; fRO2XC(i)=fRO2XC(i)+.08; fxGLY(i)=fxGLY(i)+.22; fxMGLY(i)=fxMGLY(i)+.22; fOLEA1(i)=fOLEA1(i)+.01; fOLEA2(i)=fOLEA2(i)+.2; fCRES(i)=fCRES(i)+.19; fxBALD(i)=fxBALD(i)+.06; fxBUDAL(i)=fxBUDAL(i)+.22; fxAFG1(i)=fxAFG1(i)+.02; fxAFG2A(i)=fxAFG2A(i)+.19; fzR1NO3(i)=fzR1NO3(i)+.01; fzRANO3(i)=fzRANO3(i)+.07; fyROOH(i)=fyROOH(i)+.08; fyRAOOH(i)=fyRAOOH(i)+.51; fSumRO2(i)=fSumRO2(i)+.58;

i=i+1;
Rnames{i} = 'OXYL + OH = .35*HO2 + .54*xHO2 + .54*RO2C + .11*RO2XC + .12*xGLY + .22*xMGLY + .1*OLEA1 + .1*OLEA2 + .06*LVKS + .15*xBACL + .08*XYNL + .06*xBALD + .15*xBUDAL + .01*xAFG1 + .22*xAFG2A + .11*xAFG2B + .02*zR2NO3 + .09*zRANO3 + .08*yROOH + .57*yRAOOH + .65*SumRO2';
k(:,i) = 1.36e-11;
Gstr{i,1} = 'OXYL'; Gstr{i,2} = 'OH';
fOXYL(i)=fOXYL(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.35; fxHO2(i)=fxHO2(i)+.54; fRO2C(i)=fRO2C(i)+.54; fRO2XC(i)=fRO2XC(i)+.11; fxGLY(i)=fxGLY(i)+.12; fxMGLY(i)=fxMGLY(i)+.22; fOLEA1(i)=fOLEA1(i)+.1; fOLEA2(i)=fOLEA2(i)+.1; fLVKS(i)=fLVKS(i)+.06; fxBACL(i)=fxBACL(i)+.15; fXYNL(i)=fXYNL(i)+.08; fxBALD(i)=fxBALD(i)+.06; fxBUDAL(i)=fxBUDAL(i)+.15; fxAFG1(i)=fxAFG1(i)+.01; fxAFG2A(i)=fxAFG2A(i)+.22; fxAFG2B(i)=fxAFG2B(i)+.11; fzR2NO3(i)=fzR2NO3(i)+.02; fzRANO3(i)=fzRANO3(i)+.09; fyROOH(i)=fyROOH(i)+.08; fyRAOOH(i)=fyRAOOH(i)+.57; fSumRO2(i)=fSumRO2(i)+.65;

i=i+1;
Rnames{i} = 'MXYL + OH = .21*HO2 + .66*xHO2 + .66*RO2C + .13*RO2XC + .04*xGLY + .59*xMGLY + .13*OLEA2 + .07*XYNL + .03*xBALD + .05*xAFG1 + .58*xAFG2A + .01*zR2NO3 + .12*zRANO3 + .03*yROOH + .75*yRAOOH + .79*SumRO2 + XYLRO2';
k(:,i) = 2.31e-11;
Gstr{i,1} = 'MXYL'; Gstr{i,2} = 'OH';
fMXYL(i)=fMXYL(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.21; fxHO2(i)=fxHO2(i)+.66; fRO2C(i)=fRO2C(i)+.66; fRO2XC(i)=fRO2XC(i)+.13; fxGLY(i)=fxGLY(i)+.04; fxMGLY(i)=fxMGLY(i)+.59; fOLEA2(i)=fOLEA2(i)+.13; fXYNL(i)=fXYNL(i)+.07; fxBALD(i)=fxBALD(i)+.03; fxAFG1(i)=fxAFG1(i)+.05; fxAFG2A(i)=fxAFG2A(i)+.58; fzR2NO3(i)=fzR2NO3(i)+.01; fzRANO3(i)=fzRANO3(i)+.12; fyROOH(i)=fyROOH(i)+.03; fyRAOOH(i)=fyRAOOH(i)+.75; fSumRO2(i)=fSumRO2(i)+.79; fXYLRO2(i)=fXYLRO2(i)+1;

i=i+1;
Rnames{i} = 'PXYL + OH = .38*HO2 + .52*xHO2 + .52*RO2C + .11*RO2XC + .16*xGLY + .29*xMGLY + .02*OLEA1 + .23*OLEA2 + .14*XYNL + .07*xBALD + .29*xAFG1 + .16*xAFG3 + .02*zR2NO3 + .09*zRANO3 + .09*yROOH + .53*yRAOOH + .63*SumRO2';
k(:,i) = 4.14e-12.*(T./300).^0.00.*exp(319.042./T);
Gstr{i,1} = 'PXYL'; Gstr{i,2} = 'OH';
fPXYL(i)=fPXYL(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.38; fxHO2(i)=fxHO2(i)+.52; fRO2C(i)=fRO2C(i)+.52; fRO2XC(i)=fRO2XC(i)+.11; fxGLY(i)=fxGLY(i)+.16; fxMGLY(i)=fxMGLY(i)+.29; fOLEA1(i)=fOLEA1(i)+.02; fOLEA2(i)=fOLEA2(i)+.23; fXYNL(i)=fXYNL(i)+.14; fxBALD(i)=fxBALD(i)+.07; fxAFG1(i)=fxAFG1(i)+.29; fxAFG3(i)=fxAFG3(i)+.16; fzR2NO3(i)=fzR2NO3(i)+.02; fzRANO3(i)=fzRANO3(i)+.09; fyROOH(i)=fyROOH(i)+.09; fyRAOOH(i)=fyRAOOH(i)+.53; fSumRO2(i)=fSumRO2(i)+.63;

i=i+1;
Rnames{i} = 'BZ123 + OH = .18*HO2 + .67*xHO2 + .67*RO2C + .15*RO2XC + .03*xGLY + .07*xMGLY + .03*OLEA1 + .03*OLEA2 + .1*LVKS + .54*xBACL + .02*XYNL + .02*xBALD + .54*xAFG2A + .1*xAFG2B + .01*zR2NO3 + .14*zRANO3 + .03*yROOH + .78*yRAOOH + .82*SumRO2';
k(:,i) = 3.27e-11;
Gstr{i,1} = 'BZ123'; Gstr{i,2} = 'OH';
fBZ123(i)=fBZ123(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.18; fxHO2(i)=fxHO2(i)+.67; fRO2C(i)=fRO2C(i)+.67; fRO2XC(i)=fRO2XC(i)+.15; fxGLY(i)=fxGLY(i)+.03; fxMGLY(i)=fxMGLY(i)+.07; fOLEA1(i)=fOLEA1(i)+.03; fOLEA2(i)=fOLEA2(i)+.03; fLVKS(i)=fLVKS(i)+.1; fxBACL(i)=fxBACL(i)+.54; fXYNL(i)=fXYNL(i)+.02; fxBALD(i)=fxBALD(i)+.02; fxAFG2A(i)=fxAFG2A(i)+.54; fxAFG2B(i)=fxAFG2B(i)+.1; fzR2NO3(i)=fzR2NO3(i)+.01; fzRANO3(i)=fzRANO3(i)+.14; fyROOH(i)=fyROOH(i)+.03; fyRAOOH(i)=fyRAOOH(i)+.78; fSumRO2(i)=fSumRO2(i)+.82;

i=i+1;
Rnames{i} = 'BZ124 + OH = .23*HO2 + .63*xHO2 + .63*RO2C + .14*RO2XC + .03*xGLY + .51*xMGLY + .04*OLEA1 + .11*OLEA2 + .02*LVKS + .06*xBACL + .05*XYNL + .03*xBALD + .08*xAFG1 + .04*xAFG2A + .27*xAFG2B + .21*xAFG3 + .01*zR2NO3 + .13*zRANO3 + .04*yROOH + .73*yRAOOH + .77*SumRO2';
k(:,i) = 3.25e-11;
Gstr{i,1} = 'BZ124'; Gstr{i,2} = 'OH';
fBZ124(i)=fBZ124(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.23; fxHO2(i)=fxHO2(i)+.63; fRO2C(i)=fRO2C(i)+.63; fRO2XC(i)=fRO2XC(i)+.14; fxGLY(i)=fxGLY(i)+.03; fxMGLY(i)=fxMGLY(i)+.51; fOLEA1(i)=fOLEA1(i)+.04; fOLEA2(i)=fOLEA2(i)+.11; fLVKS(i)=fLVKS(i)+.02; fxBACL(i)=fxBACL(i)+.06; fXYNL(i)=fXYNL(i)+.05; fxBALD(i)=fxBALD(i)+.03; fxAFG1(i)=fxAFG1(i)+.08; fxAFG2A(i)=fxAFG2A(i)+.04; fxAFG2B(i)=fxAFG2B(i)+.27; fxAFG3(i)=fxAFG3(i)+.21; fzR2NO3(i)=fzR2NO3(i)+.01; fzRANO3(i)=fzRANO3(i)+.13; fyROOH(i)=fyROOH(i)+.04; fyRAOOH(i)=fyRAOOH(i)+.73; fSumRO2(i)=fSumRO2(i)+.77;

i=i+1;
Rnames{i} = 'BZ135 + OH = .17*HO2 + .68*xHO2 + .68*RO2C + .15*RO2XC + .67*xMGLY + .11*OLEA2 + .05*XYNL + .02*xBALD + .67*xAFG2A + .01*zR2NO3 + .15*zRANO3 + .02*yROOH + .81*yRAOOH + .83*SumRO2';
k(:,i) = 5.86e-11;
Gstr{i,1} = 'BZ135'; Gstr{i,2} = 'OH';
fBZ135(i)=fBZ135(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.17; fxHO2(i)=fxHO2(i)+.68; fRO2C(i)=fRO2C(i)+.68; fRO2XC(i)=fRO2XC(i)+.15; fxMGLY(i)=fxMGLY(i)+.67; fOLEA2(i)=fOLEA2(i)+.11; fXYNL(i)=fXYNL(i)+.05; fxBALD(i)=fxBALD(i)+.02; fxAFG2A(i)=fxAFG2A(i)+.67; fzR2NO3(i)=fzR2NO3(i)+.01; fzRANO3(i)=fzRANO3(i)+.15; fyROOH(i)=fyROOH(i)+.02; fyRAOOH(i)=fyRAOOH(i)+.81; fSumRO2(i)=fSumRO2(i)+.83;

i=i+1;
Rnames{i} = 'C2BEN + OH = .36*HO2 + .51*xHO2 + .01*xMEO2 + .54*RO2C + .12*RO2XC + .02*xHCHO + .18*xGLY + .18*xMGLY + .01*OLEA1 + .17*OLEA2 + .16*XYNL + .03*xBALD + .18*xBUDAL + .02*xAFG1 + .16*xAFG2A + .05*zR2NO3 + .07*zRANO3 + .13*xBENX + .23*yROOH + .44*yRAOOH + .66*SumRO2';
k(:,i) = 7.00e-12;
Gstr{i,1} = 'C2BEN'; Gstr{i,2} = 'OH';
fC2BEN(i)=fC2BEN(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.36; fxHO2(i)=fxHO2(i)+.51; fxMEO2(i)=fxMEO2(i)+.01; fRO2C(i)=fRO2C(i)+.54; fRO2XC(i)=fRO2XC(i)+.12; fxHCHO(i)=fxHCHO(i)+.02; fxGLY(i)=fxGLY(i)+.18; fxMGLY(i)=fxMGLY(i)+.18; fOLEA1(i)=fOLEA1(i)+.01; fOLEA2(i)=fOLEA2(i)+.17; fXYNL(i)=fXYNL(i)+.16; fxBALD(i)=fxBALD(i)+.03; fxBUDAL(i)=fxBUDAL(i)+.18; fxAFG1(i)=fxAFG1(i)+.02; fxAFG2A(i)=fxAFG2A(i)+.16; fzR2NO3(i)=fzR2NO3(i)+.05; fzRANO3(i)=fzRANO3(i)+.07; fxBENX(i)=fxBENX(i)+.13; fyROOH(i)=fyROOH(i)+.23; fyRAOOH(i)=fyRAOOH(i)+.44; fSumRO2(i)=fSumRO2(i)+.66;

i=i+1;
Rnames{i} = 'MTBE + OH = .72*xHO2 + .19*xMEO2 + 1.12*RO2C + .09*RO2XC + .2*xHCHO + .09*zR1NO3 + .17*ALK1 + .72*ALK2 + .01*ALK3 + .89*yROOH + 1.21*SumRO2';
k(:,i) = 1.87e-13.*(T./300).^3.34.*exp(842.895./T);
Gstr{i,1} = 'MTBE'; Gstr{i,2} = 'OH';
fMTBE(i)=fMTBE(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.72; fxMEO2(i)=fxMEO2(i)+.19; fRO2C(i)=fRO2C(i)+1.12; fRO2XC(i)=fRO2XC(i)+.09; fxHCHO(i)=fxHCHO(i)+.2; fzR1NO3(i)=fzR1NO3(i)+.09; fALK1(i)=fALK1(i)+.17; fALK2(i)=fALK2(i)+.72; fALK3(i)=fALK3(i)+.01; fyROOH(i)=fyROOH(i)+.89; fSumRO2(i)=fSumRO2(i)+1.21;

i=i+1;
Rnames{i} = 'MEOH + OH = HO2 + HCHO';
k(:,i) = 2.32e-13.*(T./300).^2.72.*exp(402.073./T);
Gstr{i,1} = 'MEOH'; Gstr{i,2} = 'OH';
fMEOH(i)=fMEOH(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; fHCHO(i)=fHCHO(i)+1;

i=i+1;
Rnames{i} = 'HCOOH + OH = HO2 + CO2';
k(:,i) = 4.50e-13;
Gstr{i,1} = 'HCOOH'; Gstr{i,2} = 'OH';
fHCOOH(i)=fHCOOH(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; fCO2(i)=fCO2(i)+1;

i=i+1;
Rnames{i} = 'MEOOH + OH = .03*OH + .97*MEO2 + .03*HCHO + .97*SumRO2';
k(:,i) = 5.30e-12.*(T./300).^0.00.*exp(190.217./T);
Gstr{i,1} = 'MEOOH'; Gstr{i,2} = 'OH';
fMEOOH(i)=fMEOOH(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+.03; fMEO2(i)=fMEO2(i)+.97; fHCHO(i)=fHCHO(i)+.03; fSumRO2(i)=fSumRO2(i)+.97;

i=i+1;
Rnames{i} = 'MEOOH + HV = OH + HO2 + HCHO';
k(:,i) = JCOOH;
Gstr{i,1} = 'MEOOH';
fMEOOH(i)=fMEOOH(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; fHCHO(i)=fHCHO(i)+1;

i=i+1;
Rnames{i} = 'MECHO + OH = .01*xOH + .04*xHO2 + .95*MECO3 + .05*RO2C + .02*xHCHO + .03*xPACID + .01*CO + .01*CO2 + .01*yHPCRB + .05*SumRO2 + .95*SumRCO3';
k(:,i) = 2.40e-12.*(T./300).^0.77.*exp(545.994./T);
Gstr{i,1} = 'MECHO'; Gstr{i,2} = 'OH';
fMECHO(i)=fMECHO(i)-1; fOH(i)=fOH(i)-1; fxOH(i)=fxOH(i)+.01; fxHO2(i)=fxHO2(i)+.04; fMECO3(i)=fMECO3(i)+.95; fRO2C(i)=fRO2C(i)+.05; fxHCHO(i)=fxHCHO(i)+.02; fxPACID(i)=fxPACID(i)+.03; fCO(i)=fCO(i)+.01; fCO2(i)=fCO2(i)+.01; fyHPCRB(i)=fyHPCRB(i)+.01; fSumRO2(i)=fSumRO2(i)+.05; fSumRCO3(i)=fSumRCO3(i)+.95;

i=i+1;
Rnames{i} = 'MECHO + NO3 = HNO3 + MECO3 + SumRCO3';
k(:,i) = 1.40e-12.*(T./300).^0.00.*exp(-1859.903./T);
Gstr{i,1} = 'MECHO'; Gstr{i,2} = 'NO3';
fMECHO(i)=fMECHO(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fMECO3(i)=fMECO3(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'MECHO + HV = HO2 + .9*MEO2 + .1*MECO3 + .9*CO + .9*SumRO2 + .1*SumRCO3';
k(:,i) = JCCHOR_13;
Gstr{i,1} = 'MECHO';
fMECHO(i)=fMECHO(i)-1; fHO2(i)=fHO2(i)+1; fMEO2(i)=fMEO2(i)+.9; fMECO3(i)=fMECO3(i)+.1; fCO(i)=fCO(i)+.9; fSumRO2(i)=fSumRO2(i)+.9; fSumRCO3(i)=fSumRCO3(i)+.1;

i=i+1;
Rnames{i} = 'ETOH + OH = .95*HO2 + .05*xHO2 + .05*RO2C + .07*xHCHO + .95*MECHO + .01*xGLCHO + .05*yROOH + .05*SumRO2';
k(:,i) = 4.42e-13.*(T./300).^2.29.*exp(605.878./T);
Gstr{i,1} = 'ETOH'; Gstr{i,2} = 'OH';
fETOH(i)=fETOH(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.95; fxHO2(i)=fxHO2(i)+.05; fRO2C(i)=fRO2C(i)+.05; fxHCHO(i)=fxHCHO(i)+.07; fMECHO(i)=fMECHO(i)+.95; fxGLCHO(i)=fxGLCHO(i)+.01; fyROOH(i)=fyROOH(i)+.05; fSumRO2(i)=fSumRO2(i)+.05;

i=i+1;
Rnames{i} = 'GLCHO + OH = .2*HO2 + .8*R2CO3 + .2*GLY + .8*SumRCO3';
k(:,i) = 1.10e-11;
Gstr{i,1} = 'GLCHO'; Gstr{i,2} = 'OH';
fGLCHO(i)=fGLCHO(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.2; fR2CO3(i)=fR2CO3(i)+.8; fGLY(i)=fGLY(i)+.2; fSumRCO3(i)=fSumRCO3(i)+.8;

i=i+1;
Rnames{i} = 'GLCHO + NO3 = HNO3 + .1*HO2 + .9*R2CO3 + .1*GLY + .9*SumRCO3';
k(:,i) = 1.84e-14;
Gstr{i,1} = 'GLCHO'; Gstr{i,2} = 'NO3';
fGLCHO(i)=fGLCHO(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fHO2(i)=fHO2(i)+.1; fR2CO3(i)=fR2CO3(i)+.9; fGLY(i)=fGLY(i)+.1; fSumRCO3(i)=fSumRCO3(i)+.9;

i=i+1;
Rnames{i} = 'GLCHO + HV = .07*OH + .01*xOH + 1.66*HO2 + .06*xHO2 + .07*RO2C + .83*HCHO + .03*xHCHO + .1*MEOH + .04*xPACID + .95*CO + .01*CO2 + .02*yHPCRB + .07*SumRO2';
k(:,i) = JGLALD_14;
Gstr{i,1} = 'GLCHO';
fGLCHO(i)=fGLCHO(i)-1; fOH(i)=fOH(i)+.07; fxOH(i)=fxOH(i)+.01; fHO2(i)=fHO2(i)+1.66; fxHO2(i)=fxHO2(i)+.06; fRO2C(i)=fRO2C(i)+.07; fHCHO(i)=fHCHO(i)+.83; fxHCHO(i)=fxHCHO(i)+.03; fMEOH(i)=fMEOH(i)+.1; fxPACID(i)=fxPACID(i)+.04; fCO(i)=fCO(i)+.95; fCO2(i)=fCO2(i)+.01; fyHPCRB(i)=fyHPCRB(i)+.02; fSumRO2(i)=fSumRO2(i)+.07;

i=i+1;
Rnames{i} = 'ETCHO + OH = .04*xHO2 + .96*R2CO3 + .04*RO2C + .04*xMECHO + .01*xPACID + .04*CO + .03*yHPCRB + .04*SumRO2 + .96*SumRCO3';
k(:,i) = 6.63e-13.*(T./300).^1.99.*exp(1018.015./T);
Gstr{i,1} = 'ETCHO'; Gstr{i,2} = 'OH';
fETCHO(i)=fETCHO(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.04; fR2CO3(i)=fR2CO3(i)+.96; fRO2C(i)=fRO2C(i)+.04; fxMECHO(i)=fxMECHO(i)+.04; fxPACID(i)=fxPACID(i)+.01; fCO(i)=fCO(i)+.04; fyHPCRB(i)=fyHPCRB(i)+.03; fSumRO2(i)=fSumRO2(i)+.04; fSumRCO3(i)=fSumRCO3(i)+.96;

i=i+1;
Rnames{i} = 'ETCHO + NO3 = HNO3 + R2CO3 + SumRCO3';
k(:,i) = 6.30e-15;
Gstr{i,1} = 'ETCHO'; Gstr{i,2} = 'NO3';
fETCHO(i)=fETCHO(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fR2CO3(i)=fR2CO3(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'ETCHO + HV = HO2 + ETO2 + CO + SumRO2';
k(:,i) = JC2CHO;
Gstr{i,1} = 'ETCHO';
fETCHO(i)=fETCHO(i)-1; fHO2(i)=fHO2(i)+1; fETO2(i)=fETO2(i)+1; fCO(i)=fCO(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'ACRO + OH = ACRO_OH + .31*xHO2 + .68*MACO3 + .31*RO2C + .01*RO2XC + .07*xHCHO + .24*xGLCHO + .01*xGLY + .01*zRHNO3 + .24*CO + .22*yHPCRB + .32*SumRO2 + .68*SumRCO3';
k(:,i) = 7.10e-12.*(T./300).^0.00.*exp(333.132./T);
Gstr{i,1} = 'ACRO'; Gstr{i,2} = 'OH';
fACRO(i)=fACRO(i)-1; fOH(i)=fOH(i)-1; fACRO_OH(i)=fACRO_OH(i)+1; fxHO2(i)=fxHO2(i)+.31; fMACO3(i)=fMACO3(i)+.68; fRO2C(i)=fRO2C(i)+.31; fRO2XC(i)=fRO2XC(i)+.01; fxHCHO(i)=fxHCHO(i)+.07; fxGLCHO(i)=fxGLCHO(i)+.24; fxGLY(i)=fxGLY(i)+.01; fzRHNO3(i)=fzRHNO3(i)+.01; fCO(i)=fCO(i)+.24; fyHPCRB(i)=fyHPCRB(i)+.22; fSumRO2(i)=fSumRO2(i)+.32; fSumRCO3(i)=fSumRCO3(i)+.68;

i=i+1;
Rnames{i} = 'ACRO_OH = .06*xPACID';
k(:,i) = 1.12e+00;
Gstr{i,1} = 'ACRO_OH';
fACRO_OH(i)=fACRO_OH(i)-1; fxPACID(i)=fxPACID(i)+.06;

i=i+1;
Rnames{i} = 'ACRO_OH + NO = NO + .06*xGLY + .06*yHPCRB';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'ACRO_OH'; Gstr{i,2} = 'NO';
fACRO_OH(i)=fACRO_OH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxGLY(i)=fxGLY(i)+.06; fyHPCRB(i)=fyHPCRB(i)+.06;

i=i+1;
Rnames{i} = 'ACRO + O3 = .15*OH + .27*HO2 + .38*HCHO2 + .03*RCHO2 + .13*HCHO + .02*HCOOH + .9*GLY + .16*H2 + .34*CO + .26*CO2';
k(:,i) = 2.80e-19;
Gstr{i,1} = 'ACRO'; Gstr{i,2} = 'O3';
fACRO(i)=fACRO(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+.15; fHO2(i)=fHO2(i)+.27; fHCHO2(i)=fHCHO2(i)+.38; fRCHO2(i)=fRCHO2(i)+.03; fHCHO(i)=fHCHO(i)+.13; fHCOOH(i)=fHCOOH(i)+.02; fGLY(i)=fGLY(i)+.9; fH2(i)=fH2(i)+.16; fCO(i)=fCO(i)+.34; fCO2(i)=fCO2(i)+.26;

i=i+1;
Rnames{i} = 'ACRO + NO3 = .94*HNO3 + .06*xHO2 + .94*MACO3 + .06*RO2C + .06*xRCNO3 + .06*CO + .05*yRPNO3 + .06*SumRO2 + .94*SumRCO3';
k(:,i) = 1.10e-15;
Gstr{i,1} = 'ACRO'; Gstr{i,2} = 'NO3';
fACRO(i)=fACRO(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+.94; fxHO2(i)=fxHO2(i)+.06; fMACO3(i)=fMACO3(i)+.94; fRO2C(i)=fRO2C(i)+.06; fxRCNO3(i)=fxRCNO3(i)+.06; fCO(i)=fCO(i)+.06; fyRPNO3(i)=fyRPNO3(i)+.05; fSumRO2(i)=fSumRO2(i)+.06; fSumRCO3(i)=fSumRCO3(i)+.94;

i=i+1;
Rnames{i} = 'ACRO + HV = ACRO_HV + .22*OH + .49*HO2 + .17*xHO2 + .05*MEO2 + .15*MACO3 + .22*RO2C + .15*HCHO + .06*xHCHO + .06*MEOH + 1.06*CO + .16*CO2 + .12*CH4 + .25*ETHEN + .27*SumRO2 + .15*SumRCO3';
k(:,i) = JACROL_16;
Gstr{i,1} = 'ACRO';
fACRO(i)=fACRO(i)-1; fACRO_HV(i)=fACRO_HV(i)+1; fOH(i)=fOH(i)+.22; fHO2(i)=fHO2(i)+.49; fxHO2(i)=fxHO2(i)+.17; fMEO2(i)=fMEO2(i)+.05; fMACO3(i)=fMACO3(i)+.15; fRO2C(i)=fRO2C(i)+.22; fHCHO(i)=fHCHO(i)+.15; fxHCHO(i)=fxHCHO(i)+.06; fMEOH(i)=fMEOH(i)+.06; fCO(i)=fCO(i)+1.06; fCO2(i)=fCO2(i)+.16; fCH4(i)=fCH4(i)+.12; fETHEN(i)=fETHEN(i)+.25; fSumRO2(i)=fSumRO2(i)+.27; fSumRCO3(i)=fSumRCO3(i)+.15;

i=i+1;
Rnames{i} = 'ACRO_HV = .06*xOH + .17*xPACID + .06*CO2';
k(:,i) = 2.46e+00;
Gstr{i,1} = 'ACRO_HV';
fACRO_HV(i)=fACRO_HV(i)-1; fxOH(i)=fxOH(i)+.06; fxPACID(i)=fxPACID(i)+.17; fCO2(i)=fCO2(i)+.06;

i=i+1;
Rnames{i} = 'ACRO_HV + NO = NO + .05*xHO2 + .15*xHCHO + .21*CO + .19*yHPCRB';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'ACRO_HV'; Gstr{i,2} = 'NO';
fACRO_HV(i)=fACRO_HV(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.05; fxHCHO(i)=fxHCHO(i)+.15; fCO(i)=fCO(i)+.21; fyHPCRB(i)=fyHPCRB(i)+.19;

i=i+1;
Rnames{i} = 'ACET + OH = .96*xMECO3 + .96*RO2C + .04*RO2XC + .96*xHCHO + .04*zRCNO3 + .85*yHPCRB + SumRO2';
k(:,i) = 1.97e-14.*(T./300).^3.88.*exp(677.838./T);
Gstr{i,1} = 'ACET'; Gstr{i,2} = 'OH';
fACET(i)=fACET(i)-1; fOH(i)=fOH(i)-1; fxMECO3(i)=fxMECO3(i)+.96; fRO2C(i)=fRO2C(i)+.96; fRO2XC(i)=fRO2XC(i)+.04; fxHCHO(i)=fxHCHO(i)+.96; fzRCNO3(i)=fzRCNO3(i)+.04; fyHPCRB(i)=fyHPCRB(i)+.85; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'ACET + HV = MEO2 + MECO3 + SumRO2 + SumRCO3';
k(:,i) = JACET_06;
Gstr{i,1} = 'ACET';
fACET(i)=fACET(i)-1; fMEO2(i)=fMEO2(i)+1; fMECO3(i)=fMECO3(i)+1; fSumRO2(i)=fSumRO2(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'MEK + OH = .29*xHO2 + .55*xMECO3 + .08*xR2CO3 + .94*RO2C + .07*RO2XC + .11*xHCHO + .54*xMECHO + .29*xRCHO + .07*zRCNO3 + .91*yHPCRB + 1.01*SumRO2';
k(:,i) = 5.42e-14.*(T./300).^3.57.*exp(889.191./T);
Gstr{i,1} = 'MEK'; Gstr{i,2} = 'OH';
fMEK(i)=fMEK(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.29; fxMECO3(i)=fxMECO3(i)+.55; fxR2CO3(i)=fxR2CO3(i)+.08; fRO2C(i)=fRO2C(i)+.94; fRO2XC(i)=fRO2XC(i)+.07; fxHCHO(i)=fxHCHO(i)+.11; fxMECHO(i)=fxMECHO(i)+.54; fxRCHO(i)=fxRCHO(i)+.29; fzRCNO3(i)=fzRCNO3(i)+.07; fyHPCRB(i)=fyHPCRB(i)+.91; fSumRO2(i)=fSumRO2(i)+1.01;

i=i+1;
Rnames{i} = 'MEK + HV = .15*MEO2 + .85*ETO2 + .85*MECO3 + .15*R2CO3 + SumRO2 + SumRCO3';
k(:,i) = JMEK_06.*1.75e-1;
Gstr{i,1} = 'MEK';
fMEK(i)=fMEK(i)-1; fMEO2(i)=fMEO2(i)+.15; fETO2(i)=fETO2(i)+.85; fMECO3(i)=fMECO3(i)+.85; fR2CO3(i)=fR2CO3(i)+.15; fSumRO2(i)=fSumRO2(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'MACR + OH = MACR_OH + .05*xHO2 + .21*MACO3 + .75*RO2C + .04*RO2XC + .05*xHCHO + .61*xKET2 + .79*SumRO2 + .21*SumRCO3';
k(:,i) = 8.00e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'MACR'; Gstr{i,2} = 'OH';
fMACR(i)=fMACR(i)-1; fOH(i)=fOH(i)-1; fMACR_OH(i)=fMACR_OH(i)+1; fxHO2(i)=fxHO2(i)+.05; fMACO3(i)=fMACO3(i)+.21; fRO2C(i)=fRO2C(i)+.75; fRO2XC(i)=fRO2XC(i)+.04; fxHCHO(i)=fxHCHO(i)+.05; fxKET2(i)=fxKET2(i)+.61; fSumRO2(i)=fSumRO2(i)+.79; fSumRCO3(i)=fSumRCO3(i)+.21;

i=i+1;
Rnames{i} = 'MACR_OH = .69*xOH + .08*xKET2 + .05*xPACID + .04*zRCNO3 + .69*CO2';
k(:,i) = 5.55e-01;
Gstr{i,1} = 'MACR_OH';
fMACR_OH(i)=fMACR_OH(i)-1; fxOH(i)=fxOH(i)+.69; fxKET2(i)=fxKET2(i)+.08; fxPACID(i)=fxPACID(i)+.05; fzRCNO3(i)=fzRCNO3(i)+.04; fCO2(i)=fCO2(i)+.69;

i=i+1;
Rnames{i} = 'MACR_OH + NO = NO + .69*xHO2 + .09*xHCHO + .14*xMGLY + .04*zRHNO3 + .61*CO + .68*yHPCRB';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'MACR_OH'; Gstr{i,2} = 'NO';
fMACR_OH(i)=fMACR_OH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.69; fxHCHO(i)=fxHCHO(i)+.09; fxMGLY(i)=fxMGLY(i)+.14; fzRHNO3(i)=fzRHNO3(i)+.04; fCO(i)=fCO(i)+.61; fyHPCRB(i)=fyHPCRB(i)+.68;

i=i+1;
Rnames{i} = 'MACR + O3 = .19*OH + .01*xOH + .25*HO2 + .03*xHO2 + .01*MECO3 + .38*HCHO2 + .03*RCHO2 + .04*RO2C + .1*HCHO + .02*xHCHO + .02*MECHO + .9*MGLY + .01*OACID + .02*xPACID + .16*H2 + .38*CO + .24*CO2 + .01*yHPCRB + .04*SumRO2 + .01*SumRCO3';
k(:,i) = 1.40e-15.*(T./300).^0.00.*exp(-2099.94./T);
Gstr{i,1} = 'MACR'; Gstr{i,2} = 'O3';
fMACR(i)=fMACR(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+.19; fxOH(i)=fxOH(i)+.01; fHO2(i)=fHO2(i)+.25; fxHO2(i)=fxHO2(i)+.03; fMECO3(i)=fMECO3(i)+.01; fHCHO2(i)=fHCHO2(i)+.38; fRCHO2(i)=fRCHO2(i)+.03; fRO2C(i)=fRO2C(i)+.04; fHCHO(i)=fHCHO(i)+.1; fxHCHO(i)=fxHCHO(i)+.02; fMECHO(i)=fMECHO(i)+.02; fMGLY(i)=fMGLY(i)+.9; fOACID(i)=fOACID(i)+.01; fxPACID(i)=fxPACID(i)+.02; fH2(i)=fH2(i)+.16; fCO(i)=fCO(i)+.38; fCO2(i)=fCO2(i)+.24; fyHPCRB(i)=fyHPCRB(i)+.01; fSumRO2(i)=fSumRO2(i)+.04; fSumRCO3(i)=fSumRCO3(i)+.01;

i=i+1;
Rnames{i} = 'MACR + NO3 = MACR_N3 + .3*HNO3 + .3*MACO3 + .66*RO2C + .04*RO2XC + .66*xRCNO3 + .7*SumRO2 + .3*SumRCO3';
k(:,i) = 3.40e-15;
Gstr{i,1} = 'MACR'; Gstr{i,2} = 'NO3';
fMACR(i)=fMACR(i)-1; fNO3(i)=fNO3(i)-1; fMACR_N3(i)=fMACR_N3(i)+1; fHNO3(i)=fHNO3(i)+.3; fMACO3(i)=fMACO3(i)+.3; fRO2C(i)=fRO2C(i)+.66; fRO2XC(i)=fRO2XC(i)+.04; fxRCNO3(i)=fxRCNO3(i)+.66; fSumRO2(i)=fSumRO2(i)+.7; fSumRCO3(i)=fSumRCO3(i)+.3;

i=i+1;
Rnames{i} = 'MACR_N3 = .66*xOH + .04*zRCNO3 + .66*CO2';
k(:,i) = 5.24e-01;
Gstr{i,1} = 'MACR_N3';
fMACR_N3(i)=fMACR_N3(i)-1; fxOH(i)=fxOH(i)+.66; fzRCNO3(i)=fzRCNO3(i)+.04; fCO2(i)=fCO2(i)+.66;

i=i+1;
Rnames{i} = 'MACR_N3 + NO = NO + .66*xHO2 + .04*zRDNO3 + .66*CO + .59*yRPNO3';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'MACR_N3'; Gstr{i,2} = 'NO';
fMACR_N3(i)=fMACR_N3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.66; fzRDNO3(i)=fzRDNO3(i)+.04; fCO(i)=fCO(i)+.66; fyRPNO3(i)=fyRPNO3(i)+.59;

i=i+1;
Rnames{i} = 'MACR + HV = .45*OH + .3*HO2 + .15*MEO2 + .43*xMECO3 + .15*MACO3 + .43*RO2C + .02*RO2XC + .15*HCHO + .43*xHCHO + .02*zRCNO3 + CO + .25*PROPE + .38*yHPCRB + .6*SumRO2 + .15*SumRCO3';
k(:,i) = JMACR_06;
Gstr{i,1} = 'MACR';
fMACR(i)=fMACR(i)-1; fOH(i)=fOH(i)+.45; fHO2(i)=fHO2(i)+.3; fMEO2(i)=fMEO2(i)+.15; fxMECO3(i)=fxMECO3(i)+.43; fMACO3(i)=fMACO3(i)+.15; fRO2C(i)=fRO2C(i)+.43; fRO2XC(i)=fRO2XC(i)+.02; fHCHO(i)=fHCHO(i)+.15; fxHCHO(i)=fxHCHO(i)+.43; fzRCNO3(i)=fzRCNO3(i)+.02; fCO(i)=fCO(i)+1; fPROPE(i)=fPROPE(i)+.25; fyHPCRB(i)=fyHPCRB(i)+.38; fSumRO2(i)=fSumRO2(i)+.6; fSumRCO3(i)=fSumRCO3(i)+.15;

i=i+1;
Rnames{i} = 'MVK + OH = .28*xHO2 + .66*xMECO3 + .95*RO2C + .05*RO2XC + .28*xHCHO + .66*xGLCHO + .28*xMGLY + .05*zRCNO3 + .9*yHPCRB + SumRO2';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(609.903./T);
Gstr{i,1} = 'MVK'; Gstr{i,2} = 'OH';
fMVK(i)=fMVK(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.28; fxMECO3(i)=fxMECO3(i)+.66; fRO2C(i)=fRO2C(i)+.95; fRO2XC(i)=fRO2XC(i)+.05; fxHCHO(i)=fxHCHO(i)+.28; fxGLCHO(i)=fxGLCHO(i)+.66; fxMGLY(i)=fxMGLY(i)+.28; fzRCNO3(i)=fzRCNO3(i)+.05; fyHPCRB(i)=fyHPCRB(i)+.9; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'MVK + O3 = .18*OH + .26*HO2 + .02*xHO2 + .4*HCHO2 + .01*RCHO2 + .02*RO2C + .05*HCHO + .01*xHCHO + .01*MECHO + .95*MGLY + .01*xPACID + .17*H2 + .36*CO + .23*CO2 + .01*yHPCRB + .02*SumRO2';
k(:,i) = 8.50e-16.*(T./300).^0.00.*exp(-1520.229./T);
Gstr{i,1} = 'MVK'; Gstr{i,2} = 'O3';
fMVK(i)=fMVK(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+.18; fHO2(i)=fHO2(i)+.26; fxHO2(i)=fxHO2(i)+.02; fHCHO2(i)=fHCHO2(i)+.4; fRCHO2(i)=fRCHO2(i)+.01; fRO2C(i)=fRO2C(i)+.02; fHCHO(i)=fHCHO(i)+.05; fxHCHO(i)=fxHCHO(i)+.01; fMECHO(i)=fMECHO(i)+.01; fMGLY(i)=fMGLY(i)+.95; fxPACID(i)=fxPACID(i)+.01; fH2(i)=fH2(i)+.17; fCO(i)=fCO(i)+.36; fCO2(i)=fCO2(i)+.23; fyHPCRB(i)=fyHPCRB(i)+.01; fSumRO2(i)=fSumRO2(i)+.02;

i=i+1;
Rnames{i} = 'MVK + HV = .4*MEO2 + .4*MACO3 + .6*CO + .6*PROPE + .4*SumRO2 + .4*SumRCO3';
k(:,i) = JMVK_16;
Gstr{i,1} = 'MVK';
fMVK(i)=fMVK(i)-1; fMEO2(i)=fMEO2(i)+.4; fMACO3(i)=fMACO3(i)+.4; fCO(i)=fCO(i)+.6; fPROPE(i)=fPROPE(i)+.6; fSumRO2(i)=fSumRO2(i)+.4; fSumRCO3(i)=fSumRCO3(i)+.4;

i=i+1;
Rnames{i} = 'BUDAL + OH = BUDAL_OH + .29*OH + .44*xHO2 + .44*RO2C + .02*RO2XC + .41*xGLY + .05*xPACID + .02*CO + .29*MALAH + .46*SumRO2';
k(:,i) = 5.29e-11;
Gstr{i,1} = 'BUDAL'; Gstr{i,2} = 'OH';
fBUDAL(i)=fBUDAL(i)-1; fOH(i)=fOH(i)-1; fBUDAL_OH(i)=fBUDAL_OH(i)+1; fOH(i)=fOH(i)+.29; fxHO2(i)=fxHO2(i)+.44; fRO2C(i)=fRO2C(i)+.44; fRO2XC(i)=fRO2XC(i)+.02; fxGLY(i)=fxGLY(i)+.41; fxPACID(i)=fxPACID(i)+.05; fCO(i)=fCO(i)+.02; fMALAH(i)=fMALAH(i)+.29; fSumRO2(i)=fSumRO2(i)+.46;

i=i+1;
Rnames{i} = 'BUDAL_OH = .25*OH + .39*xPACID + .02*zRCNO3 + .25*MALAH';
k(:,i) = 2.08e+01;
Gstr{i,1} = 'BUDAL_OH';
fBUDAL_OH(i)=fBUDAL_OH(i)-1; fOH(i)=fOH(i)+.25; fxPACID(i)=fxPACID(i)+.39; fzRCNO3(i)=fzRCNO3(i)+.02; fMALAH(i)=fMALAH(i)+.25;

i=i+1;
Rnames{i} = 'BUDAL_OH + NO = NO + .25*xHO2 + .25*RO2C + .62*xGLY + .25*CO + .35*yHPCRB + .25*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'BUDAL_OH'; Gstr{i,2} = 'NO';
fBUDAL_OH(i)=fBUDAL_OH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.25; fRO2C(i)=fRO2C(i)+.25; fxGLY(i)=fxGLY(i)+.62; fCO(i)=fCO(i)+.25; fyHPCRB(i)=fyHPCRB(i)+.35; fSumRO2(i)=fSumRO2(i)+.25;

i=i+1;
Rnames{i} = 'BUDAL + HV = OH + HO2 + MALAH';
k(:,i) = JAFGS.*2.50e-1;
Gstr{i,1} = 'BUDAL';
fBUDAL(i)=fBUDAL(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; fMALAH(i)=fMALAH(i)+1;

i=i+1; % TOLRO2 assigned as RXN COUNTER
Rnames{i} = 'PHEN + OH = .85*HO2 + .07*xHO2 + .07*BZO + .07*RO2C + .01*RO2XC + .03*xGLY + .04*xMGLY + .01*OLEA1 + .04*OLEA2 + .03*OLEP + .77*CATL + .04*xBUDAL + .01*xAFG1 + .02*xAFG2A + .01*zRANO3 + .08*yRAOOH + .08*SumRO2 + TOLRO2';
k(:,i) = 4.70e-13.*(T./300).^0.00.*exp(1219.807./T);
Gstr{i,1} = 'PHEN'; Gstr{i,2} = 'OH';
fPHEN(i)=fPHEN(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.85; fxHO2(i)=fxHO2(i)+.07; fBZO(i)=fBZO(i)+.07; fRO2C(i)=fRO2C(i)+.07; fRO2XC(i)=fRO2XC(i)+.01; fxGLY(i)=fxGLY(i)+.03; fxMGLY(i)=fxMGLY(i)+.04; fOLEA1(i)=fOLEA1(i)+.01; fOLEA2(i)=fOLEA2(i)+.04; fOLEP(i)=fOLEP(i)+.03; fCATL(i)=fCATL(i)+.77; fxBUDAL(i)=fxBUDAL(i)+.04; fxAFG1(i)=fxAFG1(i)+.01; fxAFG2A(i)=fxAFG2A(i)+.02; fzRANO3(i)=fzRANO3(i)+.01; fyRAOOH(i)=fyRAOOH(i)+.08; fSumRO2(i)=fSumRO2(i)+.08; fTOLRO2(i)=fTOLRO2(i)+1;


i=i+1;
Rnames{i} = 'PHEN + NO3 = HNO3 + BZO';
k(:,i) = 4.50e-12;
Gstr{i,1} = 'PHEN'; Gstr{i,2} = 'NO3';
fPHEN(i)=fPHEN(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fBZO(i)=fBZO(i)+1;

i=i+1;
Rnames{i} = 'ALK1 + OH = .96*xHO2 + .01*xMECO3 + .97*RO2C + .03*RO2XC + .01*xHCHO + .09*xMGLY + .43*xOACID + .03*zRCNO3 + .43*CO + 39.33*NROG + .62*yHPCRB + SumRO2';
k(:,i) = 3.35e-13;
Gstr{i,1} = 'ALK1'; Gstr{i,2} = 'OH';
fALK1(i)=fALK1(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.96; fxMECO3(i)=fxMECO3(i)+.01; fRO2C(i)=fRO2C(i)+.97; fRO2XC(i)=fRO2XC(i)+.03; fxHCHO(i)=fxHCHO(i)+.01; fxMGLY(i)=fxMGLY(i)+.09; fxOACID(i)=fxOACID(i)+.43; fzRCNO3(i)=fzRCNO3(i)+.03; fCO(i)=fCO(i)+.43; fNROG(i)=fNROG(i)+39.33; fyHPCRB(i)=fyHPCRB(i)+.62; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'ALK2 + OH = .1*xHO2 + .01*xMEO2 + .84*xMECO3 + .95*RO2C + .05*RO2XC + .01*xHCHO + .08*xRCHO + .01*xMGLY + .84*xOACID + .05*zRCNO3 + 1.38*NROG + .64*yHPCRB + SumRO2';
k(:,i) = 1.67e-12;
Gstr{i,1} = 'ALK2'; Gstr{i,2} = 'OH';
fALK2(i)=fALK2(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.1; fxMEO2(i)=fxMEO2(i)+.01; fxMECO3(i)=fxMECO3(i)+.84; fRO2C(i)=fRO2C(i)+.95; fRO2XC(i)=fRO2XC(i)+.05; fxHCHO(i)=fxHCHO(i)+.01; fxRCHO(i)=fxRCHO(i)+.08; fxMGLY(i)=fxMGLY(i)+.01; fxOACID(i)=fxOACID(i)+.84; fzRCNO3(i)=fzRCNO3(i)+.05; fNROG(i)=fNROG(i)+1.38; fyHPCRB(i)=fyHPCRB(i)+.64; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'ALK3 + OH = .34*xHO2 + .14*xETO2 + .07*xR2CO3 + .33*xTBUO + 1.2*RO2C + .12*RO2XC + .1*xHCHO + .1*xMECHO + .09*xRCHO + .07*xACET + .01*xKET2 + .12*xOACID + .06*zR1NO3 + .02*zRHNO3 + .03*zRCNO3 + .05*CO + .12*ALK1 + 16.91*NROG + .81*yROOH + .33*yHPCRB + 1.32*SumRO2';
k(:,i) = 2.85e-12;
Gstr{i,1} = 'ALK3'; Gstr{i,2} = 'OH';
fALK3(i)=fALK3(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.34; fxETO2(i)=fxETO2(i)+.14; fxR2CO3(i)=fxR2CO3(i)+.07; fxTBUO(i)=fxTBUO(i)+.33; fRO2C(i)=fRO2C(i)+1.2; fRO2XC(i)=fRO2XC(i)+.12; fxHCHO(i)=fxHCHO(i)+.1; fxMECHO(i)=fxMECHO(i)+.1; fxRCHO(i)=fxRCHO(i)+.09; fxACET(i)=fxACET(i)+.07; fxKET2(i)=fxKET2(i)+.01; fxOACID(i)=fxOACID(i)+.12; fzR1NO3(i)=fzR1NO3(i)+.06; fzRHNO3(i)=fzRHNO3(i)+.02; fzRCNO3(i)=fzRCNO3(i)+.03; fCO(i)=fCO(i)+.05; fALK1(i)=fALK1(i)+.12; fNROG(i)=fNROG(i)+16.91; fyROOH(i)=fyROOH(i)+.81; fyHPCRB(i)=fyHPCRB(i)+.33; fSumRO2(i)=fSumRO2(i)+1.32;

i=i+1;
Rnames{i} = 'ALK4 + OH = .01*xOH + .26*HO2 + .37*xHO2 + .23*xETO2 + .96*RO2C + .12*RO2XC + .05*xHCHO + .12*xMECHO + .05*xETCHO + .07*xRCHO + .26*ACET + .3*xACET + .03*xMEK + .15*xKET2 + .09*zR1NO3 + .03*zRHNO3 + .01*CO2 + 1.05*yROOH + .01*yHPCRB + 1.08*SumRO2';
k(:,i) = 4.54e-12;
Gstr{i,1} = 'ALK4'; Gstr{i,2} = 'OH';
fALK4(i)=fALK4(i)-1; fOH(i)=fOH(i)-1; fxOH(i)=fxOH(i)+.01; fHO2(i)=fHO2(i)+.26; fxHO2(i)=fxHO2(i)+.37; fxETO2(i)=fxETO2(i)+.23; fRO2C(i)=fRO2C(i)+.96; fRO2XC(i)=fRO2XC(i)+.12; fxHCHO(i)=fxHCHO(i)+.05; fxMECHO(i)=fxMECHO(i)+.12; fxETCHO(i)=fxETCHO(i)+.05; fxRCHO(i)=fxRCHO(i)+.07; fACET(i)=fACET(i)+.26; fxACET(i)=fxACET(i)+.3; fxMEK(i)=fxMEK(i)+.03; fxKET2(i)=fxKET2(i)+.15; fzR1NO3(i)=fzR1NO3(i)+.09; fzRHNO3(i)=fzRHNO3(i)+.03; fCO2(i)=fCO2(i)+.01; fyROOH(i)=fyROOH(i)+1.05; fyHPCRB(i)=fyHPCRB(i)+.01; fSumRO2(i)=fSumRO2(i)+1.08;

i=i+1;
Rnames{i} = 'ALK5 + OH = ALK5_OH + .3*HO2 + .39*xHO2 + .02*xETO2 + .01*xR2CO3 + RO2C + .22*RO2XC + .01*HCHO + .03*xHCHO + .04*xMECHO + .02*xETCHO + .06*GLCHO + .01*xGLCHO + .1*RCHO + .04*xRCHO + .05*xACET + .05*xMEK + .13*KET2 + .23*xKET2 + .01*xPACID + .08*zR1NO3 + .05*zR2NO3 + .06*zRHNO3 + .02*zRCNO3 + .01*ALK4 + .01*ALK5 + 1.05*yROOH + .12*yHPCRB + 1.22*SumRO2';
k(:,i) = 1.14e-11;
Gstr{i,1} = 'ALK5'; Gstr{i,2} = 'OH';
fALK5(i)=fALK5(i)-1; fOH(i)=fOH(i)-1; fALK5_OH(i)=fALK5_OH(i)+1; fHO2(i)=fHO2(i)+.3; fxHO2(i)=fxHO2(i)+.39; fxETO2(i)=fxETO2(i)+.02; fxR2CO3(i)=fxR2CO3(i)+.01; fRO2C(i)=fRO2C(i)+1; fRO2XC(i)=fRO2XC(i)+.22; fHCHO(i)=fHCHO(i)+.01; fxHCHO(i)=fxHCHO(i)+.03; fxMECHO(i)=fxMECHO(i)+.04; fxETCHO(i)=fxETCHO(i)+.02; fGLCHO(i)=fGLCHO(i)+.06; fxGLCHO(i)=fxGLCHO(i)+.01; fRCHO(i)=fRCHO(i)+.1; fxRCHO(i)=fxRCHO(i)+.04; fxACET(i)=fxACET(i)+.05; fxMEK(i)=fxMEK(i)+.05; fKET2(i)=fKET2(i)+.13; fxKET2(i)=fxKET2(i)+.23; fxPACID(i)=fxPACID(i)+.01; fzR1NO3(i)=fzR1NO3(i)+.08; fzR2NO3(i)=fzR2NO3(i)+.05; fzRHNO3(i)=fzRHNO3(i)+.06; fzRCNO3(i)=fzRCNO3(i)+.02; fALK4(i)=fALK4(i)+.01; fALK5(i)=fALK5(i)+.01; fyROOH(i)=fyROOH(i)+1.05; fyHPCRB(i)=fyHPCRB(i)+.12; fSumRO2(i)=fSumRO2(i)+1.22;

i=i+1;
Rnames{i} = 'ALK5_OH = .02*HO2 + .03*xHO2 + .03*xPACID + .06*xHPCRB';
k(:,i) = 6.87e-01;
Gstr{i,1} = 'ALK5_OH';
fALK5_OH(i)=fALK5_OH(i)-1; fHO2(i)=fHO2(i)+.02; fxHO2(i)=fxHO2(i)+.03; fxPACID(i)=fxPACID(i)+.03; fxHPCRB(i)=fxHPCRB(i)+.06;

i=i+1;
Rnames{i} = 'ALK5_OH + NO = NO + .02*xMECO3 + .02*xR2CO3 + .1*RO2C + .02*RO2XC + .01*xETCHO + .06*xRCHO + .01*xACET + .01*zRHNO3 + .01*zRCNO3 + .01*CO + .01*ALK5 + .05*yROOH + .09*yHPCRB + .12*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'ALK5_OH'; Gstr{i,2} = 'NO';
fALK5_OH(i)=fALK5_OH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxMECO3(i)=fxMECO3(i)+.02; fxR2CO3(i)=fxR2CO3(i)+.02; fRO2C(i)=fRO2C(i)+.1; fRO2XC(i)=fRO2XC(i)+.02; fxETCHO(i)=fxETCHO(i)+.01; fxRCHO(i)=fxRCHO(i)+.06; fxACET(i)=fxACET(i)+.01; fzRHNO3(i)=fzRHNO3(i)+.01; fzRCNO3(i)=fzRCNO3(i)+.01; fCO(i)=fCO(i)+.01; fALK5(i)=fALK5(i)+.01; fyROOH(i)=fyROOH(i)+.05; fyHPCRB(i)=fyHPCRB(i)+.09; fSumRO2(i)=fSumRO2(i)+.12;

i=i+1;
Rnames{i} = 'ALK6 + OH = .16*HO2 + .46*xHO2 + .01*xMEO2 + .02*xR2CO3 + 1.09*RO2C + .35*RO2XC + .09*xHCHO + .01*xMECHO + .01*xETCHO + .07*RCHO + .09*xRCHO + .2*xACET + .09*KET2 + .27*xKET2 + .01*xPACID + .15*zR2NO3 + .12*zRHNO3 + .08*zRCNO3 + .01*xHPCRB + .03*ALK2 + .06*ALK3 + .01*ALK4 + .02*ALK5 + 1.05*yROOH + .34*yHPCRB + 1.44*SumRO2';
k(:,i) = 1.69e-11;
Gstr{i,1} = 'ALK6'; Gstr{i,2} = 'OH';
fALK6(i)=fALK6(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.16; fxHO2(i)=fxHO2(i)+.46; fxMEO2(i)=fxMEO2(i)+.01; fxR2CO3(i)=fxR2CO3(i)+.02; fRO2C(i)=fRO2C(i)+1.09; fRO2XC(i)=fRO2XC(i)+.35; fxHCHO(i)=fxHCHO(i)+.09; fxMECHO(i)=fxMECHO(i)+.01; fxETCHO(i)=fxETCHO(i)+.01; fRCHO(i)=fRCHO(i)+.07; fxRCHO(i)=fxRCHO(i)+.09; fxACET(i)=fxACET(i)+.2; fKET2(i)=fKET2(i)+.09; fxKET2(i)=fxKET2(i)+.27; fxPACID(i)=fxPACID(i)+.01; fzR2NO3(i)=fzR2NO3(i)+.15; fzRHNO3(i)=fzRHNO3(i)+.12; fzRCNO3(i)=fzRCNO3(i)+.08; fxHPCRB(i)=fxHPCRB(i)+.01; fALK2(i)=fALK2(i)+.03; fALK3(i)=fALK3(i)+.06; fALK4(i)=fALK4(i)+.01; fALK5(i)=fALK5(i)+.02; fyROOH(i)=fyROOH(i)+1.05; fyHPCRB(i)=fyHPCRB(i)+.34; fSumRO2(i)=fSumRO2(i)+1.44;

i=i+1;
Rnames{i} = 'OLE1 + OH = .78*xHO2 + .01*xMEO2 + .11*xTBUO + 1.12*RO2C + .1*RO2XC + .69*xHCHO + .01*xMECHO + .35*xETCHO + .15*xGLCHO + .35*xRCHO + .02*xACRO + .03*xACET + .02*xKET2 + .01*xMVK + .01*zR1NO3 + .01*zR2NO3 + .08*zRHNO3 + 1.15*yROOH + .07*yRUOOH + 1.22*SumRO2';
k(:,i) = 3.18e-11;
Gstr{i,1} = 'OLE1'; Gstr{i,2} = 'OH';
fOLE1(i)=fOLE1(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.78; fxMEO2(i)=fxMEO2(i)+.01; fxTBUO(i)=fxTBUO(i)+.11; fRO2C(i)=fRO2C(i)+1.12; fRO2XC(i)=fRO2XC(i)+.1; fxHCHO(i)=fxHCHO(i)+.69; fxMECHO(i)=fxMECHO(i)+.01; fxETCHO(i)=fxETCHO(i)+.35; fxGLCHO(i)=fxGLCHO(i)+.15; fxRCHO(i)=fxRCHO(i)+.35; fxACRO(i)=fxACRO(i)+.02; fxACET(i)=fxACET(i)+.03; fxKET2(i)=fxKET2(i)+.02; fxMVK(i)=fxMVK(i)+.01; fzR1NO3(i)=fzR1NO3(i)+.01; fzR2NO3(i)=fzR2NO3(i)+.01; fzRHNO3(i)=fzRHNO3(i)+.08; fyROOH(i)=fyROOH(i)+1.15; fyRUOOH(i)=fyRUOOH(i)+.07; fSumRO2(i)=fSumRO2(i)+1.22;

i=i+1;
Rnames{i} = 'OLE1 + O3 = .26*OH + .01*xOH + .17*HO2 + .16*xHO2 + .01*ETO2 + .01*xTBUO + .21*HCHO2 + .17*RCHO2 + .18*RO2C + .01*RO2XC + .5*HCHO + .02*ETOH + .08*xMECHO + .19*ETCHO + .04*xETCHO + .31*RCHO + .02*xRCHO + .04*xACET + .01*zRCNO3 + .09*H2 + .37*CO + .24*CO2 + .03*ETHAN + .02*PROP + .01*NC4 + .01*ALK2 + .02*ALK3 + .01*ALK4 + .02*yROOH + .14*yHPCRB + .2*SumRO2';
k(:,i) = 8.70e-18;
Gstr{i,1} = 'OLE1'; Gstr{i,2} = 'O3';
fOLE1(i)=fOLE1(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+.26; fxOH(i)=fxOH(i)+.01; fHO2(i)=fHO2(i)+.17; fxHO2(i)=fxHO2(i)+.16; fETO2(i)=fETO2(i)+.01; fxTBUO(i)=fxTBUO(i)+.01; fHCHO2(i)=fHCHO2(i)+.21; fRCHO2(i)=fRCHO2(i)+.17; fRO2C(i)=fRO2C(i)+.18; fRO2XC(i)=fRO2XC(i)+.01; fHCHO(i)=fHCHO(i)+.5; fETOH(i)=fETOH(i)+.02; fxMECHO(i)=fxMECHO(i)+.08; fETCHO(i)=fETCHO(i)+.19; fxETCHO(i)=fxETCHO(i)+.04; fRCHO(i)=fRCHO(i)+.31; fxRCHO(i)=fxRCHO(i)+.02; fxACET(i)=fxACET(i)+.04; fzRCNO3(i)=fzRCNO3(i)+.01; fH2(i)=fH2(i)+.09; fCO(i)=fCO(i)+.37; fCO2(i)=fCO2(i)+.24; fETHAN(i)=fETHAN(i)+.03; fPROP(i)=fPROP(i)+.02; fNC4(i)=fNC4(i)+.01; fALK2(i)=fALK2(i)+.01; fALK3(i)=fALK3(i)+.02; fALK4(i)=fALK4(i)+.01; fyROOH(i)=fyROOH(i)+.02; fyHPCRB(i)=fyHPCRB(i)+.14; fSumRO2(i)=fSumRO2(i)+.2;

i=i+1;
Rnames{i} = 'OLE1 + NO3 = .09*xNO2 + .55*xHO2 + .09*xETO2 + .15*xTBUO + 1.41*RO2C + .13*RO2XC + .09*xHCHO + .09*xETCHO + .01*xRCHO + .14*xACET + .02*zR1NO3 + .81*xRCNO3 + .11*zRDNO3 + 1.22*yRPNO3 + .31*yROOH + 1.54*SumRO2';
k(:,i) = 1.44e-14;
Gstr{i,1} = 'OLE1'; Gstr{i,2} = 'NO3';
fOLE1(i)=fOLE1(i)-1; fNO3(i)=fNO3(i)-1; fxNO2(i)=fxNO2(i)+.09; fxHO2(i)=fxHO2(i)+.55; fxETO2(i)=fxETO2(i)+.09; fxTBUO(i)=fxTBUO(i)+.15; fRO2C(i)=fRO2C(i)+1.41; fRO2XC(i)=fRO2XC(i)+.13; fxHCHO(i)=fxHCHO(i)+.09; fxETCHO(i)=fxETCHO(i)+.09; fxRCHO(i)=fxRCHO(i)+.01; fxACET(i)=fxACET(i)+.14; fzR1NO3(i)=fzR1NO3(i)+.02; fxRCNO3(i)=fxRCNO3(i)+.81; fzRDNO3(i)=fzRDNO3(i)+.11; fyRPNO3(i)=fyRPNO3(i)+1.22; fyROOH(i)=fyROOH(i)+.31; fSumRO2(i)=fSumRO2(i)+1.54;

i=i+1;
Rnames{i} = 'OLE1 + O3P = .25*RCHO + .1*MEK + .15*KET2 + .09*ALK2 + .36*ALK3 + .05*ALK4';
k(:,i) = 4.43e-12;
Gstr{i,1} = 'OLE1'; Gstr{i,2} = 'O3P';
fOLE1(i)=fOLE1(i)-1; fO3P(i)=fO3P(i)-1; fRCHO(i)=fRCHO(i)+.25; fMEK(i)=fMEK(i)+.1; fKET2(i)=fKET2(i)+.15; fALK2(i)=fALK2(i)+.09; fALK3(i)=fALK3(i)+.36; fALK4(i)=fALK4(i)+.05;

i=i+1;
Rnames{i} = 'OLE2 + OH = .93*xHO2 + .94*RO2C + .07*RO2XC + 1.25*xMECHO + .4*xETCHO + .12*xRCHO + .07*zRHNO3 + .99*yROOH + .02*yRUOOH + 1.01*SumRO2';
k(:,i) = 6.29e-11;
Gstr{i,1} = 'OLE2'; Gstr{i,2} = 'OH';
fOLE2(i)=fOLE2(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.93; fRO2C(i)=fRO2C(i)+.94; fRO2XC(i)=fRO2XC(i)+.07; fxMECHO(i)=fxMECHO(i)+1.25; fxETCHO(i)=fxETCHO(i)+.4; fxRCHO(i)=fxRCHO(i)+.12; fzRHNO3(i)=fzRHNO3(i)+.07; fyROOH(i)=fyROOH(i)+.99; fyRUOOH(i)=fyRUOOH(i)+.02; fSumRO2(i)=fSumRO2(i)+1.01;

i=i+1;
Rnames{i} = 'OLE2 + O3 = OLE2_O3 + .46*OH + .06*HO2 + .32*xHO2 + .04*MEO2 + .01*ETO2 + .15*MECHO2 + .1*RCHO2 + .4*RO2C + .07*xHCHO + .06*MEOH + .02*ETOH + .67*MECHO + .09*xMECHO + .22*ETCHO + .01*xETCHO + .07*RCHO + .01*xACET + .19*CO + .23*CO2 + .12*CH4 + .03*ETHAN + .09*yHPCRB + .45*SumRO2';
k(:,i) = 1.90e-16;
Gstr{i,1} = 'OLE2'; Gstr{i,2} = 'O3';
fOLE2(i)=fOLE2(i)-1; fO3(i)=fO3(i)-1; fOLE2_O3(i)=fOLE2_O3(i)+1; fOH(i)=fOH(i)+.46; fHO2(i)=fHO2(i)+.06; fxHO2(i)=fxHO2(i)+.32; fMEO2(i)=fMEO2(i)+.04; fETO2(i)=fETO2(i)+.01; fMECHO2(i)=fMECHO2(i)+.15; fRCHO2(i)=fRCHO2(i)+.1; fRO2C(i)=fRO2C(i)+.4; fxHCHO(i)=fxHCHO(i)+.07; fMEOH(i)=fMEOH(i)+.06; fETOH(i)=fETOH(i)+.02; fMECHO(i)=fMECHO(i)+.67; fxMECHO(i)=fxMECHO(i)+.09; fETCHO(i)=fETCHO(i)+.22; fxETCHO(i)=fxETCHO(i)+.01; fRCHO(i)=fRCHO(i)+.07; fxACET(i)=fxACET(i)+.01; fCO(i)=fCO(i)+.19; fCO2(i)=fCO2(i)+.23; fCH4(i)=fCH4(i)+.12; fETHAN(i)=fETHAN(i)+.03; fyHPCRB(i)=fyHPCRB(i)+.09; fSumRO2(i)=fSumRO2(i)+.45;

i=i+1;
Rnames{i} = 'OLE2_O3 = .01*OH + .08*xOH + .01*RCHO + .22*xPACID + .07*CO2';
k(:,i) = 2.54e+00;
Gstr{i,1} = 'OLE2_O3';
fOLE2_O3(i)=fOLE2_O3(i)-1; fOH(i)=fOH(i)+.01; fxOH(i)=fxOH(i)+.08; fRCHO(i)=fRCHO(i)+.01; fxPACID(i)=fxPACID(i)+.22; fCO2(i)=fCO2(i)+.07;

i=i+1;
Rnames{i} = 'OLE2_O3 + NO = NO + .08*xHO2 + .01*RO2C + .2*xHCHO + .02*xGLY + .27*CO + .26*yHPCRB + .02*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'OLE2_O3'; Gstr{i,2} = 'NO';
fOLE2_O3(i)=fOLE2_O3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.08; fRO2C(i)=fRO2C(i)+.01; fxHCHO(i)=fxHCHO(i)+.2; fxGLY(i)=fxGLY(i)+.02; fCO(i)=fCO(i)+.27; fyHPCRB(i)=fyHPCRB(i)+.26; fSumRO2(i)=fSumRO2(i)+.02;

i=i+1;
Rnames{i} = 'OLE2 + NO3 = .8*xNO2 + .11*xHO2 + 1.01*RO2C + .08*RO2XC + 1.11*xMECHO + .33*xETCHO + .09*xRCHO + .01*xACET + .12*xRCNO3 + .08*zRDNO3 + 1.08*yRPNO3 + .01*yROOH + 1.09*SumRO2';
k(:,i) = 4.34e-13;
Gstr{i,1} = 'OLE2'; Gstr{i,2} = 'NO3';
fOLE2(i)=fOLE2(i)-1; fNO3(i)=fNO3(i)-1; fxNO2(i)=fxNO2(i)+.8; fxHO2(i)=fxHO2(i)+.11; fRO2C(i)=fRO2C(i)+1.01; fRO2XC(i)=fRO2XC(i)+.08; fxMECHO(i)=fxMECHO(i)+1.11; fxETCHO(i)=fxETCHO(i)+.33; fxRCHO(i)=fxRCHO(i)+.09; fxACET(i)=fxACET(i)+.01; fxRCNO3(i)=fxRCNO3(i)+.12; fzRDNO3(i)=fzRDNO3(i)+.08; fyRPNO3(i)=fyRPNO3(i)+1.08; fyROOH(i)=fyROOH(i)+.01; fSumRO2(i)=fSumRO2(i)+1.09;

i=i+1;
Rnames{i} = 'OLE2 + O3P = .21*MEK + .29*KET2 + .21*ALK1 + .22*ALK2 + .07*ALK3';
k(:,i) = 1.95e-11;
Gstr{i,1} = 'OLE2'; Gstr{i,2} = 'O3P';
fOLE2(i)=fOLE2(i)-1; fO3P(i)=fO3P(i)-1; fMEK(i)=fMEK(i)+.21; fKET2(i)=fKET2(i)+.29; fALK1(i)=fALK1(i)+.21; fALK2(i)=fALK2(i)+.22; fALK3(i)=fALK3(i)+.07;

i=i+1;
Rnames{i} = 'OLE3 + OH = .94*xHO2 + .94*RO2C + .06*RO2XC + .94*xHCHO + .82*xACET + .13*xMEK + .06*zRHNO3 + yROOH + SumRO2';
k(:,i) = 5.26e-11;
Gstr{i,1} = 'OLE3'; Gstr{i,2} = 'OH';
fOLE3(i)=fOLE3(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.94; fRO2C(i)=fRO2C(i)+.94; fRO2XC(i)=fRO2XC(i)+.06; fxHCHO(i)=fxHCHO(i)+.94; fxACET(i)=fxACET(i)+.82; fxMEK(i)=fxMEK(i)+.13; fzRHNO3(i)=fzRHNO3(i)+.06; fyROOH(i)=fyROOH(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'OLE3 + O3 = .58*OH + .14*HO2 + .45*xMECO3 + .03*xR2CO3 + .21*HCHO2 + .48*RO2C + .02*RO2XC + .5*HCHO + .45*xHCHO + .03*xMECHO + .43*ACET + .07*MEK + .02*zRCNO3 + .09*H2 + .17*CO + .12*CO2 + .42*yHPCRB + .5*SumRO2';
k(:,i) = 1.18e-17;
Gstr{i,1} = 'OLE3'; Gstr{i,2} = 'O3';
fOLE3(i)=fOLE3(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+.58; fHO2(i)=fHO2(i)+.14; fxMECO3(i)=fxMECO3(i)+.45; fxR2CO3(i)=fxR2CO3(i)+.03; fHCHO2(i)=fHCHO2(i)+.21; fRO2C(i)=fRO2C(i)+.48; fRO2XC(i)=fRO2XC(i)+.02; fHCHO(i)=fHCHO(i)+.5; fxHCHO(i)=fxHCHO(i)+.45; fxMECHO(i)=fxMECHO(i)+.03; fACET(i)=fACET(i)+.43; fMEK(i)=fMEK(i)+.07; fzRCNO3(i)=fzRCNO3(i)+.02; fH2(i)=fH2(i)+.09; fCO(i)=fCO(i)+.17; fCO2(i)=fCO2(i)+.12; fyHPCRB(i)=fyHPCRB(i)+.42; fSumRO2(i)=fSumRO2(i)+.5;

i=i+1;
Rnames{i} = 'OLE3 + NO3 = .86*xNO2 + .01*xMEO2 + .07*xETO2 + .94*RO2C + .06*RO2XC + .86*xHCHO + .8*xACET + .06*xMEK + .08*xRCNO3 + .06*zRDNO3 + yRPNO3 + SumRO2';
k(:,i) = 3.62e-13;
Gstr{i,1} = 'OLE3'; Gstr{i,2} = 'NO3';
fOLE3(i)=fOLE3(i)-1; fNO3(i)=fNO3(i)-1; fxNO2(i)=fxNO2(i)+.86; fxMEO2(i)=fxMEO2(i)+.01; fxETO2(i)=fxETO2(i)+.07; fRO2C(i)=fRO2C(i)+.94; fRO2XC(i)=fRO2XC(i)+.06; fxHCHO(i)=fxHCHO(i)+.86; fxACET(i)=fxACET(i)+.8; fxMEK(i)=fxMEK(i)+.06; fxRCNO3(i)=fxRCNO3(i)+.08; fzRDNO3(i)=fzRDNO3(i)+.06; fyRPNO3(i)=fyRPNO3(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'OLE3 + O3P = .5*RCHO + .5*ALK2';
k(:,i) = 1.70e-11;
Gstr{i,1} = 'OLE3'; Gstr{i,2} = 'O3P';
fOLE3(i)=fOLE3(i)-1; fO3P(i)=fO3P(i)-1; fRCHO(i)=fRCHO(i)+.5; fALK2(i)=fALK2(i)+.5;

i=i+1;
Rnames{i} = 'OLE4 + OH = .91*xHO2 + .91*RO2C + .08*RO2XC + .83*xMECHO + .09*xETCHO + .91*xACET + .08*zRHNO3 + yROOH + .99*SumRO2';
k(:,i) = 8.71e-11;
Gstr{i,1} = 'OLE4'; Gstr{i,2} = 'OH';
fOLE4(i)=fOLE4(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.91; fRO2C(i)=fRO2C(i)+.91; fRO2XC(i)=fRO2XC(i)+.08; fxMECHO(i)=fxMECHO(i)+.83; fxETCHO(i)=fxETCHO(i)+.09; fxACET(i)=fxACET(i)+.91; fzRHNO3(i)=fzRHNO3(i)+.08; fyROOH(i)=fyROOH(i)+1; fSumRO2(i)=fSumRO2(i)+.99;

i=i+1;
Rnames{i} = 'OLE4 + O3 = OLE4_O3 + .72*OH + .03*HO2 + .17*xHO2 + .03*MEO2 + .48*xMECO3 + .1*MECHO2 + .01*RCHO2 + .7*RO2C + .02*RO2XC + .53*xHCHO + .04*MEOH + .45*MECHO + .02*xMECHO + .05*ETCHO + .5*ACET + .02*zRCNO3 + .07*CO + .12*CO2 + .08*CH4 + .01*ETHAN + .44*yHPCRB + .75*SumRO2';
k(:,i) = 4.05e-16;
Gstr{i,1} = 'OLE4'; Gstr{i,2} = 'O3';
fOLE4(i)=fOLE4(i)-1; fO3(i)=fO3(i)-1; fOLE4_O3(i)=fOLE4_O3(i)+1; fOH(i)=fOH(i)+.72; fHO2(i)=fHO2(i)+.03; fxHO2(i)=fxHO2(i)+.17; fMEO2(i)=fMEO2(i)+.03; fxMECO3(i)=fxMECO3(i)+.48; fMECHO2(i)=fMECHO2(i)+.1; fRCHO2(i)=fRCHO2(i)+.01; fRO2C(i)=fRO2C(i)+.7; fRO2XC(i)=fRO2XC(i)+.02; fxHCHO(i)=fxHCHO(i)+.53; fMEOH(i)=fMEOH(i)+.04; fMECHO(i)=fMECHO(i)+.45; fxMECHO(i)=fxMECHO(i)+.02; fETCHO(i)=fETCHO(i)+.05; fACET(i)=fACET(i)+.5; fzRCNO3(i)=fzRCNO3(i)+.02; fCO(i)=fCO(i)+.07; fCO2(i)=fCO2(i)+.12; fCH4(i)=fCH4(i)+.08; fETHAN(i)=fETHAN(i)+.01; fyHPCRB(i)=fyHPCRB(i)+.44; fSumRO2(i)=fSumRO2(i)+.75;

i=i+1;
Rnames{i} = 'OLE4_O3 = .05*xOH + .15*xPACID + .05*CO2';
k(:,i) = 2.62e+00;
Gstr{i,1} = 'OLE4_O3';
fOLE4_O3(i)=fOLE4_O3(i)-1; fxOH(i)=fxOH(i)+.05; fxPACID(i)=fxPACID(i)+.15; fCO2(i)=fCO2(i)+.05;

i=i+1;
Rnames{i} = 'OLE4_O3 + NO = NO + .05*xHO2 + .13*xHCHO + .18*CO + .17*yHPCRB';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'OLE4_O3'; Gstr{i,2} = 'NO';
fOLE4_O3(i)=fOLE4_O3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.05; fxHCHO(i)=fxHCHO(i)+.13; fCO(i)=fCO(i)+.18; fyHPCRB(i)=fyHPCRB(i)+.17;

i=i+1;
Rnames{i} = 'OLE4 + NO3 = .91*xNO2 + .92*RO2C + .09*RO2XC + .83*xMECHO + .08*xETCHO + .91*xACET + .09*zRDNO3 + yRPNO3 + 1.01*SumRO2';
k(:,i) = 9.31e-12;
Gstr{i,1} = 'OLE4'; Gstr{i,2} = 'NO3';
fOLE4(i)=fOLE4(i)-1; fNO3(i)=fNO3(i)-1; fxNO2(i)=fxNO2(i)+.91; fRO2C(i)=fRO2C(i)+.92; fRO2XC(i)=fRO2XC(i)+.09; fxMECHO(i)=fxMECHO(i)+.83; fxETCHO(i)=fxETCHO(i)+.08; fxACET(i)=fxACET(i)+.91; fzRDNO3(i)=fzRDNO3(i)+.09; fyRPNO3(i)=fyRPNO3(i)+1; fSumRO2(i)=fSumRO2(i)+1.01;

i=i+1;
Rnames{i} = 'OLE4 + O3P = .5*KET2 + .5*ALK2';
k(:,i) = 5.11e-11;
Gstr{i,1} = 'OLE4'; Gstr{i,2} = 'O3P';
fOLE4(i)=fOLE4(i)-1; fO3P(i)=fO3P(i)-1; fKET2(i)=fKET2(i)+.5; fALK2(i)=fALK2(i)+.5;

i=i+1;
Rnames{i} = 'TERP + OH = TERP_OH + .01*xOH + .01*HO2 + .6*xHO2 + .02*xR2CO3 + .01*xMACO3 + 1.1*RO2C + .29*RO2XC + .16*xHCHO + .29*xRCHO + .13*xOLEA2 + .09*xACET + .05*xKET2 + .01*xMVK + .04*xLVKS + .05*xOLEP + .01*xAFG2A + .01*zR2NO3 + .2*zRHNO3 + .07*zRCNO3 + .01*xHPCRB + .51*yROOH + .55*yRUOOH + .27*yHPCRB + 1.39*SumRO2';
k(:,i) = 1.10e-10;
Gstr{i,1} = 'TERP'; Gstr{i,2} = 'OH';
fTERP(i)=fTERP(i)-1; fOH(i)=fOH(i)-1; fTERP_OH(i)=fTERP_OH(i)+1; fxOH(i)=fxOH(i)+.01; fHO2(i)=fHO2(i)+.01; fxHO2(i)=fxHO2(i)+.6; fxR2CO3(i)=fxR2CO3(i)+.02; fxMACO3(i)=fxMACO3(i)+.01; fRO2C(i)=fRO2C(i)+1.1; fRO2XC(i)=fRO2XC(i)+.29; fxHCHO(i)=fxHCHO(i)+.16; fxRCHO(i)=fxRCHO(i)+.29; fxOLEA2(i)=fxOLEA2(i)+.13; fxACET(i)=fxACET(i)+.09; fxKET2(i)=fxKET2(i)+.05; fxMVK(i)=fxMVK(i)+.01; fxLVKS(i)=fxLVKS(i)+.04; fxOLEP(i)=fxOLEP(i)+.05; fxAFG2A(i)=fxAFG2A(i)+.01; fzR2NO3(i)=fzR2NO3(i)+.01; fzRHNO3(i)=fzRHNO3(i)+.2; fzRCNO3(i)=fzRCNO3(i)+.07; fxHPCRB(i)=fxHPCRB(i)+.01; fyROOH(i)=fyROOH(i)+.51; fyRUOOH(i)=fyRUOOH(i)+.55; fyHPCRB(i)=fyHPCRB(i)+.27; fSumRO2(i)=fSumRO2(i)+1.39;

i=i+1;
Rnames{i} = 'TERP_OH = .05*xOH + .03*xPACID + .02*xAFG2A + .06*xHPCRB';
k(:,i) = 2.70e+00;
Gstr{i,1} = 'TERP_OH';
fTERP_OH(i)=fTERP_OH(i)-1; fxOH(i)=fxOH(i)+.05; fxPACID(i)=fxPACID(i)+.03; fxAFG2A(i)=fxAFG2A(i)+.02; fxHPCRB(i)=fxHPCRB(i)+.06;

i=i+1;
Rnames{i} = 'TERP_OH + NO = NO + .02*xHO2 + .01*xR2CO3 + .13*RO2C + .04*RO2XC + .01*xHCHO + .03*xRCHO + .03*xOLEA1 + .01*xOLEA2 + .01*zR2NO3 + .01*zRHNO3 + .03*zRCNO3 + .01*yROOH + .01*yRUOOH + .2*yHPCRB + .17*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'TERP_OH'; Gstr{i,2} = 'NO';
fTERP_OH(i)=fTERP_OH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.02; fxR2CO3(i)=fxR2CO3(i)+.01; fRO2C(i)=fRO2C(i)+.13; fRO2XC(i)=fRO2XC(i)+.04; fxHCHO(i)=fxHCHO(i)+.01; fxRCHO(i)=fxRCHO(i)+.03; fxOLEA1(i)=fxOLEA1(i)+.03; fxOLEA2(i)=fxOLEA2(i)+.01; fzR2NO3(i)=fzR2NO3(i)+.01; fzRHNO3(i)=fzRHNO3(i)+.01; fzRCNO3(i)=fzRCNO3(i)+.03; fyROOH(i)=fyROOH(i)+.01; fyRUOOH(i)=fyRUOOH(i)+.01; fyHPCRB(i)=fyHPCRB(i)+.2; fSumRO2(i)=fSumRO2(i)+.17;

i=i+1;
Rnames{i} = 'TERP + O3 = TERP_O3 + .57*OH + .02*xOH + .13*HO2 + .09*xHO2 + .08*xMECO3 + .07*xR2CO3 + .08*HCHO2 + .25*RCHO2 + .36*RO2C + .11*RO2XC + .18*HCHO + .06*xHCHO + .12*xRCHO + .03*xGLY + .01*xMACR + .01*ACET + .01*xACET + .17*KET2 + .01*LVKS + .02*OLEP + .01*xPACID + .01*xAFG3 + .11*zRCNO3 + .01*xHPCRB + .03*H2 + .12*CO + .06*CO2 + .01*yROOH + .39*yHPCRB + .47*SumRO2';
k(:,i) = 1.17e-16;
Gstr{i,1} = 'TERP'; Gstr{i,2} = 'O3';
fTERP(i)=fTERP(i)-1; fO3(i)=fO3(i)-1; fTERP_O3(i)=fTERP_O3(i)+1; fOH(i)=fOH(i)+.57; fxOH(i)=fxOH(i)+.02; fHO2(i)=fHO2(i)+.13; fxHO2(i)=fxHO2(i)+.09; fxMECO3(i)=fxMECO3(i)+.08; fxR2CO3(i)=fxR2CO3(i)+.07; fHCHO2(i)=fHCHO2(i)+.08; fRCHO2(i)=fRCHO2(i)+.25; fRO2C(i)=fRO2C(i)+.36; fRO2XC(i)=fRO2XC(i)+.11; fHCHO(i)=fHCHO(i)+.18; fxHCHO(i)=fxHCHO(i)+.06; fxRCHO(i)=fxRCHO(i)+.12; fxGLY(i)=fxGLY(i)+.03; fxMACR(i)=fxMACR(i)+.01; fACET(i)=fACET(i)+.01; fxACET(i)=fxACET(i)+.01; fKET2(i)=fKET2(i)+.17; fLVKS(i)=fLVKS(i)+.01; fOLEP(i)=fOLEP(i)+.02; fxPACID(i)=fxPACID(i)+.01; fxAFG3(i)=fxAFG3(i)+.01; fzRCNO3(i)=fzRCNO3(i)+.11; fxHPCRB(i)=fxHPCRB(i)+.01; fH2(i)=fH2(i)+.03; fCO(i)=fCO(i)+.12; fCO2(i)=fCO2(i)+.06; fyROOH(i)=fyROOH(i)+.01; fyHPCRB(i)=fyHPCRB(i)+.39; fSumRO2(i)=fSumRO2(i)+.47;

i=i+1;
Rnames{i} = 'TERP_O3 = .01*OH + .03*xOH + .08*xHO2 + .01*xPACID + .04*xHPCRB';
k(:,i) = 1.22e+00;
Gstr{i,1} = 'TERP_O3';
fTERP_O3(i)=fTERP_O3(i)-1; fOH(i)=fOH(i)+.01; fxOH(i)=fxOH(i)+.03; fxHO2(i)=fxHO2(i)+.08; fxPACID(i)=fxPACID(i)+.01; fxHPCRB(i)=fxHPCRB(i)+.04;

i=i+1;
Rnames{i} = 'TERP_O3 + NO = NO + .04*xMECO3 + .01*xR2CO3 + .04*xMACO3 + .06*RO2C + .03*RO2XC + .04*xHCHO + .01*xRCHO + .04*xOLEA2 + .03*zRCNO3 + .01*CO + .08*yHPCRB + .09*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'TERP_O3'; Gstr{i,2} = 'NO';
fTERP_O3(i)=fTERP_O3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxMECO3(i)=fxMECO3(i)+.04; fxR2CO3(i)=fxR2CO3(i)+.01; fxMACO3(i)=fxMACO3(i)+.04; fRO2C(i)=fRO2C(i)+.06; fRO2XC(i)=fRO2XC(i)+.03; fxHCHO(i)=fxHCHO(i)+.04; fxRCHO(i)=fxRCHO(i)+.01; fxOLEA2(i)=fxOLEA2(i)+.04; fzRCNO3(i)=fzRCNO3(i)+.03; fCO(i)=fCO(i)+.01; fyHPCRB(i)=fyHPCRB(i)+.08; fSumRO2(i)=fSumRO2(i)+.09;

i=i+1;
Rnames{i} = 'TERP + NO3 = TERP_N3 + .51*xNO2 + .02*xOH + .07*xHO2 + .03*xR2CO3 + 1.17*RO2C + .29*RO2XC + .02*xHCHO + .29*xRCHO + .21*xOLEA2 + .15*xACET + .01*xMVK + .01*xOLEP + .13*xRCNO3 + .09*zRCNO3 + .19*zRDNO3 + yRPNO3 + .05*yROOH + .01*yRUOOH + .01*yHPCRB + 1.46*SumRO2';
k(:,i) = 1.10e-11;
Gstr{i,1} = 'TERP'; Gstr{i,2} = 'NO3';
fTERP(i)=fTERP(i)-1; fNO3(i)=fNO3(i)-1; fTERP_N3(i)=fTERP_N3(i)+1; fxNO2(i)=fxNO2(i)+.51; fxOH(i)=fxOH(i)+.02; fxHO2(i)=fxHO2(i)+.07; fxR2CO3(i)=fxR2CO3(i)+.03; fRO2C(i)=fRO2C(i)+1.17; fRO2XC(i)=fRO2XC(i)+.29; fxHCHO(i)=fxHCHO(i)+.02; fxRCHO(i)=fxRCHO(i)+.29; fxOLEA2(i)=fxOLEA2(i)+.21; fxACET(i)=fxACET(i)+.15; fxMVK(i)=fxMVK(i)+.01; fxOLEP(i)=fxOLEP(i)+.01; fxRCNO3(i)=fxRCNO3(i)+.13; fzRCNO3(i)=fzRCNO3(i)+.09; fzRDNO3(i)=fzRDNO3(i)+.19; fyRPNO3(i)=fyRPNO3(i)+1; fyROOH(i)=fyROOH(i)+.05; fyRUOOH(i)=fyRUOOH(i)+.01; fyHPCRB(i)=fyHPCRB(i)+.01; fSumRO2(i)=fSumRO2(i)+1.46;

i=i+1;
Rnames{i} = 'TERP_N3 = .01*xNO2 + .07*xOH + .02*xPACID + .03*xRCNO3 + .02*xHPCRB';
k(:,i) = 2.47e+00;
Gstr{i,1} = 'TERP_N3';
fTERP_N3(i)=fTERP_N3(i)-1; fxNO2(i)=fxNO2(i)+.01; fxOH(i)=fxOH(i)+.07; fxPACID(i)=fxPACID(i)+.02; fxRCNO3(i)=fxRCNO3(i)+.03; fxHPCRB(i)=fxHPCRB(i)+.02;

i=i+1;
Rnames{i} = 'TERP_N3 + NO = NO + .04*xHO2 + .12*RO2C + .04*RO2XC + .01*xACET + .04*zRCNO3 + .01*zRDNO3 + .01*yRPNO3 + .16*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'TERP_N3'; Gstr{i,2} = 'NO';
fTERP_N3(i)=fTERP_N3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.04; fRO2C(i)=fRO2C(i)+.12; fRO2XC(i)=fRO2XC(i)+.04; fxACET(i)=fxACET(i)+.01; fzRCNO3(i)=fzRCNO3(i)+.04; fzRDNO3(i)=fzRDNO3(i)+.01; fyRPNO3(i)=fyRPNO3(i)+.01; fSumRO2(i)=fSumRO2(i)+.16;

i=i+1;
Rnames{i} = 'TERP + O3P = .16*RCHO + .04*OLEA2 + .18*KET2 + .01*LVKS + .27*OLEP + .18*ALK3 + .08*ALK4 + .08*ALK5';
k(:,i) = 4.24e-11;
Gstr{i,1} = 'TERP'; Gstr{i,2} = 'O3P';
fTERP(i)=fTERP(i)-1; fO3P(i)=fO3P(i)-1; fRCHO(i)=fRCHO(i)+.16; fOLEA2(i)=fOLEA2(i)+.04; fKET2(i)=fKET2(i)+.18; fLVKS(i)=fLVKS(i)+.01; fOLEP(i)=fOLEP(i)+.27; fALK3(i)=fALK3(i)+.18; fALK4(i)=fALK4(i)+.08; fALK5(i)=fALK5(i)+.08;

i=i+1;
Rnames{i} = 'SESQ + OH = SESQ_OH + .05*xOH + .03*HO2 + .57*xHO2 + .83*RO2C + .25*RO2XC + .04*xHCHO + .45*xOLEA2 + .01*xACET + .07*xOLEP + .18*zRHNO3 + .03*zRCNO3 + .02*xHPCRB + .01*yROOH + .97*yRUOOH + .09*yHPCRB + 1.08*SumRO2';
k(:,i) = 2.00e-10;
Gstr{i,1} = 'SESQ'; Gstr{i,2} = 'OH';
fSESQ(i)=fSESQ(i)-1; fOH(i)=fOH(i)-1; fSESQ_OH(i)=fSESQ_OH(i)+1; fxOH(i)=fxOH(i)+.05; fHO2(i)=fHO2(i)+.03; fxHO2(i)=fxHO2(i)+.57; fRO2C(i)=fRO2C(i)+.83; fRO2XC(i)=fRO2XC(i)+.25; fxHCHO(i)=fxHCHO(i)+.04; fxOLEA2(i)=fxOLEA2(i)+.45; fxACET(i)=fxACET(i)+.01; fxOLEP(i)=fxOLEP(i)+.07; fzRHNO3(i)=fzRHNO3(i)+.18; fzRCNO3(i)=fzRCNO3(i)+.03; fxHPCRB(i)=fxHPCRB(i)+.02; fyROOH(i)=fyROOH(i)+.01; fyRUOOH(i)=fyRUOOH(i)+.97; fyHPCRB(i)=fyHPCRB(i)+.09; fSumRO2(i)=fSumRO2(i)+1.08;

i=i+1;
Rnames{i} = 'SESQ_OH = .03*xOH + .08*xHO2 + .02*xLVKS + .01*xOLEP + .03*zRPNO3 + .06*xHPCRB + .01*yROOH';
k(:,i) = 3.19e+00;
Gstr{i,1} = 'SESQ_OH';
fSESQ_OH(i)=fSESQ_OH(i)-1; fxOH(i)=fxOH(i)+.03; fxHO2(i)=fxHO2(i)+.08; fxLVKS(i)=fxLVKS(i)+.02; fxOLEP(i)=fxOLEP(i)+.01; fzRPNO3(i)=fzRPNO3(i)+.03; fxHPCRB(i)=fxHPCRB(i)+.06; fyROOH(i)=fyROOH(i)+.01;

i=i+1;
Rnames{i} = 'SESQ_OH + NO = NO + .25*RO2C + .09*RO2XC + .08*xHCHO + .07*xOLEA2 + .09*xACET + .12*zRHNO3 + .01*zRCNO3 + .11*yRUOOH + .23*yHPCRB + .34*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'SESQ_OH'; Gstr{i,2} = 'NO';
fSESQ_OH(i)=fSESQ_OH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRO2C(i)=fRO2C(i)+.25; fRO2XC(i)=fRO2XC(i)+.09; fxHCHO(i)=fxHCHO(i)+.08; fxOLEA2(i)=fxOLEA2(i)+.07; fxACET(i)=fxACET(i)+.09; fzRHNO3(i)=fzRHNO3(i)+.12; fzRCNO3(i)=fzRCNO3(i)+.01; fyRUOOH(i)=fyRUOOH(i)+.11; fyHPCRB(i)=fyHPCRB(i)+.23; fSumRO2(i)=fSumRO2(i)+.34;

i=i+1;
Rnames{i} = 'SESQ + O3 = SESQ_O3 + .66*OH + .02*xOH + .01*HO2 + .07*xHO2 + .15*xMACO3 + .33*RCHO2 + .25*RO2C + .1*RO2XC + .01*HCHO + .15*xHCHO + .01*OLEP + .07*zRCNO3 + .01*xHPCRB + .22*yHPCRB + .35*SumRO2';
k(:,i) = 3.14e-16;
Gstr{i,1} = 'SESQ'; Gstr{i,2} = 'O3';
fSESQ(i)=fSESQ(i)-1; fO3(i)=fO3(i)-1; fSESQ_O3(i)=fSESQ_O3(i)+1; fOH(i)=fOH(i)+.66; fxOH(i)=fxOH(i)+.02; fHO2(i)=fHO2(i)+.01; fxHO2(i)=fxHO2(i)+.07; fxMACO3(i)=fxMACO3(i)+.15; fRCHO2(i)=fRCHO2(i)+.33; fRO2C(i)=fRO2C(i)+.25; fRO2XC(i)=fRO2XC(i)+.1; fHCHO(i)=fHCHO(i)+.01; fxHCHO(i)=fxHCHO(i)+.15; fOLEP(i)=fOLEP(i)+.01; fzRCNO3(i)=fzRCNO3(i)+.07; fxHPCRB(i)=fxHPCRB(i)+.01; fyHPCRB(i)=fyHPCRB(i)+.22; fSumRO2(i)=fSumRO2(i)+.35;

i=i+1;
Rnames{i} = 'SESQ_O3 = .03*xOH + .29*xHO2 + .05*OTHN + .03*zRNNO3';
k(:,i) = 4.27e+00;
Gstr{i,1} = 'SESQ_O3';
fSESQ_O3(i)=fSESQ_O3(i)-1; fxOH(i)=fxOH(i)+.03; fxHO2(i)=fxHO2(i)+.29; fOTHN(i)=fOTHN(i)+.05; fzRNNO3(i)=fzRNNO3(i)+.03;

i=i+1;
Rnames{i} = 'SESQ_O3 + NO = NO + .17*xMECO3 + .35*RO2C + .14*RO2XC + .02*xHCHO + .02*xRCHO + .22*xOLEA2 + .02*xACET + .16*zRCNO3 + .51*yHPCRB + .49*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'SESQ_O3'; Gstr{i,2} = 'NO';
fSESQ_O3(i)=fSESQ_O3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxMECO3(i)=fxMECO3(i)+.17; fRO2C(i)=fRO2C(i)+.35; fRO2XC(i)=fRO2XC(i)+.14; fxHCHO(i)=fxHCHO(i)+.02; fxRCHO(i)=fxRCHO(i)+.02; fxOLEA2(i)=fxOLEA2(i)+.22; fxACET(i)=fxACET(i)+.02; fzRCNO3(i)=fzRCNO3(i)+.16; fyHPCRB(i)=fyHPCRB(i)+.51; fSumRO2(i)=fSumRO2(i)+.49;

i=i+1;
Rnames{i} = 'SESQ + NO3 = .74*xNO2 + .03*xOH + .01*xHO2 + .84*RO2C + .23*RO2XC + .74*xOLEA2 + .03*xRCNO3 + .01*zRCNO3 + .21*zRDNO3 + .01*RNNO3 + yRPNO3 + 1.07*SumRO2';
k(:,i) = 1.90e-11;
Gstr{i,1} = 'SESQ'; Gstr{i,2} = 'NO3';
fSESQ(i)=fSESQ(i)-1; fNO3(i)=fNO3(i)-1; fxNO2(i)=fxNO2(i)+.74; fxOH(i)=fxOH(i)+.03; fxHO2(i)=fxHO2(i)+.01; fRO2C(i)=fRO2C(i)+.84; fRO2XC(i)=fRO2XC(i)+.23; fxOLEA2(i)=fxOLEA2(i)+.74; fxRCNO3(i)=fxRCNO3(i)+.03; fzRCNO3(i)=fzRCNO3(i)+.01; fzRDNO3(i)=fzRDNO3(i)+.21; fRNNO3(i)=fRNNO3(i)+.01; fyRPNO3(i)=fyRPNO3(i)+1; fSumRO2(i)=fSumRO2(i)+1.07;

i=i+1;
Rnames{i} = 'SESQ + O3P = .13*OLEA2 + .87*OLEP';
k(:,i) = 6.85e-11;
Gstr{i,1} = 'SESQ'; Gstr{i,2} = 'O3P';
fSESQ(i)=fSESQ(i)-1; fO3P(i)=fO3P(i)-1; fOLEA2(i)=fOLEA2(i)+.13; fOLEP(i)=fOLEP(i)+.87;

i=i+1;
Rnames{i} = 'BENX + OH = .69*HO2 + .28*xHO2 + .28*RO2C + .04*RO2XC + .28*xGLY + .12*OLEA2 + .57*PHEN + .28*xBUDAL + .04*zRANO3 + .31*yRAOOH + .32*SumRO2';
k(:,i) = 1.21e-12;
Gstr{i,1} = 'BENX'; Gstr{i,2} = 'OH';
fBENX(i)=fBENX(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.69; fxHO2(i)=fxHO2(i)+.28; fRO2C(i)=fRO2C(i)+.28; fRO2XC(i)=fRO2XC(i)+.04; fxGLY(i)=fxGLY(i)+.28; fOLEA2(i)=fOLEA2(i)+.12; fPHEN(i)=fPHEN(i)+.57; fxBUDAL(i)=fxBUDAL(i)+.28; fzRANO3(i)=fzRANO3(i)+.04; fyRAOOH(i)=fyRAOOH(i)+.31; fSumRO2(i)=fSumRO2(i)+.32;

i=i+1;
Rnames{i} = 'ARO1 + OH = .26*HO2 + .48*xHO2 + .05*xETO2 + .75*RO2C + .21*RO2XC + .01*xHCHO + .06*xMECHO + .11*xETCHO + .01*xRCHO + .13*xGLY + .13*xMGLY + .01*OLEA1 + .13*OLEA2 + .12*XYNL + .2*xBALD + .13*xBUDAL + .01*xAFG1 + .11*xAFG2A + .03*zR1NO3 + .11*zR2NO3 + .01*zRHNO3 + .06*zRANO3 + .04*ARO1 + 3.11*NROG + .64*yROOH + .32*yRAOOH + .96*SumRO2';
k(:,i) = 7.69e-12;
Gstr{i,1} = 'ARO1'; Gstr{i,2} = 'OH';
fARO1(i)=fARO1(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.26; fxHO2(i)=fxHO2(i)+.48; fxETO2(i)=fxETO2(i)+.05; fRO2C(i)=fRO2C(i)+.75; fRO2XC(i)=fRO2XC(i)+.21; fxHCHO(i)=fxHCHO(i)+.01; fxMECHO(i)=fxMECHO(i)+.06; fxETCHO(i)=fxETCHO(i)+.11; fxRCHO(i)=fxRCHO(i)+.01; fxGLY(i)=fxGLY(i)+.13; fxMGLY(i)=fxMGLY(i)+.13; fOLEA1(i)=fOLEA1(i)+.01; fOLEA2(i)=fOLEA2(i)+.13; fXYNL(i)=fXYNL(i)+.12; fxBALD(i)=fxBALD(i)+.2; fxBUDAL(i)=fxBUDAL(i)+.13; fxAFG1(i)=fxAFG1(i)+.01; fxAFG2A(i)=fxAFG2A(i)+.11; fzR1NO3(i)=fzR1NO3(i)+.03; fzR2NO3(i)=fzR2NO3(i)+.11; fzRHNO3(i)=fzRHNO3(i)+.01; fzRANO3(i)=fzRANO3(i)+.06; fARO1(i)=fARO1(i)+.04; fNROG(i)=fNROG(i)+3.11; fyROOH(i)=fyROOH(i)+.64; fyRAOOH(i)=fyRAOOH(i)+.32; fSumRO2(i)=fSumRO2(i)+.96;

i=i+1;
Rnames{i} = 'ARO2 + OH = .28*HO2 + .56*xHO2 + .61*RO2C + .15*RO2XC + .01*xHCHO + .07*xGLY + .39*xMGLY + .02*OLEA1 + .13*OLEA2 + .01*xKET2 + .01*LVKS + .03*xBACL + .01*xOACID + .08*XYNL + .04*BALD + .03*xBALD + .03*xBUDAL + .07*xAFG1 + .29*xAFG2A + .04*xAFG2B + .05*xAFG3 + .02*zR2NO3 + .01*zRCNO3 + .11*zRANO3 + .03*xBENX + 1.67*NROG + .11*yROOH + .59*yRAOOH + .04*yHPCRB + .76*SumRO2';
k(:,i) = 2.20e-11;
Gstr{i,1} = 'ARO2'; Gstr{i,2} = 'OH';
fARO2(i)=fARO2(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.28; fxHO2(i)=fxHO2(i)+.56; fRO2C(i)=fRO2C(i)+.61; fRO2XC(i)=fRO2XC(i)+.15; fxHCHO(i)=fxHCHO(i)+.01; fxGLY(i)=fxGLY(i)+.07; fxMGLY(i)=fxMGLY(i)+.39; fOLEA1(i)=fOLEA1(i)+.02; fOLEA2(i)=fOLEA2(i)+.13; fxKET2(i)=fxKET2(i)+.01; fLVKS(i)=fLVKS(i)+.01; fxBACL(i)=fxBACL(i)+.03; fxOACID(i)=fxOACID(i)+.01; fXYNL(i)=fXYNL(i)+.08; fBALD(i)=fBALD(i)+.04; fxBALD(i)=fxBALD(i)+.03; fxBUDAL(i)=fxBUDAL(i)+.03; fxAFG1(i)=fxAFG1(i)+.07; fxAFG2A(i)=fxAFG2A(i)+.29; fxAFG2B(i)=fxAFG2B(i)+.04; fxAFG3(i)=fxAFG3(i)+.05; fzR2NO3(i)=fzR2NO3(i)+.02; fzRCNO3(i)=fzRCNO3(i)+.01; fzRANO3(i)=fzRANO3(i)+.11; fxBENX(i)=fxBENX(i)+.03; fNROG(i)=fNROG(i)+1.67; fyROOH(i)=fyROOH(i)+.11; fyRAOOH(i)=fyRAOOH(i)+.59; fyHPCRB(i)=fyHPCRB(i)+.04; fSumRO2(i)=fSumRO2(i)+.76;

i=i+1;
Rnames{i} = 'FURNS + OH = .75*HO2 + .24*xHO2 + .24*RO2C + .01*RO2XC + .07*xRCHO + .03*xOLEA1 + .14*xOLEP + .75*BUDAL + .01*zRHNO3 + .08*CO + .15*yRUOOH + .01*yHPCRB + .25*SumRO2';
k(:,i) = 3.84e-11;
Gstr{i,1} = 'FURNS'; Gstr{i,2} = 'OH';
fFURNS(i)=fFURNS(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.75; fxHO2(i)=fxHO2(i)+.24; fRO2C(i)=fRO2C(i)+.24; fRO2XC(i)=fRO2XC(i)+.01; fxRCHO(i)=fxRCHO(i)+.07; fxOLEA1(i)=fxOLEA1(i)+.03; fxOLEP(i)=fxOLEP(i)+.14; fBUDAL(i)=fBUDAL(i)+.75; fzRHNO3(i)=fzRHNO3(i)+.01; fCO(i)=fCO(i)+.08; fyRUOOH(i)=fyRUOOH(i)+.15; fyHPCRB(i)=fyHPCRB(i)+.01; fSumRO2(i)=fSumRO2(i)+.25;

i=i+1;
Rnames{i} = 'FURNS + O3 = .44*HO2 + .33*xHO2 + .4*RCHO2 + .33*RO2C + .01*RO2XC + .14*OLEA1 + .01*zRCNO3 + .07*HPCRB + .74*CO + .19*CO2 + .33*ALK1 + .2*yHPCRB + .34*SumRO2';
k(:,i) = 2.40e-18;
Gstr{i,1} = 'FURNS'; Gstr{i,2} = 'O3';
fFURNS(i)=fFURNS(i)-1; fO3(i)=fO3(i)-1; fHO2(i)=fHO2(i)+.44; fxHO2(i)=fxHO2(i)+.33; fRCHO2(i)=fRCHO2(i)+.4; fRO2C(i)=fRO2C(i)+.33; fRO2XC(i)=fRO2XC(i)+.01; fOLEA1(i)=fOLEA1(i)+.14; fzRCNO3(i)=fzRCNO3(i)+.01; fHPCRB(i)=fHPCRB(i)+.07; fCO(i)=fCO(i)+.74; fCO2(i)=fCO2(i)+.19; fALK1(i)=fALK1(i)+.33; fyHPCRB(i)=fyHPCRB(i)+.2; fSumRO2(i)=fSumRO2(i)+.34;

i=i+1;
Rnames{i} = 'FURNS + NO3 = .08*xNO2 + .87*xHO2 + .95*RO2C + .05*RO2XC + .07*xOLEA1 + .01*xOLEP + .87*xRCNO3 + .05*zRDNO3 + .28*CO + .63*yRPNO3 + SumRO2';
k(:,i) = 1.20e-12;
Gstr{i,1} = 'FURNS'; Gstr{i,2} = 'NO3';
fFURNS(i)=fFURNS(i)-1; fNO3(i)=fNO3(i)-1; fxNO2(i)=fxNO2(i)+.08; fxHO2(i)=fxHO2(i)+.87; fRO2C(i)=fRO2C(i)+.95; fRO2XC(i)=fRO2XC(i)+.05; fxOLEA1(i)=fxOLEA1(i)+.07; fxOLEP(i)=fxOLEP(i)+.01; fxRCNO3(i)=fxRCNO3(i)+.87; fzRDNO3(i)=fzRDNO3(i)+.05; fCO(i)=fCO(i)+.28; fyRPNO3(i)=fyRPNO3(i)+.63; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'STYRS + OH = .06*HO2 + .79*xHO2 + .79*RO2C + .15*RO2XC + .74*xHCHO + .02*xGLY + .02*xMGLY + .03*OLEA2 + .02*XYNL + .74*xBALD + .02*xBUDAL + .02*xAFG2A + .14*zRHNO3 + .01*zRANO3 + .88*yROOH + .06*yRAOOH + .94*SumRO2';
k(:,i) = 5.80e-11;
Gstr{i,1} = 'STYRS'; Gstr{i,2} = 'OH';
fSTYRS(i)=fSTYRS(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.06; fxHO2(i)=fxHO2(i)+.79; fRO2C(i)=fRO2C(i)+.79; fRO2XC(i)=fRO2XC(i)+.15; fxHCHO(i)=fxHCHO(i)+.74; fxGLY(i)=fxGLY(i)+.02; fxMGLY(i)=fxMGLY(i)+.02; fOLEA2(i)=fOLEA2(i)+.03; fXYNL(i)=fXYNL(i)+.02; fxBALD(i)=fxBALD(i)+.74; fxBUDAL(i)=fxBUDAL(i)+.02; fxAFG2A(i)=fxAFG2A(i)+.02; fzRHNO3(i)=fzRHNO3(i)+.14; fzRANO3(i)=fzRANO3(i)+.01; fyROOH(i)=fyROOH(i)+.88; fyRAOOH(i)=fyRAOOH(i)+.06; fSumRO2(i)=fSumRO2(i)+.94;

i=i+1;
Rnames{i} = 'STYRS + O3 = .03*xBZO + .08*OH + .17*HO2 + .21*HCHO2 + .34*RCHO2 + .03*RO2C + .5*HCHO + .05*PHEN + .5*BALD + .09*H2 + .22*CO + .23*CO2 + .09*BENZ + .03*yROOH + .03*SumRO2';
k(:,i) = 1.60e-17;
Gstr{i,1} = 'STYRS'; Gstr{i,2} = 'O3';
fSTYRS(i)=fSTYRS(i)-1; fO3(i)=fO3(i)-1; fxBZO(i)=fxBZO(i)+.03; fOH(i)=fOH(i)+.08; fHO2(i)=fHO2(i)+.17; fHCHO2(i)=fHCHO2(i)+.21; fRCHO2(i)=fRCHO2(i)+.34; fRO2C(i)=fRO2C(i)+.03; fHCHO(i)=fHCHO(i)+.5; fPHEN(i)=fPHEN(i)+.05; fBALD(i)=fBALD(i)+.5; fH2(i)=fH2(i)+.09; fCO(i)=fCO(i)+.22; fCO2(i)=fCO2(i)+.23; fBENZ(i)=fBENZ(i)+.09; fyROOH(i)=fyROOH(i)+.03; fSumRO2(i)=fSumRO2(i)+.03;

i=i+1;
Rnames{i} = 'AMINS + OH = .02*HO2 + .96*xHO2 + .01*xMEO2 + .97*RO2C + .02*RO2XC + .08*xHCHO + .02*RCHO + .02*zR2NO3 + .97*xAMINS + .99*yROOH + .99*SumRO2';
k(:,i) = 4.35e-11;
Gstr{i,1} = 'AMINS'; Gstr{i,2} = 'OH';
fAMINS(i)=fAMINS(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.02; fxHO2(i)=fxHO2(i)+.96; fxMEO2(i)=fxMEO2(i)+.01; fRO2C(i)=fRO2C(i)+.97; fRO2XC(i)=fRO2XC(i)+.02; fxHCHO(i)=fxHCHO(i)+.08; fRCHO(i)=fRCHO(i)+.02; fzR2NO3(i)=fzR2NO3(i)+.02; fxAMINS(i)=fxAMINS(i)+.97; fyROOH(i)=fyROOH(i)+.99; fSumRO2(i)=fSumRO2(i)+.99;

i=i+1;
Rnames{i} = 'AMINS + O3 = .61*AMINS + 29.54*NROG';
k(:,i) = 3.09e-18;
Gstr{i,1} = 'AMINS'; Gstr{i,2} = 'O3';
fAMINS(i)=fAMINS(i)-1; fO3(i)=fO3(i)-1; fAMINS(i)=fAMINS(i)+.61; fNROG(i)=fNROG(i)+29.54;

i=i+1;
Rnames{i} = 'TAMNS + OH = .03*xMEO2 + .06*RO2C + .03*xHCHO + .03*xAMINS + .97*PNAMIN + .06*yROOH + .06*SumRO2';
k(:,i) = 1.01e-11;
Gstr{i,1} = 'TAMNS'; Gstr{i,2} = 'OH';
fTAMNS(i)=fTAMNS(i)-1; fOH(i)=fOH(i)-1; fxMEO2(i)=fxMEO2(i)+.03; fRO2C(i)=fRO2C(i)+.06; fxHCHO(i)=fxHCHO(i)+.03; fxAMINS(i)=fxAMINS(i)+.03; fPNAMIN(i)=fPNAMIN(i)+.97; fyROOH(i)=fyROOH(i)+.06; fSumRO2(i)=fSumRO2(i)+.06;

i=i+1;
Rnames{i} = 'RCHO + OH = .02*xOH + .05*HO2 + .05*xHO2 + .01*xMECO3 + .81*R2CO3 + .16*RO2C + .04*RO2XC + .03*xHCHO + .04*RCHO + .04*xRCHO + .02*MGLY + .03*xACET + .01*xBACL + .02*xPACID + .04*zRCNO3 + .03*CO + .01*ALK4 + .07*NROG + .15*yHPCRB + .2*SumRO2 + .81*SumRCO3';
k(:,i) = 3.12e-11;
Gstr{i,1} = 'RCHO'; Gstr{i,2} = 'OH';
fRCHO(i)=fRCHO(i)-1; fOH(i)=fOH(i)-1; fxOH(i)=fxOH(i)+.02; fHO2(i)=fHO2(i)+.05; fxHO2(i)=fxHO2(i)+.05; fxMECO3(i)=fxMECO3(i)+.01; fR2CO3(i)=fR2CO3(i)+.81; fRO2C(i)=fRO2C(i)+.16; fRO2XC(i)=fRO2XC(i)+.04; fxHCHO(i)=fxHCHO(i)+.03; fRCHO(i)=fRCHO(i)+.04; fxRCHO(i)=fxRCHO(i)+.04; fMGLY(i)=fMGLY(i)+.02; fxACET(i)=fxACET(i)+.03; fxBACL(i)=fxBACL(i)+.01; fxPACID(i)=fxPACID(i)+.02; fzRCNO3(i)=fzRCNO3(i)+.04; fCO(i)=fCO(i)+.03; fALK4(i)=fALK4(i)+.01; fNROG(i)=fNROG(i)+.07; fyHPCRB(i)=fyHPCRB(i)+.15; fSumRO2(i)=fSumRO2(i)+.2; fSumRCO3(i)=fSumRCO3(i)+.81;

i=i+1;
Rnames{i} = 'RCHO + NO3 = HNO3 + .04*HO2 + .95*R2CO3 + .02*RO2C + .01*RO2XC + .02*RCHO + .02*MGLY + .01*zRCNO3 + .02*yHPCRB + .03*SumRO2 + .95*SumRCO3';
k(:,i) = 2.09e-14;
Gstr{i,1} = 'RCHO'; Gstr{i,2} = 'NO3';
fRCHO(i)=fRCHO(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fHO2(i)=fHO2(i)+.04; fR2CO3(i)=fR2CO3(i)+.95; fRO2C(i)=fRO2C(i)+.02; fRO2XC(i)=fRO2XC(i)+.01; fRCHO(i)=fRCHO(i)+.02; fMGLY(i)=fMGLY(i)+.02; fzRCNO3(i)=fzRCNO3(i)+.01; fyHPCRB(i)=fyHPCRB(i)+.02; fSumRO2(i)=fSumRO2(i)+.03; fSumRCO3(i)=fSumRCO3(i)+.95;

i=i+1;
Rnames{i} = 'RCHO + HV = RCHO_HV + 1.21*HO2 + .6*xHO2 + .04*xMECO3 + .76*RO2C + .14*RO2XC + .09*xHCHO + .09*MECHO + .02*xMECHO + .03*xETCHO + .12*GLCHO + .42*xRCHO + .06*xACET + .03*xKET2 + .01*xPACID + .01*zRHNO3 + .12*zRCNO3 + CO + .01*ALK4 + .04*NROG + .31*yROOH + .51*yHPCRB + .9*SumRO2';
k(:,i) = JC2CHO;
Gstr{i,1} = 'RCHO';
fRCHO(i)=fRCHO(i)-1; fRCHO_HV(i)=fRCHO_HV(i)+1; fHO2(i)=fHO2(i)+1.21; fxHO2(i)=fxHO2(i)+.6; fxMECO3(i)=fxMECO3(i)+.04; fRO2C(i)=fRO2C(i)+.76; fRO2XC(i)=fRO2XC(i)+.14; fxHCHO(i)=fxHCHO(i)+.09; fMECHO(i)=fMECHO(i)+.09; fxMECHO(i)=fxMECHO(i)+.02; fxETCHO(i)=fxETCHO(i)+.03; fGLCHO(i)=fGLCHO(i)+.12; fxRCHO(i)=fxRCHO(i)+.42; fxACET(i)=fxACET(i)+.06; fxKET2(i)=fxKET2(i)+.03; fxPACID(i)=fxPACID(i)+.01; fzRHNO3(i)=fzRHNO3(i)+.01; fzRCNO3(i)=fzRCNO3(i)+.12; fCO(i)=fCO(i)+1; fALK4(i)=fALK4(i)+.01; fNROG(i)=fNROG(i)+.04; fyROOH(i)=fyROOH(i)+.31; fyHPCRB(i)=fyHPCRB(i)+.51; fSumRO2(i)=fSumRO2(i)+.9;

i=i+1;
Rnames{i} = 'RCHO_HV = .01*xOH + .06*xPACID + .01*CO2';
k(:,i) = 2.25e+00;
Gstr{i,1} = 'RCHO_HV';
fRCHO_HV(i)=fRCHO_HV(i)-1; fxOH(i)=fxOH(i)+.01; fxPACID(i)=fxPACID(i)+.06; fCO2(i)=fCO2(i)+.01;

i=i+1;
Rnames{i} = 'RCHO_HV + NO = NO + .01*xHO2 + .01*RO2C + .04*xHCHO + .01*xRCHO + .05*CO + .06*yHPCRB + .01*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'RCHO_HV'; Gstr{i,2} = 'NO';
fRCHO_HV(i)=fRCHO_HV(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.01; fRO2C(i)=fRO2C(i)+.01; fxHCHO(i)=fxHCHO(i)+.04; fxRCHO(i)=fxRCHO(i)+.01; fCO(i)=fCO(i)+.05; fyHPCRB(i)=fyHPCRB(i)+.06; fSumRO2(i)=fSumRO2(i)+.01;

i=i+1;
Rnames{i} = 'OLEA1 + OH = OLEA1_OH + .17*HO2 + .27*xHO2 + .03*MACO3 + .6*RO2C + .05*RO2XC + .2*xGLCHO + .06*RCHO + .05*xGLY + .19*xKET2 + .02*xPACID + .05*AFG1 + .01*AFG2A + .04*AFG2B + .01*HPCRB + .06*CO2 + .05*yHPCRB + .65*SumRO2 + .03*SumRCO3';
k(:,i) = 5.06e-11;
Gstr{i,1} = 'OLEA1'; Gstr{i,2} = 'OH';
fOLEA1(i)=fOLEA1(i)-1; fOH(i)=fOH(i)-1; fOLEA1_OH(i)=fOLEA1_OH(i)+1; fHO2(i)=fHO2(i)+.17; fxHO2(i)=fxHO2(i)+.27; fMACO3(i)=fMACO3(i)+.03; fRO2C(i)=fRO2C(i)+.6; fRO2XC(i)=fRO2XC(i)+.05; fxGLCHO(i)=fxGLCHO(i)+.2; fRCHO(i)=fRCHO(i)+.06; fxGLY(i)=fxGLY(i)+.05; fxKET2(i)=fxKET2(i)+.19; fxPACID(i)=fxPACID(i)+.02; fAFG1(i)=fAFG1(i)+.05; fAFG2A(i)=fAFG2A(i)+.01; fAFG2B(i)=fAFG2B(i)+.04; fHPCRB(i)=fHPCRB(i)+.01; fCO2(i)=fCO2(i)+.06; fyHPCRB(i)=fyHPCRB(i)+.05; fSumRO2(i)=fSumRO2(i)+.65; fSumRCO3(i)=fSumRCO3(i)+.03;

i=i+1;
Rnames{i} = 'OLEA1_OH = .33*xOH + .15*HO2 + .01*xHCHO + .19*xKET2 + .19*xPACID + .02*AFG2A + .04*AFG2B + .05*zRCNO3 + .09*HPCRB + .27*CO2';
k(:,i) = 9.69e-01;
Gstr{i,1} = 'OLEA1_OH';
fOLEA1_OH(i)=fOLEA1_OH(i)-1; fxOH(i)=fxOH(i)+.33; fHO2(i)=fHO2(i)+.15; fxHCHO(i)=fxHCHO(i)+.01; fxKET2(i)=fxKET2(i)+.19; fxPACID(i)=fxPACID(i)+.19; fAFG2A(i)=fAFG2A(i)+.02; fAFG2B(i)=fAFG2B(i)+.04; fzRCNO3(i)=fzRCNO3(i)+.05; fHPCRB(i)=fHPCRB(i)+.09; fCO2(i)=fCO2(i)+.27;

i=i+1;
Rnames{i} = 'OLEA1_OH + NO = NO + .43*xHO2 + .14*RO2C + .01*RO2XC + .09*xHCOOH + .25*xGLCHO + .08*xGLY + .48*xMGLY + .06*zRHNO3 + .1*CO + .59*yHPCRB + .15*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'OLEA1_OH'; Gstr{i,2} = 'NO';
fOLEA1_OH(i)=fOLEA1_OH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.43; fRO2C(i)=fRO2C(i)+.14; fRO2XC(i)=fRO2XC(i)+.01; fxHCOOH(i)=fxHCOOH(i)+.09; fxGLCHO(i)=fxGLCHO(i)+.25; fxGLY(i)=fxGLY(i)+.08; fxMGLY(i)=fxMGLY(i)+.48; fzRHNO3(i)=fzRHNO3(i)+.06; fCO(i)=fCO(i)+.1; fyHPCRB(i)=fyHPCRB(i)+.59; fSumRO2(i)=fSumRO2(i)+.15;

i=i+1;
Rnames{i} = 'OLEA1 + O3 = .62*OH + .71*HO2 + .16*RCHO2 + .04*HCHO + .1*MEOH + .02*HCOOH + .01*MECHO + .06*GLCHO + .42*GLY + .81*MGLY + .02*KET2 + .01*OACID + .06*CO + .33*CO2 + .05*ALK4';
k(:,i) = 3.50e-18;
Gstr{i,1} = 'OLEA1'; Gstr{i,2} = 'O3';
fOLEA1(i)=fOLEA1(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+.62; fHO2(i)=fHO2(i)+.71; fRCHO2(i)=fRCHO2(i)+.16; fHCHO(i)=fHCHO(i)+.04; fMEOH(i)=fMEOH(i)+.1; fHCOOH(i)=fHCOOH(i)+.02; fMECHO(i)=fMECHO(i)+.01; fGLCHO(i)=fGLCHO(i)+.06; fGLY(i)=fGLY(i)+.42; fMGLY(i)=fMGLY(i)+.81; fKET2(i)=fKET2(i)+.02; fOACID(i)=fOACID(i)+.01; fCO(i)=fCO(i)+.06; fCO2(i)=fCO2(i)+.33; fALK4(i)=fALK4(i)+.05;

i=i+1;
Rnames{i} = 'OLEA1 + NO3 = .56*xNO2 + .04*HNO3 + .22*HO2 + .16*xHO2 + .71*RO2C + .06*RO2XC + .01*xHCHO + .52*xGLCHO + .03*xGLY + .03*xKET2 + .52*xPACID + .02*AFG1 + .01*AFG2B + .15*xRHNO3 + .19*RCNO3 + .01*xRCNO3 + .05*zRCNO3 + .02*zRDNO3 + .15*CO + .17*yRPNO3 + .77*SumRO2';
k(:,i) = 9.62e-14;
Gstr{i,1} = 'OLEA1'; Gstr{i,2} = 'NO3';
fOLEA1(i)=fOLEA1(i)-1; fNO3(i)=fNO3(i)-1; fxNO2(i)=fxNO2(i)+.56; fHNO3(i)=fHNO3(i)+.04; fHO2(i)=fHO2(i)+.22; fxHO2(i)=fxHO2(i)+.16; fRO2C(i)=fRO2C(i)+.71; fRO2XC(i)=fRO2XC(i)+.06; fxHCHO(i)=fxHCHO(i)+.01; fxGLCHO(i)=fxGLCHO(i)+.52; fxGLY(i)=fxGLY(i)+.03; fxKET2(i)=fxKET2(i)+.03; fxPACID(i)=fxPACID(i)+.52; fAFG1(i)=fAFG1(i)+.02; fAFG2B(i)=fAFG2B(i)+.01; fxRHNO3(i)=fxRHNO3(i)+.15; fRCNO3(i)=fRCNO3(i)+.19; fxRCNO3(i)=fxRCNO3(i)+.01; fzRCNO3(i)=fzRCNO3(i)+.05; fzRDNO3(i)=fzRDNO3(i)+.02; fCO(i)=fCO(i)+.15; fyRPNO3(i)=fyRPNO3(i)+.17; fSumRO2(i)=fSumRO2(i)+.77;

i=i+1;
Rnames{i} = 'OLEA1 + HV = .43*OH + .86*HO2 + .01*xHO2 + .1*MEO2 + .03*MACO3 + .01*RO2C + .01*xHCHO + .01*HCOOH + .09*GLCHO + .06*MGLY + .03*KET2 + .25*OLEP + .01*xPACID + .03*AFG2A + .08*AFG2B + .99*CO + .03*CO2 + .02*ALK4 + .01*ALK5 + .11*SumRO2 + .03*SumRCO3';
k(:,i) = JMACR_06;
Gstr{i,1} = 'OLEA1';
fOLEA1(i)=fOLEA1(i)-1; fOH(i)=fOH(i)+.43; fHO2(i)=fHO2(i)+.86; fxHO2(i)=fxHO2(i)+.01; fMEO2(i)=fMEO2(i)+.1; fMACO3(i)=fMACO3(i)+.03; fRO2C(i)=fRO2C(i)+.01; fxHCHO(i)=fxHCHO(i)+.01; fHCOOH(i)=fHCOOH(i)+.01; fGLCHO(i)=fGLCHO(i)+.09; fMGLY(i)=fMGLY(i)+.06; fKET2(i)=fKET2(i)+.03; fOLEP(i)=fOLEP(i)+.25; fxPACID(i)=fxPACID(i)+.01; fAFG2A(i)=fAFG2A(i)+.03; fAFG2B(i)=fAFG2B(i)+.08; fCO(i)=fCO(i)+.99; fCO2(i)=fCO2(i)+.03; fALK4(i)=fALK4(i)+.02; fALK5(i)=fALK5(i)+.01; fSumRO2(i)=fSumRO2(i)+.11; fSumRCO3(i)=fSumRCO3(i)+.03;

i=i+1;
Rnames{i} = 'OLEA2 + OH = OLEA2_OH + .08*OH + .16*xOH + .11*HO2 + .24*xHO2 + .01*xMECO3 + .03*xR2CO3 + .12*MACO3 + .03*xMACO3 + .51*RO2C + .1*RO2XC + .01*xHCHO + .03*xGLCHO + .23*xRCHO + .03*xGLY + .01*xMGLY + .04*OLEA1 + .05*OLEA2 + .01*xOLEA2 + .02*LVKS + .1*xPACID + .01*xAFG3 + .05*zRHNO3 + .05*zRCNO3 + .08*HPCRB + .01*xHPCRB + .18*CO + .09*CO2 + .07*MALAH + .3*yHPCRB + .61*SumRO2 + .12*SumRCO3';
k(:,i) = 9.04e-11;
Gstr{i,1} = 'OLEA2'; Gstr{i,2} = 'OH';
fOLEA2(i)=fOLEA2(i)-1; fOH(i)=fOH(i)-1; fOLEA2_OH(i)=fOLEA2_OH(i)+1; fOH(i)=fOH(i)+.08; fxOH(i)=fxOH(i)+.16; fHO2(i)=fHO2(i)+.11; fxHO2(i)=fxHO2(i)+.24; fxMECO3(i)=fxMECO3(i)+.01; fxR2CO3(i)=fxR2CO3(i)+.03; fMACO3(i)=fMACO3(i)+.12; fxMACO3(i)=fxMACO3(i)+.03; fRO2C(i)=fRO2C(i)+.51; fRO2XC(i)=fRO2XC(i)+.1; fxHCHO(i)=fxHCHO(i)+.01; fxGLCHO(i)=fxGLCHO(i)+.03; fxRCHO(i)=fxRCHO(i)+.23; fxGLY(i)=fxGLY(i)+.03; fxMGLY(i)=fxMGLY(i)+.01; fOLEA1(i)=fOLEA1(i)+.04; fOLEA2(i)=fOLEA2(i)+.05; fxOLEA2(i)=fxOLEA2(i)+.01; fLVKS(i)=fLVKS(i)+.02; fxPACID(i)=fxPACID(i)+.1; fxAFG3(i)=fxAFG3(i)+.01; fzRHNO3(i)=fzRHNO3(i)+.05; fzRCNO3(i)=fzRCNO3(i)+.05; fHPCRB(i)=fHPCRB(i)+.08; fxHPCRB(i)=fxHPCRB(i)+.01; fCO(i)=fCO(i)+.18; fCO2(i)=fCO2(i)+.09; fMALAH(i)=fMALAH(i)+.07; fyHPCRB(i)=fyHPCRB(i)+.3; fSumRO2(i)=fSumRO2(i)+.61; fSumRCO3(i)=fSumRCO3(i)+.12;

i=i+1;
Rnames{i} = 'OLEA2_OH = .01*OH + .07*xOH + .02*HO2 + .03*xMACO3 + .13*xPACID + .04*HPCRB + .04*xHPCRB + .02*MALAH';
k(:,i) = 3.25e+00;
Gstr{i,1} = 'OLEA2_OH';
fOLEA2_OH(i)=fOLEA2_OH(i)-1; fOH(i)=fOH(i)+.01; fxOH(i)=fxOH(i)+.07; fHO2(i)=fHO2(i)+.02; fxMACO3(i)=fxMACO3(i)+.03; fxPACID(i)=fxPACID(i)+.13; fHPCRB(i)=fHPCRB(i)+.04; fxHPCRB(i)=fxHPCRB(i)+.04; fMALAH(i)=fMALAH(i)+.02;

i=i+1;
Rnames{i} = 'OLEA2_OH + NO = NO + .08*xHO2 + .04*xMECO3 + .15*RO2C + .01*RO2XC + .04*xRCHO + .06*xMGLY + .01*zRCNO3 + .01*CO + .06*CO2 + .15*yHPCRB + .16*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'OLEA2_OH'; Gstr{i,2} = 'NO';
fOLEA2_OH(i)=fOLEA2_OH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.08; fxMECO3(i)=fxMECO3(i)+.04; fRO2C(i)=fRO2C(i)+.15; fRO2XC(i)=fRO2XC(i)+.01; fxRCHO(i)=fxRCHO(i)+.04; fxMGLY(i)=fxMGLY(i)+.06; fzRCNO3(i)=fzRCNO3(i)+.01; fCO(i)=fCO(i)+.01; fCO2(i)=fCO2(i)+.06; fyHPCRB(i)=fyHPCRB(i)+.15; fSumRO2(i)=fSumRO2(i)+.16;

i=i+1;
Rnames{i} = 'OLEA2 + O3 = OLEA2_O3 + .44*OH + .16*HO2 + .17*xHO2 + .03*xMECO3 + .03*HCHO2 + .34*RCHO2 + .24*RO2C + .01*RO2XC + .02*HCHO + .03*xHCHO + .01*HCOOH + .21*RCHO + .32*GLY + .01*xGLY + .36*MGLY + .05*BACL + .01*xPACID + .01*zRCNO3 + .01*H2 + .38*CO + .15*CO2 + .03*yHPCRB + .25*SumRO2';
k(:,i) = 2.99e-17;
Gstr{i,1} = 'OLEA2'; Gstr{i,2} = 'O3';
fOLEA2(i)=fOLEA2(i)-1; fO3(i)=fO3(i)-1; fOLEA2_O3(i)=fOLEA2_O3(i)+1; fOH(i)=fOH(i)+.44; fHO2(i)=fHO2(i)+.16; fxHO2(i)=fxHO2(i)+.17; fxMECO3(i)=fxMECO3(i)+.03; fHCHO2(i)=fHCHO2(i)+.03; fRCHO2(i)=fRCHO2(i)+.34; fRO2C(i)=fRO2C(i)+.24; fRO2XC(i)=fRO2XC(i)+.01; fHCHO(i)=fHCHO(i)+.02; fxHCHO(i)=fxHCHO(i)+.03; fHCOOH(i)=fHCOOH(i)+.01; fRCHO(i)=fRCHO(i)+.21; fGLY(i)=fGLY(i)+.32; fxGLY(i)=fxGLY(i)+.01; fMGLY(i)=fMGLY(i)+.36; fBACL(i)=fBACL(i)+.05; fxPACID(i)=fxPACID(i)+.01; fzRCNO3(i)=fzRCNO3(i)+.01; fH2(i)=fH2(i)+.01; fCO(i)=fCO(i)+.38; fCO2(i)=fCO2(i)+.15; fyHPCRB(i)=fyHPCRB(i)+.03; fSumRO2(i)=fSumRO2(i)+.25;

i=i+1;
Rnames{i} = 'OLEA2_O3 = .01*OH + .08*xOH + .01*HO2 + .01*RCHO + .06*xBACL + .13*xPACID + .03*xHPCRB + .06*CO2';
k(:,i) = 1.44e+00;
Gstr{i,1} = 'OLEA2_O3';
fOLEA2_O3(i)=fOLEA2_O3(i)-1; fOH(i)=fOH(i)+.01; fxOH(i)=fxOH(i)+.08; fHO2(i)=fHO2(i)+.01; fRCHO(i)=fRCHO(i)+.01; fxBACL(i)=fxBACL(i)+.06; fxPACID(i)=fxPACID(i)+.13; fxHPCRB(i)=fxHPCRB(i)+.03; fCO2(i)=fCO2(i)+.06;

i=i+1;
Rnames{i} = 'OLEA2_O3 + NO = NO + .05*xHO2 + .03*xR2CO3 + .04*RO2C + .02*RO2XC + .03*xHCHO + .06*xGLY + .12*xMGLY + .02*zRCNO3 + .12*CO + .22*yHPCRB + .06*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'OLEA2_O3'; Gstr{i,2} = 'NO';
fOLEA2_O3(i)=fOLEA2_O3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.05; fxR2CO3(i)=fxR2CO3(i)+.03; fRO2C(i)=fRO2C(i)+.04; fRO2XC(i)=fRO2XC(i)+.02; fxHCHO(i)=fxHCHO(i)+.03; fxGLY(i)=fxGLY(i)+.06; fxMGLY(i)=fxMGLY(i)+.12; fzRCNO3(i)=fzRCNO3(i)+.02; fCO(i)=fCO(i)+.12; fyHPCRB(i)=fyHPCRB(i)+.22; fSumRO2(i)=fSumRO2(i)+.06;

i=i+1;
Rnames{i} = 'OLEA2 + NO3 = OLEA2_N3 + .32*xNO2 + .49*HNO3 + .2*xOH + .06*xHO2 + .01*xMECO3 + .03*xR2CO3 + .1*MACO3 + .06*xMACO3 + .67*RO2C + .16*RO2XC + .02*xHCHO + .26*xRCHO + .01*xMGLY + .19*xPACID + .01*xAFG3 + .07*xRCNO3 + .1*zRCNO3 + .06*zRDNO3 + .09*CO + .1*CO2 + .05*MALAH + .29*yRPNO3 + .83*SumRO2 + .1*SumRCO3';
k(:,i) = 3.30e-12;
Gstr{i,1} = 'OLEA2'; Gstr{i,2} = 'NO3';
fOLEA2(i)=fOLEA2(i)-1; fNO3(i)=fNO3(i)-1; fOLEA2_N3(i)=fOLEA2_N3(i)+1; fxNO2(i)=fxNO2(i)+.32; fHNO3(i)=fHNO3(i)+.49; fxOH(i)=fxOH(i)+.2; fxHO2(i)=fxHO2(i)+.06; fxMECO3(i)=fxMECO3(i)+.01; fxR2CO3(i)=fxR2CO3(i)+.03; fMACO3(i)=fMACO3(i)+.1; fxMACO3(i)=fxMACO3(i)+.06; fRO2C(i)=fRO2C(i)+.67; fRO2XC(i)=fRO2XC(i)+.16; fxHCHO(i)=fxHCHO(i)+.02; fxRCHO(i)=fxRCHO(i)+.26; fxMGLY(i)=fxMGLY(i)+.01; fxPACID(i)=fxPACID(i)+.19; fxAFG3(i)=fxAFG3(i)+.01; fxRCNO3(i)=fxRCNO3(i)+.07; fzRCNO3(i)=fzRCNO3(i)+.1; fzRDNO3(i)=fzRDNO3(i)+.06; fCO(i)=fCO(i)+.09; fCO2(i)=fCO2(i)+.1; fMALAH(i)=fMALAH(i)+.05; fyRPNO3(i)=fyRPNO3(i)+.29; fSumRO2(i)=fSumRO2(i)+.83; fSumRCO3(i)=fSumRCO3(i)+.1;

i=i+1;
Rnames{i} = 'OLEA2_N3 = .05*xOH + .07*xMACO3 + .21*xPACID + .01*xAFG3 + .04*xRCNO3 + .04*xHPCRB + .05*MALAH';
k(:,i) = 3.07e+00;
Gstr{i,1} = 'OLEA2_N3';
fOLEA2_N3(i)=fOLEA2_N3(i)-1; fxOH(i)=fxOH(i)+.05; fxMACO3(i)=fxMACO3(i)+.07; fxPACID(i)=fxPACID(i)+.21; fxAFG3(i)=fxAFG3(i)+.01; fxRCNO3(i)=fxRCNO3(i)+.04; fxHPCRB(i)=fxHPCRB(i)+.04; fMALAH(i)=fMALAH(i)+.05;

i=i+1;
Rnames{i} = 'OLEA2_N3 + NO = NO + .07*xHO2 + .03*xMECO3 + .21*RO2C + .01*RO2XC + .04*xRCHO + .04*xMGLY + .02*xACET + .01*xRHNO3 + .01*zRDNO3 + .02*CO + .14*CO2 + .1*yRPNO3 + .22*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'OLEA2_N3'; Gstr{i,2} = 'NO';
fOLEA2_N3(i)=fOLEA2_N3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.07; fxMECO3(i)=fxMECO3(i)+.03; fRO2C(i)=fRO2C(i)+.21; fRO2XC(i)=fRO2XC(i)+.01; fxRCHO(i)=fxRCHO(i)+.04; fxMGLY(i)=fxMGLY(i)+.04; fxACET(i)=fxACET(i)+.02; fxRHNO3(i)=fxRHNO3(i)+.01; fzRDNO3(i)=fzRDNO3(i)+.01; fCO(i)=fCO(i)+.02; fCO2(i)=fCO2(i)+.14; fyRPNO3(i)=fyRPNO3(i)+.1; fSumRO2(i)=fSumRO2(i)+.22;

i=i+1;
Rnames{i} = 'OLEA2 + HV = OLEA2_HV + .28*OH + HO2 + .45*xHO2 + .05*xMECO3 + .64*RO2C + .15*RO2XC + .04*xHCHO + .04*xRCHO + .06*OLEA2 + .07*xOLEA2 + .01*xACET + .04*xLVKS + .26*OLEP + .26*xAFG2A + .02*xAFG2B + .01*xAFG3 + .08*zRHNO3 + .06*zRCNO3 + .03*xHPCRB + 1.21*CO + .26*yRUOOH + .46*yHPCRB + .79*SumRO2';
k(:,i) = JC2CHO;
Gstr{i,1} = 'OLEA2';
fOLEA2(i)=fOLEA2(i)-1; fOLEA2_HV(i)=fOLEA2_HV(i)+1; fOH(i)=fOH(i)+.28; fHO2(i)=fHO2(i)+1; fxHO2(i)=fxHO2(i)+.45; fxMECO3(i)=fxMECO3(i)+.05; fRO2C(i)=fRO2C(i)+.64; fRO2XC(i)=fRO2XC(i)+.15; fxHCHO(i)=fxHCHO(i)+.04; fxRCHO(i)=fxRCHO(i)+.04; fOLEA2(i)=fOLEA2(i)+.06; fxOLEA2(i)=fxOLEA2(i)+.07; fxACET(i)=fxACET(i)+.01; fxLVKS(i)=fxLVKS(i)+.04; fOLEP(i)=fOLEP(i)+.26; fxAFG2A(i)=fxAFG2A(i)+.26; fxAFG2B(i)=fxAFG2B(i)+.02; fxAFG3(i)=fxAFG3(i)+.01; fzRHNO3(i)=fzRHNO3(i)+.08; fzRCNO3(i)=fzRCNO3(i)+.06; fxHPCRB(i)=fxHPCRB(i)+.03; fCO(i)=fCO(i)+1.21; fyRUOOH(i)=fyRUOOH(i)+.26; fyHPCRB(i)=fyHPCRB(i)+.46; fSumRO2(i)=fSumRO2(i)+.79;

i=i+1;
Rnames{i} = 'OLEA2_HV = .02*OH + .04*xOH + .01*OLEP + .06*xHPCRB';
k(:,i) = 1.71e+00;
Gstr{i,1} = 'OLEA2_HV';
fOLEA2_HV(i)=fOLEA2_HV(i)-1; fOH(i)=fOH(i)+.02; fxOH(i)=fxOH(i)+.04; fOLEP(i)=fOLEP(i)+.01; fxHPCRB(i)=fxHPCRB(i)+.06;

i=i+1;
Rnames{i} = 'OLEA2_HV + NO = NO + .02*xHO2 + .01*xMECO3 + .08*RO2C + .02*RO2XC + .01*xHCHO + .07*xOLEA2 + .02*zRHNO3 + .01*zRCNO3 + .02*CO + .12*yHPCRB + .1*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'OLEA2_HV'; Gstr{i,2} = 'NO';
fOLEA2_HV(i)=fOLEA2_HV(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.02; fxMECO3(i)=fxMECO3(i)+.01; fRO2C(i)=fRO2C(i)+.08; fRO2XC(i)=fRO2XC(i)+.02; fxHCHO(i)=fxHCHO(i)+.01; fxOLEA2(i)=fxOLEA2(i)+.07; fzRHNO3(i)=fzRHNO3(i)+.02; fzRCNO3(i)=fzRCNO3(i)+.01; fCO(i)=fCO(i)+.02; fyHPCRB(i)=fyHPCRB(i)+.12; fSumRO2(i)=fSumRO2(i)+.1;

i=i+1;
Rnames{i} = 'KET2 + OH = .01*xOH + .53*HO2 + .18*xHO2 + .01*MECO3 + .05*xMECO3 + .01*R2CO3 + .13*xR2CO3 + .49*RO2C + .08*RO2XC + .02*HCHO + .16*xHCHO + .1*xMECHO + .01*xETCHO + .14*RCHO + .19*xRCHO + .31*MGLY + .01*xACET + .08*KET2 + .03*xKET2 + .08*zRCNO3 + .54*yHPCRB + .57*SumRO2 + .02*SumRCO3';
k(:,i) = 9.96e-12;
Gstr{i,1} = 'KET2'; Gstr{i,2} = 'OH';
fKET2(i)=fKET2(i)-1; fOH(i)=fOH(i)-1; fxOH(i)=fxOH(i)+.01; fHO2(i)=fHO2(i)+.53; fxHO2(i)=fxHO2(i)+.18; fMECO3(i)=fMECO3(i)+.01; fxMECO3(i)=fxMECO3(i)+.05; fR2CO3(i)=fR2CO3(i)+.01; fxR2CO3(i)=fxR2CO3(i)+.13; fRO2C(i)=fRO2C(i)+.49; fRO2XC(i)=fRO2XC(i)+.08; fHCHO(i)=fHCHO(i)+.02; fxHCHO(i)=fxHCHO(i)+.16; fxMECHO(i)=fxMECHO(i)+.1; fxETCHO(i)=fxETCHO(i)+.01; fRCHO(i)=fRCHO(i)+.14; fxRCHO(i)=fxRCHO(i)+.19; fMGLY(i)=fMGLY(i)+.31; fxACET(i)=fxACET(i)+.01; fKET2(i)=fKET2(i)+.08; fxKET2(i)=fxKET2(i)+.03; fzRCNO3(i)=fzRCNO3(i)+.08; fyHPCRB(i)=fyHPCRB(i)+.54; fSumRO2(i)=fSumRO2(i)+.57; fSumRCO3(i)=fSumRCO3(i)+.02;

i=i+1;
Rnames{i} = 'KET2 + HV = .46*HO2 + .2*xHO2 + .08*MEO2 + .14*ETO2 + .48*MECO3 + .42*R2CO3 + .21*RO2C + .01*RO2XC + .31*HCHO + .02*xHCHO + .01*xMECHO + .03*xETCHO + .16*xRCHO + .01*zRHNO3 + .1*CO + .09*ALK4 + .01*ALK5 + .22*yROOH + .44*SumRO2 + .9*SumRCO3';
k(:,i) = JMEK_06.*7.53e-2;
Gstr{i,1} = 'KET2';
fKET2(i)=fKET2(i)-1; fHO2(i)=fHO2(i)+.46; fxHO2(i)=fxHO2(i)+.2; fMEO2(i)=fMEO2(i)+.08; fETO2(i)=fETO2(i)+.14; fMECO3(i)=fMECO3(i)+.48; fR2CO3(i)=fR2CO3(i)+.42; fRO2C(i)=fRO2C(i)+.21; fRO2XC(i)=fRO2XC(i)+.01; fHCHO(i)=fHCHO(i)+.31; fxHCHO(i)=fxHCHO(i)+.02; fxMECHO(i)=fxMECHO(i)+.01; fxETCHO(i)=fxETCHO(i)+.03; fxRCHO(i)=fxRCHO(i)+.16; fzRHNO3(i)=fzRHNO3(i)+.01; fCO(i)=fCO(i)+.1; fALK4(i)=fALK4(i)+.09; fALK5(i)=fALK5(i)+.01; fyROOH(i)=fyROOH(i)+.22; fSumRO2(i)=fSumRO2(i)+.44; fSumRCO3(i)=fSumRCO3(i)+.9;

i=i+1;
Rnames{i} = 'LVKS + OH = LVKS_OH + .03*HO2 + .13*xHO2 + .1*MECO3 + .15*xMECO3 + .22*xR2CO3 + .49*RO2C + .06*RO2XC + .04*xHCHO + .06*xRCHO + .01*MGLY + .02*xMGLY + .1*OLEA1 + .02*xACET + .22*xKET2 + .04*xBACL + .01*xPACID + .01*xAFG2B + .06*zRCNO3 + .02*HPCRB + .07*xHPCRB + .01*CO + .51*yHPCRB + .55*SumRO2 + .1*SumRCO3';
k(:,i) = 6.81e-11;
Gstr{i,1} = 'LVKS'; Gstr{i,2} = 'OH';
fLVKS(i)=fLVKS(i)-1; fOH(i)=fOH(i)-1; fLVKS_OH(i)=fLVKS_OH(i)+1; fHO2(i)=fHO2(i)+.03; fxHO2(i)=fxHO2(i)+.13; fMECO3(i)=fMECO3(i)+.1; fxMECO3(i)=fxMECO3(i)+.15; fxR2CO3(i)=fxR2CO3(i)+.22; fRO2C(i)=fRO2C(i)+.49; fRO2XC(i)=fRO2XC(i)+.06; fxHCHO(i)=fxHCHO(i)+.04; fxRCHO(i)=fxRCHO(i)+.06; fMGLY(i)=fMGLY(i)+.01; fxMGLY(i)=fxMGLY(i)+.02; fOLEA1(i)=fOLEA1(i)+.1; fxACET(i)=fxACET(i)+.02; fxKET2(i)=fxKET2(i)+.22; fxBACL(i)=fxBACL(i)+.04; fxPACID(i)=fxPACID(i)+.01; fxAFG2B(i)=fxAFG2B(i)+.01; fzRCNO3(i)=fzRCNO3(i)+.06; fHPCRB(i)=fHPCRB(i)+.02; fxHPCRB(i)=fxHPCRB(i)+.07; fCO(i)=fCO(i)+.01; fyHPCRB(i)=fyHPCRB(i)+.51; fSumRO2(i)=fSumRO2(i)+.55; fSumRCO3(i)=fSumRCO3(i)+.1;

i=i+1;
Rnames{i} = 'LVKS_OH = .31*HO2 + .31*HPCRB + .08*xHPCRB + .07*CO';
k(:,i) = 6.74e+00;
Gstr{i,1} = 'LVKS_OH';
fLVKS_OH(i)=fLVKS_OH(i)-1; fHO2(i)=fHO2(i)+.31; fHPCRB(i)=fHPCRB(i)+.31; fxHPCRB(i)=fxHPCRB(i)+.08; fCO(i)=fCO(i)+.07;

i=i+1;
Rnames{i} = 'LVKS_OH + NO = NO + .27*xHO2 + .28*RO2C + .04*RO2XC + .08*xRCHO + .27*xMGLY + .27*xACET + .04*zRCNO3 + .3*yHPCRB + .32*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'LVKS_OH'; Gstr{i,2} = 'NO';
fLVKS_OH(i)=fLVKS_OH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.27; fRO2C(i)=fRO2C(i)+.28; fRO2XC(i)=fRO2XC(i)+.04; fxRCHO(i)=fxRCHO(i)+.08; fxMGLY(i)=fxMGLY(i)+.27; fxACET(i)=fxACET(i)+.27; fzRCNO3(i)=fzRCNO3(i)+.04; fyHPCRB(i)=fyHPCRB(i)+.3; fSumRO2(i)=fSumRO2(i)+.32;

i=i+1;
Rnames{i} = 'LVKS + O3 = LVKS_O3 + .58*OH + .1*HO2 + .02*xHO2 + .42*xMECO3 + .01*xR2CO3 + .11*HCHO2 + .12*RCHO2 + .5*RO2C + .02*RO2XC + .03*HCHO + .37*xHCHO + .01*MECHO + .03*RCHO + .01*xGLY + .64*MGLY + .04*ACET + .05*KET2 + .27*BACL + .01*OACID + .01*xPACID + .02*zRCNO3 + .05*H2 + .26*CO + .12*CO2 + .34*yHPCRB + .53*SumRO2';
k(:,i) = 1.94e-17;
Gstr{i,1} = 'LVKS'; Gstr{i,2} = 'O3';
fLVKS(i)=fLVKS(i)-1; fO3(i)=fO3(i)-1; fLVKS_O3(i)=fLVKS_O3(i)+1; fOH(i)=fOH(i)+.58; fHO2(i)=fHO2(i)+.1; fxHO2(i)=fxHO2(i)+.02; fxMECO3(i)=fxMECO3(i)+.42; fxR2CO3(i)=fxR2CO3(i)+.01; fHCHO2(i)=fHCHO2(i)+.11; fRCHO2(i)=fRCHO2(i)+.12; fRO2C(i)=fRO2C(i)+.5; fRO2XC(i)=fRO2XC(i)+.02; fHCHO(i)=fHCHO(i)+.03; fxHCHO(i)=fxHCHO(i)+.37; fMECHO(i)=fMECHO(i)+.01; fRCHO(i)=fRCHO(i)+.03; fxGLY(i)=fxGLY(i)+.01; fMGLY(i)=fMGLY(i)+.64; fACET(i)=fACET(i)+.04; fKET2(i)=fKET2(i)+.05; fBACL(i)=fBACL(i)+.27; fOACID(i)=fOACID(i)+.01; fxPACID(i)=fxPACID(i)+.01; fzRCNO3(i)=fzRCNO3(i)+.02; fH2(i)=fH2(i)+.05; fCO(i)=fCO(i)+.26; fCO2(i)=fCO2(i)+.12; fyHPCRB(i)=fyHPCRB(i)+.34; fSumRO2(i)=fSumRO2(i)+.53;

i=i+1;
Rnames{i} = 'LVKS_O3 = .05*xMECO3 + .01*RO2C + .12*xPACID + .01*CO2';
k(:,i) = 5.62e+00;
Gstr{i,1} = 'LVKS_O3';
fLVKS_O3(i)=fLVKS_O3(i)-1; fxMECO3(i)=fxMECO3(i)+.05; fRO2C(i)=fRO2C(i)+.01; fxPACID(i)=fxPACID(i)+.12; fCO2(i)=fCO2(i)+.01;

i=i+1;
Rnames{i} = 'LVKS_O3 + NO = NO + .05*xHO2 + .01*RO2XC + .03*xHCHO + .01*zRCNO3 + .02*CO + .1*yHPCRB';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'LVKS_O3'; Gstr{i,2} = 'NO';
fLVKS_O3(i)=fLVKS_O3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.05; fRO2XC(i)=fRO2XC(i)+.01; fxHCHO(i)=fxHCHO(i)+.03; fzRCNO3(i)=fzRCNO3(i)+.01; fCO(i)=fCO(i)+.02; fyHPCRB(i)=fyHPCRB(i)+.1;

i=i+1;
Rnames{i} = 'LVKS + HV = .05*xOH + .12*HO2 + .28*MEO2 + .05*xMECO3 + .28*MACO3 + .1*RO2C + .02*RO2XC + .12*HCHO + .05*xMGLY + .35*OLEP + .05*xPACID + .02*zRCNO3 + .6*CO + .25*OLE4 + .05*MALAH + .4*SumRO2 + .28*SumRCO3';
k(:,i) = JMVK_16;
Gstr{i,1} = 'LVKS';
fLVKS(i)=fLVKS(i)-1; fxOH(i)=fxOH(i)+.05; fHO2(i)=fHO2(i)+.12; fMEO2(i)=fMEO2(i)+.28; fxMECO3(i)=fxMECO3(i)+.05; fMACO3(i)=fMACO3(i)+.28; fRO2C(i)=fRO2C(i)+.1; fRO2XC(i)=fRO2XC(i)+.02; fHCHO(i)=fHCHO(i)+.12; fxMGLY(i)=fxMGLY(i)+.05; fOLEP(i)=fOLEP(i)+.35; fxPACID(i)=fxPACID(i)+.05; fzRCNO3(i)=fzRCNO3(i)+.02; fCO(i)=fCO(i)+.6; fOLE4(i)=fOLE4(i)+.25; fMALAH(i)=fMALAH(i)+.05; fSumRO2(i)=fSumRO2(i)+.4; fSumRCO3(i)=fSumRCO3(i)+.28;

i=i+1;
Rnames{i} = 'OLEP + OH = .12*HO2 + .28*xHO2 + .36*R2CO3 + .16*xR2CO3 + .45*RO2C + .08*RO2XC + .27*xRCHO + .01*MGLY + .01*xMGLY + .01*LVKS + .04*BACL + .04*OLEP + .01*AFG3 + .08*zRCNO3 + .5*yHPCRB + .53*SumRO2 + .36*SumRCO3';
k(:,i) = 7.93e-11;
Gstr{i,1} = 'OLEP'; Gstr{i,2} = 'OH';
fOLEP(i)=fOLEP(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.12; fxHO2(i)=fxHO2(i)+.28; fR2CO3(i)=fR2CO3(i)+.36; fxR2CO3(i)=fxR2CO3(i)+.16; fRO2C(i)=fRO2C(i)+.45; fRO2XC(i)=fRO2XC(i)+.08; fxRCHO(i)=fxRCHO(i)+.27; fMGLY(i)=fMGLY(i)+.01; fxMGLY(i)=fxMGLY(i)+.01; fLVKS(i)=fLVKS(i)+.01; fBACL(i)=fBACL(i)+.04; fOLEP(i)=fOLEP(i)+.04; fAFG3(i)=fAFG3(i)+.01; fzRCNO3(i)=fzRCNO3(i)+.08; fyHPCRB(i)=fyHPCRB(i)+.5; fSumRO2(i)=fSumRO2(i)+.53; fSumRCO3(i)=fSumRCO3(i)+.36;

i=i+1;
Rnames{i} = 'OLEP + O3 = .3*OH + .26*HO2 + .01*xHO2 + .09*xR2CO3 + .51*RCHO2 + .1*RO2C + .02*RO2XC + .04*xHCHO + .02*RCHO + .02*xRCHO + .02*xGLY + .25*MGLY + .03*KET2 + .12*BACL + .01*xPACID + .02*zRCNO3 + .02*HPCRB + .14*CO + .14*CO2 + .1*yHPCRB + .12*SumRO2';
k(:,i) = 7.86e-17;
Gstr{i,1} = 'OLEP'; Gstr{i,2} = 'O3';
fOLEP(i)=fOLEP(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+.3; fHO2(i)=fHO2(i)+.26; fxHO2(i)=fxHO2(i)+.01; fxR2CO3(i)=fxR2CO3(i)+.09; fRCHO2(i)=fRCHO2(i)+.51; fRO2C(i)=fRO2C(i)+.1; fRO2XC(i)=fRO2XC(i)+.02; fxHCHO(i)=fxHCHO(i)+.04; fRCHO(i)=fRCHO(i)+.02; fxRCHO(i)=fxRCHO(i)+.02; fxGLY(i)=fxGLY(i)+.02; fMGLY(i)=fMGLY(i)+.25; fKET2(i)=fKET2(i)+.03; fBACL(i)=fBACL(i)+.12; fxPACID(i)=fxPACID(i)+.01; fzRCNO3(i)=fzRCNO3(i)+.02; fHPCRB(i)=fHPCRB(i)+.02; fCO(i)=fCO(i)+.14; fCO2(i)=fCO2(i)+.14; fyHPCRB(i)=fyHPCRB(i)+.1; fSumRO2(i)=fSumRO2(i)+.12;

i=i+1;
Rnames{i} = 'OLEP + NO3 = .27*xNO2 + .12*HNO3 + .11*HO2 + .15*xHO2 + .32*xR2CO3 + .01*MACO3 + .79*RO2C + .14*RO2XC + .36*xRCHO + .05*xGLY + .09*xMGLY + .03*xACET + .04*xKET2 + .07*OLEP + .03*AFG3 + .15*xRCNO3 + .14*zRCNO3 + .93*SumRO2 + .01*SumRCO3';
k(:,i) = 3.52e-12;
Gstr{i,1} = 'OLEP'; Gstr{i,2} = 'NO3';
fOLEP(i)=fOLEP(i)-1; fNO3(i)=fNO3(i)-1; fxNO2(i)=fxNO2(i)+.27; fHNO3(i)=fHNO3(i)+.12; fHO2(i)=fHO2(i)+.11; fxHO2(i)=fxHO2(i)+.15; fxR2CO3(i)=fxR2CO3(i)+.32; fMACO3(i)=fMACO3(i)+.01; fRO2C(i)=fRO2C(i)+.79; fRO2XC(i)=fRO2XC(i)+.14; fxRCHO(i)=fxRCHO(i)+.36; fxGLY(i)=fxGLY(i)+.05; fxMGLY(i)=fxMGLY(i)+.09; fxACET(i)=fxACET(i)+.03; fxKET2(i)=fxKET2(i)+.04; fOLEP(i)=fOLEP(i)+.07; fAFG3(i)=fAFG3(i)+.03; fxRCNO3(i)=fxRCNO3(i)+.15; fzRCNO3(i)=fzRCNO3(i)+.14; fSumRO2(i)=fSumRO2(i)+.93; fSumRCO3(i)=fSumRCO3(i)+.01;

i=i+1;
Rnames{i} = 'OACID + OH = .3*xHO2 + .7*MEO2 + .3*RO2C + .02*xHCHO + .28*xMGLY + .72*CO2 + .26*yHPCRB + SumRO2';
k(:,i) = 7.47e-13;
Gstr{i,1} = 'OACID'; Gstr{i,2} = 'OH';
fOACID(i)=fOACID(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.3; fMEO2(i)=fMEO2(i)+.7; fRO2C(i)=fRO2C(i)+.3; fxHCHO(i)=fxHCHO(i)+.02; fxMGLY(i)=fxMGLY(i)+.28; fCO2(i)=fCO2(i)+.72; fyHPCRB(i)=fyHPCRB(i)+.26; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'PACID + OH = .19*xOH + .56*xHO2 + .26*MECO3 + .74*RO2C + .19*xHCHO + .56*xPACID + .19*CO2 + .74*SumRO2 + .26*SumRCO3';
k(:,i) = 3.00e-14;
Gstr{i,1} = 'PACID'; Gstr{i,2} = 'OH';
fPACID(i)=fPACID(i)-1; fOH(i)=fOH(i)-1; fxOH(i)=fxOH(i)+.19; fxHO2(i)=fxHO2(i)+.56; fMECO3(i)=fMECO3(i)+.26; fRO2C(i)=fRO2C(i)+.74; fxHCHO(i)=fxHCHO(i)+.19; fxPACID(i)=fxPACID(i)+.56; fCO2(i)=fCO2(i)+.19; fSumRO2(i)=fSumRO2(i)+.74; fSumRCO3(i)=fSumRCO3(i)+.26;

i=i+1;
Rnames{i} = 'PACID + HV = OH + MEO2 + CO2 + SumRO2';
k(:,i) = JPAA;
Gstr{i,1} = 'PACID';
fPACID(i)=fPACID(i)-1; fOH(i)=fOH(i)+1; fMEO2(i)=fMEO2(i)+1; fCO2(i)=fCO2(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'MGLY + OH = .01*xHO2 + .99*MECO3 + .01*RO2C + .01*xHCHO + .01*xPACID + CO + .01*SumRO2 + .99*SumRCO3';
k(:,i) = 1.19e-11;
Gstr{i,1} = 'MGLY'; Gstr{i,2} = 'OH';
fMGLY(i)=fMGLY(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.01; fMECO3(i)=fMECO3(i)+.99; fRO2C(i)=fRO2C(i)+.01; fxHCHO(i)=fxHCHO(i)+.01; fxPACID(i)=fxPACID(i)+.01; fCO(i)=fCO(i)+1; fSumRO2(i)=fSumRO2(i)+.01; fSumRCO3(i)=fSumRCO3(i)+.99;

i=i+1;
Rnames{i} = 'MGLY + NO3 = HNO3 + MECO3 + CO + SumRCO3';
k(:,i) = 5.00e-16;
Gstr{i,1} = 'MGLY'; Gstr{i,2} = 'NO3';
fMGLY(i)=fMGLY(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fMECO3(i)=fMECO3(i)+1; fCO(i)=fCO(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'MGLY + HV = HO2 + MECO3 + CO + SumRCO3';
k(:,i) = JMGLY_13;
Gstr{i,1} = 'MGLY';
fMGLY(i)=fMGLY(i)-1; fHO2(i)=fHO2(i)+1; fMECO3(i)=fMECO3(i)+1; fCO(i)=fCO(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'BACL + HV = 2*MECO3 + 2*SumRCO3';
k(:,i) = JBACL_11;
Gstr{i,1} = 'BACL';
fBACL(i)=fBACL(i)-1; fMECO3(i)=fMECO3(i)+2; fSumRCO3(i)=fSumRCO3(i)+2;

i=i+1;
Rnames{i} = 'CRES + OH = .84*HO2 + .11*xHO2 + .03*BZO + .11*RO2C + .02*RO2XC + .02*xGLY + .05*xMGLY + .02*OLEA1 + .08*OLEA2 + .17*LVKS + .03*xBACL + .14*OLEP + .42*CATL + .01*xBALD + .03*xBUDAL + .01*xAFG1 + .04*xAFG2A + .02*xAFG2B + .02*zRANO3 + .01*yROOH + .11*yRAOOH + .13*SumRO2 + TOLRO2';
k(:,i) = 4.65e-11;
Gstr{i,1} = 'CRES'; Gstr{i,2} = 'OH';
fCRES(i)=fCRES(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.84; fxHO2(i)=fxHO2(i)+.11; fBZO(i)=fBZO(i)+.03; fRO2C(i)=fRO2C(i)+.11; fRO2XC(i)=fRO2XC(i)+.02; fxGLY(i)=fxGLY(i)+.02; fxMGLY(i)=fxMGLY(i)+.05; fOLEA1(i)=fOLEA1(i)+.02; fOLEA2(i)=fOLEA2(i)+.08; fLVKS(i)=fLVKS(i)+.17; fxBACL(i)=fxBACL(i)+.03; fOLEP(i)=fOLEP(i)+.14; fCATL(i)=fCATL(i)+.42; fxBALD(i)=fxBALD(i)+.01; fxBUDAL(i)=fxBUDAL(i)+.03; fxAFG1(i)=fxAFG1(i)+.01; fxAFG2A(i)=fxAFG2A(i)+.04; fxAFG2B(i)=fxAFG2B(i)+.02; fzRANO3(i)=fzRANO3(i)+.02; fyROOH(i)=fyROOH(i)+.01; fyRAOOH(i)=fyRAOOH(i)+.11; fSumRO2(i)=fSumRO2(i)+.13; fTOLRO2(i)=fTOLRO2(i)+1;

i=i+1;
Rnames{i} = 'CRES + NO3 = HNO3 + BZO';
k(:,i) = 1.27e-11;
Gstr{i,1} = 'CRES'; Gstr{i,2} = 'NO3';
fCRES(i)=fCRES(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fBZO(i)=fBZO(i)+1;

i=i+1;
Rnames{i} = 'XYNL + OH = .79*HO2 + .16*xHO2 + .02*BZO + .16*RO2C + .03*RO2XC + .01*xGLY + .04*xMGLY + .02*OLEA1 + .06*OLEA2 + .26*LVKS + .1*xBACL + .16*OLEP + .01*XYNL + .27*CATL + .01*xBUDAL + .01*xAFG1 + .09*xAFG2A + .03*xAFG2B + .01*xAFG3 + .03*zRANO3 + .02*yROOH + .18*yRAOOH + .19*SumRO2';
k(:,i) = 6.73e-11;
Gstr{i,1} = 'XYNL'; Gstr{i,2} = 'OH';
fXYNL(i)=fXYNL(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.79; fxHO2(i)=fxHO2(i)+.16; fBZO(i)=fBZO(i)+.02; fRO2C(i)=fRO2C(i)+.16; fRO2XC(i)=fRO2XC(i)+.03; fxGLY(i)=fxGLY(i)+.01; fxMGLY(i)=fxMGLY(i)+.04; fOLEA1(i)=fOLEA1(i)+.02; fOLEA2(i)=fOLEA2(i)+.06; fLVKS(i)=fLVKS(i)+.26; fxBACL(i)=fxBACL(i)+.1; fOLEP(i)=fOLEP(i)+.16; fXYNL(i)=fXYNL(i)+.01; fCATL(i)=fCATL(i)+.27; fxBUDAL(i)=fxBUDAL(i)+.01; fxAFG1(i)=fxAFG1(i)+.01; fxAFG2A(i)=fxAFG2A(i)+.09; fxAFG2B(i)=fxAFG2B(i)+.03; fxAFG3(i)=fxAFG3(i)+.01; fzRANO3(i)=fzRANO3(i)+.03; fyROOH(i)=fyROOH(i)+.02; fyRAOOH(i)=fyRAOOH(i)+.18; fSumRO2(i)=fSumRO2(i)+.19;

i=i+1;
Rnames{i} = 'XYNL + NO3 = HNO3 + BZO';
k(:,i) = 3.09e-11;
Gstr{i,1} = 'XYNL'; Gstr{i,2} = 'NO3';
fXYNL(i)=fXYNL(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fBZO(i)=fBZO(i)+1;

i=i+1;
Rnames{i} = 'CATL + OH = .96*HO2 + .03*xHO2 + .01*BZO + .03*RO2C + .01*OLEA1 + .02*OLEA2 + .72*LVKS + .02*xBACL + .06*OLEP + .13*CATL3 + .02*xAFG2A + .03*yRAOOH + .03*SumRO2';
k(:,i) = 1.56e-10;
Gstr{i,1} = 'CATL'; Gstr{i,2} = 'OH';
fCATL(i)=fCATL(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.96; fxHO2(i)=fxHO2(i)+.03; fBZO(i)=fBZO(i)+.01; fRO2C(i)=fRO2C(i)+.03; fOLEA1(i)=fOLEA1(i)+.01; fOLEA2(i)=fOLEA2(i)+.02; fLVKS(i)=fLVKS(i)+.72; fxBACL(i)=fxBACL(i)+.02; fOLEP(i)=fOLEP(i)+.06; fCATL3(i)=fCATL3(i)+.13; fxAFG2A(i)=fxAFG2A(i)+.02; fyRAOOH(i)=fyRAOOH(i)+.03; fSumRO2(i)=fSumRO2(i)+.03;

i=i+1;
Rnames{i} = 'CATL + NO3 = HNO3 + BZO';
k(:,i) = 4.04e-11;
Gstr{i,1} = 'CATL'; Gstr{i,2} = 'NO3';
fCATL(i)=fCATL(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fBZO(i)=fBZO(i)+1;

i=i+1;
Rnames{i} = 'RCNO3 + OH = RCNO3_OH + .09*xNO2 + .27*NO2 + .01*OH + .01*xOH + .03*HO2 + .09*xHO2 + .04*xMECO3 + .32*R2CO3 + .04*xR2CO3 + .38*RO2C + .06*RO2XC + .06*xHCHO + .04*xMECHO + .02*RCHO + .04*xRCHO + .01*xGLY + .02*MGLY + .04*xACET + .07*KET2 + .07*BACL + .02*xBACL + .01*OLEP + .03*PACID + .03*xPACID + .04*RCNO3 + .15*xRCNO3 + .06*zRCNO3 + .01*CO + .01*CO2 + .05*ALK2 + 3.73*NROG + .02*yRPNO3 + .02*yHPCRB + .44*SumRO2 + .32*SumRCO3';
k(:,i) = 1.78e-11;
Gstr{i,1} = 'RCNO3'; Gstr{i,2} = 'OH';
fRCNO3(i)=fRCNO3(i)-1; fOH(i)=fOH(i)-1; fRCNO3_OH(i)=fRCNO3_OH(i)+1; fxNO2(i)=fxNO2(i)+.09; fNO2(i)=fNO2(i)+.27; fOH(i)=fOH(i)+.01; fxOH(i)=fxOH(i)+.01; fHO2(i)=fHO2(i)+.03; fxHO2(i)=fxHO2(i)+.09; fxMECO3(i)=fxMECO3(i)+.04; fR2CO3(i)=fR2CO3(i)+.32; fxR2CO3(i)=fxR2CO3(i)+.04; fRO2C(i)=fRO2C(i)+.38; fRO2XC(i)=fRO2XC(i)+.06; fxHCHO(i)=fxHCHO(i)+.06; fxMECHO(i)=fxMECHO(i)+.04; fRCHO(i)=fRCHO(i)+.02; fxRCHO(i)=fxRCHO(i)+.04; fxGLY(i)=fxGLY(i)+.01; fMGLY(i)=fMGLY(i)+.02; fxACET(i)=fxACET(i)+.04; fKET2(i)=fKET2(i)+.07; fBACL(i)=fBACL(i)+.07; fxBACL(i)=fxBACL(i)+.02; fOLEP(i)=fOLEP(i)+.01; fPACID(i)=fPACID(i)+.03; fxPACID(i)=fxPACID(i)+.03; fRCNO3(i)=fRCNO3(i)+.04; fxRCNO3(i)=fxRCNO3(i)+.15; fzRCNO3(i)=fzRCNO3(i)+.06; fCO(i)=fCO(i)+.01; fCO2(i)=fCO2(i)+.01; fALK2(i)=fALK2(i)+.05; fNROG(i)=fNROG(i)+3.73; fyRPNO3(i)=fyRPNO3(i)+.02; fyHPCRB(i)=fyHPCRB(i)+.02; fSumRO2(i)=fSumRO2(i)+.44; fSumRCO3(i)=fSumRCO3(i)+.32;

i=i+1;
Rnames{i} = 'RCNO3_OH = .01*xOH + .04*HO2 + .04*RCNO3';
k(:,i) = 2.06e+00;
Gstr{i,1} = 'RCNO3_OH';
fRCNO3_OH(i)=fRCNO3_OH(i)-1; fxOH(i)=fxOH(i)+.01; fHO2(i)=fHO2(i)+.04; fRCNO3(i)=fRCNO3(i)+.04;

i=i+1;
Rnames{i} = 'RCNO3_OH + NO = NO + .02*xR2CO3 + .06*RO2C + .02*RO2XC + .02*xHCHO + .03*xRCNO3 + .02*zRCNO3 + .02*yHPCRB + .08*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'RCNO3_OH'; Gstr{i,2} = 'NO';
fRCNO3_OH(i)=fRCNO3_OH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxR2CO3(i)=fxR2CO3(i)+.02; fRO2C(i)=fRO2C(i)+.06; fRO2XC(i)=fRO2XC(i)+.02; fxHCHO(i)=fxHCHO(i)+.02; fxRCNO3(i)=fxRCNO3(i)+.03; fzRCNO3(i)=fzRCNO3(i)+.02; fyHPCRB(i)=fyHPCRB(i)+.02; fSumRO2(i)=fSumRO2(i)+.08;

i=i+1;
Rnames{i} = 'RCNO3 + HV = RCNO3_HV + .62*NO2 + .01*xOH + .46*HO2 + .31*xHO2 + .06*ETO2 + .15*MECO3 + .06*R2CO3 + .03*xR2CO3 + .51*RO2C + .1*RO2XC + .04*HCHO + .01*xHCHO + .04*MECHO + .17*RCHO + .03*xRCHO + .05*xACET + .03*xKET2 + .03*OACID + .02*xOACID + .02*xPACID + .02*AFG2A + .03*RCNO3 + .19*xRCNO3 + .1*zRCNO3 + .46*CO + .01*CO2 + 6.89*NROG + .04*yRPNO3 + .15*yHPCRB + .67*SumRO2 + .21*SumRCO3';
k(:,i) = JCRBNIT;
Gstr{i,1} = 'RCNO3';
fRCNO3(i)=fRCNO3(i)-1; fRCNO3_HV(i)=fRCNO3_HV(i)+1; fNO2(i)=fNO2(i)+.62; fxOH(i)=fxOH(i)+.01; fHO2(i)=fHO2(i)+.46; fxHO2(i)=fxHO2(i)+.31; fETO2(i)=fETO2(i)+.06; fMECO3(i)=fMECO3(i)+.15; fR2CO3(i)=fR2CO3(i)+.06; fxR2CO3(i)=fxR2CO3(i)+.03; fRO2C(i)=fRO2C(i)+.51; fRO2XC(i)=fRO2XC(i)+.1; fHCHO(i)=fHCHO(i)+.04; fxHCHO(i)=fxHCHO(i)+.01; fMECHO(i)=fMECHO(i)+.04; fRCHO(i)=fRCHO(i)+.17; fxRCHO(i)=fxRCHO(i)+.03; fxACET(i)=fxACET(i)+.05; fxKET2(i)=fxKET2(i)+.03; fOACID(i)=fOACID(i)+.03; fxOACID(i)=fxOACID(i)+.02; fxPACID(i)=fxPACID(i)+.02; fAFG2A(i)=fAFG2A(i)+.02; fRCNO3(i)=fRCNO3(i)+.03; fxRCNO3(i)=fxRCNO3(i)+.19; fzRCNO3(i)=fzRCNO3(i)+.1; fCO(i)=fCO(i)+.46; fCO2(i)=fCO2(i)+.01; fNROG(i)=fNROG(i)+6.89; fyRPNO3(i)=fyRPNO3(i)+.04; fyHPCRB(i)=fyHPCRB(i)+.15; fSumRO2(i)=fSumRO2(i)+.67; fSumRCO3(i)=fSumRCO3(i)+.21;

i=i+1;
Rnames{i} = 'RCNO3_HV = .15*HO2 + .01*xACET + .05*PACID + .02*xPACID + .01*AFG2A + .05*xRCNO3 + .08*HPCRB';
k(:,i) = 4.46e-01;
Gstr{i,1} = 'RCNO3_HV';
fRCNO3_HV(i)=fRCNO3_HV(i)-1; fHO2(i)=fHO2(i)+.15; fxACET(i)=fxACET(i)+.01; fPACID(i)=fPACID(i)+.05; fxPACID(i)=fxPACID(i)+.02; fAFG2A(i)=fAFG2A(i)+.01; fxRCNO3(i)=fxRCNO3(i)+.05; fHPCRB(i)=fHPCRB(i)+.08;

i=i+1;
Rnames{i} = 'RCNO3_HV + NO = NO + .03*xOH + .04*xMECO3 + .03*xR2CO3 + .16*RO2C + .03*RO2XC + .01*xHCHO + .12*xRCHO + .02*xKET2 + .04*xRHNO3 + .02*zRCNO3 + .03*CO + .05*CO2 + .11*yHPCRB + .19*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'RCNO3_HV'; Gstr{i,2} = 'NO';
fRCNO3_HV(i)=fRCNO3_HV(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxOH(i)=fxOH(i)+.03; fxMECO3(i)=fxMECO3(i)+.04; fxR2CO3(i)=fxR2CO3(i)+.03; fRO2C(i)=fRO2C(i)+.16; fRO2XC(i)=fRO2XC(i)+.03; fxHCHO(i)=fxHCHO(i)+.01; fxRCHO(i)=fxRCHO(i)+.12; fxKET2(i)=fxKET2(i)+.02; fxRHNO3(i)=fxRHNO3(i)+.04; fzRCNO3(i)=fzRCNO3(i)+.02; fCO(i)=fCO(i)+.03; fCO2(i)=fCO2(i)+.05; fyHPCRB(i)=fyHPCRB(i)+.11; fSumRO2(i)=fSumRO2(i)+.19;

i=i+1;
Rnames{i} = 'RHNO3 + OH = .01*xNO2 + .6*NO2 + .08*HO2 + .26*xHO2 + .29*RO2C + .05*RO2XC + .05*xHCHO + .03*xGLCHO + .01*xACET + .01*KET2 + .06*xKET2 + .01*LVKS + .05*xRHNO3 + .08*RCNO3 + .21*xRCNO3 + .04*zRDNO3 + .02*ALK4 + .57*ALK5 + .32*yRPNO3 + .34*SumRO2';
k(:,i) = 3.66e-11;
Gstr{i,1} = 'RHNO3'; Gstr{i,2} = 'OH';
fRHNO3(i)=fRHNO3(i)-1; fOH(i)=fOH(i)-1; fxNO2(i)=fxNO2(i)+.01; fNO2(i)=fNO2(i)+.6; fHO2(i)=fHO2(i)+.08; fxHO2(i)=fxHO2(i)+.26; fRO2C(i)=fRO2C(i)+.29; fRO2XC(i)=fRO2XC(i)+.05; fxHCHO(i)=fxHCHO(i)+.05; fxGLCHO(i)=fxGLCHO(i)+.03; fxACET(i)=fxACET(i)+.01; fKET2(i)=fKET2(i)+.01; fxKET2(i)=fxKET2(i)+.06; fLVKS(i)=fLVKS(i)+.01; fxRHNO3(i)=fxRHNO3(i)+.05; fRCNO3(i)=fRCNO3(i)+.08; fxRCNO3(i)=fxRCNO3(i)+.21; fzRDNO3(i)=fzRDNO3(i)+.04; fALK4(i)=fALK4(i)+.02; fALK5(i)=fALK5(i)+.57; fyRPNO3(i)=fyRPNO3(i)+.32; fSumRO2(i)=fSumRO2(i)+.34;

i=i+1;
Rnames{i} = 'RHNO3 + HV = -0.01*xNO2 + NO2 + .93*HO2 + .05*xHO2 + .11*RO2C + .02*RO2XC + .73*HCHO + .01*xHCHO + .02*MECHO + .04*RCHO + .02*xRCHO + .32*MACR + .06*OLEA1 + .02*OLEA2 + .01*xOLEA2 + .04*ACET + .37*MVK + .01*xMVK + .02*zRHNO3 + .01*HPCRB + .01*xHPCRB + .07*FURNS + .07*yRUOOH + .05*yHPCRB + .13*SumRO2';
k(:,i) = JIC3ONO2;
Gstr{i,1} = 'RHNO3';
fRHNO3(i)=fRHNO3(i)-1; fxNO2(i)=fxNO2(i)-0.01; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+.93; fxHO2(i)=fxHO2(i)+.05; fRO2C(i)=fRO2C(i)+.11; fRO2XC(i)=fRO2XC(i)+.02; fHCHO(i)=fHCHO(i)+.73; fxHCHO(i)=fxHCHO(i)+.01; fMECHO(i)=fMECHO(i)+.02; fRCHO(i)=fRCHO(i)+.04; fxRCHO(i)=fxRCHO(i)+.02; fMACR(i)=fMACR(i)+.32; fOLEA1(i)=fOLEA1(i)+.06; fOLEA2(i)=fOLEA2(i)+.02; fxOLEA2(i)=fxOLEA2(i)+.01; fACET(i)=fACET(i)+.04; fMVK(i)=fMVK(i)+.37; fxMVK(i)=fxMVK(i)+.01; fzRHNO3(i)=fzRHNO3(i)+.02; fHPCRB(i)=fHPCRB(i)+.01; fxHPCRB(i)=fxHPCRB(i)+.01; fFURNS(i)=fFURNS(i)+.07; fyRUOOH(i)=fyRUOOH(i)+.07; fyHPCRB(i)=fyHPCRB(i)+.05; fSumRO2(i)=fSumRO2(i)+.13;

i=i+1;
Rnames{i} = 'RANO3 + OH = .42*NO2 + .58*HO2 + .01*OLEP + .02*AFG2A + .11*RHNO3 + .47*RCNO3 + .01*ALK5 + .37*ALK6';
k(:,i) = 4.49e-11;
Gstr{i,1} = 'RANO3'; Gstr{i,2} = 'OH';
fRANO3(i)=fRANO3(i)-1; fOH(i)=fOH(i)-1; fNO2(i)=fNO2(i)+.42; fHO2(i)=fHO2(i)+.58; fOLEP(i)=fOLEP(i)+.01; fAFG2A(i)=fAFG2A(i)+.02; fRHNO3(i)=fRHNO3(i)+.11; fRCNO3(i)=fRCNO3(i)+.47; fALK5(i)=fALK5(i)+.01; fALK6(i)=fALK6(i)+.37;

i=i+1;
Rnames{i} = 'RANO3 + HV = .34*RHNO3 + .66*RCNO3';
k(:,i) = JCOOH;
Gstr{i,1} = 'RANO3';
fRANO3(i)=fRANO3(i)-1; fRHNO3(i)=fRHNO3(i)+.34; fRCNO3(i)=fRCNO3(i)+.66;

i=i+1;
Rnames{i} = 'RPNO3 + OH = .18*xNO2 + .35*NO2 + .19*OH + .03*xOH + .15*HO2 + .03*xHO2 + .35*RO2C + .08*RO2XC + .09*xHCHO + .09*xRCHO + .05*xOLEA1 + .03*xACET + .02*xMVK + .16*RHNO3 + .02*RCNO3 + .03*xRCNO3 + .02*zRCNO3 + .15*RPNO3 + .02*xRPNO3 + .06*zRDNO3 + .35*ROOH + .01*HPCRB + .02*xHPCRB + .33*yRPNO3 + .43*SumRO2';
k(:,i) = 4.11e-11;
Gstr{i,1} = 'RPNO3'; Gstr{i,2} = 'OH';
fRPNO3(i)=fRPNO3(i)-1; fOH(i)=fOH(i)-1; fxNO2(i)=fxNO2(i)+.18; fNO2(i)=fNO2(i)+.35; fOH(i)=fOH(i)+.19; fxOH(i)=fxOH(i)+.03; fHO2(i)=fHO2(i)+.15; fxHO2(i)=fxHO2(i)+.03; fRO2C(i)=fRO2C(i)+.35; fRO2XC(i)=fRO2XC(i)+.08; fxHCHO(i)=fxHCHO(i)+.09; fxRCHO(i)=fxRCHO(i)+.09; fxOLEA1(i)=fxOLEA1(i)+.05; fxACET(i)=fxACET(i)+.03; fxMVK(i)=fxMVK(i)+.02; fRHNO3(i)=fRHNO3(i)+.16; fRCNO3(i)=fRCNO3(i)+.02; fxRCNO3(i)=fxRCNO3(i)+.03; fzRCNO3(i)=fzRCNO3(i)+.02; fRPNO3(i)=fRPNO3(i)+.15; fxRPNO3(i)=fxRPNO3(i)+.02; fzRDNO3(i)=fzRDNO3(i)+.06; fROOH(i)=fROOH(i)+.35; fHPCRB(i)=fHPCRB(i)+.01; fxHPCRB(i)=fxHPCRB(i)+.02; fyRPNO3(i)=fyRPNO3(i)+.33; fSumRO2(i)=fSumRO2(i)+.43;

i=i+1;
Rnames{i} = 'RPNO3 + HV = RPNO3_HV + .9*NO2 + OH + .01*HO2 + .01*xHO2 + .01*xR2CO3 + .06*RO2C + .02*RO2XC + .63*HCHO + .2*RCHO + .54*OLEA1 + .01*xACET + .16*MVK + .01*RCNO3 + .01*xRCNO3 + .02*zRCNO3 + .08*SumRO2';
k(:,i) = JCOOH;
Gstr{i,1} = 'RPNO3';
fRPNO3(i)=fRPNO3(i)-1; fRPNO3_HV(i)=fRPNO3_HV(i)+1; fNO2(i)=fNO2(i)+.9; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+.01; fxHO2(i)=fxHO2(i)+.01; fxR2CO3(i)=fxR2CO3(i)+.01; fRO2C(i)=fRO2C(i)+.06; fRO2XC(i)=fRO2XC(i)+.02; fHCHO(i)=fHCHO(i)+.63; fRCHO(i)=fRCHO(i)+.2; fOLEA1(i)=fOLEA1(i)+.54; fxACET(i)=fxACET(i)+.01; fMVK(i)=fMVK(i)+.16; fRCNO3(i)=fRCNO3(i)+.01; fxRCNO3(i)=fxRCNO3(i)+.01; fzRCNO3(i)=fzRCNO3(i)+.02; fSumRO2(i)=fSumRO2(i)+.08;

i=i+1;
Rnames{i} = 'RPNO3_HV = .04*NO2 + .02*HO2 + .01*xPACID + .01*RPNO3 + .04*HPCRB';
k(:,i) = 8.74e-01;
Gstr{i,1} = 'RPNO3_HV';
fRPNO3_HV(i)=fRPNO3_HV(i)-1; fNO2(i)=fNO2(i)+.04; fHO2(i)=fHO2(i)+.02; fxPACID(i)=fxPACID(i)+.01; fRPNO3(i)=fRPNO3(i)+.01; fHPCRB(i)=fHPCRB(i)+.04;

i=i+1;
Rnames{i} = 'RPNO3_HV + NO = NO + .05*xHO2 + .05*RO2C + .04*xHCHO + .02*xRHNO3 + .03*xRCNO3 + .06*yRPNO3 + .05*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'RPNO3_HV'; Gstr{i,2} = 'NO';
fRPNO3_HV(i)=fRPNO3_HV(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.05; fRO2C(i)=fRO2C(i)+.05; fxHCHO(i)=fxHCHO(i)+.04; fxRHNO3(i)=fxRHNO3(i)+.02; fxRCNO3(i)=fxRCNO3(i)+.03; fyRPNO3(i)=fyRPNO3(i)+.06; fSumRO2(i)=fSumRO2(i)+.05;

i=i+1;
Rnames{i} = 'RDNO3 + OH = .23*xNO2 + .49*NO2 + .05*xHO2 + .77*RO2C + .23*RO2XC + .08*xHCHO + .15*xACET + .47*RHNO3 + .02*RCNO3 + .24*xRCNO3 + .08*zRCNO3 + .15*zRDNO3 + .04*xRDNO3 + .01*CO + SumRO2';
k(:,i) = 1.27e-11;
Gstr{i,1} = 'RDNO3'; Gstr{i,2} = 'OH';
fRDNO3(i)=fRDNO3(i)-1; fOH(i)=fOH(i)-1; fxNO2(i)=fxNO2(i)+.23; fNO2(i)=fNO2(i)+.49; fxHO2(i)=fxHO2(i)+.05; fRO2C(i)=fRO2C(i)+.77; fRO2XC(i)=fRO2XC(i)+.23; fxHCHO(i)=fxHCHO(i)+.08; fxACET(i)=fxACET(i)+.15; fRHNO3(i)=fRHNO3(i)+.47; fRCNO3(i)=fRCNO3(i)+.02; fxRCNO3(i)=fxRCNO3(i)+.24; fzRCNO3(i)=fzRCNO3(i)+.08; fzRDNO3(i)=fzRDNO3(i)+.15; fxRDNO3(i)=fxRDNO3(i)+.04; fCO(i)=fCO(i)+.01; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'RDNO3 + HV = RDNO3_HV + 1.83*NO2 + .03*HO2 + .02*xHO2 + .01*xR2CO3 + .17*RO2C + .05*RO2XC + .23*HCHO + .01*xHCHO + .4*RCHO + .2*OLEA1 + .03*xACET + .23*MVK + .01*xPACID + .03*RCNO3 + .03*xRCNO3 + .05*zRCNO3 + .22*SumRO2';
k(:,i) = JDIONO2;
Gstr{i,1} = 'RDNO3';
fRDNO3(i)=fRDNO3(i)-1; fRDNO3_HV(i)=fRDNO3_HV(i)+1; fNO2(i)=fNO2(i)+1.83; fHO2(i)=fHO2(i)+.03; fxHO2(i)=fxHO2(i)+.02; fxR2CO3(i)=fxR2CO3(i)+.01; fRO2C(i)=fRO2C(i)+.17; fRO2XC(i)=fRO2XC(i)+.05; fHCHO(i)=fHCHO(i)+.23; fxHCHO(i)=fxHCHO(i)+.01; fRCHO(i)=fRCHO(i)+.4; fOLEA1(i)=fOLEA1(i)+.2; fxACET(i)=fxACET(i)+.03; fMVK(i)=fMVK(i)+.23; fxPACID(i)=fxPACID(i)+.01; fRCNO3(i)=fRCNO3(i)+.03; fxRCNO3(i)=fxRCNO3(i)+.03; fzRCNO3(i)=fzRCNO3(i)+.05; fSumRO2(i)=fSumRO2(i)+.22;

i=i+1;
Rnames{i} = 'RDNO3_HV = .04*NO2 + .01*xOH + .01*HO2 + .01*xPACID + .01*RPNO3 + .04*HPCRB + .01*CO2';
k(:,i) = 8.74e-01;
Gstr{i,1} = 'RDNO3_HV';
fRDNO3_HV(i)=fRDNO3_HV(i)-1; fNO2(i)=fNO2(i)+.04; fxOH(i)=fxOH(i)+.01; fHO2(i)=fHO2(i)+.01; fxPACID(i)=fxPACID(i)+.01; fRPNO3(i)=fRPNO3(i)+.01; fHPCRB(i)=fHPCRB(i)+.04; fCO2(i)=fCO2(i)+.01;

i=i+1;
Rnames{i} = 'RDNO3_HV + NO = NO + .05*xHO2 + .05*RO2C + .04*xHCHO + .02*xRHNO3 + .03*xRCNO3 + .05*yRPNO3 + .05*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'RDNO3_HV'; Gstr{i,2} = 'NO';
fRDNO3_HV(i)=fRDNO3_HV(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.05; fRO2C(i)=fRO2C(i)+.05; fxHCHO(i)=fxHCHO(i)+.04; fxRHNO3(i)=fxRHNO3(i)+.02; fxRCNO3(i)=fxRCNO3(i)+.03; fyRPNO3(i)=fyRPNO3(i)+.05; fSumRO2(i)=fSumRO2(i)+.05;

i=i+1;
Rnames{i} = 'R1NO3 + OH = .41*xNO2 + .17*NO2 + .29*xHO2 + .99*RO2C + .12*RO2XC + .1*xHCHO + .29*xMECHO + .05*xETCHO + .02*xRCHO + .05*ACET + .26*xACET + .05*MEK + .04*xMEK + .07*KET2 + .05*xKET2 + .1*xRHNO3 + .19*xRCNO3 + .01*xRPNO3 + .12*zRDNO3 + 1.12*yRPNO3 + 1.11*SumRO2';
k(:,i) = 1.47e-12;
Gstr{i,1} = 'R1NO3'; Gstr{i,2} = 'OH';
fR1NO3(i)=fR1NO3(i)-1; fOH(i)=fOH(i)-1; fxNO2(i)=fxNO2(i)+.41; fNO2(i)=fNO2(i)+.17; fxHO2(i)=fxHO2(i)+.29; fRO2C(i)=fRO2C(i)+.99; fRO2XC(i)=fRO2XC(i)+.12; fxHCHO(i)=fxHCHO(i)+.1; fxMECHO(i)=fxMECHO(i)+.29; fxETCHO(i)=fxETCHO(i)+.05; fxRCHO(i)=fxRCHO(i)+.02; fACET(i)=fACET(i)+.05; fxACET(i)=fxACET(i)+.26; fMEK(i)=fMEK(i)+.05; fxMEK(i)=fxMEK(i)+.04; fKET2(i)=fKET2(i)+.07; fxKET2(i)=fxKET2(i)+.05; fxRHNO3(i)=fxRHNO3(i)+.1; fxRCNO3(i)=fxRCNO3(i)+.19; fxRPNO3(i)=fxRPNO3(i)+.01; fzRDNO3(i)=fzRDNO3(i)+.12; fyRPNO3(i)=fyRPNO3(i)+1.12; fSumRO2(i)=fSumRO2(i)+1.11;

i=i+1;
Rnames{i} = 'R1NO3 + HV = .04*TBUO - 0.01*xNO2 + NO2 + .19*HO2 + .38*xHO2 + .32*ETO2 + .01*xTBUO + .46*RO2C + .05*RO2XC + .05*xHCHO + .12*MECHO + .03*ETCHO + .03*xETCHO + .02*xRCHO + .34*ACET + .12*xACET + .11*MEK + .05*KET2 + .22*xKET2 + .05*zRHNO3 + .01*xRHNO3 + .51*yROOH + .83*SumRO2';
k(:,i) = JIC3ONO2;
Gstr{i,1} = 'R1NO3';
fR1NO3(i)=fR1NO3(i)-1; fTBUO(i)=fTBUO(i)+.04; fxNO2(i)=fxNO2(i)-0.01; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+.19; fxHO2(i)=fxHO2(i)+.38; fETO2(i)=fETO2(i)+.32; fxTBUO(i)=fxTBUO(i)+.01; fRO2C(i)=fRO2C(i)+.46; fRO2XC(i)=fRO2XC(i)+.05; fxHCHO(i)=fxHCHO(i)+.05; fMECHO(i)=fMECHO(i)+.12; fETCHO(i)=fETCHO(i)+.03; fxETCHO(i)=fxETCHO(i)+.03; fxRCHO(i)=fxRCHO(i)+.02; fACET(i)=fACET(i)+.34; fxACET(i)=fxACET(i)+.12; fMEK(i)=fMEK(i)+.11; fKET2(i)=fKET2(i)+.05; fxKET2(i)=fxKET2(i)+.22; fzRHNO3(i)=fzRHNO3(i)+.05; fxRHNO3(i)=fxRHNO3(i)+.01; fyROOH(i)=fyROOH(i)+.51; fSumRO2(i)=fSumRO2(i)+.83;

i=i+1;
Rnames{i} = 'R2NO3 + OH = .18*xNO2 + .05*NO2 + .43*xHO2 + 1.17*RO2C + .33*RO2XC + .01*xHCHO + .07*xRCHO + .01*xACET + .05*KET2 + .08*xKET2 + .02*xOLEP + .04*xRHNO3 + .4*xRCNO3 + .01*zRCNO3 + .32*zRDNO3 + .01*xHPCRB + .02*CO + 1.44*yRPNO3 + 1.5*SumRO2';
k(:,i) = 1.16e-11;
Gstr{i,1} = 'R2NO3'; Gstr{i,2} = 'OH';
fR2NO3(i)=fR2NO3(i)-1; fOH(i)=fOH(i)-1; fxNO2(i)=fxNO2(i)+.18; fNO2(i)=fNO2(i)+.05; fxHO2(i)=fxHO2(i)+.43; fRO2C(i)=fRO2C(i)+1.17; fRO2XC(i)=fRO2XC(i)+.33; fxHCHO(i)=fxHCHO(i)+.01; fxRCHO(i)=fxRCHO(i)+.07; fxACET(i)=fxACET(i)+.01; fKET2(i)=fKET2(i)+.05; fxKET2(i)=fxKET2(i)+.08; fxOLEP(i)=fxOLEP(i)+.02; fxRHNO3(i)=fxRHNO3(i)+.04; fxRCNO3(i)=fxRCNO3(i)+.4; fzRCNO3(i)=fzRCNO3(i)+.01; fzRDNO3(i)=fzRDNO3(i)+.32; fxHPCRB(i)=fxHPCRB(i)+.01; fCO(i)=fCO(i)+.02; fyRPNO3(i)=fyRPNO3(i)+1.44; fSumRO2(i)=fSumRO2(i)+1.5;

i=i+1;
Rnames{i} = 'R2NO3 + HV = R2NO3_HV - 0.04*xNO2 + NO2 + .1*HO2 + .61*xHO2 + .01*xMECO3 + .01*xR2CO3 + .82*RO2C + .19*RO2XC + .04*xRCHO + .01*xACET + .09*KET2 + .44*xKET2 + .02*xMVK + .03*xPACID + .13*zRHNO3 + .04*xRHNO3 + .06*zRCNO3 + .02*CO + .61*yROOH + .36*yHPCRB + 1.01*SumRO2';
k(:,i) = JIC3ONO2;
Gstr{i,1} = 'R2NO3';
fR2NO3(i)=fR2NO3(i)-1; fR2NO3_HV(i)=fR2NO3_HV(i)+1; fxNO2(i)=fxNO2(i)-0.04; fNO2(i)=fNO2(i)+1; fHO2(i)=fHO2(i)+.1; fxHO2(i)=fxHO2(i)+.61; fxMECO3(i)=fxMECO3(i)+.01; fxR2CO3(i)=fxR2CO3(i)+.01; fRO2C(i)=fRO2C(i)+.82; fRO2XC(i)=fRO2XC(i)+.19; fxRCHO(i)=fxRCHO(i)+.04; fxACET(i)=fxACET(i)+.01; fKET2(i)=fKET2(i)+.09; fxKET2(i)=fxKET2(i)+.44; fxMVK(i)=fxMVK(i)+.02; fxPACID(i)=fxPACID(i)+.03; fzRHNO3(i)=fzRHNO3(i)+.13; fxRHNO3(i)=fxRHNO3(i)+.04; fzRCNO3(i)=fzRCNO3(i)+.06; fCO(i)=fCO(i)+.02; fyROOH(i)=fyROOH(i)+.61; fyHPCRB(i)=fyHPCRB(i)+.36; fSumRO2(i)=fSumRO2(i)+1.01;

i=i+1;
Rnames{i} = 'R2NO3_HV = .02*HO2 + .02*xHO2 + .05*xPACID + .06*xHPCRB';
k(:,i) = 1.28e+00;
Gstr{i,1} = 'R2NO3_HV';
fR2NO3_HV(i)=fR2NO3_HV(i)-1; fHO2(i)=fHO2(i)+.02; fxHO2(i)=fxHO2(i)+.02; fxPACID(i)=fxPACID(i)+.05; fxHPCRB(i)=fxHPCRB(i)+.06;

i=i+1;
Rnames{i} = 'R2NO3_HV + NO = NO + .13*RO2C + .03*RO2XC + .1*xRCHO + .01*xACET + .01*zRHNO3 + .03*zRCNO3 + .16*yHPCRB + .16*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'R2NO3_HV'; Gstr{i,2} = 'NO';
fR2NO3_HV(i)=fR2NO3_HV(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRO2C(i)=fRO2C(i)+.13; fRO2XC(i)=fRO2XC(i)+.03; fxRCHO(i)=fxRCHO(i)+.1; fxACET(i)=fxACET(i)+.01; fzRHNO3(i)=fzRHNO3(i)+.01; fzRCNO3(i)=fzRCNO3(i)+.03; fyHPCRB(i)=fyHPCRB(i)+.16; fSumRO2(i)=fSumRO2(i)+.16;

i=i+1;
Rnames{i} = 'RAOOH + OH = .76*OH + .17*HO2 + .06*xHO2 + .06*RO2C + .01*RO2XC + .31*RCHO + .02*xGLY + .04*xMGLY + .01*KET2 + .04*OLEP + .02*xBUDAL + .02*AFG2A + .03*xAFG2A + .01*zRANO3 + .17*HPCRB + .01*ALK5 + .37*ALK6 + .07*yRAOOH + .07*SumRO2';
k(:,i) = 8.27e-11;
Gstr{i,1} = 'RAOOH'; Gstr{i,2} = 'OH';
fRAOOH(i)=fRAOOH(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+.76; fHO2(i)=fHO2(i)+.17; fxHO2(i)=fxHO2(i)+.06; fRO2C(i)=fRO2C(i)+.06; fRO2XC(i)=fRO2XC(i)+.01; fRCHO(i)=fRCHO(i)+.31; fxGLY(i)=fxGLY(i)+.02; fxMGLY(i)=fxMGLY(i)+.04; fKET2(i)=fKET2(i)+.01; fOLEP(i)=fOLEP(i)+.04; fxBUDAL(i)=fxBUDAL(i)+.02; fAFG2A(i)=fAFG2A(i)+.02; fxAFG2A(i)=fxAFG2A(i)+.03; fzRANO3(i)=fzRANO3(i)+.01; fHPCRB(i)=fHPCRB(i)+.17; fALK5(i)=fALK5(i)+.01; fALK6(i)=fALK6(i)+.37; fyRAOOH(i)=fyRAOOH(i)+.07; fSumRO2(i)=fSumRO2(i)+.07;

i=i+1;
Rnames{i} = 'RAOOH + HV = HPCRB';
k(:,i) = JCOOH;
Gstr{i,1} = 'RAOOH';
fRAOOH(i)=fRAOOH(i)-1; fHPCRB(i)=fHPCRB(i)+1;

i=i+1;
Rnames{i} = 'RUOOH + OH = .64*OH + .08*HO2 + .25*xHO2 + .25*RO2C + .02*RO2XC + .12*xHCHO + .03*xGLCHO + .03*xMACR + .06*xKET2 + .06*xMVK + .02*LVKS + .01*zRHNO3 + .01*zRPNO3 + .08*HPCRB + .16*xHPCRB + .02*ALK4 + .6*ALK5 + .01*xFURNS + .17*yROOH + .1*yRUOOH + .27*SumRO2';
k(:,i) = 5.87e-11;
Gstr{i,1} = 'RUOOH'; Gstr{i,2} = 'OH';
fRUOOH(i)=fRUOOH(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+.64; fHO2(i)=fHO2(i)+.08; fxHO2(i)=fxHO2(i)+.25; fRO2C(i)=fRO2C(i)+.25; fRO2XC(i)=fRO2XC(i)+.02; fxHCHO(i)=fxHCHO(i)+.12; fxGLCHO(i)=fxGLCHO(i)+.03; fxMACR(i)=fxMACR(i)+.03; fxKET2(i)=fxKET2(i)+.06; fxMVK(i)=fxMVK(i)+.06; fLVKS(i)=fLVKS(i)+.02; fzRHNO3(i)=fzRHNO3(i)+.01; fzRPNO3(i)=fzRPNO3(i)+.01; fHPCRB(i)=fHPCRB(i)+.08; fxHPCRB(i)=fxHPCRB(i)+.16; fALK4(i)=fALK4(i)+.02; fALK5(i)=fALK5(i)+.6; fxFURNS(i)=fxFURNS(i)+.01; fyROOH(i)=fyROOH(i)+.17; fyRUOOH(i)=fyRUOOH(i)+.1; fSumRO2(i)=fSumRO2(i)+.27;

i=i+1;
Rnames{i} = 'RUOOH + HV = OH + HO2 + .86*HCHO + .4*MACR + .04*OLEA1 + .47*MVK + .09*FURNS';
k(:,i) = JCOOH;
Gstr{i,1} = 'RUOOH';
fRUOOH(i)=fRUOOH(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; fHCHO(i)=fHCHO(i)+.86; fMACR(i)=fMACR(i)+.4; fOLEA1(i)=fOLEA1(i)+.04; fMVK(i)=fMVK(i)+.47; fFURNS(i)=fFURNS(i)+.09;

i=i+1;
Rnames{i} = 'HPCRB + OH = .58*OH + .01*HO2 + .38*xHO2 + .38*RO2C + .03*RO2XC + .03*xHCHO + .34*RCHO + .05*xGLY + .26*xMGLY + .01*OLEA1 + .21*OLEP + .03*xPACID + .02*AFG1 + .03*zRPNO3 + .01*HPCRB + .35*xHPCRB + .04*CO + .39*yHPCRB + .41*SumRO2';
k(:,i) = 5.38e-11;
Gstr{i,1} = 'HPCRB'; Gstr{i,2} = 'OH';
fHPCRB(i)=fHPCRB(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+.58; fHO2(i)=fHO2(i)+.01; fxHO2(i)=fxHO2(i)+.38; fRO2C(i)=fRO2C(i)+.38; fRO2XC(i)=fRO2XC(i)+.03; fxHCHO(i)=fxHCHO(i)+.03; fRCHO(i)=fRCHO(i)+.34; fxGLY(i)=fxGLY(i)+.05; fxMGLY(i)=fxMGLY(i)+.26; fOLEA1(i)=fOLEA1(i)+.01; fOLEP(i)=fOLEP(i)+.21; fxPACID(i)=fxPACID(i)+.03; fAFG1(i)=fAFG1(i)+.02; fzRPNO3(i)=fzRPNO3(i)+.03; fHPCRB(i)=fHPCRB(i)+.01; fxHPCRB(i)=fxHPCRB(i)+.35; fCO(i)=fCO(i)+.04; fyHPCRB(i)=fyHPCRB(i)+.39; fSumRO2(i)=fSumRO2(i)+.41;

i=i+1;
Rnames{i} = 'HPCRB + HV = HPCRB_HV + OH + .54*HO2 + .09*xHO2 + .06*RO2C + .11*HCHO + .03*xHCHO + .11*OLEA1 + .03*xPACID + .11*AFG2A + .29*AFG2B + .02*xAFG2B + .07*SumRO2';
k(:,i) = JHPALDS.*1.00e-1;
Gstr{i,1} = 'HPCRB';
fHPCRB(i)=fHPCRB(i)-1; fHPCRB_HV(i)=fHPCRB_HV(i)+1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+.54; fxHO2(i)=fxHO2(i)+.09; fRO2C(i)=fRO2C(i)+.06; fHCHO(i)=fHCHO(i)+.11; fxHCHO(i)=fxHCHO(i)+.03; fOLEA1(i)=fOLEA1(i)+.11; fxPACID(i)=fxPACID(i)+.03; fAFG2A(i)=fAFG2A(i)+.11; fAFG2B(i)=fAFG2B(i)+.29; fxAFG2B(i)=fxAFG2B(i)+.02; fSumRO2(i)=fSumRO2(i)+.07;

i=i+1;
Rnames{i} = 'HPCRB_HV = .36*HO2 + .01*RO2XC + .03*xHCHO + .03*xPACID + .11*AFG2A + .25*AFG2B + .01*xAFG2B + .01*zRCNO3';
k(:,i) = 2.11e+01;
Gstr{i,1} = 'HPCRB_HV';
fHPCRB_HV(i)=fHPCRB_HV(i)-1; fHO2(i)=fHO2(i)+.36; fRO2XC(i)=fRO2XC(i)+.01; fxHCHO(i)=fxHCHO(i)+.03; fxPACID(i)=fxPACID(i)+.03; fAFG2A(i)=fAFG2A(i)+.11; fAFG2B(i)=fAFG2B(i)+.25; fxAFG2B(i)=fxAFG2B(i)+.01; fzRCNO3(i)=fzRCNO3(i)+.01;

i=i+1;
Rnames{i} = 'HPCRB_HV + NO = NO + .07*xHO2 + .4*RO2C + .39*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'HPCRB_HV'; Gstr{i,2} = 'NO';
fHPCRB_HV(i)=fHPCRB_HV(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.07; fRO2C(i)=fRO2C(i)+.4; fSumRO2(i)=fSumRO2(i)+.39;

i=i+1;
Rnames{i} = 'ROOH + OH = .2*OH + .06*xOH + .22*HO2 + .38*xHO2 + .07*xETO2 + .02*xTBUO + .59*RO2C + .05*RO2XC + .01*HCHO + .34*xHCHO + .14*xMECHO + .01*xETCHO + .06*GLCHO + .04*xGLCHO + .01*RCHO + .03*xRCHO + .02*ACET + .14*xACET + .02*MEK + .02*xMEK + .09*KET2 + .03*xKET2 + .02*zR1NO3 + .01*zRHNO3 + .01*zRCNO3 + .02*zRPNO3 + .22*HPCRB + .03*xHPCRB + .61*yROOH + .03*yHPCRB + .64*SumRO2';
k(:,i) = 1.24e-11;
Gstr{i,1} = 'ROOH'; Gstr{i,2} = 'OH';
fROOH(i)=fROOH(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+.2; fxOH(i)=fxOH(i)+.06; fHO2(i)=fHO2(i)+.22; fxHO2(i)=fxHO2(i)+.38; fxETO2(i)=fxETO2(i)+.07; fxTBUO(i)=fxTBUO(i)+.02; fRO2C(i)=fRO2C(i)+.59; fRO2XC(i)=fRO2XC(i)+.05; fHCHO(i)=fHCHO(i)+.01; fxHCHO(i)=fxHCHO(i)+.34; fxMECHO(i)=fxMECHO(i)+.14; fxETCHO(i)=fxETCHO(i)+.01; fGLCHO(i)=fGLCHO(i)+.06; fxGLCHO(i)=fxGLCHO(i)+.04; fRCHO(i)=fRCHO(i)+.01; fxRCHO(i)=fxRCHO(i)+.03; fACET(i)=fACET(i)+.02; fxACET(i)=fxACET(i)+.14; fMEK(i)=fMEK(i)+.02; fxMEK(i)=fxMEK(i)+.02; fKET2(i)=fKET2(i)+.09; fxKET2(i)=fxKET2(i)+.03; fzR1NO3(i)=fzR1NO3(i)+.02; fzRHNO3(i)=fzRHNO3(i)+.01; fzRCNO3(i)=fzRCNO3(i)+.01; fzRPNO3(i)=fzRPNO3(i)+.02; fHPCRB(i)=fHPCRB(i)+.22; fxHPCRB(i)=fxHPCRB(i)+.03; fyROOH(i)=fyROOH(i)+.61; fyHPCRB(i)=fyHPCRB(i)+.03; fSumRO2(i)=fSumRO2(i)+.64;

i=i+1;
Rnames{i} = 'ROOH + HV = .02*TBUO + OH + .79*HO2 + .06*xHO2 + .11*ETO2 + .09*RO2C + .01*RO2XC + .74*HCHO + .23*MECHO + .01*ETCHO + .09*GLCHO + .08*RCHO + .16*ACET + .03*xACET + .04*MEK + .05*KET2 + .03*xKET2 + .01*zRCNO3 + .06*yROOH + .03*yHPCRB + .21*SumRO2';
k(:,i) = JCOOH;
Gstr{i,1} = 'ROOH';
fROOH(i)=fROOH(i)-1; fTBUO(i)=fTBUO(i)+.02; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+.79; fxHO2(i)=fxHO2(i)+.06; fETO2(i)=fETO2(i)+.11; fRO2C(i)=fRO2C(i)+.09; fRO2XC(i)=fRO2XC(i)+.01; fHCHO(i)=fHCHO(i)+.74; fMECHO(i)=fMECHO(i)+.23; fETCHO(i)=fETCHO(i)+.01; fGLCHO(i)=fGLCHO(i)+.09; fRCHO(i)=fRCHO(i)+.08; fACET(i)=fACET(i)+.16; fxACET(i)=fxACET(i)+.03; fMEK(i)=fMEK(i)+.04; fKET2(i)=fKET2(i)+.05; fxKET2(i)=fxKET2(i)+.03; fzRCNO3(i)=fzRCNO3(i)+.01; fyROOH(i)=fyROOH(i)+.06; fyHPCRB(i)=fyHPCRB(i)+.03; fSumRO2(i)=fSumRO2(i)+.21;

i=i+1;
Rnames{i} = 'AFG1 + OH = AFG1_OH + .24*OH + .01*xOH + .02*HO2 + .2*xHO2 + .18*RO2C + .02*RO2XC + .18*xGLY + .02*xPACID + .02*HPCRB + .01*CO + .24*MALAH + .2*SumRO2';
k(:,i) = 3.39e-11;
Gstr{i,1} = 'AFG1'; Gstr{i,2} = 'OH';
fAFG1(i)=fAFG1(i)-1; fOH(i)=fOH(i)-1; fAFG1_OH(i)=fAFG1_OH(i)+1; fOH(i)=fOH(i)+.24; fxOH(i)=fxOH(i)+.01; fHO2(i)=fHO2(i)+.02; fxHO2(i)=fxHO2(i)+.2; fRO2C(i)=fRO2C(i)+.18; fRO2XC(i)=fRO2XC(i)+.02; fxGLY(i)=fxGLY(i)+.18; fxPACID(i)=fxPACID(i)+.02; fHPCRB(i)=fHPCRB(i)+.02; fCO(i)=fCO(i)+.01; fMALAH(i)=fMALAH(i)+.24; fSumRO2(i)=fSumRO2(i)+.2;

i=i+1;
Rnames{i} = 'AFG1_OH = .19*OH + .01*xOH + .32*HO2 + .19*xPACID + .02*zRCNO3 + .32*HPCRB + .01*xHPCRB + .18*MALAH';
k(:,i) = 1.77e+01;
Gstr{i,1} = 'AFG1_OH';
fAFG1_OH(i)=fAFG1_OH(i)-1; fOH(i)=fOH(i)+.19; fxOH(i)=fxOH(i)+.01; fHO2(i)=fHO2(i)+.32; fxPACID(i)=fxPACID(i)+.19; fzRCNO3(i)=fzRCNO3(i)+.02; fHPCRB(i)=fHPCRB(i)+.32; fxHPCRB(i)=fxHPCRB(i)+.01; fMALAH(i)=fMALAH(i)+.18;

i=i+1;
Rnames{i} = 'AFG1_OH + NO = NO + .39*xHO2 + .52*RO2C + .03*RO2XC + .39*xGLY + .56*xMGLY + .2*CO + .43*yHPCRB + .55*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'AFG1_OH'; Gstr{i,2} = 'NO';
fAFG1_OH(i)=fAFG1_OH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.39; fRO2C(i)=fRO2C(i)+.52; fRO2XC(i)=fRO2XC(i)+.03; fxGLY(i)=fxGLY(i)+.39; fxMGLY(i)=fxMGLY(i)+.56; fCO(i)=fCO(i)+.2; fyHPCRB(i)=fyHPCRB(i)+.43; fSumRO2(i)=fSumRO2(i)+.55;

i=i+1;
Rnames{i} = 'AFG1 + HV = AFG1_HV + .26*OH + .54*xOH + .94*HO2 + .03*xHO2 + .06*MEO2 + .03*RO2C + .23*PACID + .05*xPACID + .01*AFG1 + .02*AFG2A + .02*xHPCRB + .03*CO + .09*SumRO2';
k(:,i) = JAFGS.*2.20e-1;
Gstr{i,1} = 'AFG1';
fAFG1(i)=fAFG1(i)-1; fAFG1_HV(i)=fAFG1_HV(i)+1; fOH(i)=fOH(i)+.26; fxOH(i)=fxOH(i)+.54; fHO2(i)=fHO2(i)+.94; fxHO2(i)=fxHO2(i)+.03; fMEO2(i)=fMEO2(i)+.06; fRO2C(i)=fRO2C(i)+.03; fPACID(i)=fPACID(i)+.23; fxPACID(i)=fxPACID(i)+.05; fAFG1(i)=fAFG1(i)+.01; fAFG2A(i)=fAFG2A(i)+.02; fxHPCRB(i)=fxHPCRB(i)+.02; fCO(i)=fCO(i)+.03; fSumRO2(i)=fSumRO2(i)+.09;

i=i+1;
Rnames{i} = 'AFG1_HV = .01*OH + .17*xOH + .33*xPACID + .33*xHPCRB';
k(:,i) = 1.80e+01;
Gstr{i,1} = 'AFG1_HV';
fAFG1_HV(i)=fAFG1_HV(i)-1; fOH(i)=fOH(i)+.01; fxOH(i)=fxOH(i)+.17; fxPACID(i)=fxPACID(i)+.33; fxHPCRB(i)=fxHPCRB(i)+.33;

i=i+1;
Rnames{i} = 'AFG1_HV + NO = NO + .1*xHO2 + .64*RO2C + .08*RO2XC + .08*zRCNO3 + .05*CO + .49*MALAH + .72*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'AFG1_HV'; Gstr{i,2} = 'NO';
fAFG1_HV(i)=fAFG1_HV(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.1; fRO2C(i)=fRO2C(i)+.64; fRO2XC(i)=fRO2XC(i)+.08; fzRCNO3(i)=fzRCNO3(i)+.08; fCO(i)=fCO(i)+.05; fMALAH(i)=fMALAH(i)+.49; fSumRO2(i)=fSumRO2(i)+.72;

i=i+1;
Rnames{i} = 'AFG2A + OH = .57*xHO2 + .15*xMECO3 + .01*xR2CO3 + .2*MACO3 + .73*RO2C + .07*RO2XC + .03*xRCHO + .47*xGLY + .54*xMGLY + .23*xPACID + .07*zRCNO3 + .03*CO + .47*yHPCRB + .8*SumRO2 + .2*SumRCO3';
k(:,i) = 5.99e-11;
Gstr{i,1} = 'AFG2A'; Gstr{i,2} = 'OH';
fAFG2A(i)=fAFG2A(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.57; fxMECO3(i)=fxMECO3(i)+.15; fxR2CO3(i)=fxR2CO3(i)+.01; fMACO3(i)=fMACO3(i)+.2; fRO2C(i)=fRO2C(i)+.73; fRO2XC(i)=fRO2XC(i)+.07; fxRCHO(i)=fxRCHO(i)+.03; fxGLY(i)=fxGLY(i)+.47; fxMGLY(i)=fxMGLY(i)+.54; fxPACID(i)=fxPACID(i)+.23; fzRCNO3(i)=fzRCNO3(i)+.07; fCO(i)=fCO(i)+.03; fyHPCRB(i)=fyHPCRB(i)+.47; fSumRO2(i)=fSumRO2(i)+.8; fSumRCO3(i)=fSumRCO3(i)+.2;

i=i+1;
Rnames{i} = 'AFG2A + HV = OH + .91*MEO2 + .09*ETO2 + MALAH + SumRO2';
k(:,i) = JAFGS.*2.50e-1;
Gstr{i,1} = 'AFG2A';
fAFG2A(i)=fAFG2A(i)-1; fOH(i)=fOH(i)+1; fMEO2(i)=fMEO2(i)+.91; fETO2(i)=fETO2(i)+.09; fMALAH(i)=fMALAH(i)+1; fSumRO2(i)=fSumRO2(i)+1;

i=i+1;
Rnames{i} = 'AFG2B + OH = AFG2B_OH + .02*HO2 + .4*xHO2 + .17*MACO3 + .4*RO2C + .05*RO2XC + .39*xGLY + .39*xBACL + .05*zRCNO3 + .02*HPCRB + .38*yHPCRB + .45*SumRO2 + .17*SumRCO3';
k(:,i) = 4.58e-11;
Gstr{i,1} = 'AFG2B'; Gstr{i,2} = 'OH';
fAFG2B(i)=fAFG2B(i)-1; fOH(i)=fOH(i)-1; fAFG2B_OH(i)=fAFG2B_OH(i)+1; fHO2(i)=fHO2(i)+.02; fxHO2(i)=fxHO2(i)+.4; fMACO3(i)=fMACO3(i)+.17; fRO2C(i)=fRO2C(i)+.4; fRO2XC(i)=fRO2XC(i)+.05; fxGLY(i)=fxGLY(i)+.39; fxBACL(i)=fxBACL(i)+.39; fzRCNO3(i)=fzRCNO3(i)+.05; fHPCRB(i)=fHPCRB(i)+.02; fyHPCRB(i)=fyHPCRB(i)+.38; fSumRO2(i)=fSumRO2(i)+.45; fSumRCO3(i)=fSumRCO3(i)+.17;

i=i+1;
Rnames{i} = 'AFG2B_OH = .36*HO2 + .36*HPCRB';
k(:,i) = 1.46e+01;
Gstr{i,1} = 'AFG2B_OH';
fAFG2B_OH(i)=fAFG2B_OH(i)-1; fHO2(i)=fHO2(i)+.36; fHPCRB(i)=fHPCRB(i)+.36;

i=i+1;
Rnames{i} = 'AFG2B_OH + NO = NO + .2*xHO2 + .12*xMECO3 + .32*RO2C + .04*RO2XC + .13*xRCHO + .2*xGLY + .2*xBACL + .04*zRCNO3 + .31*yHPCRB + .36*SumRO2';
k(:,i) = 2.55e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'AFG2B_OH'; Gstr{i,2} = 'NO';
fAFG2B_OH(i)=fAFG2B_OH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fxHO2(i)=fxHO2(i)+.2; fxMECO3(i)=fxMECO3(i)+.12; fRO2C(i)=fRO2C(i)+.32; fRO2XC(i)=fRO2XC(i)+.04; fxRCHO(i)=fxRCHO(i)+.13; fxGLY(i)=fxGLY(i)+.2; fxBACL(i)=fxBACL(i)+.2; fzRCNO3(i)=fzRCNO3(i)+.04; fyHPCRB(i)=fyHPCRB(i)+.31; fSumRO2(i)=fSumRO2(i)+.36;

i=i+1;
Rnames{i} = 'AFG2B + HV = .86*OH + .1*xOH + .03*xHO2 + MEO2 + .04*RO2C + .08*xPACID + .05*xHPCRB + .03*CO + .87*MALAH + 1.04*SumRO2';
k(:,i) = JAFGS.*2.20e-1;
Gstr{i,1} = 'AFG2B';
fAFG2B(i)=fAFG2B(i)-1; fOH(i)=fOH(i)+.86; fxOH(i)=fxOH(i)+.1; fxHO2(i)=fxHO2(i)+.03; fMEO2(i)=fMEO2(i)+1; fRO2C(i)=fRO2C(i)+.04; fxPACID(i)=fxPACID(i)+.08; fxHPCRB(i)=fxHPCRB(i)+.05; fCO(i)=fCO(i)+.03; fMALAH(i)=fMALAH(i)+.87; fSumRO2(i)=fSumRO2(i)+1.04;

i=i+1;
Rnames{i} = 'AFG3 + OH = .27*xHO2 + .62*xMECO3 + .88*RO2C + .11*RO2XC + .62*xRCHO + .54*xMGLY + .11*zRCNO3 + .85*yHPCRB + .99*SumRO2';
k(:,i) = 7.20e-11;
Gstr{i,1} = 'AFG3'; Gstr{i,2} = 'OH';
fAFG3(i)=fAFG3(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.27; fxMECO3(i)=fxMECO3(i)+.62; fRO2C(i)=fRO2C(i)+.88; fRO2XC(i)=fRO2XC(i)+.11; fxRCHO(i)=fxRCHO(i)+.62; fxMGLY(i)=fxMGLY(i)+.54; fzRCNO3(i)=fzRCNO3(i)+.11; fyHPCRB(i)=fyHPCRB(i)+.85; fSumRO2(i)=fSumRO2(i)+.99;

i=i+1;
Rnames{i} = 'PAN2 = NO2 + R2CO3 + SumRCO3';
k(:,i) = 3.39e-04;
Gstr{i,1} = 'PAN2';
fPAN2(i)=fPAN2(i)-1; fNO2(i)=fNO2(i)+1; fR2CO3(i)=fR2CO3(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'PAN2 + OH = .05*NO3 + .73*xNO3 + 1.15*xHO2 + 1.55*RO2C + .07*RO2XC + .17*xHCHO + .66*xMECHO + .07*xETCHO + .15*xPAN2 + .07*zPAN2 + .5*CO + .73*CO2 + .05*ALK3 + 1.62*SumRO2';
k(:,i) = 3.42e-12;
Gstr{i,1} = 'PAN2'; Gstr{i,2} = 'OH';
fPAN2(i)=fPAN2(i)-1; fOH(i)=fOH(i)-1; fNO3(i)=fNO3(i)+.05; fxNO3(i)=fxNO3(i)+.73; fxHO2(i)=fxHO2(i)+1.15; fRO2C(i)=fRO2C(i)+1.55; fRO2XC(i)=fRO2XC(i)+.07; fxHCHO(i)=fxHCHO(i)+.17; fxMECHO(i)=fxMECHO(i)+.66; fxETCHO(i)=fxETCHO(i)+.07; fxPAN2(i)=fxPAN2(i)+.15; fzPAN2(i)=fzPAN2(i)+.07; fCO(i)=fCO(i)+.5; fCO2(i)=fCO2(i)+.73; fALK3(i)=fALK3(i)+.05; fSumRO2(i)=fSumRO2(i)+1.62;

i=i+1;
Rnames{i} = 'PAN2 + HV = NO2 + R2CO3 + SumRCO3';
k(:,i) = JPPN_11;
Gstr{i,1} = 'PAN2';
fPAN2(i)=fPAN2(i)-1; fNO2(i)=fNO2(i)+1; fR2CO3(i)=fR2CO3(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'APANS = NO2 + MACO3 + SumRCO3';
k(:,i) = 3.39e-04;
Gstr{i,1} = 'APANS';
fAPANS(i)=fAPANS(i)-1; fNO2(i)=fNO2(i)+1; fMACO3(i)=fMACO3(i)+1; fSumRCO3(i)=fSumRCO3(i)+1;

i=i+1;
Rnames{i} = 'APANS + OH = .74*NO3 + .18*xNO3 + .07*xHO2 + .25*RO2C + .01*RO2XC + .07*xHCHO + .18*xKET2 + .19*OACID + .07*xPAN2 + .01*zPAN2 + .18*CO2 + .56*ALK4 + .26*SumRO2';
k(:,i) = 2.90e-11;
Gstr{i,1} = 'APANS'; Gstr{i,2} = 'OH';
fAPANS(i)=fAPANS(i)-1; fOH(i)=fOH(i)-1; fNO3(i)=fNO3(i)+.74; fxNO3(i)=fxNO3(i)+.18; fxHO2(i)=fxHO2(i)+.07; fRO2C(i)=fRO2C(i)+.25; fRO2XC(i)=fRO2XC(i)+.01; fxHCHO(i)=fxHCHO(i)+.07; fxKET2(i)=fxKET2(i)+.18; fOACID(i)=fOACID(i)+.19; fxPAN2(i)=fxPAN2(i)+.07; fzPAN2(i)=fzPAN2(i)+.01; fCO2(i)=fCO2(i)+.18; fALK4(i)=fALK4(i)+.56; fSumRO2(i)=fSumRO2(i)+.26;

i=i+1;
Rnames{i} = 'APANS + O3 = .05*NO2 + .19*OH + .34*HO2 + .38*HCHO2 + .01*RCHO2 + .1*HCHO + .9*PAN2 + .16*H2 + .31*CO + .21*CO2';
k(:,i) = 8.20e-18;
Gstr{i,1} = 'APANS'; Gstr{i,2} = 'O3';
fAPANS(i)=fAPANS(i)-1; fO3(i)=fO3(i)-1; fNO2(i)=fNO2(i)+.05; fOH(i)=fOH(i)+.19; fHO2(i)=fHO2(i)+.34; fHCHO2(i)=fHCHO2(i)+.38; fRCHO2(i)=fRCHO2(i)+.01; fHCHO(i)=fHCHO(i)+.1; fPAN2(i)=fPAN2(i)+.9; fH2(i)=fH2(i)+.16; fCO(i)=fCO(i)+.31; fCO2(i)=fCO2(i)+.21;

i=i+1;
Rnames{i} = 'APANS + NO3 = HO2';
k(:,i) = 1.60e-16;
Gstr{i,1} = 'APANS'; Gstr{i,2} = 'NO3';
fAPANS(i)=fAPANS(i)-1; fNO3(i)=fNO3(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'APANS + HV = .6*NO2 + .4*NO3 + .4*MEO2 + .6*MACO3 + .4*HCHO + .4*CO + .4*CO2 + .4*SumRO2 + .6*SumRCO3*.';
k(:,i) = JPPN_11;
Gstr{i,1} = 'APANS';
fAPANS(i)=fAPANS(i)-1; fNO2(i)=fNO2(i)+.6; fNO3(i)=fNO3(i)+.4; fMEO2(i)=fMEO2(i)+.4; fMACO3(i)=fMACO3(i)+.6; fHCHO(i)=fHCHO(i)+.4; fCO(i)=fCO(i)+.4; fCO2(i)=fCO2(i)+.4; fSumRO2(i)=fSumRO2(i)+.4; fSumRCO3(i)=fSumRCO3(i)+.6;