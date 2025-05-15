global env
fsdbDumpfile "$env(DEMO_NAME).fsdb"
fsdbDumpvars 0 "adder_with_delays_tb"
fsdbDumpMDA 0 "adder_with_delays_tb"
run
