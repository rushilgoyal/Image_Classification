function T2 = Test_Acc(a,b)

%A similar function is developed for test dataset which aims to calculate
%the percentage of characters predicted correctly by our model in the
%previously unseen (test) dataset

%Creating a variable 'Class' for original classes as before

Class = [1*ones(80,1);2*ones(80,1);3*ones(80,1);4*ones(80,1);5*ones(81,1);6*ones(80,1);7*ones(79,1);8*ones(80,1);9*ones(80,1);10*ones(80,1)];

%By referring to the func dist2, the squared Euclidean Distance between each
%feature value is calculated
D2 = dist2(a,b); 

%Sorting along the rows
[D2_sorted, D2_index] = sort (D2,2); 

C2=Class(D2_index(:,1)); %Predicts the class for this closest match

%Gives an array with the true classes for all characters in the test set
TrueTestClass=[1*ones(1,7) 2*ones(1,7) 3*ones(1,7) 4*ones(1,7) 5*ones(1,7) 6*ones(1,7) 7*ones(1,7) 8*ones(1,7) 9*ones(1,7) 10*ones(1,7)];

%The following commands reorders the variable TrueTestClass to reflect the sequence Matlab
%uses to analyze characters in.

load 'Reorder.mat'
TrueTestClass = TrueTestClass (ReorderIndex);
clear ReorderIndex;

%Transposing the matrix to verticle to make the dimensions comparable with C2 
TrueTestClass = TrueTestClass';

Err_Rate = C2 - TrueTestClass;

T2 = tabulate(Err_Rate);
