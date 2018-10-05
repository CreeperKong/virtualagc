// Verilog module auto-generated for AGC module A17 by dumbVerilog.py

module A17 ( 
  rst, AGCWAR, CCHG_, CDUFAL, CGA17, CH1113, CH1213, CH1214, CH1301, CH1302,
  CH1303, CH1304, CH1305, CH1306, CH1307, CH1308, CH1309, CH1310, CH1311,
  CH1316, CH1401, CH1402, CH1403, CH1404, CH1405, CH1406, CH1407, CH1408,
  CH1409, CH1410, CH1411, CH1412, CH1413, CH1414, CH1416, CH3310, CH3312,
  CHWL01_, CHWL02_, CHWL03_, CHWL04_, CHWL05_, CHWL06_, CHWL07_, CHWL08_,
  CHWL09_, CHWL10_, CHWL11_, CHWL12_, CHWL13_, CHWL14_, CHWL16_, CTLSAT,
  F05A_, F05B_, F05D, FREFUN, GCAPCL, GOJAM, GUIREL, HOLFUN, IMUCAG, IMUFAL,
  IMUOPR, IN3008, IN3212, IN3213, IN3214, IN3216, IN3301, ISSTOR, LEMATT,
  LFTOFF, LRRLSC, LVDAGD, MANRmP, MANRmR, MANRmY, MANRpP, MANRpR, MANRpY,
  MNIMmP, MNIMmR, MNIMmY, MNIMpP, MNIMpR, MNIMpY, OPCDFL, OPMSW2, OPMSW3,
  OSCALM, PCHGOF, PIPAFL, ROLGOF, RRPONA, RRRLSC, S01, S02, S4BSAB, SMSEPR,
  SPSRDY, STRPRS, TEMPIN, TPOR_, TRANmX, TRANmY, TRANmZ, TRANpX, TRANpY,
  TRANpZ, TRST10, TRST9, ULLTHR, WCH13_, WCHG_, XB0_, XB1_, XB2_, XB3_, XT1_,
  XT3_, ZEROP, CHOR01_, CHOR02_, CHOR03_, CHOR04_, CHOR05_, CHOR06_, CHOR07_,
  CHOR08_, CHOR09_, CHOR10_, CHOR11_, CHOR12_, CHOR13_, CHOR14_, CHOR16_,
  RCH33_, XB0, CCH10, CCH11, CH3201, CH3202, CH3203, CH3204, CH3205, CH3206,
  CH3207, CH3208, CH3209, CH3210, CH3313, CH3314, CH3316, HNDRPT, RCH10_,
  RCH11_, RCH30_, RCH31_, RCH32_, RLYB01, RLYB02, RLYB03, RLYB04, RLYB05,
  RLYB06, RLYB07, RLYB08, RLYB09, RLYB10, RLYB11, RYWD12, RYWD13, RYWD14,
  RYWD16, TRP31A, TRP31B, TRP32, WCH10_, WCH11_
);

input wand rst, AGCWAR, CCHG_, CDUFAL, CGA17, CH1113, CH1213, CH1214, CH1301,
  CH1302, CH1303, CH1304, CH1305, CH1306, CH1307, CH1308, CH1309, CH1310,
  CH1311, CH1316, CH1401, CH1402, CH1403, CH1404, CH1405, CH1406, CH1407,
  CH1408, CH1409, CH1410, CH1411, CH1412, CH1413, CH1414, CH1416, CH3310,
  CH3312, CHWL01_, CHWL02_, CHWL03_, CHWL04_, CHWL05_, CHWL06_, CHWL07_,
  CHWL08_, CHWL09_, CHWL10_, CHWL11_, CHWL12_, CHWL13_, CHWL14_, CHWL16_,
  CTLSAT, F05A_, F05B_, F05D, FREFUN, GCAPCL, GOJAM, GUIREL, HOLFUN, IMUCAG,
  IMUFAL, IMUOPR, IN3008, IN3212, IN3213, IN3214, IN3216, IN3301, ISSTOR,
  LEMATT, LFTOFF, LRRLSC, LVDAGD, MANRmP, MANRmR, MANRmY, MANRpP, MANRpR,
  MANRpY, MNIMmP, MNIMmR, MNIMmY, MNIMpP, MNIMpR, MNIMpY, OPCDFL, OPMSW2,
  OPMSW3, OSCALM, PCHGOF, PIPAFL, ROLGOF, RRPONA, RRRLSC, S01, S02, S4BSAB,
  SMSEPR, SPSRDY, STRPRS, TEMPIN, TPOR_, TRANmX, TRANmY, TRANmZ, TRANpX,
  TRANpY, TRANpZ, TRST10, TRST9, ULLTHR, WCH13_, WCHG_, XB0_, XB1_, XB2_,
  XB3_, XT1_, XT3_, ZEROP;

inout wand CHOR01_, CHOR02_, CHOR03_, CHOR04_, CHOR05_, CHOR06_, CHOR07_,
  CHOR08_, CHOR09_, CHOR10_, CHOR11_, CHOR12_, CHOR13_, CHOR14_, CHOR16_,
  RCH33_, XB0;

output wand CCH10, CCH11, CH3201, CH3202, CH3203, CH3204, CH3205, CH3206,
  CH3207, CH3208, CH3209, CH3210, CH3313, CH3314, CH3316, HNDRPT, RCH10_,
  RCH11_, RCH30_, RCH31_, RCH32_, RLYB01, RLYB02, RLYB03, RLYB04, RLYB05,
  RLYB06, RLYB07, RLYB08, RLYB09, RLYB10, RLYB11, RYWD12, RYWD13, RYWD14,
  RYWD16, TRP31A, TRP31B, TRP32, WCH10_, WCH11_;

// Gate A17-U121B
assign #0.2  A17U121Pad9 = rst ? 0 : ~(0|TRANmY|RCH31_);
// Gate A17-U202A
assign #0.2  A17U202Pad1 = rst ? 0 : ~(0|RCH10_|A17U201Pad2);
// Gate A17-U256A A17-U256B A17-U257A
assign #0.2  CCH11 = rst ? 1 : ~(0|A17U255Pad9);
// Gate A17-U141B
assign #0.2  A17U139Pad8 = rst ? 0 : ~(0|XT3_|XB2_);
// Gate A17-U248A A17-U247A A17-U247B
assign #0.2  WCH10_ = rst ? 1 : ~(0|A17U245Pad9);
// Gate A17-U146A A17-U209A
assign #0.2  CHOR07_ = rst ? 1 : ~(0|A17U115Pad9|A17U146Pad3|A17U146Pad4|CH1407|CH1307|A17U209Pad4);
// Gate A17-U121A
assign #0.2  A17U118Pad2 = rst ? 0 : ~(0|GOJAM|TRP32|A17U118Pad1);
// Gate A17-U118B
assign #0.2  A17U118Pad3 = rst ? 0 : ~(0|WCH13_|CHWL14_);
// Gate A17-U118A
assign #0.2  A17U118Pad1 = rst ? 1 : ~(0|A17U118Pad2|A17U118Pad3);
// Gate A17-U214A
assign #0.2  A17U214Pad1 = rst ? 0 : ~(0|A17U213Pad2|RCH10_);
// Gate A17-U225A
assign #0.2  A17U225Pad1 = rst ? 0 : ~(0|A17U225Pad2|CCH10);
// Gate A17-U123B
assign #0.2  A17U123Pad9 = rst ? 0 : ~(0|MANRpR|RCH31_);
// Gate A17-U214B
assign #0.2  A17U213Pad8 = rst ? 0 : ~(0|WCH10_|CHWL06_);
// Gate A17-U102A
assign #0.2  CH3205 = rst ? 0 : ~(0|MNIMpR|RCH32_);
// Gate A17-U244A
assign #0.2  A17U244Pad1 = rst ? 0 : ~(0|A17U243Pad2|CCH10);
// Gate A17-U213B
assign #0.2  A17U213Pad2 = rst ? 1 : ~(0|A17U213Pad1|A17U213Pad8);
// Gate A17-U123A
assign #0.2  A17U123Pad1 = rst ? 0 : ~(0|F05D|A17U122Pad3|A17U105Pad1);
// Gate A17-U213A
assign #0.2  A17U213Pad1 = rst ? 0 : ~(0|A17U213Pad2|CCH10);
// Gate A17-U243B
assign #0.2  A17U243Pad9 = rst ? 0 : ~(0|WCH10_|CHWL16_);
// Gate A17-U150B
assign #0.2  A17U149Pad3 = rst ? 0 : ~(0|RCH30_|IMUOPR);
// Gate A17-U150A
assign #0.2  A17U149Pad4 = rst ? 0 : ~(0|RCH33_|LRRLSC);
// Gate A17-U205A
assign #0.2  A17U205Pad1 = rst ? 0 : ~(0|A17U204Pad2|CCH10);
// Gate A17-U244B
assign #0.2  A17U243Pad2 = rst ? 1 : ~(0|A17U243Pad9|A17U244Pad1);
// Gate A17-U206B
assign #0.2  A17U205Pad7 = rst ? 0 : ~(0|WCH10_|CHWL09_);
// Gate A17-U236B
assign #0.2  A17U235Pad7 = rst ? 0 : ~(0|WCH10_|CHWL12_);
// Gate A17-U130A
assign #0.2  A17U130Pad1 = rst ? 0 : ~(0|A17U126Pad4|GOJAM|TRP31A);
// Gate A17-U124A
assign #0.2  A17U122Pad3 = rst ? 1 : ~(0|A17U124Pad2|A17U123Pad1);
// Gate A17-U122B
assign #0.2  A17U122Pad9 = rst ? 0 : ~(0|MANRmR|RCH31_);
// Gate A17-U138A
assign #0.2  A17U135Pad3 = rst ? 0 : ~(0|RCH32_|IN3214);
// Gate A17-U137B
assign #0.2  A17U135Pad2 = rst ? 0 : ~(0|RCH30_|ISSTOR);
// Gate A17-U135B
assign #0.2  A17U134Pad4 = rst ? 0 : ~(0|RCH32_|IN3216);
// Gate A17-U159B
assign #0.2  A17U158Pad3 = rst ? 0 : ~(0|RCH30_|SMSEPR);
// Gate A17-U238B
assign #0.2  A17U237Pad2 = rst ? 1 : ~(0|A17U237Pad9|A17U238Pad1);
// Gate A17-U217B
assign #0.2  A17U216Pad2 = rst ? 1 : ~(0|A17U217Pad1|A17U217Pad8);
// Gate A17-U254B
assign #0.2  A17U254Pad9 = rst ? 0 : ~(0|CCHG_|XT1_|XB1_);
// Gate A17-U224B
assign #0.2  A17U223Pad8 = rst ? 0 : ~(0|WCH10_|CHWL03_);
// Gate A17-U158B
assign #0.2  A17U158Pad4 = rst ? 0 : ~(0|RCH33_|RRPONA);
// Gate A17-U136B
assign #0.2  A17U134Pad3 = rst ? 0 : ~(0|RCH30_|TEMPIN);
// Gate A17-U152A A17-U215A
assign #0.2  CHOR06_ = rst ? 1 : ~(0|A17U122Pad9|A17U152Pad3|A17U152Pad4|CH1406|CH1306|A17U214Pad1);
// Gate A17-U237B
assign #0.2  A17U237Pad9 = rst ? 0 : ~(0|WCH10_|CHWL13_);
// Gate A17-U128A
assign #0.2  A17U127Pad2 = rst ? 0 : ~(0|F05D|A17U120Pad9|A17U125Pad3);
// Gate A17-U207A
assign #0.2  A17U207Pad1 = rst ? 0 : ~(0|A17U207Pad2|CCH10);
// Gate A17-U110B
assign #0.2  HNDRPT = rst ? 0 : ~(0|A17U110Pad7|TPOR_);
// Gate A17-U207B
assign #0.2  A17U207Pad2 = rst ? 1 : ~(0|A17U207Pad1|A17U207Pad8);
// Gate A17-U208B
assign #0.2  A17U207Pad8 = rst ? 0 : ~(0|WCH10_|CHWL08_);
// Gate A17-U259B
assign #0.2  XB0 = rst ? 0 : ~(0|S01|S02);
// Gate A17-U254A A17-U255A A17-U253B
assign #0.2  WCH11_ = rst ? 1 : ~(0|A17U252Pad9);
// Gate A17-U218B
assign #0.2  A17U217Pad8 = rst ? 0 : ~(0|WCH10_|CHWL05_);
// Gate A17-U109B
assign #0.2  A17U109Pad9 = rst ? 0 : ~(0|FREFUN|RCH31_);
// Gate A17-U237A
assign #0.2  RYWD13 = rst ? 0 : ~(0|A17U237Pad2);
// Gate A17-U233B
assign #0.2  RYWD12 = rst ? 0 : ~(0|A17U233Pad7);
// Gate A17-U252B
assign #0.2  A17U252Pad9 = rst ? 0 : ~(0|XT1_|WCHG_|XB1_);
// Gate A17-U217A
assign #0.2  A17U217Pad1 = rst ? 0 : ~(0|A17U216Pad2|CCH10);
// Gate A17-U109A
assign #0.2  A17U109Pad1 = rst ? 0 : ~(0|GCAPCL|RCH31_);
// Gate A17-U111B
assign #0.2  A17U111Pad9 = rst ? 0 : ~(0|HOLFUN|RCH31_);
// Gate A17-U135A A17-U240B
assign #0.2  CHOR14_ = rst ? 1 : ~(0|A17U135Pad2|A17U135Pad3|A17U109Pad9|CH1414|CH1214|A17U240Pad8);
// Gate A17-U144A A17-U234A
assign #0.2  CHOR11_ = rst ? 1 : ~(0|A17U114Pad9|A17U144Pad3|A17U143Pad1|CH1411|A17U233Pad1|CH1311);
// Gate A17-U106B A17-U107A A17-U107B A17-U105A
assign #0.2  A17U105Pad1 = rst ? 1 : ~(0|MNIMpY|MNIMmY|MNIMmP|TRST10|ROLGOF|PCHGOF|MNIMpP|MNIMmR|TRST9|MNIMpR);
// Gate A17-U210A
assign #0.2  A17U209Pad4 = rst ? 0 : ~(0|A17U210Pad2|RCH10_);
// Gate A17-U160B
assign #0.2  A17U159Pad3 = rst ? 0 : ~(0|RCH30_|ULLTHR);
// Gate A17-U153A A17-U215B
assign #0.2  CHOR05_ = rst ? 1 : ~(0|A17U123Pad9|A17U153Pad3|A17U153Pad4|A17U215Pad6|CH1405|CH1305);
// Gate A17-U160A
assign #0.2  A17U159Pad4 = rst ? 0 : ~(0|RCH33_|IN3301);
// Gate A17-U258A A17-U258B A17-U259A
assign #0.2  RCH11_ = rst ? 1 : ~(0|A17U257Pad9);
// Gate A17-U117B
assign #0.2  A17U117Pad9 = rst ? 0 : ~(0|TRANmX|RCH31_);
// Gate A17-U152B
assign #0.2  A17U152Pad3 = rst ? 0 : ~(0|RCH33_|OPMSW3);
// Gate A17-U201B
assign #0.2  A17U201Pad9 = rst ? 0 : ~(0|WCH10_|CHWL10_);
// Gate A17-U153B
assign #0.2  A17U152Pad4 = rst ? 0 : ~(0|RCH30_|GUIREL);
// Gate A17-U145A A17-U145B A17-U146B
assign #0.2  RCH33_ = rst ? 1 : ~(0|A17U143Pad9);
// Gate A17-U114B
assign #0.2  A17U114Pad9 = rst ? 0 : ~(0|TRANpZ|RCH31_);
// Gate A17-U249A A17-U250A A17-U250B
assign #0.2  CCH10 = rst ? 1 : ~(0|A17U249Pad2);
// Gate A17-U202B
assign #0.2  A17U201Pad2 = rst ? 1 : ~(0|A17U201Pad1|A17U201Pad9);
// Gate A17-U201A
assign #0.2  A17U201Pad1 = rst ? 0 : ~(0|A17U201Pad2|CCH10);
// Gate A17-U239A
assign #0.2  A17U239Pad1 = rst ? 0 : ~(0|A17U237Pad2|RCH10_);
// Gate A17-U103A
assign #0.2  CH3204 = rst ? 0 : ~(0|MNIMmY|RCH32_);
// Gate A17-U113A
assign #0.2  A17U110Pad7 = rst ? 1 : ~(0|TRP31A|TRP32|TRP31B);
// Gate A17-U106A
assign #0.2  CH3206 = rst ? 0 : ~(0|MNIMmR|RCH32_);
// Gate A17-U111A
assign #0.2  CH3207 = rst ? 0 : ~(0|TRST9|RCH32_);
// Gate A17-U242B
assign #0.2  A17U241Pad7 = rst ? 0 : ~(0|WCH10_|CHWL14_);
// Gate A17-U104B
assign #0.2  CH3201 = rst ? 0 : ~(0|MNIMpP|RCH32_);
// Gate A17-U104A
assign #0.2  CH3202 = rst ? 0 : ~(0|MNIMmP|RCH32_);
// Gate A17-U103B
assign #0.2  CH3203 = rst ? 0 : ~(0|MNIMpY|RCH32_);
// Gate A17-U205B
assign #0.2  A17U204Pad2 = rst ? 1 : ~(0|A17U205Pad7|A17U205Pad1);
// Gate A17-U220A
assign #0.2  A17U220Pad1 = rst ? 0 : ~(0|A17U219Pad2|RCH10_);
// Gate A17-U223A
assign #0.2  A17U223Pad1 = rst ? 0 : ~(0|A17U222Pad2|CCH10);
// Gate A17-U110A
assign #0.2  CH3208 = rst ? 0 : ~(0|TRST10|RCH32_);
// Gate A17-U108B
assign #0.2  CH3209 = rst ? 0 : ~(0|PCHGOF|RCH32_);
// Gate A17-U122A
assign #0.2  TRP32 = rst ? 0 : ~(0|F05B_|A17U122Pad3);
// Gate A17-U230B
assign #0.2  A17U230Pad2 = rst ? 0 : ~(0|WCH10_|CHWL01_);
// Gate A17-U144B
assign #0.2  A17U144Pad3 = rst ? 0 : ~(0|RCH30_|IMUCAG);
// Gate A17-U251B
assign #0.2  A17U251Pad2 = rst ? 0 : ~(0|XB0_|XT1_);
// Gate A17-U149B
assign #0.2  A17U148Pad3 = rst ? 0 : ~(0|RCH30_|IN3008);
// Gate A17-U142A
assign #0.2  A17U141Pad3 = rst ? 0 : ~(0|RCH32_|IN3212);
// Gate A17-U142B
assign #0.2  A17U141Pad4 = rst ? 0 : ~(0|RCH30_|CDUFAL);
// Gate A17-U242A
assign #0.2  A17U240Pad8 = rst ? 0 : ~(0|A17U239Pad7|RCH10_);
// Gate A17-U155A A17-U221A
assign #0.2  CHOR04_ = rst ? 1 : ~(0|A17U125Pad9|A17U155Pad3|A17U155Pad4|CH1404|CH1304|A17U220Pad1);
// Gate A17-U219A
assign #0.2  A17U219Pad1 = rst ? 0 : ~(0|A17U219Pad2|CCH10);
// Gate A17-U138B
assign #0.2  A17U138Pad9 = rst ? 0 : ~(0|RCH30_|IMUFAL);
// Gate A17-U222A
assign #0.2  A17U221Pad6 = rst ? 0 : ~(0|A17U222Pad2|RCH10_);
// Gate A17-U139B A17-U140A A17-U140B
assign #0.2  RCH32_ = rst ? 1 : ~(0|A17U139Pad8);
// Gate A17-U225B
assign #0.2  A17U225Pad2 = rst ? 1 : ~(0|A17U225Pad1|A17U225Pad8);
// Gate A17-U243A
assign #0.2  RYWD16 = rst ? 0 : ~(0|A17U243Pad2);
// Gate A17-U108A
assign #0.2  CH3210 = rst ? 0 : ~(0|ROLGOF|RCH32_);
// Gate A17-U134A A17-U246A
assign #0.2  CHOR16_ = rst ? 1 : ~(0|A17U109Pad1|A17U134Pad3|A17U134Pad4|CH1316|CH1416|A17U245Pad1);
// Gate A17-U137A
assign #0.2  A17U137Pad1 = rst ? 0 : ~(0|RCH32_|IN3213);
// Gate A17-U239B
assign #0.2  RYWD14 = rst ? 0 : ~(0|A17U239Pad7);
// Gate A17-U139A A17-U246B A17-U240A
assign #0.2  CHOR13_ = rst ? 1 : ~(0|A17U111Pad9|A17U138Pad9|A17U137Pad1|CH1113|CH1413|A17U239Pad1|CH1213);
// Gate A17-U208A
assign #0.2  A17U208Pad1 = rst ? 0 : ~(0|A17U207Pad2|RCH10_);
// Gate A17-U155B
assign #0.2  A17U155Pad4 = rst ? 0 : ~(0|RCH33_|ZEROP);
// Gate A17-U156B
assign #0.2  A17U155Pad3 = rst ? 0 : ~(0|RCH30_|S4BSAB);
// Gate A17-U226B
assign #0.2  A17U225Pad8 = rst ? 0 : ~(0|WCH10_|CHWL02_);
// Gate A17-U156A A17-U221B
assign #0.2  CHOR03_ = rst ? 1 : ~(0|A17U126Pad9|A17U156Pad3|A17U156Pad4|A17U221Pad6|CH1403|CH1303);
// Gate A17-U133A A17-U133B A17-U136A
assign #0.2  RCH31_ = rst ? 1 : ~(0|A17U133Pad2);
// Gate A17-U148B
assign #0.2  A17U148Pad2 = rst ? 0 : ~(0|RCH33_|LVDAGD);
// Gate A17-U119B
assign #0.2  A17U119Pad9 = rst ? 0 : ~(0|TRANpY|RCH31_);
// Gate A17-U235A
assign #0.2  A17U235Pad1 = rst ? 0 : ~(0|A17U233Pad7|CCH10);
// Gate A17-U219B
assign #0.2  A17U219Pad2 = rst ? 1 : ~(0|A17U219Pad1|A17U219Pad8);
// Gate A17-U228A
assign #0.2  A17U227Pad6 = rst ? 0 : ~(0|A17U228Pad2|RCH10_);
// Gate A17-U131B
assign #0.2  A17U131Pad2 = rst ? 0 : ~(0|XB0_|XT3_);
// Gate A17-U220B
assign #0.2  A17U219Pad8 = rst ? 0 : ~(0|WCH10_|CHWL04_);
// Gate A17-U128B
assign #0.2  A17U128Pad9 = rst ? 0 : ~(0|MANRmP|RCH31_);
// Gate A17-U252A A17-U253A A17-U251A
assign #0.2  RCH10_ = rst ? 1 : ~(0|A17U251Pad2);
// Gate A17-U223B
assign #0.2  A17U222Pad2 = rst ? 1 : ~(0|A17U223Pad1|A17U223Pad8);
// Gate A17-U249B
assign #0.2  A17U249Pad2 = rst ? 0 : ~(0|A17U248Pad9|GOJAM);
// Gate A17-U154B
assign #0.2  A17U153Pad3 = rst ? 0 : ~(0|RCH30_|LFTOFF);
// Gate A17-U151A A17-U203B
assign #0.2  CHOR10_ = rst ? 1 : ~(0|A17U121Pad9|A17U151Pad3|CH3310|A17U202Pad1|CH1410|CH1310);
// Gate A17-U232B
assign #0.2  A17U231Pad2 = rst ? 1 : ~(0|A17U231Pad9|A17U232Pad1);
// Gate A17-U154A
assign #0.2  A17U153Pad4 = rst ? 0 : ~(0|RCH33_|OPMSW2);
// Gate A17-U120B A17-U127B
assign #0.2  A17U120Pad9 = rst ? 1 : ~(0|MANRmR|MANRmY|MANRpR|MANRpY|MANRmP|MANRpP);
// Gate A17-U231B
assign #0.2  A17U231Pad9 = rst ? 0 : ~(0|WCH10_|CHWL11_);
// Gate A17-U125B
assign #0.2  A17U125Pad9 = rst ? 0 : ~(0|MANRmY|RCH31_);
// Gate A17-U158A A17-U227A
assign #0.2  CHOR02_ = rst ? 1 : ~(0|A17U128Pad9|A17U158Pad3|A17U158Pad4|CH1402|CH1302|A17U226Pad1);
// Gate A17-U241A
assign #0.2  A17U241Pad1 = rst ? 0 : ~(0|A17U239Pad7|CCH10);
// Gate A17-U127A
assign #0.2  A17U125Pad3 = rst ? 1 : ~(0|A17U127Pad2|A17U126Pad1);
// Gate A17-U116A
assign #0.2  A17U115Pad3 = rst ? 0 : ~(0|GOJAM|TRP31B|A17U115Pad1);
// Gate A17-U117A
assign #0.2  A17U115Pad2 = rst ? 0 : ~(0|WCH13_|CHWL13_);
// Gate A17-U115A
assign #0.2  A17U115Pad1 = rst ? 1 : ~(0|A17U115Pad2|A17U115Pad3);
// Gate A17-U211B
assign #0.2  A17U210Pad2 = rst ? 1 : ~(0|A17U211Pad1|A17U211Pad8);
// Gate A17-U115B
assign #0.2  A17U115Pad9 = rst ? 0 : ~(0|TRANpX|RCH31_);
// Gate A17-U255B
assign #0.2  A17U255Pad9 = rst ? 0 : ~(0|GOJAM|A17U254Pad9);
// Gate A17-U131A A17-U132A A17-U132B
assign #0.2  RCH30_ = rst ? 1 : ~(0|A17U131Pad2);
// Gate A17-U204B
assign #0.2  RLYB10 = rst ? 0 : ~(0|A17U201Pad2);
// Gate A17-U231A
assign #0.2  RLYB11 = rst ? 0 : ~(0|A17U231Pad2);
// Gate A17-U126A
assign #0.2  A17U126Pad1 = rst ? 0 : ~(0|F05A_|A17U120Pad9|A17U126Pad4);
// Gate A17-U130B
assign #0.2  A17U126Pad4 = rst ? 1 : ~(0|A17U129Pad1|A17U130Pad1);
// Gate A17-U245A
assign #0.2  A17U245Pad1 = rst ? 0 : ~(0|RCH10_|A17U243Pad2);
// Gate A17-U126B
assign #0.2  A17U126Pad9 = rst ? 0 : ~(0|MANRpY|RCH31_);
// Gate A17-U159A A17-U227B
assign #0.2  CHOR01_ = rst ? 1 : ~(0|A17U129Pad9|A17U159Pad3|A17U159Pad4|A17U227Pad6|CH1301|CH1401);
// Gate A17-U245B
assign #0.2  A17U245Pad9 = rst ? 0 : ~(0|XB0_|WCHG_|XT1_);
// Gate A17-U230A
assign #0.2  A17U228Pad2 = rst ? 1 : ~(0|A17U230Pad2|A17U229Pad1);
// Gate A17-U125A
assign #0.2  TRP31A = rst ? 0 : ~(0|F05B_|A17U125Pad3);
// Gate A17-U119A
assign #0.2  TRP31B = rst ? 0 : ~(0|F05B_|A17U112Pad4);
// Gate A17-U151B
assign #0.2  A17U151Pad3 = rst ? 0 : ~(0|RCH30_|CTLSAT);
// Gate A17-U226A
assign #0.2  A17U226Pad1 = rst ? 0 : ~(0|A17U225Pad2|RCH10_);
// Gate A17-U204A
assign #0.2  A17U203Pad4 = rst ? 0 : ~(0|A17U204Pad2|RCH10_);
// Gate A17-U235B
assign #0.2  A17U233Pad7 = rst ? 1 : ~(0|A17U235Pad7|A17U235Pad1);
// Gate A17-U233A
assign #0.2  A17U233Pad1 = rst ? 0 : ~(0|RCH10_|A17U231Pad2);
// Gate A17-U129A
assign #0.2  A17U129Pad1 = rst ? 0 : ~(0|CHWL12_|WCH13_);
// Gate A17-U129B
assign #0.2  A17U129Pad9 = rst ? 0 : ~(0|RCH31_|MANRpP);
// Gate A17-U206A
assign #0.2  RLYB09 = rst ? 0 : ~(0|A17U204Pad2);
// Gate A17-U210B
assign #0.2  RLYB08 = rst ? 0 : ~(0|A17U207Pad2);
// Gate A17-U248B
assign #0.2  A17U248Pad9 = rst ? 0 : ~(0|XT1_|XB0_|CCHG_);
// Gate A17-U260A
assign #0.2  A17J4Pad467 = rst ? 1 : ~(0);
// Gate A17-U149A A17-U203A
assign #0.2  CHOR09_ = rst ? 1 : ~(0|A17U119Pad9|A17U149Pad3|A17U149Pad4|CH1309|CH1409|A17U203Pad4);
// Gate A17-U229A
assign #0.2  A17U229Pad1 = rst ? 0 : ~(0|A17U228Pad2|CCH10);
// Gate A17-U224A
assign #0.2  RLYB03 = rst ? 0 : ~(0|A17U222Pad2);
// Gate A17-U228B
assign #0.2  RLYB02 = rst ? 0 : ~(0|A17U225Pad2);
// Gate A17-U218A
assign #0.2  RLYB05 = rst ? 0 : ~(0|A17U216Pad2);
// Gate A17-U222B
assign #0.2  RLYB04 = rst ? 0 : ~(0|A17U219Pad2);
// Gate A17-U212A
assign #0.2  RLYB07 = rst ? 0 : ~(0|A17U210Pad2);
// Gate A17-U216B
assign #0.2  RLYB06 = rst ? 0 : ~(0|A17U213Pad2);
// Gate A17-U116B
assign #0.2  A17U114Pad2 = rst ? 0 : ~(0|A17U115Pad1|F05A_|A17U112Pad3);
// Gate A17-U229B
assign #0.2  RLYB01 = rst ? 0 : ~(0|A17U228Pad2);
// Gate A17-U212B
assign #0.2  A17U211Pad8 = rst ? 0 : ~(0|WCH10_|CHWL07_);
// Gate A17-U147B
assign #0.2  A17U146Pad4 = rst ? 0 : ~(0|RCH30_|OPCDFL);
// Gate A17-U147A
assign #0.2  A17U146Pad3 = rst ? 0 : ~(0|RCH33_|STRPRS);
// Gate A17-U211A
assign #0.2  A17U211Pad1 = rst ? 0 : ~(0|A17U210Pad2|CCH10);
// Gate A17-U257B
assign #0.2  A17U257Pad9 = rst ? 0 : ~(0|XT1_|XB1_);
// Gate A17-U114A
assign #0.2  A17U112Pad4 = rst ? 1 : ~(0|A17U114Pad2|A17U112Pad1);
// Gate A17-U143B
assign #0.2  A17U143Pad9 = rst ? 0 : ~(0|XT3_|XB3_);
// Gate A17-U112A
assign #0.2  A17U112Pad1 = rst ? 0 : ~(0|F05D|A17U112Pad3|A17U112Pad4);
// Gate A17-U120A A17-U113B
assign #0.2  A17U112Pad3 = rst ? 1 : ~(0|TRANmY|TRANmZ|TRANpZ|TRANpY|TRANpX|TRANmX);
// Gate A17-U124B
assign #0.2  A17U124Pad2 = rst ? 0 : ~(0|A17U118Pad1|A17U105Pad1|F05A_);
// Gate A17-U143A
assign #0.2  A17U143Pad1 = rst ? 0 : ~(0|RCH32_|LEMATT);
// Gate A17-U232A
assign #0.2  A17U232Pad1 = rst ? 0 : ~(0|CCH10|A17U231Pad2);
// Gate A17-U112B
assign #0.2  A17U112Pad9 = rst ? 0 : ~(0|TRANmZ|RCH31_);
// Gate A17-U260B
assign #0.2  A17J4Pad468 = rst ? 1 : ~(0);
// Gate A17-U134B
assign #0.2  A17U133Pad2 = rst ? 0 : ~(0|XB1_|XT3_);
// Gate A17-U157A
assign #0.2  A17U156Pad4 = rst ? 0 : ~(0|RCH33_|RRRLSC);
// Gate A17-U238A
assign #0.2  A17U238Pad1 = rst ? 0 : ~(0|A17U237Pad2|CCH10);
// Gate A17-U157B
assign #0.2  A17U156Pad3 = rst ? 0 : ~(0|RCH30_|SPSRDY);
// Gate A17-U148A A17-U209B
assign #0.2  CHOR08_ = rst ? 1 : ~(0|A17U148Pad2|A17U148Pad3|A17U117Pad9|CH1408|A17U208Pad1|CH1308);
// Gate A17-U241B
assign #0.2  A17U239Pad7 = rst ? 1 : ~(0|A17U241Pad7|A17U241Pad1);
// Gate A17-U102B
assign #0.2  CH3316 = rst ? 0 : ~(0|RCH33_|OSCALM);
// Gate A17-U141A A17-U234B
assign #0.2  CHOR12_ = rst ? 1 : ~(0|A17U112Pad9|A17U141Pad3|A17U141Pad4|CH3312|CH1412|A17U234Pad8);
// Gate A17-U101A
assign #0.2  CH3314 = rst ? 0 : ~(0|AGCWAR|RCH33_);
// Gate A17-U236A
assign #0.2  A17U234Pad8 = rst ? 0 : ~(0|A17U233Pad7|RCH10_);
// Gate A17-U101B
assign #0.2  CH3313 = rst ? 0 : ~(0|RCH33_|PIPAFL);
// Gate A17-U216A
assign #0.2  A17U215Pad6 = rst ? 0 : ~(0|A17U216Pad2|RCH10_);

endmodule