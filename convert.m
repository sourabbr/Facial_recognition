function gImg=convert(gImg)

gImg=imresize(gImg,[100 100]);
gImg=rgb2gray(gImg);
gImg=gImg(:)';
gImg=double(gImg);
end
