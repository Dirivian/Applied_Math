%% Neural Spiking

clear all;
%parpool; % Parallel computing because this takes a while
A = [0.98, 0.1,0 ;
    0.02, 0.7,0.05;
    0 , 0.2, 0.95;] ;
[T,L] =eigs(A);
prb =T(:,1);
probin =[prb(1)+prb(2);prb(3);];
probin =probin./sum(probin);
B = [0.9 0.1 0; 0.1 0.6 0.1; 0 0.3 0.9;];
[T,L] =eigs(B);
prb =T(:,1);
probout =[prb(1)+prb(2);prb(3);];
probout =probout./sum(probout);
Popenout= probout(1);
Popenin=probout(1);
Nin = 100;
Nout =50;
parfor T=0:1:Nin-1
    sum=0;
    for w = 0:1:Nout
        sum=sum+ binopdf(w, Nout,Popenout)*(1-binocdf(T+w, Nin,Popenin));
        if T+w>Nin
            break;
        end
    end
    p(T+1) =sum;
end
Nin = 10;
Nout =5;
parfor T=0:1:Nin-1
    sum=0;
    for w = 0:1:Nout
        sum=sum+ binopdf(w, Nout,Popenin)*(1-binocdf(T+w, Nin,Popenout));
        if T+w>Nin
            break;
        end
    end
    p2(T+1) =sum;
end

% Nin = 1000;
% Nout =500;
% parfor T=0:1:Nin-1
%     sum=0;
%     for w = 0:1:Nout
%         sum=sum+ binopdf(w, Nout,Popenin)*(1-binocdf(T+w, Nin,Popenout));
%         if T+w>Nin
%             break;
%         end
%     end
%     p3(T+1) =sum;
% end
%%
 