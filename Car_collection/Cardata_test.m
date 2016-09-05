clear;

% read data file
    path ='./Car_collection_data/';
    r = dir(path);
                    
    len_r = size(r,1);
    
    acc_total=[];
    gps_total=[];
    
  for i = 3:len_r
      
      %initial new empty temparay store
            GPS=[];
            acc=[];
            gps_data=[];
%       load one data file 1.time 2.3.4 3-axis acce 5.6 GPS
            newPath = strcat(path,r(i).name);    
            xd_all = load(newPath);
        
            GPS(:,1)=xd_all(:,5);
            GPS(:,2)=xd_all(:,6);
            
            acc(:,1)=xd_all(:,2);
            acc(:,2)=xd_all(:,3);
            acc(:,3)=xd_all(:,4);
            
            
            id=GPS(:,2)==0 & GPS(:,1)==0;  
            GPS(id,:)=[]; 
            
           [gps_data(:,1),gps_data(:,2),z] = wgs2utm(GPS(:,1),GPS(:,2));
           
           
%            utmzone='56 H'; %Sysney for 56 H
%            [lat,lon]=TurntoGPS(gps_data(:,1),gps_data(:,2),utmzone);
           
        acc_total=[acc_total' acc']';
        gps_total=[gps_total' gps_data']';




%            totalLength = size(xd_all,1);
%            halfLength = floor(totalLength/2);
%            train_set = (xd_all(1:halfLength,1:2));
%            test_set  = (xd_all(halfLength+1:end,1:2));
           
           
           savefile = strcat(int2str(len_r-2),'_car_acc_gps.mat');
           save(savefile,'acc_total','gps_total');



  end 