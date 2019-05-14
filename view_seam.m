function view_seam(im,seam,seamDirection)
    if strcmp(seamDirection,'VERTICAL') == 1 
        im(seam) = 255,0,0;  
    elseif strcmp(seamDirection,'HORIZONTAL') == 1
        im = permute(im,[2,1,3]);
        im(seam) = 139,0,0; 
        im = permute(im,[2,1,3]);
    end
    imshow(im);
end