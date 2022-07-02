%ME 4720
%HW 2 Problem 1

%% Initialize Program
clearvars; clc; disp("Problem 1")

%% Extra
A = sym('T_A'); B = sym('T_B'); C = sym('T_C'); D = sym('T_D');

%% Initial Temperature Guesses
T = ones(4,1);
T(1) = input("TA initial guess? ");
T(2) = input("TB initial guess? ");
T(3) = input("TC initial guess? ");
T(4) = input("TD initial guess? ");

%% Residuals
R = ones(4,1);
R(1) = abs(1000+T(2)-4*T(1));
R(2) = abs(600+T(1)+T(3)-4*T(2));
R(3) = abs(600+T(2)+T(4)-4*T(3));
R(4) = abs(600+2*T(3)-4*T(4));

%% Largest Residual
[residual, index] = max(R);

%% Iteration Count
iterations = 0;

%% Loop
while residual > 0.1
    if(index==1)
        T(1) = 0.25*(1000+T(2));
        R(1) = abs(1000+T(2)-4*T(1));
        R(2) = abs(600+T(1)+T(3)-4*T(2));
        [residual, index] = max(R);
        iterations = iterations + 1;

    elseif(index==2)
        T(2) = 0.25*(600+T(1)+T(3));
        R(1) = abs(1000+T(2)-4*T(1));
        R(2) = abs(600+T(1)+T(3)-4*T(2));
        R(3) = abs(600+T(2)+T(4)-4*T(3));
        [residual, index] = max(R);
        iterations = iterations + 1;

    elseif(index==3)
        T(3) = 0.25*(600+T(2)+T(4));
        R(2) = abs(600+T(1)+T(3)-4*T(2));
        R(3) = abs(600+T(2)+T(4)-4*T(3));
        R(4) = abs(600+2*T(3)-4*T(4));
        [residual, index] = max(R);
        iterations = iterations + 1;

    elseif(index==4)
        T(4) = 0.25*(600+2*T(3));
        R(3) = abs(600+T(2)+T(4)-4*T(3));
        R(4) = abs(600+2*T(3)-4*T(4));
        [residual, index] = max(R);
        iterations = iterations + 1;

    elseif residual < 0.1
        break
    end
end

%% Results
node = ["A" "B" "C" "D"]';
Node = char(node);
Temperature = T;
Residual = R;

%Display Iterations
it = ['After ', num2str(iterations), ' iterations'];
disp(it)

%Table Results
Prob_1 = table(Node, Temperature, Residual);
disp(Prob_1)

%Print
publish('HW2_P1.m','evalCode',false);
