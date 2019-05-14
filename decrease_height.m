function [reducedColorImg,reducedEnergyImg] = decrease_height(im,energyImg)
    cumulativeMap = cumulative_min_energy_map(energyImg,'HORIZONTAL');
    seam = find_horizontal_seam(cumulativeMap);
    seam_img = permute(im,[2,1,3]);
    energyImg = permute(energyImg,[2,1]);
    [row,col,channel] = size(seam_img);
    bool = false;
    for i = 1:1:row
        for j = 1:1:col
            for q = 1:1:length(seam)
                if row*(j-1)+i == seam(q)
                    bool = true;
                end
            end
            if bool == true
                if j<col
                    for k = j:1:col-1
                        seam_img(i,k,:) = seam_img(i,k+1,:);
                        energyImg(i,k) = energyImg(i,k+1);
                    end
                end
            end
            bool = false;
        end
    end
    seam_img = seam_img(1:row,1:col-1,1:3);
    seam_img = permute(seam_img,[2,1,3]);
    reducedColorImg = seam_img;
    reducedEnergyImg = energyImg(1:row,1:col-1);
    reducedEnergyImg = permute(reducedEnergyImg,[2,1]);
end