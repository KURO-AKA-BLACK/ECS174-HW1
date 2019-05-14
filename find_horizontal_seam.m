function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)
    cumulativeEnergyMap = cumulativeEnergyMap';
    [row,col] = size(cumulativeEnergyMap);
    min_last_row = 10000000000;
    for i = 1:1:col
        last_min = min_last_row;
        min_last_row = min(min_last_row,cumulativeEnergyMap(row,i));
        if last_min ~= min_last_row
            min_col = i;
        end
    end
    temp_loc = row*min_col;
    seam_array = temp_loc;
    while true
        if mod(temp_loc,row) == 1
            break;
        end
        if temp_loc <= row
            min_val = min(cumulativeEnergyMap(temp_loc - 1), cumulativeEnergyMap(temp_loc + row - 1));
            if min_val == cumulativeEnergyMap(temp_loc - 1)
                temp_loc = temp_loc - 1;
            else
                temp_loc = temp_loc + row - 1;
            end
        elseif temp_loc > (row*col-row)
            min_val = min(cumulativeEnergyMap(temp_loc - 1), cumulativeEnergyMap(temp_loc - row - 1));
            if min_val == cumulativeEnergyMap(temp_loc - 1)
                temp_loc = temp_loc - 1;
            else
                temp_loc = temp_loc - row - 1;
            end
        else
            min_val = min([cumulativeEnergyMap(temp_loc - 1), cumulativeEnergyMap(temp_loc + row -1), cumulativeEnergyMap(temp_loc - row - 1)]);
            if min_val ==  cumulativeEnergyMap(temp_loc - 1)
                temp_loc = temp_loc - 1;
            elseif min_val == cumulativeEnergyMap(temp_loc + row - 1)
                temp_loc = temp_loc + row - 1;
            else
                temp_loc = temp_loc - row - 1;
            end
        end
        seam_array = [seam_array,temp_loc];
    end
    horizontalSeam = seam_array;
end