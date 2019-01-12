function worldImage=main(worldImage,perspectiveImage,x1,y1,x2,y2)
    
    %function to give boundary points of perspective image
    boundary_point=[1,1,1 ; size(perspectiveImage,1),1,1 ; 1,size(perspectiveImage,2),1;size(perspectiveImage,1),size(perspectiveImage,2),1];
    
    %function to calculate homography matrix
    [H,invH]=homography(y1,x1,y2,x2);
    
    %function to get boundary points for the resulatant perspective image
    point_new = perspective_points(boundary_point,invH);
    
    %function to calculate offset
    [minx,miny,maxx,maxy]=offset(point_new,worldImage);

    %function to create world image canvas and set previous world image and
    %perspective image
    worldImage=creating_world_image(worldImage,perspectiveImage,minx,miny,maxx,maxy,H);


    %to show figure
     figure; imshow(worldImage);
    


end