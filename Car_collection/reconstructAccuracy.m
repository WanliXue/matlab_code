function accuracy=reconstructAccuracy(xData,Psi)
% calcualte differnt Psi error

accuracy=[];


[limit ~]=size(Psi);

ratio=[ 0.1 0.2 0.3 0.4 0.5 0.6];
% ratio=[0.1 0.3 ];
m=ratio*limit;

 eps = 0.001;
 
 t_x=[];
count=0;

for noProjCount=1:length(m)
Err=[];
noProj=m(noProjCount);

  [U,~,~] = svd(Psi);
Phi = U(:,1:noProj)';   
  

     
  for i=1:size(xData,2) %one data segment nx1
      
      tempX=xData(:,i);
      
      y=Phi*tempX;
      
        if ~isnan(Phi*Psi)
            
            theta0 = pinv(Phi*Psi)*y;
            theta_hat = l1qc_logbarrier(theta0, Phi*Psi, [], y, eps, 1e-3);
            if length(find(theta_hat ~= 0)) == 0
                xp = ones(m,1);
            else
                xp = Psi*theta_hat;
%                 t_x(:,count*18+i)=xp;
            end
            %theta_hat = l1eq_pd(theta0, theta*D, [], y);
        else
            xp = zeros(m,1);
        end

% avoid tempX to be zero
countT=1;
tErr=[];
for t=1:length(tempX)
    a=tempX(t);
    b=xp(t);
    if(a~=0)  
       tErr(countT)=abs(a-b)/abs(a);
       countT=countT+1;
    end
    
end
 
       Err(i)=mean(tErr);   %for one ratio, the erro mean
 
  end %end of data circle
  count=count+1;
  Err_diffPhi(:,count)=mean(Err);
  Std_diffPhi(:,count)=std(Err);


end %no of projection

accuracy=[ Err_diffPhi' Std_diffPhi'];

end

