% % global A B C D ARaw BRaw CRaw DRaw t tloop i tloop f1 fid
% A1(i,:)=length(A);
% assignin('base', 'A1', A1);
% 
% if i>1
%     for j=1:125
%         A2(i,j)=mean(A((i-2)*125+j:(i-1)*125+j));
%     end
%     assignin('base', 'A2', A2);
%     A3=reshape(A2',1,[]);
%     assignin('base', 'A3', A3);
% 
% 
%     if i*tloop<10
%         plot(fig1,t,A)
%         xlim(fig1,[0 i*tloop])
%         axis(axis)
%     else
%         plot(fig1,t(end-2500+1:end),A(end-2500+1:end))
%         xlim(fig1,[i*tloop-10 i*tloop])
%         axis(axis)
%     end
% 
%     %%%%%%%%%%%%%%%%%%%%%%
%     if i*tloop<10
%         plot(s1,t,ARaw)
%         xlim(s1,[0 i*tloop])
%         axis(axis)
%     else
%         plot(s1,t(end-2500+1:end),ARaw(end-2500+1:end))
%         xlim(s1,[i*tloop-10 i*tloop])
%         axis(axis)
%     end
% 
%     if i*tloop<10
%         plot(s2,t,A)
%         xlim(s2,[0 i*tloop])
%         axis(axis)
%     else
%         plot(s2,t(end-2500+1:end),A(end-2500+1:end))
%         xlim(s2,[i*tloop-10 i*tloop])
%         axis(axis)
%     end
% 
%     if i*tloop<10
%         plot(s3,t,A3)
%         xlim(s3,[0 i*tloop])
%         axis(axis)
%     else
%         plot(s3,t(end-2500+1:end),A3(end-2500+1:end))
%         xlim(s3,[i*tloop-10 i*tloop])
%         axis(axis)
%     end
% end

%-------------------------------------------------------------------------------------------------------------------------%
%------------------------------------------------------Mohammad Hoseyni---------------------------------------------------%
%-------------------------------------------------------------------------------------------------------------------------%

     if i*tloop<10
        plot(s1,t,A)
        xlim(s1,[0 i*tloop])
        axis(axis)
    else
        plot(s1,t(end-2500+1:end),A(end-2500+1:end))
        xlim(s1,[i*tloop-10 i*tloop])
        axis(axis)
     end
     
      if i*tloop<10
        plot(s2,t,B)
        xlim(s2,[0 i*tloop])
        axis(axis)
    else
        plot(s2,t(end-2500+1:end),B(end-2500+1:end))
        xlim(s2,[i*tloop-10 i*tloop])
        axis(axis)
     end   
  %  * * * * * * * * * * * * * * * * * *
   
Adn1 = wdenoise(A,6,'Wavelet','db1','DenoisingMethod','UniversalThreshold');
Bdn1 = wdenoise(B,6,'Wavelet','db1','DenoisingMethod','UniversalThreshold');
Adn = wdenoise(Adn1,6,'Wavelet','coif1','DenoisingMethod','UniversalThreshold');
Bdn = wdenoise(Bdn1,6,'Wavelet','coif1','DenoisingMethod','UniversalThreshold');

w = 2500 ;
A0 = smoothdata(Adn,"movmedian",w);
B0 = smoothdata(Bdn,"movmedian",w);
Adt = Adn - A0;
Bdt = Bdn - B0;

movavg = 1/20*ones(20,1);
y1 = filtfilt(movavg,1,Adt);
y2 = filtfilt(movavg,1,Bdt);

sy2 = delayseq(y2',55) ;

% * * * * * * * * * * * * * * * * * * * * *
    % plotting y1 & y2

     if i*tloop<10
         %channel A: Adn
         plot(s11,t,Adn)
         title('channel A: Adn')
         xlim(s11,[0 i*tloop])
         axis(axis)
         %channel A: A0 median
         plot(s21,t,Adt)
         title('channel A: Adt median')
         xlim(s21,[0 i*tloop])
         axis(axis)
         %channel A:  final
         plot(s31,t,y1)
         title('channel A: final')
         xlim(s31,[0 i*tloop])
         axis(axis)
     else
        %channel A: Adn
         plot(s11,t(end-2500+1:end),Adn(end-2500+1:end))
         title('channel A: Adn')
         xlim(s11,[0 i*tloop])
         axis(axis)
         %channel A: A0 median
         plot(s21,t(end-2500+1:end),Adt(end-2500+1:end))
         title('channel A: A0 median')
         xlim(s21,[0 i*tloop])
         axis(axis)
         %channel A:  final
         plot(s31,t(end-2500+1:end),y1(end-2500+1:end))
         title('channel A: final')
         xlim(s31,[0 i*tloop])
         axis(axis)
     end
     
      if i*tloop<10
        %channel B: Bdn
         plot(s12,t,Bdn)
         title('channel B: Bdn')
         xlim(s12,[0 i*tloop])
         axis(axis)
         %channel B: B0 median
         plot(s22,t,Bdt)
         title('channel B: Bdt median')
         xlim(s22,[0 i*tloop])
         axis(axis)
         %channel B:  final
         plot(s32,t,y2)
         title('channel B: final')
         xlim(s32,[0 i*tloop])
         axis(axis)
    else
        %channel B: Bdn
         plot(s12,t(end-2500+1:end),Bdn(end-2500+1:end))
         title('channel B: Bdn')
         xlim(s12,[0 i*tloop])
         axis(axis)
         %channel B: B0 median
         plot(s22,t(end-2500+1:end),Bdt(end-2500+1:end))
         title('channel B: B0 median')
         xlim(s22,[0 i*tloop])
         axis(axis)
         %channel B:  final
         plot(s32,t(end-2500+1:end),y2(end-2500+1:end))
         title('channel B: final')
         xlim(s32,[0 i*tloop])
         axis(axis)
     end   

