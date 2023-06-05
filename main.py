from resGuardClasses.tankStorage import *
from resGuardClasses.alarmSystems import *



psi_value = float(input(" Current psi: "))



# Operator input of desired reservoir level and the current reservoir level
current_res_lvl = float(input('Current reservoir level \n'))
desired_res_lvl = float(input('What is your desired reservoir level? \n'))

# raw and finished water GPM input
raw_mgd_input = int(input('Current Raw Water intake: \n'))

unit_converter(current_res_lvl, desired_res_lvl)
discharge_pressure_alarm(psi_value)