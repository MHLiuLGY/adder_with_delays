.PHONY: help all all_ctrl com sim sim_ctrl cov_dve cov_verdi urg rpt deb clean

#================================
#=========== vars def ===========
#================================
export DEMO_NAME = adder_with_delays
TC_NAME = +define+adder_with_delays_tb
FILE_LIST = -f file_list
TOP = -top adder_with_delays_tb

WAVEFORM = $(DEMO_NAME).fsdb
OUTPUT = simv_$(DEMO_NAME)

# Time unit & precision
TIME_DEF = -timescale=1ns/1ps

# Include file search path
INC_PATH = +incdir+${DC_HOME}/dw/sim_ver

# Code coverage command
CM = -cm line+cond+fsm+branch
# +tgl
CM_NAME = -cm_name $(OUTPUT)
CM_DIR = -cm_dir ./${OUTPUT}.vdb

# Post-simulation/DW(LIB_DIR+LIB_EXT or LIB_FILE)
LIB_DIR = -y ${DC_HOME}/dw/sim_ver
LIB_EXT = +libext+.v

# Load waveform
ifeq ($(WAVEFORM), $(wildcard $(WAVEFORM)))
	LOAD_WAVE = -ssf $(WAVEFORM)
endif

help:
	@echo "make help"
	@echo "make all to compile and simulate"
	@echo "make all_ctrl to compile and simulate with control"
	@echo "make com to compile"
	@echo "make sim to simulate"
	@echo "make sim_ctrl to simulate with control"
	@echo "make cov_dve to show the coverage with DVE"
	@echo "make cov_verdi to show the coverage with Verdi"
	@echo "make urg to generate the coverage report"
	@echo "make rpt to view the coverage report"
	@echo "make deb to debug with Verdi"
	@echo "make clean to clean the workspace"

all: com sim
all_ctrl: com sim_ctrl
#================================
#============= vcs ==============
#================================
# This 2 compile time switch should turn off
# when post-simulation is on going
# 	   +notimingcheck
# 	   +nospecify

# And +neg_tchk may be used

# Compile command
VCS = vcs -sverilog +v2k $(TIME_DEF) $(FILE_LIST) \
	  -debug_pp +memcbk \
	  -full64 \
	  +vcs+lic+wait \
	  +notimingcheck+nospecify \
	  $(TC_NAME) \
	  $(INC_DIR) \
	  $(LIB_DIR) $(LIB_EXT) \
	  $(CM) $(CM_NAME) $(CM_DIR) \
	  -cm_hier ./vcs_cov.cfg \
	  -LDFLAGS \
	  -rdynamic \
	  -P /opt/synopsys/verdi_2015/share/PLI/VCS/LINUX64/novas.tab \
	  /opt/synopsys/verdi_2015/share/PLI/VCS/LINUX64/pli.a \
	  -o $(OUTPUT) \
	  -l compile.log

# Simulation command
SIM = ./$(OUTPUT) \
	  $(CM) $(CM_NAME) $(CM_DIR) \
	  -ucli -i dump_fsdb_vcs.tcl \
	  +fsdb+autoflush \
	  -l $(OUTPUT).log

SIM_CTRL = ./$(OUTPUT) \
	  $(CM) $(CM_NAME) $(CM_DIR) \
	  -ucli -i dump_fsdb_vcs_ctrl.tcl \
	  +fsdb+autoflush \
	  -l $(OUTPUT).log

# Start compile
com:
	$(VCS)

# Start simulation
sim:
	$(SIM)

sim_ctrl:
	$(SIM_CTRL)

#================================
#============ debug =============
#================================
# Show the coverage with DVE
cov_dve:
	dve -cov -dir *.vdb &

# Show the coverage with Verdi
cov_verdi:
	verdi -cov -covdir *.vdb &

# Generate the coverage report
urg:
	urg -dir *.vdb -full64 -report both

# View the coverage report
rpt:
	firefox both/dashboard.html

# Debug
deb:
	verdi \
		-sv \
		$(FILE_LIST) \
		$(TOP) \
		$(TC_NAME) \
		$(LOAD_WAVE) \
		-nologo

#================================
#============ clean =============
#================================
# Start clean
clean:
	rm -rf csrc *.log simv* ucli* *.fsdb novas* verdi* *.vdb *Log DVE*


