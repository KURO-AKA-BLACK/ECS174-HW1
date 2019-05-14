function cumulativeEnergyMap = cumulative_min_energy_map(energyImg,seamDirection)
    cumulativeEnergyMap = energyImg;
    [row,col] = size(energyImg);
    if strcmp(seamDirection,'VERTICAL')
        for i = 2:1:row
            for j = 1:1:col
                if (j == 1)
                    cumulativeEnergyMap(i,j) = energyImg(i,j) + min(cumulativeEnergyMap(i-1,j),cumulativeEnergyMap(i-1,j+1));
                elseif (j == col)
                    cumulativeEnergyMap(i,j) = energyImg(i,j) + min(cumulativeEnergyMap(i-1,j-1),cumulativeEnergyMap(i-1,j));
                else
                    cumulativeEnergyMap(i,j) = energyImg(i,j) + min([cumulativeEnergyMap(i-1,j-1),cumulativeEnergyMap(i-1,j),cumulativeEnergyMap(i-1,j+1)]);
                end    
            end
        end
    elseif strcmp(seamDirection,'HORIZONTAL')
        for i = 2:1:col
            for j = 1:1:row
                if (j == 1)
                    cumulativeEnergyMap(j,i) = energyImg(j,i) + min(cumulativeEnergyMap(j,i-1),cumulativeEnergyMap(j+1,i-1));
                elseif (j == row)
                    cumulativeEnergyMap(j,i) = energyImg(j,i) + min(cumulativeEnergyMap(j-1,i-1),cumulativeEnergyMap(j,i-1));
                else
                    cumulativeEnergyMap(j,i) = energyImg(j,i) + min([cumulativeEnergyMap(j-1,i-1),cumulativeEnergyMap(j,i-1),cumulativeEnergyMap(j+1,i-1)]);
                end
            end
        end
    end
end