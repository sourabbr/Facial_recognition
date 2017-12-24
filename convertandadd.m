function [emma,will,data]=convertandadd(gImg,num,emma,will,data)
%gImg=imread(img);
gImg=imresize(gImg,[100 100]);
gImg=rgb2gray(gImg);
gImg=gImg(:)';
gImg=double(gImg);
if (num==0)
    emma = [emma;gImg 0];
else
    will = [will;gImg 1];
end
data = [data;gImg num];
end
