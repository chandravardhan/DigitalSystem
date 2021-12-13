module Kogge32b(x,y,cin,cout,sum);
input [31:0] x,y;
input cin;
output cout;
output [31:0] sum;
wire [31:0] 
	G_Z,P_Z, // input_cell
	G_A,P_A, // merge level 1
	G_B,P_B, // merge level 2
	G_C,P_C, // merge level 3
	G_D,P_D, // merge level 4
	G_E,P_E; // merge level 5
wire [32:1]	c;

// input level
input_cell level_Z0(x[0],y[0],P_Z[0],G_Z[0]);
input_cell level_Z1(x[1],y[1],P_Z[1],G_Z[1]);
input_cell level_Z2(x[2],y[2],P_Z[2],G_Z[2]);
input_cell level_Z3(x[3],y[3],P_Z[3],G_Z[3]);
input_cell level_Z4(x[4],y[4],P_Z[4],G_Z[4]);
input_cell level_Z5(x[5],y[5],P_Z[5],G_Z[5]);
input_cell level_Z6(x[6],y[6],P_Z[6],G_Z[6]);
input_cell level_Z7(x[7],y[7],P_Z[7],G_Z[7]);
input_cell level_Z8(x[8],y[8],P_Z[8],G_Z[8]);
input_cell level_Z9(x[9],y[9],P_Z[9],G_Z[9]);
input_cell level_Z10(x[10],y[10],P_Z[10],G_Z[10]);
input_cell level_Z11(x[11],y[11],P_Z[11],G_Z[11]);
input_cell level_Z12(x[12],y[12],P_Z[12],G_Z[12]);
input_cell level_Z13(x[13],y[13],P_Z[13],G_Z[13]);
input_cell level_Z14(x[14],y[14],P_Z[14],G_Z[14]);
input_cell level_Z15(x[15],y[15],P_Z[15],G_Z[15]);

input_cell level_Z16(x[16],y[16],P_Z[16],G_Z[16]);
input_cell level_Z17(x[17],y[17],P_Z[17],G_Z[17]);
input_cell level_Z18(x[18],y[18],P_Z[18],G_Z[18]);
input_cell level_Z19(x[19],y[19],P_Z[19],G_Z[19]);
input_cell level_Z20(x[20],y[20],P_Z[20],G_Z[20]);
input_cell level_Z21(x[21],y[21],P_Z[21],G_Z[21]);
input_cell level_Z22(x[22],y[22],P_Z[22],G_Z[22]);
input_cell level_Z23(x[23],y[23],P_Z[23],G_Z[23]);
input_cell level_Z24(x[24],y[24],P_Z[24],G_Z[24]);
input_cell level_Z25(x[25],y[25],P_Z[25],G_Z[25]);
input_cell level_Z26(x[26],y[26],P_Z[26],G_Z[26]);
input_cell level_Z27(x[27],y[27],P_Z[27],G_Z[27]);
input_cell level_Z28(x[28],y[28],P_Z[28],G_Z[28]);
input_cell level_Z29(x[29],y[29],P_Z[29],G_Z[29]);
input_cell level_Z30(x[30],y[30],P_Z[30],G_Z[30]);
input_cell level_Z31(x[31],y[31],P_Z[31],G_Z[31]);

// level 1
black_cell level_0A(P_Z[0],G_Z[0],0,cin		  ,P_A[0],G_A[0]);
black_cell level_1A(P_Z[1],G_Z[1],P_Z[0],G_Z[0],P_A[1],G_A[1]);
black_cell level_2A(P_Z[2],G_Z[2],P_Z[1],G_Z[1],P_A[2],G_A[2]);
black_cell level_3A(P_Z[3],G_Z[3],P_Z[2],G_Z[2],P_A[3],G_A[3]);
black_cell level_4A(P_Z[4],G_Z[4],P_Z[3],G_Z[3],P_A[4],G_A[4]);
black_cell level_5A(P_Z[5],G_Z[5],P_Z[4],G_Z[4],P_A[5],G_A[5]);
black_cell level_6A(P_Z[6],G_Z[6],P_Z[5],G_Z[5],P_A[6],G_A[6]);
black_cell level_7A(P_Z[7],G_Z[7],P_Z[6],G_Z[6],P_A[7],G_A[7]);
black_cell level_8A(P_Z[8],G_Z[8],P_Z[7],G_Z[7],P_A[8],G_A[8]);
black_cell level_9A(P_Z[9],G_Z[9],P_Z[8],G_Z[8],P_A[9],G_A[9]);
black_cell level_10A(P_Z[10],G_Z[10],P_Z[9],G_Z[9],P_A[10],G_A[10]);
black_cell level_11A(P_Z[11],G_Z[11],P_Z[10],G_Z[10],P_A[11],G_A[11]);
black_cell level_12A(P_Z[12],G_Z[12],P_Z[11],G_Z[11],P_A[12],G_A[12]);
black_cell level_13A(P_Z[13],G_Z[13],P_Z[12],G_Z[12],P_A[13],G_A[13]);
black_cell level_14A(P_Z[14],G_Z[14],P_Z[13],G_Z[13],P_A[14],G_A[14]);
black_cell level_15A(P_Z[15],G_Z[15],P_Z[14],G_Z[14],P_A[15],G_A[15]);

black_cell level_16A(P_Z[16],G_Z[16],P_Z[15],G_Z[15],P_A[16],G_A[16]);
black_cell level_17A(P_Z[17],G_Z[17],P_Z[16],G_Z[16],P_A[17],G_A[17]);
black_cell level_18A(P_Z[18],G_Z[18],P_Z[17],G_Z[17],P_A[18],G_A[18]);
black_cell level_19A(P_Z[19],G_Z[19],P_Z[18],G_Z[18],P_A[19],G_A[19]);
black_cell level_20A(P_Z[20],G_Z[20],P_Z[19],G_Z[19],P_A[20],G_A[20]);
black_cell level_21A(P_Z[21],G_Z[21],P_Z[20],G_Z[20],P_A[21],G_A[21]);
black_cell level_22A(P_Z[22],G_Z[22],P_Z[21],G_Z[21],P_A[22],G_A[22]);
black_cell level_23A(P_Z[23],G_Z[23],P_Z[22],G_Z[22],P_A[23],G_A[23]);
black_cell level_24A(P_Z[24],G_Z[24],P_Z[23],G_Z[23],P_A[24],G_A[24]);
black_cell level_25A(P_Z[25],G_Z[25],P_Z[24],G_Z[24],P_A[25],G_A[25]);
black_cell level_26A(P_Z[26],G_Z[26],P_Z[25],G_Z[25],P_A[26],G_A[26]);
black_cell level_27A(P_Z[27],G_Z[27],P_Z[26],G_Z[26],P_A[27],G_A[27]);
black_cell level_28A(P_Z[28],G_Z[28],P_Z[27],G_Z[27],P_A[28],G_A[28]);
black_cell level_29A(P_Z[29],G_Z[29],P_Z[28],G_Z[28],P_A[29],G_A[29]);
black_cell level_30A(P_Z[30],G_Z[30],P_Z[29],G_Z[29],P_A[30],G_A[30]);
black_cell level_31A(P_Z[31],G_Z[31],P_Z[30],G_Z[30],P_A[31],G_A[31]);


// level 2
black_cell level_1B(P_A[1],G_A[1],0,cin		  ,P_B[1],G_B[1]);
black_cell level_2B(P_A[2],G_A[2],P_A[0],G_A[0],P_B[2],G_B[2]);
black_cell level_3B(P_A[3],G_A[3],P_A[1],G_A[1],P_B[3],G_B[3]);
black_cell level_4B(P_A[4],G_A[4],P_A[2],G_A[2],P_B[4],G_B[4]);
black_cell level_5B(P_A[5],G_A[5],P_A[3],G_A[3],P_B[5],G_B[5]);
black_cell level_6B(P_A[6],G_A[6],P_A[4],G_A[4],P_B[6],G_B[6]);
black_cell level_7B(P_A[7],G_A[7],P_A[5],G_A[5],P_B[7],G_B[7]);
black_cell level_8B(P_A[8],G_A[8],P_A[6],G_A[6],P_B[8],G_B[8]);
black_cell level_9B(P_A[9],G_A[9],P_A[7],G_A[7],P_B[9],G_B[9]);
black_cell level_10B(P_A[10],G_A[10],P_A[8],G_A[8],P_B[10],G_B[10]);
black_cell level_11B(P_A[11],G_A[11],P_A[9],G_A[9],P_B[11],G_B[11]);
black_cell level_12B(P_A[12],G_A[12],P_A[10],G_A[10],P_B[12],G_B[12]);
black_cell level_13B(P_A[13],G_A[13],P_A[11],G_A[11],P_B[13],G_B[13]);
black_cell level_14B(P_A[14],G_A[14],P_A[12],G_A[12],P_B[14],G_B[14]);
black_cell level_15B(P_A[15],G_A[15],P_A[13],G_A[13],P_B[15],G_B[15]);

black_cell level_16B(P_A[16],G_A[16],P_A[14],G_A[14],P_B[16],G_B[16]);
black_cell level_17B(P_A[17],G_A[17],P_A[15],G_A[15],P_B[17],G_B[17]);
black_cell level_18B(P_A[18],G_A[18],P_A[16],G_A[16],P_B[18],G_B[18]);
black_cell level_19B(P_A[19],G_A[19],P_A[17],G_A[17],P_B[19],G_B[19]);
black_cell level_20B(P_A[20],G_A[20],P_A[18],G_A[18],P_B[20],G_B[20]);
black_cell level_21B(P_A[21],G_A[21],P_A[19],G_A[19],P_B[21],G_B[21]);
black_cell level_22B(P_A[22],G_A[22],P_A[20],G_A[20],P_B[22],G_B[22]);
black_cell level_23B(P_A[23],G_A[23],P_A[21],G_A[21],P_B[23],G_B[23]);
black_cell level_24B(P_A[24],G_A[24],P_A[22],G_A[22],P_B[24],G_B[24]);
black_cell level_25B(P_A[25],G_A[25],P_A[23],G_A[23],P_B[25],G_B[25]);
black_cell level_26B(P_A[26],G_A[26],P_A[24],G_A[24],P_B[26],G_B[26]);
black_cell level_27B(P_A[27],G_A[27],P_A[25],G_A[25],P_B[27],G_B[27]);
black_cell level_28B(P_A[28],G_A[28],P_A[26],G_A[26],P_B[28],G_B[28]);
black_cell level_29B(P_A[29],G_A[29],P_A[27],G_A[27],P_B[29],G_B[29]);
black_cell level_30B(P_A[30],G_A[30],P_A[28],G_A[28],P_B[30],G_B[30]);
black_cell level_31B(P_A[31],G_A[31],P_A[29],G_A[29],P_B[31],G_B[31]);

// level 3
black_cell level_3C(P_B[3],G_B[3],0,cin		  ,P_C[3],G_C[3]);
black_cell level_4C(P_B[4],G_B[4],P_A[0],G_A[0],P_C[4],G_C[4]);
black_cell level_5C(P_B[5],G_B[5],P_B[1],G_B[1],P_C[5],G_C[5]);
black_cell level_6C(P_B[6],G_B[6],P_B[2],G_B[2],P_C[6],G_C[6]);
black_cell level_7C(P_B[7],G_B[7],P_B[3],G_B[3],P_C[7],G_C[7]);
black_cell level_8C(P_B[8],G_B[8],P_B[4],G_B[4],P_C[8],G_C[8]);
black_cell level_9C(P_B[9],G_B[9],P_B[5],G_B[5],P_C[9],G_C[9]);
black_cell level_10C(P_B[10],G_B[10],P_B[6],G_B[6],P_C[10],G_C[10]);
black_cell level_11C(P_B[11],G_B[11],P_B[7],G_B[7],P_C[11],G_C[11]);
black_cell level_12C(P_B[12],G_B[12],P_B[8],G_B[8],P_C[12],G_C[12]);
black_cell level_13C(P_B[13],G_B[13],P_B[9],G_B[9],P_C[13],G_C[13]);
black_cell level_14C(P_B[14],G_B[14],P_B[10],G_B[10],P_C[14],G_C[14]);
black_cell level_15C(P_B[15],G_B[15],P_B[11],G_B[11],P_C[15],G_C[15]);

black_cell level_16C(P_B[16],G_B[16],P_B[12],G_B[12],P_C[16],G_C[16]);
black_cell level_17C(P_B[17],G_B[17],P_B[13],G_B[13],P_C[17],G_C[17]);
black_cell level_18C(P_B[18],G_B[18],P_B[14],G_B[14],P_C[18],G_C[18]);
black_cell level_19C(P_B[19],G_B[19],P_B[15],G_B[15],P_C[19],G_C[19]);
black_cell level_20C(P_B[20],G_B[20],P_B[16],G_B[16],P_C[20],G_C[20]);
black_cell level_21C(P_B[21],G_B[21],P_B[17],G_B[17],P_C[21],G_C[21]);
black_cell level_22C(P_B[22],G_B[22],P_B[18],G_B[18],P_C[22],G_C[22]);
black_cell level_23C(P_B[23],G_B[23],P_B[19],G_B[19],P_C[23],G_C[23]);
black_cell level_24C(P_B[24],G_B[24],P_B[20],G_B[20],P_C[24],G_C[24]);
black_cell level_25C(P_B[25],G_B[25],P_B[21],G_B[21],P_C[25],G_C[25]);
black_cell level_26C(P_B[26],G_B[26],P_B[22],G_B[22],P_C[26],G_C[26]);
black_cell level_27C(P_B[27],G_B[27],P_B[23],G_B[23],P_C[27],G_C[27]);
black_cell level_28C(P_B[28],G_B[28],P_B[24],G_B[24],P_C[28],G_C[28]);
black_cell level_29C(P_B[29],G_B[29],P_B[25],G_B[25],P_C[29],G_C[29]);
black_cell level_30C(P_B[30],G_B[30],P_B[26],G_B[26],P_C[30],G_C[30]);
black_cell level_31C(P_B[31],G_B[31],P_B[27],G_B[27],P_C[31],G_C[31]);


// level 4
black_cell level_7D(P_C[7],G_C[7],0,cin		  ,P_D[7],G_D[7]);
black_cell level_8D(P_C[8],G_C[8],P_A[0],G_A[0],P_D[8],G_D[8]);
black_cell level_9D(P_C[9],G_C[9],P_B[1],G_B[1],P_D[9],G_D[9]);
black_cell level_10D(P_C[10],G_C[10],P_B[2],G_B[2],P_D[10],G_D[10]);
black_cell level_11D(P_C[11],G_C[11],P_C[3],G_C[3],P_D[11],G_D[11]);
black_cell level_12D(P_C[12],G_C[12],P_C[4],G_C[4],P_D[12],G_D[12]);
black_cell level_13D(P_C[13],G_C[13],P_C[5],G_C[5],P_D[13],G_D[13]);
black_cell level_14D(P_C[14],G_C[14],P_C[6],G_C[6],P_D[14],G_D[14]);
black_cell level_15D(P_C[15],G_C[15],P_C[7],G_C[7],P_D[15],G_D[15]);

black_cell level_16D(P_C[16],G_C[16],P_C[8],G_C[8],P_D[16],G_D[16]);
black_cell level_17D(P_C[17],G_C[17],P_C[9],G_C[9],P_D[17],G_D[17]);
black_cell level_18D(P_C[18],G_C[18],P_C[10],G_C[10],P_D[18],G_D[18]);
black_cell level_19D(P_C[19],G_C[19],P_C[11],G_C[11],P_D[19],G_D[19]);
black_cell level_20D(P_C[20],G_C[20],P_C[12],G_C[12],P_D[20],G_D[20]);
black_cell level_21D(P_C[21],G_C[21],P_C[13],G_C[13],P_D[21],G_D[21]);
black_cell level_22D(P_C[22],G_C[22],P_C[14],G_C[14],P_D[22],G_D[22]);
black_cell level_23D(P_C[23],G_C[23],P_C[15],G_C[15],P_D[23],G_D[23]);
black_cell level_24D(P_C[24],G_C[24],P_C[16],G_C[16],P_D[24],G_D[24]);
black_cell level_25D(P_C[25],G_C[25],P_C[17],G_C[17],P_D[25],G_D[25]);
black_cell level_26D(P_C[26],G_C[26],P_C[18],G_C[18],P_D[26],G_D[26]);
black_cell level_27D(P_C[27],G_C[27],P_C[19],G_C[19],P_D[27],G_D[27]);
black_cell level_28D(P_C[28],G_C[28],P_C[20],G_C[20],P_D[28],G_D[28]);
black_cell level_29D(P_C[29],G_C[29],P_C[21],G_C[21],P_D[29],G_D[29]);
black_cell level_30D(P_C[30],G_C[30],P_C[22],G_C[22],P_D[30],G_D[30]);
black_cell level_31D(P_C[31],G_C[31],P_C[23],G_C[23],P_D[31],G_D[31]);



// level 5
black_cell level_15E(P_D[15],G_D[15],0, cin			,P_E[15],G_E[15]);

black_cell level_16E(P_D[16],G_D[16],P_A[0], G_A[0],P_E[16],G_E[16]);

black_cell level_17E(P_D[17],G_D[17],P_B[1], G_B[1],P_E[17],G_E[17]);
black_cell level_18E(P_D[18],G_D[18],P_B[2], G_B[2],P_E[18],G_E[18]);

black_cell level_19E(P_D[19],G_D[19],P_C[3], G_C[3],P_E[19],G_E[19]);
black_cell level_20E(P_D[20],G_D[20],P_C[4], G_C[4],P_E[20],G_E[20]);
black_cell level_21E(P_D[21],G_D[21],P_C[5], G_C[5],P_E[21],G_E[21]);
black_cell level_22E(P_D[22],G_D[22],P_C[6], G_C[6],P_E[22],G_E[22]);

black_cell level_23E(P_D[23],G_D[23],P_D[7], G_D[7],P_E[23],G_E[23]);
black_cell level_24E(P_D[24],G_D[24],P_D[8], G_D[8],P_E[24],G_E[24]);
black_cell level_25E(P_D[25],G_D[25],P_D[9], G_D[9],P_E[25],G_E[25]);
black_cell level_26E(P_D[26],G_D[26],P_D[10], G_D[10],P_E[26],G_E[26]);
black_cell level_27E(P_D[27],G_D[27],P_D[11], G_D[11],P_E[27],G_E[27]);
black_cell level_28E(P_D[28],G_D[28],P_D[12], G_D[12],P_E[28],G_E[28]);
black_cell level_29E(P_D[29],G_D[29],P_D[13], G_D[13],P_E[29],G_E[29]);
black_cell level_30E(P_D[30],G_D[30],P_D[14], G_D[14],P_E[30],G_E[30]);
black_cell level_31E(P_D[31],G_D[31],P_D[15], G_D[15],P_E[31],G_E[31]);



carry_eval_cell c1(P_A[0],G_A[0],cin,c[1]);

carry_eval_cell c2(P_B[1],G_B[1],cin,c[2]);
carry_eval_cell c3(P_B[2],G_B[2],cin,c[3]);

carry_eval_cell c4(P_C[3],G_C[3],cin,c[4]);
carry_eval_cell c5(P_C[4],G_C[4],cin,c[5]);
carry_eval_cell c6(P_C[5],G_C[5],cin,c[6]);
carry_eval_cell c7(P_C[6],G_C[6],cin,c[7]);

carry_eval_cell c8(P_D[7],G_D[7],cin,c[8]);
carry_eval_cell c9(P_D[8],G_D[8],cin,c[9]);
carry_eval_cell c10(P_D[9],G_D[9],cin,c[10]);
carry_eval_cell c11(P_D[10],G_D[10],cin,c[11]);
carry_eval_cell c12(P_D[11],G_D[11],cin,c[12]);
carry_eval_cell c13(P_D[12],G_D[12],cin,c[13]);
carry_eval_cell c14(P_D[13],G_D[13],cin,c[14]);
carry_eval_cell c15(P_D[14],G_D[14],cin,c[15]);

carry_eval_cell c16(P_E[15],G_E[15],cin,c[16]);
carry_eval_cell c17(P_E[16],G_E[16],cin,c[17]);
carry_eval_cell c18(P_E[17],G_E[17],cin,c[18]);
carry_eval_cell c19(P_E[18],G_E[18],cin,c[19]);
carry_eval_cell c20(P_E[19],G_E[19],cin,c[20]);
carry_eval_cell c21(P_E[20],G_E[20],cin,c[21]);
carry_eval_cell c22(P_E[21],G_E[21],cin,c[22]);
carry_eval_cell c23(P_E[22],G_E[22],cin,c[23]);
carry_eval_cell c24(P_E[23],G_E[23],cin,c[24]);
carry_eval_cell c25(P_E[24],G_E[24],cin,c[25]);
carry_eval_cell c26(P_E[25],G_E[25],cin,c[26]);
carry_eval_cell c27(P_E[26],G_E[26],cin,c[27]);
carry_eval_cell c28(P_E[27],G_E[27],cin,c[28]);
carry_eval_cell c29(P_E[28],G_E[28],cin,c[29]);
carry_eval_cell c30(P_E[29],G_E[29],cin,c[30]);
carry_eval_cell c31(P_E[30],G_E[30],cin,c[31]);
carry_eval_cell c32(P_E[31],G_E[31],cin,c[32]);


assign sum[0] = cin ^ P_Z[0];
assign sum[1] = c[1] ^ P_Z[1];
assign sum[2] = c[2] ^ P_Z[2];
assign sum[3] = c[3] ^ P_Z[3];
assign sum[4] = c[4] ^ P_Z[4];
assign sum[5] = c[5] ^ P_Z[5];
assign sum[6] = c[6] ^ P_Z[6];
assign sum[7] = c[7] ^ P_Z[7];
assign sum[8] = c[8] ^ P_Z[8];
assign sum[9] = c[9] ^ P_Z[9];
assign sum[10] = c[10] ^ P_Z[10];
assign sum[11] = c[11] ^ P_Z[11];
assign sum[12] = c[12] ^ P_Z[12];
assign sum[13] = c[13] ^ P_Z[13];
assign sum[14] = c[14] ^ P_Z[14];
assign sum[15] = c[15] ^ P_Z[15];

assign sum[16] = c[16] ^ P_Z[16];
assign sum[17] = c[17] ^ P_Z[17];
assign sum[18] = c[18] ^ P_Z[18];
assign sum[19] = c[19] ^ P_Z[19];
assign sum[20] = c[20] ^ P_Z[20];
assign sum[21] = c[21] ^ P_Z[21];
assign sum[22] = c[22] ^ P_Z[22];
assign sum[23] = c[23] ^ P_Z[23];
assign sum[24] = c[24] ^ P_Z[24];
assign sum[25] = c[25] ^ P_Z[25];
assign sum[26] = c[26] ^ P_Z[26];
assign sum[27] = c[27] ^ P_Z[27];
assign sum[28] = c[28] ^ P_Z[28];
assign sum[29] = c[29] ^ P_Z[29];
assign sum[30] = c[30] ^ P_Z[30];
assign sum[31] = c[31] ^ P_Z[31];

assign cout = c[32];

endmodule

module input_cell(a,b,p,g);
input a,b;
output p,g;

assign p = a ^ b;
assign g = a & b;
endmodule

module black_cell(Pim,Gim,Pmj,Gmj,P,G);
input Pim,Gim,Pmj,Gmj;
output P,G;

assign P = Pim & Pmj;
assign G = Gim | (Pim & Gmj);

endmodule

module carry_eval_cell(Pi0,Gi0,c0,ci);
input Gi0,Pi0,c0;
output ci;

assign ci = Gi0 | (Pi0 & c0);

endmodule



