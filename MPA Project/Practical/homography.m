
function [H,invH]=homography(x1,y1,x2,y2)
%This function will find the homography between 4 points using svd



A= -1*[
-x1(1)  -y1(1)  -1   0    0    0   x1(1)*x2(1)   y1(1)*x2(1)   x2(1);
0    0    0 -x1(1)   -y1(1)  -1   x1(1)*y2(1)   y1(1)*y2(1)   y2(1);

-x1(2)  -y1(2)  -1   0    0    0   x1(2)*x2(2)   y1(2)*x2(2)   x2(2);
0    0    0 -x1(2)   -y1(2)  -1   x1(2)*y2(2)   y1(2)*y2(2)   y2(2);

-x1(3)  -y1(3)  -1   0    0    0   x1(3)*x2(3)   y1(3)*x2(3)   x2(3);
0    0    0 -x1(3)   -y1(3)  -1   x1(3)*y2(3)   y1(3)*y2(3)   y2(3);

-x1(4)  -y1(4)  -1   0    0    0   x1(4)*x2(4)   y1(4)*x2(4)   x2(4);
0    0    0 -x1(4)   -y1(4)  -1   x1(4)*y2(4)   y1(4)*y2(4)   y2(4)];

%get the last matrix to calculate homography matrix
[~,~,V] = svd(A);


H=V(:,9);
H=reshape(H,3,3);
%inverse of homography matrix
invH =inv(H);

end
