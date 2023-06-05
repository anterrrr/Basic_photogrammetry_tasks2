function [F] = FunFundamentalMatrix (P1, P2)
%% 函数解释：分解投影矩阵求解基础矩阵F
% P1 P2：投影矩阵 F：基础矩阵
    M1 = P1(:,1:3);m1=P1(:,4);
    M2 = P2(:,1:3);m2=P2(:,4);
    n = m2-M2*inv(M1)*m1;
    n = [0,-n(3),n(2);
         n(3),0,-n(1);
         -n(2),n(1),0];
     F=n*M2*inv(M1);
end

