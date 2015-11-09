module spiMemory(clk, sclk_pin, cs_pin, miso_pin, mosi_pin, faultinjector_pin, leds);
input		clk;
input		sclk_pin;
input		cs_pin;
output		miso_pin;
input		mosi_pin;
input		faultinjector_pin;
output[7:0]		leds;

parameter dbus_width=8;

//Input Conditioner Plugs
wire[4:0] dummy;
wire mosi_cond;
wire sclk_pos, sclk_neg;
wire cs_cond;
//

//FSM generated control flags
wire addr_we;
wire dm_we;
wire sr_we;
wire miso_bufe;
//

//Register/DM read & load wires
wire[dbus_width-1:0] dout_parallelin;
wire[dbus_width-1:0] parallelout_din;
wire[dbus_width-2:0] addr_out;

wire ser_out;
wire qout_to_misobufe;

//This fault will pull address write enable high always.
wire fault_wire;
or fault(fault_wire, faultinjector_pin, addr_we);
//

StateMachine fsm(clk, miso_bufe, dm_we, addr_we, sr_we, sclk_pos, cs_cond, parallelout_din[0]);

inputconditioner mosi_ic(clk, mosi_pin, mosi_cond, dummy[0], dummy[1]);
inputconditioner sclk_ic(clk, sclk_pin, dummy[2], sclk_pos, sclk_neg);
inputconditioner chse_ic(clk, cs_pin, cs_cond, dummy[3], dummy[4]);

addresslatch addr_cap(clk, parallelout_din, addr_out, fault_wire); //fault is on addr_we

DataMemory dat_mem(clk, dout_parallelin, addr_out, dm_we, parallelout_din);

d_flipflop dff(clk, sclk_neg, ser_out, qout_to_misobufe);

buffer miso_buffer(clk, qout_to_misobufe, miso_bufe, miso_pin);

shiftregister shift_reg(clk, sclk_pos, sr_we, dout_parallelin, mosi_cond, parallelout_din, ser_out);

assign leds=parallelout_din;

endmodule
