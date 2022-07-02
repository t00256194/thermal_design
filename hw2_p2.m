%ME 4720
%HW 2 Problem 2

%% Initialize Program
clearvars; clc; disp("Problem 2")


%% Initial Temperature Guesses
T = ones(12,1);
T(1) = input("T1 initial guess? ");
T(2) = input("T2 initial guess? ");
T(3) = input("T3 initial guess? ");
T(4) = input("T4 initial guess? ");
T(5) = input("T5 initial guess? ");
T(6) = input("T6 initial guess? ");
T(7) = input("T7 initial guess? ");
T(8) = input("T8 initial guess? ");
T(9) = input("T9 initial guess? ");
T(10) = input("T10 initial guess? ");
T(11) = input("T11 initial guess? ");
T(12) = input("T12 initial guess? ");

%% Residuals
R = ones(12,1);
R(1) = abs(215-8*T(1)+2*T(2)+4*T(4));
R(2) = abs(2*T(1)-8*T(2)+2*T(3)+4*T(5)+15);
R(3) = abs(2*T(2)-9*T(3)+2*T(6)+107.5);
R(4) = abs(T(1)-4*T(4)+T(5)+T(7)+100);
R(5) = abs(T(2)+T(4)-4*T(5)+T(6)+T(8));
R(6) = abs(T(3)+2*T(5)+T(9)+100-9*T(6));
R(7) = abs(T(4)-4*T(7)+T(8)+T(10)+100);
R(8) = abs(T(5)+T(7)+T(9)+T(11)-4*T(8));
R(9) = abs(T(6)+2*T(8)+T(12)+100-9*T(9));
R(10) = abs(2*T(7)+T(11)+100-4*T(10));
R(11) = abs(2*T(8)+T(10)+T(12)-4*T(11));
R(12) = abs(T(9)+T(11)+50-4.5*T(12));

%% Largest Residual
[residual, index] = max(R);

%% Iteration Count
iterations = 0;

%% Loop
while residual > 0.1
    if(index==1)
        T(1) = (215+2*T(2)+4*T(4))/8;
        R(1) = abs(215-8*T(1)+2*T(2)+4*T(4));
        R(2) = abs(2*T(1)-8*T(2)+2*T(3)+4*T(5)+15);
        R(4) = abs(T(1)-4*T(4)+T(5)+T(7)+100);
        [residual, index] = max(R);
        iterations = iterations + 1;

    elseif(index==2)
        T(2) = (2*T(1)+2*T(3)+4*T(5)+15)/8;
        R(1) = abs(215-8*T(1)+2*T(2)+4*T(4));
        R(2) = abs(2*T(1)-8*T(2)+2*T(3)+4*T(5)+15);
        R(3) = abs(2*T(2)-9*T(3)+2*T(6)+107.5);
        R(5) = abs(T(2)+T(4)-4*T(5)+T(6)+T(8));
        [residual, index] = max(R);
        iterations = iterations + 1;

    elseif(index==3)
        T(3) = (2*T(2)+2*T(6)+107.5)/9;
        R(2) = abs(2*T(1)-8*T(2)+2*T(3)+4*T(5)+15);
        R(3) = abs(2*T(2)-9*T(3)+2*T(6)+107.5);
        R(6) = abs(T(3)+2*T(5)+T(9)+100-9*T(6));
        [residual, index] = max(R);
        iterations = iterations + 1;

    elseif(index==4)
        T(4) = (T(1)+T(5)+T(7)+100)/4;
        R(1) = abs(215-8*T(1)+2*T(2)+4*T(4));
        R(4) = abs(T(1)-4*T(4)+T(5)+T(7)+100);
        R(5) = abs(T(2)+T(4)-4*T(5)+T(6)+T(8));
        R(7) = abs(T(4)-4*T(7)+T(8)+T(10)+100);
        [residual, index] = max(R);
        iterations = iterations + 1;

    elseif(index==5)
        T(5) = (T(2)+T(4)+T(6)+T(8))/4;
        R(2) = abs(2*T(1)-8*T(2)+2*T(3)+4*T(5)+15);
        R(4) = abs(T(1)-4*T(4)+T(5)+T(7)+100);
        R(5) = abs(T(2)+T(4)-4*T(5)+T(6)+T(8));
        R(6) = abs(T(3)+2*T(5)+T(9)+100-9*T(6));
        R(8) = abs(T(5)+T(7)+T(9)+T(11)-4*T(8));
        [residual, index] = max(R);
        iterations = iterations + 1;

    elseif(index==6)
        T(6) = (T(3)+2*T(5)+T(9)+100)/9;
        R(3) = abs(2*T(2)-9*T(3)+2*T(6)+107.5);
        R(5) = abs(T(2)+T(4)-4*T(5)+T(6)+T(8));
        R(6) = abs(T(3)+2*T(5)+T(9)+100-9*T(6));
        R(9) = abs(T(6)+2*T(8)+T(12)+100-9*T(9));
        [residual, index] = max(R);
        iterations = iterations + 1;

    elseif(index==7)
        T(7) = (T(4)+T(8)+T(10)+100)/4;
        R(4) = abs(T(1)-4*T(4)+T(5)+T(7)+100);
        R(7) = abs(T(4)-4*T(7)+T(8)+T(10)+100);
        R(8) = abs(T(5)+T(7)+T(9)+T(11)-4*T(8));
        R(10) = abs(2*T(7)+T(11)+100-4*T(10));
        [residual, index] = max(R);
        iterations = iterations + 1;

    elseif(index==8)
        T(8) = (T(5)+T(7)+T(9)+T(11))/4;
        R(5) = abs(T(2)+T(4)-4*T(5)+T(6)+T(8));
        R(7) = abs(T(4)-4*T(7)+T(8)+T(10)+100);
        R(8) = abs(T(5)+T(7)+T(9)+T(11)-4*T(8));
        R(9) = abs(T(6)+2*T(8)+T(12)+100-9*T(9));
        R(11) = abs(2*T(8)+T(10)+T(12)-4*T(11));
        [residual, index] = max(R);
        iterations = iterations + 1;

    elseif(index==9)
        T(9) = (T(6)+2*T(8)+T(12)+100)/9;
        R(6) = abs(T(3)+2*T(5)+T(9)+100-9*T(6));
        R(8) = abs(T(5)+T(7)+T(9)+T(11)-4*T(8));
        R(9) = abs(T(6)+2*T(8)+T(12)+100-9*T(9));
        R(12) = abs(T(9)+T(11)+50-4.5*T(12));
        [residual, index] = max(R);
        iterations = iterations + 1;

    elseif(index==10)
        T(10) = (2*T(7)+T(11)+100)/4;
        R(7) = abs(T(4)-4*T(7)+T(8)+T(10)+100);
        R(10) = abs(2*T(7)+T(11)+100-4*T(10));
        R(11) = abs(2*T(8)+T(10)+T(12)-4*T(11));
        [residual, index] = max(R);
        iterations = iterations + 1;

    elseif(index==11)
        T(11) = (2*T(8)+T(10)+T(12))/4;
        R(8) = abs(T(5)+T(7)+T(9)+T(11)-4*T(8));
        R(10) = abs(2*T(7)+T(11)+100-4*T(10));
        R(11) = abs(2*T(8)+T(10)+T(12)-4*T(11));
        R(12) = abs(T(9)+T(11)+50-4.5*T(12));
        [residual, index] = max(R);
        iterations = iterations + 1;

    elseif(index==12)
        T(12) = (T(9)+T(11)+50)/4.5;
        R(9) = abs(T(6)+2*T(8)+T(12)+100-9*T(9));
        R(11) = abs(2*T(8)+T(10)+T(12)-4*T(11));
        R(12) = abs(T(9)+T(11)+50-4.5*T(12));
        [residual, index] = max(R);
        iterations = iterations + 1;

    elseif residual < 0.1
        break
    end
end

%% Results
node = ["T1" "T2" "T3" "T4" "T5" "T6" "T7" "T8" "T9" "T10" "T11" "T12"]';
Node = char(node);
Temperature = T;
Residual = R;

%% Display Iterations
it = ['After ', num2str(iterations), ' iterations'];
disp(it)

%% Table Results
Prob_2 = table(Node, Temperature, Residual);
disp(Prob_2)

%% Print
publish('HW2_P2.m','evalCode',false);

Published with MATLAB® R2018b
