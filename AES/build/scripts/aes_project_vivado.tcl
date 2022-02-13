# ====================================================================
# File Name     : aes_project_vivado.tcl
# Author        : Philip Davey
# Design Folder : AES
# Date          : February 2022
# --------------------------------------------------------------------
# Description   :
#               :
#               :
#               :
#               :
# ====================================================================

# ########################################
# Create Project:
# ########################################

set project_name "aes_project"
set project_dir  ../work/aes_project

set part_number  "xc7k70tfbg484-3"

create_project -force -part $part_number $project_name $project_dir

# Set Target and Simulator Language:
set_property target_language VHDL [current_project]
set_property simulator_language VHDL [current_project]

# ###################################
# Adding files:
# ###################################

source aes_file_list.tcl