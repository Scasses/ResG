import asyncio



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
    

    gas_pumps = {'HSP3': {'gpmHigh': 13889, 'gpmMed': 10417, 'gpmLow': 6994},
             'HSP4': {'gpmHigh': 13889, 'gpmMed': 10417, 'gpmLow': 6994},
             'HSP5': {'gpmHigh': 31250, 'gpmMid': 20833, 'gpmLow': 13899},
             'HSP6': {'gpmHigh': 41667, 'gpmMid': 31250, 'gpmLow': 20833}}
    





target = 133651


thirty_perc = target * .33
thirty_perc_plus = thirty_perc + 1000
thirty_perc_minus = thirty_perc - 1000


target_pluss = target + 1500
target_minus = target - 1500

eighty_perc_target = target * .51
per_of_target_rangeP = eighty_perc_target + 1500
per_of_target_rangeM = eighty_perc_target - 1500

twenty_percent_target = target * .2
percent_of_tptP = twenty_percent_target + 1500
percent_of_tptM = twenty_percent_target - 1500







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




# matching_items = []
# target_plus = target + 1800
# target_minus = target - 1800


# target_percent = target * .33

# target_percent_P = target_percent + 1000
# target_percent_M = target_percent - 1000
# # pumps_array = 0
H_Pump = []
M_Pump = []
L_Pump = []






def pump_check(dictionary):
    pumps_groups_high = []
    pumps_groups_mid = []
    pumps_groups_low = []
    pumps_name = []
#     H_pump = []
    # i = 0
    for pumps, pumps_data in dictionary.items():
        for gpm, gpm_data in pumps_data.items():
            if gpm == 'gpmLow':
                pumps_groups_low.append({pumps: gpm})
                L_Pump.append(gpm_data)
                low_totals = sum(L_Pump)
                pumps_name.append(low_totals)
                print(pumps_name, 'Pump list')
                print(low_totals, "Low gpm totals")
                if thirty_perc_minus > low_totals:
                    print('Need more GPMs')
                elif thirty_perc_plus < low_totals:
                    L_Pump.sort(reverse=True, key=gpm_sorter)
                    L_Pump.pop()
                    new_sum = sum(L_Pump)
                    print(new_sum,'New sum')
                    if thirty_perc_minus < new_sum < thirty_perc_plus:
                        print(new_sum,'Just right')
                        
                    
                
                    # print(pumps_name, 'True')
            elif gpm == 'gpmMid':
                pumps_groups_mid.append({pumps: gpm})
                M_Pump.append(gpm_data)
                mid_totals = sum(M_Pump)
                print(mid_totals, 'Mid GPM totals')
                
            elif gpm == 'gpmHigh':
                pumps_groups_high.append({pumps: gpm})
                H_Pump.append(gpm_data)
                # print(H_Pump, 'These are the H Pumps')
                high_totals = sum(H_Pump)
                print(high_totals, 'High GPM totals')
                

            else:
                print('False!')



pump_check(HighServicePumps.gas_pumps)





# def pump_check(dictionary):
#     pumps_groups_high = []
#     pumps_groups_mid = []
#     pumps_groups_low = []
#     pumps_name = []
# #     H_pump = []
#     # i = 0
#     for pumps, pumps_data in dictionary.items():
#         for gpm, gpm_data in pumps_data.items():
#             if gpm == 'gpmLow':
#                 pumps_groups_low.append({pumps: gpm})
#                 L_Pump.append(gpm_data)
#                 low_totals = sum(L_Pump)
#                 print(low_totals, "Low gpm totals")
#                 if target_minus > low_totals < target_plus:
#                     pumps_name.append(low_totals)
#                     print(pumps_name, 'These are the low totals')
                
#                     # print(pumps_name, 'True')
#             elif gpm == 'gpmMid':
#                 pumps_groups_mid.append({pumps: gpm})
#                 M_Pump.append(gpm_data)
#                 mid_totals = sum(M_Pump)
#                 print(mid_totals, 'Mid GPM totals')
                
#             elif gpm == 'gpmHigh':
#                 pumps_groups_high.append({pumps: gpm})
#                 H_Pump.append(gpm_data)
#                 # print(H_Pump, 'These are the H Pumps')
#                 high_totals = sum(H_Pump)
#                 print(high_totals, 'High GPM totals')
                

#             else:
#                 print('False!')



# pump_check(HighServicePumps.gas_pumps)