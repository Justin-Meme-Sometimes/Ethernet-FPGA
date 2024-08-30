module transmit
    typedef struct packed {
        logic [7:0][6:0] preamble;
        logic [7:0] sfd;
        logic [7:0][6:0] mac_dest;
        logic [7:0][6:0] mac_src;
        logic [7:0][1:0] ether_type;
        logic [7:0][99:0] payload; //this varies in space will figure out
        logic [7:0][3:0] crc_32;
    } Ethernet_Packet;


endmodule;

module transmit_fsm
     enum {PREAMBLE,SFD,MAC_DEST,MAC_SRC,ETHER_TYPE,PAYLOAD,CRC32} 
     current_state, next_state;

     always_ff @(posedge clock, negedge reset_n) begin
        if(!reset_n) begin
            current_state <= INIT;
        end
        else begin
            current_state <= next_state;
        end
     end

    always_comb begin
        PREAMBLE: begin
            if(preamable_complete) begin
                next_state = SFD;
            end
        end
        SFD: begin
            if(sfd_complete) begin
                next_state = MAC_DEST;
            end
        end
        MAC_DEST: begin
            if(mac_dest_complete) begin
                next_state = MAC_SRC;
            end
        end
        MAC_SRC: begin
            if(mac_src_complete) begin
                next_state = ETHER_TYPE;
            end
        end
        ETHER_TYPE: begin
            if(ether_type_complete) begin
                next_state = PAYLOAD;
            end
        end
        PAYLOAD: begin
            if(payload_complete) begin
                next_state = CRC32;
            end
        end
        CRC32: begin
            if(crc32) begin
                next_state = PREAMBLE;
            end
        end
    end

endmodule