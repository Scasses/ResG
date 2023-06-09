import functools

class HighServicePumps:
    highServicePumps = {'HSP1': 13889,
                    'HSP2': 13889,
                    'HSP3': {'gpmHigh': 13889, 'gpmMed': 10417, 'gpmLow': 6994},
                    'HSP4': {'gpmHigh': 13889, 'gpmMed': 10417, 'gpmLow': 6994},
                    'HSP5': {'gpmHigh': 31250, 'gpmMed': 20833, 'gpmLow': 13899},
                    'HSP6': {'gpmHigh': 41667, 'gpmMed': 31250, 'gpmLow': 20833},
                    'HSP7': 41667,
                    'HSP8': 41667,
                    'HSP9': 41667,
                    'HSP10': 41667}
    

    gas_pumps = {
             'HSP3': {'gpmHigh': 13889, 'gpmMid': 10417, 'gpmLow': 6994},
             'HSP4': {'gpmHigh': 13889, 'gpmMid': 10417, 'gpmLow': 6994},
             'HSP5': {'gpmHigh': 31250, 'gpmMid': 20833, 'gpmLow': 13899},
             'HSP6': {'gpmHigh': 41667, 'gpmMid': 31250, 'gpmLow': 20833}
             }
    



target = 133651


thirty_perc = target * .33
thirty_perc_plus = int(thirty_perc) + 1000
thirty_perc_minus = int(thirty_perc) - 1000


target_pluss = target + 1500
target_minus = target - 1500

eighty_perc_target = target * .51
per_of_target_rangeP = eighty_perc_target + 1500
per_of_target_rangeM = eighty_perc_target - 1500

twenty_percent_target = target * .2
percent_of_tptP = twenty_percent_target + 1500
percent_of_tptM = twenty_percent_target - 1500


def speed_sorter(pump_list):
    pump_high = []
    pump_medium = []
    pump_low = []

    for index,val in pump_list.items():
        pump_high.append(val['gpmHigh'])
        pump_medium.append(val['gpmMid'])
        pump_low.append(val['gpmLow'])
    return pump_high, pump_medium, pump_low




def pump_speed(pump_dict):
    pump_totals = []

    pump_seperation = speed_sorter(pump_dict)
    for index in pump_seperation:
        gpm_high_totals = functools.reduce(lambda a,b: a+b, index)
        pump_totals.append(gpm_high_totals)
        if thirty_perc_minus < range(0, len(pump_totals)) <= thirty_perc_plus:
            print('True')
        else:
            print('False') 
        
        
        
 
 

                

        
    
            

            
pump_speed(HighServicePumps.gas_pumps)



def gas_pump_selector(dictionary):
    pump_choice = {}
    for pumps, gpm in dictionary.items():
        if isinstance(gpm, dict):
            new_dict = dict(gpm)
            pump_choice.update(new_dict)
            # print(pump_choice, 'pumps choice')
    return pump_choice





def e_pump_sort(electric):
    if type(electric) != dict:
        return electric


def gpm_sorter(gpm):
    return gpm

temp_pump = []


def check_sum(pumps, target):
    for i in range(len(pumps)):
        temp_sum = 0
        for gpm in range(i, len(pumps)):
            if temp_sum > (target + 1000 or target - 1000):
                index_pos = [i, gpm-1]
                print(index_pos, 'Index Position')
            else:
                temp_sum += pumps[gpm]
                temp_pump.append(temp_sum)
        return temp_pump




def pump_selector(all_pumps):
    elec_pumps = list(filter(e_pump_sort, all_pumps.values()))
    pump_gens = check_sum(elec_pumps, eighty_perc_target)
    final_pump = pump_gens.pop()
    totals = [int(per_of_target_rangeM) <= final_pump <=
              int(per_of_target_rangeP)]
    print(totals)
    if totals == [True]:
        print(final_pump, 'This is the GPM target')
        return final_pump
    elif totals == [False]:
        print('False claim')
    else:
        print('GPM not found')
    return final_pump


H_Pump = []
M_Pump = []
L_Pump = []




