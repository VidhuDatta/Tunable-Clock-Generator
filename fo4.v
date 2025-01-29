// FO4 Module Implementation
// Ring oscillator with 7 stages and FO4 fan-out

module fo4
    (
      input  wire reset_i,       // Reset input
      output wire probe_in_o,    // First output probe (input of measured inverter)
      output wire probe_out_o    // Second output probe (output of measured inverter)
    );

    // Intermediate wires for connecting the inverters in the ring
    wire [6:0] ring_nodes;      // Nodes between the 7 inverters
	wire ring_node_out;
    wire [2:0] dangling1_x1_outputs; // Outputs of the dangling inverters at stage 1
	wire [2:0] dangling1_x4_outputs; // outputs of x4 dangling inverters at stage 1
	
	wire [2:0] dangling2_x1_outputs; // Outputs of the dangling inverters at stage 2
	wire [2:0] dangling2_x4_outputs; // outputs of x4 dangling inverters at stage 2
	
	wire [2:0] dangling3_x1_outputs; // Outputs of the dangling inverters at stage 3
	wire [2:0] dangling3_x4_outputs; // outputs of x4 dangling inverters at stage 3
	
	wire [2:0] dangling4_x1_outputs; // Outputs of the dangling inverters at stage 4
	wire [2:0] dangling4_x4_outputs; // outputs of x4 dangling inverters at stage 4
	
	wire [2:0] dangling5_x1_outputs; // Outputs of the dangling inverters at stage 5
	wire [2:0] dangling5_x4_outputs; // outputs of x4 dangling inverters at stage 5
	
	wire [2:0] dangling6_x1_outputs; // Outputs of the dangling inverters at stage 6
	wire [2:0] dangling6_x4_outputs; // outputs of x4 dangling inverters at stage 6
	
	wire [2:0] dangling7_x1_outputs; // Outputs of the dangling inverters at stage 7
	wire [2:0] dangling7_x4_outputs; // outputs of x4 dangling inverters at stage 7
	

    // Reset Gate (DO NOT REMOVE OR RENAME)
    sky130_fd_sc_hd__or2_1
    reset
        (.A(reset_i),           // Connect reset input
         .B(ring_node_out),     // Feedback from the last inverter in the loop
         .X(ring_nodes[0])      // Output to the first inverter
        );

// Stage 1: (connected to reset gate)
    sky130_fd_sc_hd__inv_1
    inv_stage_1
        (.A(ring_nodes[0]),
         .Y(ring_nodes[1])
        );
	//Dangling outputs x1
	sky130_fd_sc_hd__inv_1
	inv0_x1_stage_1
	    (.A(ring_nodes[1]),
		 .Y(dangling1_x1_outputs[0])
		);
	
	sky130_fd_sc_hd__inv_1
	inv1_x1_stage_1
	    (.A(ring_nodes[1]),
		 .Y(dangling1_x1_outputs[1])
		);
	
	sky130_fd_sc_hd__inv_1
	inv2_x1_stage_1
	    (.A(ring_nodes[1]),
		 .Y(dangling1_x1_outputs[2])
		);
		
	//dangling outputs x4
		
	sky130_fd_sc_hd__inv_4
	inv0_x4_stage_1
	    (.A(dangling1_x1_outputs[0]),
		 .Y(dangling1_x4_outputs[0])
		);
		
	sky130_fd_sc_hd__inv_4
	inv1_x4_stage_1
	    (.A(dangling1_x1_outputs[1]),
		 .Y(dangling1_x4_outputs[1])
		);
	
	sky130_fd_sc_hd__inv_4
	inv2_x4_stage_1
	    (.A(dangling1_x1_outputs[2]),
		 .Y(dangling1_x4_outputs[2])
		);
		
//Stage 2 : 
    
    sky130_fd_sc_hd__inv_1
    inv_stage_2
        (.A(ring_nodes[1]),
         .Y(ring_nodes[2])
        );
	//Dangling outputs x1
	sky130_fd_sc_hd__inv_1
	inv0_x1_stage_2
	    (.A(ring_nodes[2]),
		 .Y(dangling2_x1_outputs[0])
		);
	
	sky130_fd_sc_hd__inv_1
	inv1_x1_stage_2
	    (.A(ring_nodes[2]),
		 .Y(dangling2_x1_outputs[1])
		);
	
	sky130_fd_sc_hd__inv_1
	inv2_x1_stage_2
	    (.A(ring_nodes[2]),
		 .Y(dangling2_x1_outputs[2])
		);
		
	//dangling outputs x4
		
	sky130_fd_sc_hd__inv_4
	inv0_x4_stage_2
	    (.A(dangling2_x1_outputs[0]),
		 .Y(dangling2_x4_outputs[0])
		);
		
	sky130_fd_sc_hd__inv_4
	inv1_x4_stage_2
	    (.A(dangling2_x1_outputs[1]),
		 .Y(dangling2_x4_outputs[1])
		);
	
	sky130_fd_sc_hd__inv_4
	inv2_x4_stage_2
	    (.A(dangling2_x1_outputs[2]),
		 .Y(dangling2_x4_outputs[2])
		);

//Stage 3 :
    
    sky130_fd_sc_hd__inv_1
    inv_stage_3
        (.A(ring_nodes[2]),
         .Y(ring_nodes[3])
        );
	//Dangling outputs x1
	sky130_fd_sc_hd__inv_1
	inv0_x1_stage_3
	    (.A(ring_nodes[3]),
		 .Y(dangling3_x1_outputs[0])
		);
	
	sky130_fd_sc_hd__inv_1
	inv1_x1_stage_3
	    (.A(ring_nodes[3]),
		 .Y(dangling3_x1_outputs[1])
		);
	
	sky130_fd_sc_hd__inv_1
	inv2_x1_stage_3
	    (.A(ring_nodes[3]),
		 .Y(dangling3_x1_outputs[2])
		);
		
	//dangling outputs x4
		
	sky130_fd_sc_hd__inv_4
	inv0_x4_stage_3
	    (.A(dangling3_x1_outputs[0]),
		 .Y(dangling3_x4_outputs[0])
		);
		
	sky130_fd_sc_hd__inv_4
	inv1_x4_stage_3
	    (.A(dangling3_x1_outputs[1]),
		 .Y(dangling3_x4_outputs[1])
		);
	
	sky130_fd_sc_hd__inv_4
	inv2_x4_stage_3
	    (.A(dangling3_x1_outputs[2]),
		 .Y(dangling3_x4_outputs[2])
		);

//Stage 4 :
    
    sky130_fd_sc_hd__inv_1
    inv_stage_4
        (.A(ring_nodes[3]),
         .Y(ring_nodes[4])
        );
	//Dangling outputs x1
	sky130_fd_sc_hd__inv_1
	inv0_x1_stage_4
	    (.A(ring_nodes[4]),
		 .Y(dangling4_x1_outputs[0])
		);
	
	sky130_fd_sc_hd__inv_1
	inv1_x1_stage_4
	    (.A(ring_nodes[4]),
		 .Y(dangling4_x1_outputs[1])
		);
	
	sky130_fd_sc_hd__inv_1
	inv2_x1_stage_4
	    (.A(ring_nodes[4]),
		 .Y(dangling4_x1_outputs[2])
		);
		
	//dangling outputs x4
		
	sky130_fd_sc_hd__inv_4
	inv0_x4_stage_4
	    (.A(dangling4_x1_outputs[0]),
		 .Y(dangling4_x4_outputs[0])
		);
		
	sky130_fd_sc_hd__inv_4
	inv1_x4_stage_4
	    (.A(dangling4_x1_outputs[1]),
		 .Y(dangling4_x4_outputs[1])
		);
	
	sky130_fd_sc_hd__inv_4
	inv2_x4_stage_4
	    (.A(dangling4_x1_outputs[2]),
		 .Y(dangling4_x4_outputs[2])
		);


//Stage 5 :
    
    sky130_fd_sc_hd__inv_1
    inv_stage_5
        (.A(ring_nodes[4]),
         .Y(ring_nodes[5])
        );
	//Dangling outputs x1
	sky130_fd_sc_hd__inv_1
	inv0_x1_stage_5
	    (.A(ring_nodes[5]),
		 .Y(dangling5_x1_outputs[0])
		);
	
	sky130_fd_sc_hd__inv_1
	inv1_x1_stage_5
	    (.A(ring_nodes[5]),
		 .Y(dangling5_x1_outputs[1])
		);
	
	sky130_fd_sc_hd__inv_1
	inv2_x1_stage_5
	    (.A(ring_nodes[5]),
		 .Y(dangling5_x1_outputs[2])
		);
		
	//dangling outputs x4
		
	sky130_fd_sc_hd__inv_4
	inv0_x4_stage_5
	    (.A(dangling5_x1_outputs[0]),
		 .Y(dangling5_x4_outputs[0])
		);
		
	sky130_fd_sc_hd__inv_4
	inv1_x4_stage_5
	    (.A(dangling5_x1_outputs[1]),
		 .Y(dangling5_x4_outputs[1])
		);
	
	sky130_fd_sc_hd__inv_4
	inv2_x4_stage_5
	    (.A(dangling5_x1_outputs[2]),
		 .Y(dangling5_x4_outputs[2])
		);

//Stage 6 :
    
    sky130_fd_sc_hd__inv_1
    inv_stage_6
        (.A(ring_nodes[5]),
         .Y(ring_nodes[6])
        );
	//Dangling outputs x1
	sky130_fd_sc_hd__inv_1
	inv0_x1_stage_6
	    (.A(ring_nodes[6]),
		 .Y(dangling6_x1_outputs[0])
		);
	
	sky130_fd_sc_hd__inv_1
	inv1_x1_stage_6
	    (.A(ring_nodes[6]),
		 .Y(dangling6_x1_outputs[1])
		);
	
	sky130_fd_sc_hd__inv_1
	inv2_x1_stage_6
	    (.A(ring_nodes[6]),
		 .Y(dangling6_x1_outputs[2])
		);
		
	//dangling outputs x4
		
	sky130_fd_sc_hd__inv_4
	inv0_x4_stage_6
	    (.A(dangling6_x1_outputs[0]),
		 .Y(dangling6_x4_outputs[0])
		);
		
	sky130_fd_sc_hd__inv_4
	inv1_x4_stage_6
	    (.A(dangling6_x1_outputs[1]),
		 .Y(dangling6_x4_outputs[1])
		);
	
	sky130_fd_sc_hd__inv_4
	inv2_x4_stage_6
	    (.A(dangling6_x1_outputs[2]),
		 .Y(dangling6_x4_outputs[2])
		);

//Stage 7 :
    
    sky130_fd_sc_hd__inv_1
    inv_stage_7
        (.A(ring_nodes[6]),
         .Y(ring_node_out)
        );
	//Dangling outputs x1
	sky130_fd_sc_hd__inv_1
	inv0_x1_stage_7
	    (.A(ring_node_out),
		 .Y(dangling7_x1_outputs[0])
		);
	
	sky130_fd_sc_hd__inv_1
	inv1_x1_stage_7
	    (.A(ring_node_out),
		 .Y(dangling7_x1_outputs[1])
		);
	
	sky130_fd_sc_hd__inv_1
	inv2_x1_stage_7
	    (.A(ring_node_out),
		 .Y(dangling7_x1_outputs[2])
		);
		
	//dangling outputs x4
		
	sky130_fd_sc_hd__inv_4
	inv0_x4_stage_7
	    (.A(dangling7_x1_outputs[0]),
		 .Y(dangling7_x4_outputs[0])
		);
		
	sky130_fd_sc_hd__inv_4
	inv1_x4_stage_7
	    (.A(dangling7_x1_outputs[1]),
		 .Y(dangling7_x4_outputs[1])
		);
	
	sky130_fd_sc_hd__inv_4
	inv2_x4_stage_7
	    (.A(dangling7_x1_outputs[2]),
		 .Y(dangling7_x4_outputs[2])
		);




    // Probes
    assign probe_in_o  = ring_nodes[6]; // Measure input of the 1st stage inverter
    assign probe_out_o = ring_node_out; // Measure output of the 1st stage inverter

endmodule

