//CRC_32 Generation used to determine is CRC32 is correct for UDP/Ethernet
module CRC_32_Generation
    (input logic clock,
     input logic reset_n,
     input logic crc_in,
     input logic c_en,
     input logic clear,
     output logic [15:0] crc_out);

        logic x_out_1,
              x_out_2,
              x_out_3,
              x_out_4,
              x_out_5,
              x_out_6,
              x_out_7,
              x_out_8,
              x_out_9,
              x_out_10,
              x_out_11,
              x_out_12,
              x_out_13,
              x_out_14;
        logic A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,AA,BB,CC,DD,EE,FF;

        assign x_out_1 = crc_in ^ FF;
        assign x_out_2 = x_out_1 ^ A; //between 1 & 2
        assign x_out_3 = x_out_1 ^ B; //between 3 & 4
        assign x_out_4 = x_out_1 ^ D; //between 4 & 5
        assign x_out_5 = x_out_1 ^ E; //between 6 & 7
        assign x_out_6 = x_out_1 ^ G; //between 7 & 8
        assign x_out_7 = x_out_1 ^ H; //between 8 & 9
        assign x_out_8 = x_out_1 ^ J; //between 10 & 11
        assign x_out_9 = x_out_1 ^ K; //between 11 & 12
        assign x_out_10 = x_out_1 ^ L;//between 15 & 16
        assign x_out_11 = x_out_1 ^ P;//between 21 & 22
        assign x_out_12 = x_out_1 ^ V;//between 22 & 23
        assign x_out_13 = x_out_1 ^ W; //between 25 & 26
        assign x_out_14 = x_out_1 ^ Z;//between 31 & 0
    


        CRC_Register #(1) r1 (.clock(clock), .reset_n(reset_n), .clear(clear),  
            .D_in(x_out_1), .Q(A), .en(c_en));
        CRC_Register #(1) r2 (.clock(clock), .reset_n(reset_n), .clear(clear),
            .D_in(x_out_2), .Q(B), .en(c_en));
        CRC_Register #(1) r3 (.clock(clock), .reset_n(reset_n), .clear(clear), 
            .D_in(x_out_3), .Q(C), .en(c_en));
        CRC_Register #(1) r4 (.clock(clock), .reset_n(reset_n), .clear(clear), 
            .D_in(C), .Q(D), .en(c_en));
        CRC_Register #(1) r5 (.clock(clock), .reset_n(reset_n), .clear(clear), 
            .D_in(x_out_4), .Q(E), .en(c_en));
        CRC_Register #(1) r6 (.clock(clock), .reset_n(reset_n), .clear(clear), 
            .D_in(x_out_5), .Q(F), .en(c_en));
        CRC_Register #(1) r7 (.clock(clock), .reset_n(reset_n), .clear(clear),  
            .D_in(F), .Q(G), .en(c_en));
        CRC_Register #(1) r8 (.clock(clock), .reset_n(reset_n), .clear(clear), 
            .D_in(x_out_6), .Q(H), .en(c_en));
        CRC_Register #(1) r9 (.clock(clock), .reset_n(reset_n), .clear(clear), 
            .D_in(x_out_7), .Q(I), .en(c_en));
        CRC_Register #(1) r10 (.clock(clock), .reset_n(reset_n),.clear(clear), 
            .D_in(I), .Q(J), .en(c_en));
        CRC_Register #(1) r11 (.clock(clock),.reset_n(reset_n),.clear(clear), 
            .D_in(x_out_8), .Q(K), .en(c_en));
        CRC_Register #(1) r12 (.clock(clock),.reset_n(reset_n),.clear(clear),  
            .D_in(x_out_9), .Q(L), .en(c_en));
        CRC_Register #(1) r13 (.clock(clock),.reset_n(reset_n),.clear(clear),  
            .D_in(x_out_10), .Q(M), .en(c_en));
        CRC_Register #(1) r14 (.clock(clock),.reset_n(reset_n),.clear(clear), 
            .D_in(M), .Q(N), .en(c_en));
        CRC_Register #(1) r15 (.clock(clock),.reset_n(reset_n),.clear(clear), 
            .D_in(N), .Q(O), .en(c_en));
        CRC_Register #(1) r16 (.clock(clock),.reset_n(reset_n),.clear(clear), 
            .D_in(O), .Q(P), .en(c_en));
        CRC_Register #(1) r17 (.clock(clock), .reset_n(reset_n), .clear(clear),  
            .D_in(x_out_11), .Q(Q), .en(c_en));
        CRC_Register #(1) r18 (.clock(clock), .reset_n(reset_n), .clear(clear),
            .D_in(Q), .Q(R), .en(c_en));
        CRC_Register #(1) r19 (.clock(clock), .reset_n(reset_n), .clear(clear), 
            .D_in(R), .Q(S), .en(c_en));
        CRC_Register #(1) r20 (.clock(clock), .reset_n(reset_n), .clear(clear), 
            .D_in(S), .Q(T), .en(c_en));
        CRC_Register #(1) r21 (.clock(clock), .reset_n(reset_n), .clear(clear), 
            .D_in(T), .Q(U), .en(c_en));
        CRC_Register #(1) r22 (.clock(clock), .reset_n(reset_n), .clear(clear), 
            .D_in(U), .Q(V), .en(c_en));
        CRC_Register #(1) r23 (.clock(clock), .reset_n(reset_n), .clear(clear),  
            .D_in(x_out_12), .Q(W), .en(c_en));
        CRC_Register #(1) r24 (.clock(clock), .reset_n(reset_n), .clear(clear), 
            .D_in(x_out_13), .Q(X), .en(c_en));
        CRC_Register #(1) r25 (.clock(clock), .reset_n(reset_n), .clear(clear), 
            .D_in(X), .Q(Y), .en(c_en));
        CRC_Register #(1) r26 (.clock(clock), .reset_n(reset_n),.clear(clear), 
            .D_in(Y), .Q(Z), .en(c_en));
        CRC_Register #(1) r27 (.clock(clock),.reset_n(reset_n),.clear(clear), 
            .D_in(x_out_14), .Q(AA), .en(c_en));
        CRC_Register #(1) r28 (.clock(clock),.reset_n(reset_n),.clear(clear),  
            .D_in(AA), .Q(BB), .en(c_en));
        CRC_Register #(1) r29 (.clock(clock),.reset_n(reset_n),.clear(clear),  
            .D_in(BB), .Q(CC), .en(c_en));
        CRC_Register #(1) r30 (.clock(clock),.reset_n(reset_n),.clear(clear), 
            .D_in(CC), .Q(DD), .en(c_en));
        CRC_Register #(1) r31 (.clock(clock),.reset_n(reset_n),.clear(clear), 
            .D_in(DD), .Q(EE), .en(c_en));
        CRC_Register #(1) r32 (.clock(clock),.reset_n(reset_n),.clear(clear), 
            .D_in(EE), .Q(FF), .en(c_en));

        assign crc_out = ~{FF,EE,DD,CC,BB,AA,Z,Y,X,W,V,U,T,S,R,Q,P,O,N,M,L,K,J,I,H,G,F,E,D,C,B,A};
endmodule