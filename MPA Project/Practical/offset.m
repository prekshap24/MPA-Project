function [minx,miny,maxx,maxy]=offset(point_new,image)
%function to calculate offset
    
minx=round(abs(min(min(point_new(:,1)),1)));
miny=round(abs(min(min(point_new(:,2)),1)));
maxx=round(abs(max(max(point_new(:,1)),size(image,1))));
maxy=round(abs(max(max(point_new(:,2)),size(image,2))));
end