



class SyetemAlarmMon:
    pressureSOP = {'dayMax' : [72.9], 'dayMin' : [64.0], 'nightMax' : [64.9], 'nightMin' : [58.0]}
    # temporary time used for testing
    hour = 200
    
    # PSI discharge messages
    high_psi = 'Discharge pressure is high, take action to reduce pressure.'
    low_psi = 'Discharge pressure is low, take action to increase pressure.'

    # Discharge pressure alarm
def discharge_pressure_alarm(psi):
        day_max = SyetemAlarmMon.pressureSOP['dayMax'][0]
        day_min = SyetemAlarmMon.pressureSOP['dayMax'][0]
        night_max = SyetemAlarmMon.pressureSOP['nightMax'][0]
        night_min = SyetemAlarmMon.pressureSOP['nightMin'][0]
        if psi > day_max and SyetemAlarmMon.hour > 600 and SyetemAlarmMon.hour > 2300:
            print('High',SyetemAlarmMon.high_psi)
        elif psi < day_min and SyetemAlarmMon.hour > 600 and SyetemAlarmMon.hour > 2300:
            print('Low',SyetemAlarmMon.low_psi)
        elif psi > night_max and SyetemAlarmMon.hour < 600 and SyetemAlarmMon.hour < 2300:
            print('High', SyetemAlarmMon.high_psi) 
        elif SyetemAlarmMon.psi < night_min and SyetemAlarmMon.hour < 600 and SyetemAlarmMon.hour < 2300:
            print('Low', SyetemAlarmMon.low_psi)
        else:
            print('Discharge pressure is normal')

   