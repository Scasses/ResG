# import main


class Reservoirs:
        height = {'reservoirMax' : [192], 'reservoirLow' : [96]}
        gallonsPI = 98958
        res_max_low = {'reservoirMaxHeight': [16], 'reservoirLowHeight': [8]}
        # Minutes in a shift
        shift_time = 480
        # raw_gpm = ((main.raw_mgd_input * 1000000) / 3) / shift_time

# Converts Current reservoir level and desired reservoir level from feet to inches
def unit_converter(curr_res_lvl, des_res_lvl):
    curr_res_inch = round(curr_res_lvl * 12)
    des_res_inch = round(des_res_lvl * 12)
    res_diff_inch = des_res_inch - curr_res_inch
    print(res_diff_inch, "Reservoir difference")
    return res_diff_inch


# the reservoir_manager function determines which action to take based on reservoir height goal
def reservoir_manager(desired_res_lvl, current_res_lvl):
    diff_gpm = (unit_converter(main.current_res_lvl, main.desired_res_lvl) * Reservoirs.gallonsPI) / Reservoirs.shift_time
    if desired_res_lvl > current_res_lvl:
        inc_target_gpm = round(Reservoirs.raw_gpm - diff_gpm)
        print(f'{inc_target_gpm}gpm up needed to reach desired reservoir level')
        return inc_target_gpm
    else:
        dec_target_gpm = round(Reservoirs.raw_gpm + diff_gpm)
        print(f'{dec_target_gpm}gpm down needed to reach desired reservoir level')
        return dec_target_gpm


                
        
        