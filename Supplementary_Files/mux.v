module mux
    #(parameter NUM_INPUTS = 32, parameter NUM_OUTPUTS = 1)
    (
    input [(NUM_INPUTS-1):0] data_in,
    input [$clog2(NUM_INPUTS)-1:0]  select_in,
    output data_out
    );
reg [NUM_INPUTS:0] D;
always @ (D)
    begin
        D <= data_in;
    end
assign data_out = D[select_in];

endmodule
