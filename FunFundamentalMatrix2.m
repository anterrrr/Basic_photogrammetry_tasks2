function [F] = FunFundamentalMatrix2(pts1, pts2)
%% 函数解释：使用数值方法，根据已知匹配像点，求解基础矩阵F
%pts1 pts2：匹配像面点坐标  F：基础矩阵

    %参数初始化
    [row,~] = size(pts1);
    A = [];
    V = -ones([row,1]);

    for i=1:row
        %构造系数矩阵
        x1 = pts1(i,1);y1 = pts1(i,2);x2 = pts2(i,1);y2 = pts2(i,2);
        temp_A = [x1*x2,x1*y2,x1,y1*x2,y1*y2,y1,x2,y2];
        A = [A;temp_A];
    end
    F = inv(A.'*A)*A.'*V;
    F = [F;1];
    F = reshape(F,[3,3]);
end

