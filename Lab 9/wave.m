function A3 = wave(im, wname, no_levels)
    [C, S]=wavedec2(im2double(im),no_levels,wname);
    A3=appcoef2(C,S,wname,no_levels);
end