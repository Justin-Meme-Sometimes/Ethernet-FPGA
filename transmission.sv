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


endmodule