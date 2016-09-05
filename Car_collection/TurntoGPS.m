function [Lat, Lon] = TurntoGPS( x,y ,z )
%TURNTOGPS By Wanli
%   Convert the vector to GPS point  [x, y] ([lat, lon])
% z is the utmzon




[n l]=size(x);

xx=reshape(x,[],1);
yy=reshape(y,[],1);

utmzone=[];

% utmzone=['30 T'; '32 T'; '11 S'; '28 R'; '15 S'; '51 R'];



for i=1:n*l
   utmzone=[utmzone;z];
end

[Lat,Lon] = utm2deg(xx,yy,utmzone);






end

