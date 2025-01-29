// 
//  Clk Gen Module -- Students should implement their tunable clock generator
//  circuit here! The input and output port list has been created for you. Do
//  not modify the port list, this will break the rest of the lab :)
// 
//  First, you must figure out what logic gates are available to us in the
//  standard cell library. The best place to figure this out is the liberty
//  file which can be found at:
//
//      <SKY130_ROOT>/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_100C_1v60.lib
//
//  Open this file above to see the gates available in this cell library. This
//  will be helpful to figure out the names of the gates as well as the name of
//  the pins for the gates. Using this information you can instantiate the
//  cells you need for the circuit.
//
//  NOTE: This file is 100K lines, be sure to use the search function of your
//  text editor. Search for "cell " to find the each gate available in this
//  cell library. Under each cell definition, search for "pin " to find the
//  pins of the gate (you can ignore pg_pins, we do not need to work with
//  supply nets within this verilog file). Inside the pin definition will be
//  the "direction " to determine if it is an input or output of the gate.
//  Output pins will also have a "function " which is the boolean logic
//  expression for the gate. Timing information for each pin can also be found
//  within the pin definitions, please read the module - handout for more
//  information.
//
module clk_gen
    ( input  wire       reset_i
    , input  wire [3:0] select_i
    , output wire       clk_o
    );

    // TODO: Implement the clock generator below! Make sure that:
    //  1. The ring ends at the B pin of the reset NOR gate below.
    //  2. The ring begins with the X pin of the reset_bal NOR gate below.
    //  3. Use the 4-bit select_i to choose between your 16 clock speeds.
    //  4. The final clock should drive the clk_o port.

    wire reset_to_reset_bal_n;
	wire [10:0] ring_nodes;
	wire [1:0] ring_nodes_l1;
	wire [1:0] ring_nodes_l2;
	wire [1:0] ring_nodes_l3;
	wire [1:0] ring_nodes_l4;
	wire [1:0] ring_nodes_l5;
	wire [1:0] ring_nodes_l6;
	wire [1:0] ring_nodes_l7;
	wire [1:0] ring_nodes_l8;
	wire [1:0] ring_nodes_l9;
	wire [1:0] ring_nodes_l10;
	wire [1:0] ring_nodes_l11;
	wire [1:0] ring_nodes_l12;
	wire [1:0] ring_nodes_l13;
	wire [1:0] ring_nodes_l14;
	wire [1:0] ring_nodes_l15;
	wire ring_nodes_base_out;
	wire ring_nodes_l1_out;
	wire ring_nodes_l2_out;
	wire ring_nodes_l3_out;
	wire ring_nodes_l4_out;
	wire ring_nodes_l5_out;
	wire ring_nodes_l6_out;
	wire ring_nodes_l7_out;
	wire ring_nodes_l8_out;
	wire ring_nodes_l9_out;
	wire ring_nodes_l10_out;
	wire ring_nodes_l11_out;
	wire ring_nodes_l12_out;
	wire ring_nodes_l13_out;
	wire ring_nodes_l14_out;
	wire ring_nodes_l15_out;
	wire [7:0] mux_out;
	wire [3:0] mux1_out;
	wire [1:0] mux2_out;
	wire mux3_out;
	

    sky130_fd_sc_hd__nor2_1
    reset
        (.A(reset_i)
        ,.B(mux3_out)
        ,.Y(reset_to_reset_bal_n)
        );

    sky130_fd_sc_hd__nor2_1
    reset_bal
        (.A(reset_i)
        ,.B(reset_to_reset_bal_n)
        ,.Y(ring_nodes[0])
        );
	
	// Base
	
	sky130_fd_sc_hd__clkinv_2
	inv1_base
			(.A(ring_nodes[0])
			,.Y(ring_nodes[1])
			);
	sky130_fd_sc_hd__clkinv_2
	inv2_base
			(.A(ring_nodes[1])
			,.Y(ring_nodes[2])
			);
	sky130_fd_sc_hd__clkinv_2
	inv3_base
			(.A(ring_nodes[2])
			,.Y(ring_nodes[3])
			);
	sky130_fd_sc_hd__clkinv_2
	inv4_base
			(.A(ring_nodes[3])
			,.Y(ring_nodes[4])
			);
	sky130_fd_sc_hd__clkinv_2
	inv5_base
			(.A(ring_nodes[4])
			,.Y(ring_nodes[5])
			);
	sky130_fd_sc_hd__clkinv_2
	inv6_base
			(.A(ring_nodes[5])
			,.Y(ring_nodes[6])
			);
	sky130_fd_sc_hd__clkinv_2
	inv7_base
			(.A(ring_nodes[6])
			,.Y(ring_nodes[7])
			);
	sky130_fd_sc_hd__clkinv_2
	inv8_base
			(.A(ring_nodes[7])
			,.Y(ring_nodes[8])
			);
	sky130_fd_sc_hd__clkinv_2
	inv9_base
			(.A(ring_nodes[8])
			,.Y(ring_nodes[9])
			);
	sky130_fd_sc_hd__clkinv_2
	inv10_base
			(.A(ring_nodes[9])
			,.Y(ring_nodes[10])
			);
	sky130_fd_sc_hd__clkinv_2
	inv11_base
			(.A(ring_nodes[10])
			,.Y(ring_nodes_base_out)
			);

	
    // Level-1
	sky130_fd_sc_hd__clkinv_2
	inv1_l1
			(.A(ring_nodes_base_out)
			,.Y(ring_nodes_l1[1])
			);
	sky130_fd_sc_hd__clkinv_2
	inv2_l1
			(.A(ring_nodes_l1[1])
			,.Y(ring_nodes_l1_out)
			);
	
	// Level-2
	sky130_fd_sc_hd__clkinv_2
	inv1_l2
			(.A(ring_nodes_l1_out)
			,.Y(ring_nodes_l2[1])
			);
	sky130_fd_sc_hd__clkinv_2
	inv2_l2
			(.A(ring_nodes_l2[1])
			,.Y(ring_nodes_l2_out)
			);
			
	//Level-3
	sky130_fd_sc_hd__clkinv_2
	inv1_l3
			(.A(ring_nodes_l2_out)
			,.Y(ring_nodes_l3[1])
			);
	sky130_fd_sc_hd__clkinv_2
	inv2_l3
			(.A(ring_nodes_l3[1])
			,.Y(ring_nodes_l3_out)
			);
	
	//Level - 4
	sky130_fd_sc_hd__clkinv_2
	inv1_l4
			(.A(ring_nodes_l3_out)
			,.Y(ring_nodes_l4[1])
			);
	sky130_fd_sc_hd__clkinv_2
	inv2_l4
			(.A(ring_nodes_l4[1])
			,.Y(ring_nodes_l4_out)
			);
	
	//Level - 5
	sky130_fd_sc_hd__clkinv_2
	inv1_l5
			(.A(ring_nodes_l4_out)
			,.Y(ring_nodes_l5[1])
			);
	sky130_fd_sc_hd__clkinv_2
	inv2_l5
			(.A(ring_nodes_l5[1])
			,.Y(ring_nodes_l5_out)
			);
	
	//Level - 6
	sky130_fd_sc_hd__clkinv_2
	inv1_l6
			(.A(ring_nodes_l5_out)
			,.Y(ring_nodes_l6[1])
			);
	sky130_fd_sc_hd__clkinv_2
	inv2_l6
			(.A(ring_nodes_l6[1])
			,.Y(ring_nodes_l6_out)
			);
			
	//Level - 7
	sky130_fd_sc_hd__clkinv_2
	inv1_l7
			(.A(ring_nodes_l6_out)
			,.Y(ring_nodes_l7[1])
			);
	sky130_fd_sc_hd__clkinv_2
	inv2_l7
			(.A(ring_nodes_l7[1])
			,.Y(ring_nodes_l7_out)
			);
			
    //Level - 8
	sky130_fd_sc_hd__clkinv_2
	inv1_l8
			(.A(ring_nodes_l7_out)
			,.Y(ring_nodes_l8[1])
			);
	sky130_fd_sc_hd__clkinv_2
	inv2_l8
			(.A(ring_nodes_l8[1])
			,.Y(ring_nodes_l8_out)
			);
			
	//Level - 9
	sky130_fd_sc_hd__clkinv_2
	inv1_l9
			(.A(ring_nodes_l8_out)
			,.Y(ring_nodes_l9[1])
			);
	sky130_fd_sc_hd__clkinv_2
	inv2_l9
			(.A(ring_nodes_l9[1])
			,.Y(ring_nodes_l9_out)
			);
			
	//Level - 10
	sky130_fd_sc_hd__clkinv_2
	inv1_l10
			(.A(ring_nodes_l9_out)
			,.Y(ring_nodes_l10[1])
			);
	sky130_fd_sc_hd__clkinv_2
	inv2_l10
			(.A(ring_nodes_l10[1])
			,.Y(ring_nodes_l10_out)
			);
			
	//Level - 11
	sky130_fd_sc_hd__clkinv_2
	inv1_l11
			(.A(ring_nodes_l10_out)
			,.Y(ring_nodes_l11[1])
			);
	sky130_fd_sc_hd__clkinv_2
	inv2_l11
			(.A(ring_nodes_l11[1])
			,.Y(ring_nodes_l11_out)
			);
			
	//Level - 12
	sky130_fd_sc_hd__clkinv_2
	inv1_l12
			(.A(ring_nodes_l11_out)
			,.Y(ring_nodes_l12[1])
			);
	sky130_fd_sc_hd__clkinv_2
	inv2_l12
			(.A(ring_nodes_l12[1])
			,.Y(ring_nodes_l12_out)
			);
			
	//Level - 13
	sky130_fd_sc_hd__clkinv_2
	inv1_l13
			(.A(ring_nodes_l12_out)
			,.Y(ring_nodes_l13[1])
			);
	sky130_fd_sc_hd__clkinv_2
	inv2_l13
			(.A(ring_nodes_l13[1])
			,.Y(ring_nodes_l13_out)
			);
	
	//Level - 14
	sky130_fd_sc_hd__clkinv_2
	inv1_l14
			(.A(ring_nodes_l13_out)
			,.Y(ring_nodes_l14[1])
			);
	sky130_fd_sc_hd__clkinv_2
	inv2_l14
			(.A(ring_nodes_l14[1])
			,.Y(ring_nodes_l14_out)
			);
	
	//Level - 15
	sky130_fd_sc_hd__clkinv_2
	inv1_l15
			(.A(ring_nodes_l14_out)
			,.Y(ring_nodes_l15[1])
			);
	sky130_fd_sc_hd__clkinv_2
	inv2_l15
			(.A(ring_nodes_l15[1])
			,.Y(ring_nodes_l15_out)
			);
	
	// Mux 16*1 stage 1
	sky130_fd_sc_hd__mux2i_1
	mux_1
		(.A0(ring_nodes_base_out)
		,.A1(ring_nodes_l1_out)
		,.S(select_i[0])
		,.Y(mux_out[0])
		);
		
	sky130_fd_sc_hd__mux2i_1
	mux_2
		(.A0(ring_nodes_l2_out)
		,.A1(ring_nodes_l3_out)
		,.S(select_i[0])
		,.Y(mux_out[1])
		);
		
	sky130_fd_sc_hd__mux2i_1
	mux_3
		(.A0(ring_nodes_l4_out)
		,.A1(ring_nodes_l5_out)
		,.S(select_i[0])
		,.Y(mux_out[2])
		);
	
	sky130_fd_sc_hd__mux2i_1
	mux_4
		(.A0(ring_nodes_l6_out)
		,.A1(ring_nodes_l7_out)
		,.S(select_i[0])
		,.Y(mux_out[3])
		);
		
	sky130_fd_sc_hd__mux2i_1
	mux_5
		(.A0(ring_nodes_l8_out)
		,.A1(ring_nodes_l9_out)
		,.S(select_i[0])
		,.Y(mux_out[4])
		);
		
	sky130_fd_sc_hd__mux2i_1
	mux_6
		(.A0(ring_nodes_l10_out)
		,.A1(ring_nodes_l11_out)
		,.S(select_i[0])
		,.Y(mux_out[5])
		);
		
	sky130_fd_sc_hd__mux2i_1
	mux_7
		(.A0(ring_nodes_l12_out)
		,.A1(ring_nodes_l13_out)
		,.S(select_i[0])
		,.Y(mux_out[6])
		);
	
	sky130_fd_sc_hd__mux2i_1
	mux_8
		(.A0(ring_nodes_l14_out)
		,.A1(ring_nodes_l15_out)
		,.S(select_i[0])
		,.Y(mux_out[7])
		);
    
    // mux stage 2
    sky130_fd_sc_hd__mux2i_1
	mux1_1
		(.A0(mux_out[0])
		,.A1(mux_out[1])
		,.S(select_i[1])
		,.Y(mux1_out[0])
		);
    sky130_fd_sc_hd__mux2i_1
	mux1_2
		(.A0(mux_out[2])
		,.A1(mux_out[3])
		,.S(select_i[1])
		,.Y(mux1_out[1])
		);
    sky130_fd_sc_hd__mux2i_1
	mux1_3
		(.A0(mux_out[4])
		,.A1(mux_out[5])
		,.S(select_i[1])
		,.Y(mux1_out[2])
		);
    sky130_fd_sc_hd__mux2i_1
	mux1_4
		(.A0(mux_out[6])
		,.A1(mux_out[7])
		,.S(select_i[1])
		,.Y(mux1_out[3])
		);
		
		
    //mux stage 3
    sky130_fd_sc_hd__mux2i_1
	mux2_1
		(.A0(mux1_out[0])
		,.A1(mux1_out[1])
		,.S(select_i[2])
		,.Y(mux2_out[0])
		);
    sky130_fd_sc_hd__mux2i_1
	mux2_2
		(.A0(mux1_out[2])
		,.A1(mux1_out[3])
		,.S(select_i[2])
		,.Y(mux2_out[1])
		);
	
	//mux stage 4
	sky130_fd_sc_hd__mux2i_1
	mux3_1
		(.A0(mux2_out[0])
		,.A1(mux2_out[1])
		,.S(select_i[3])
		,.Y(mux3_out)
		); 
		
	//output	
    assign clk_o = mux3_out;

endmodule
