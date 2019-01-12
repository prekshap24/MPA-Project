function newImage=creating_world_image(I1,I2,minx,miny,maxx,maxy,H)

%function to create world image canvas and set previous world image and
    %perspective image
    
    
   %creating array(image) of extended size(inculding offset) 
newImage=zeros(minx+maxx ,miny+maxy, 3,'uint8');

%copy previous world image on new world image
    for i=1:size(I1,1)
        for j=1:size(I1,2)

            newImage(minx+i,miny+j,:)=I1(i,j,:);

        end
    end
% using reverse mapping to find corresponding value in the perspective
% image
    K=ones(1,3);
    for i=1:size(newImage,1)
        for j=1:size(newImage,2)
            K = [i-minx,j-miny,1]*H;
            K(1)=round(K(1)/K(3));
            K(2)=round(K(2)/K(3));
            if (K(1)>0 && K(1)<size(I2,1) && K(2)>0 && K(2)<size(I2,2))
                if(newImage(i,j,:)==0 )
                newImage(i,j,:)=I2(K(1),K(2),:);
                end
            end
        end
    end
end