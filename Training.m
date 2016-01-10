
function T1 = Training_Acc(a,b)

%Implementing a function to calculate the training accuracy
 
%Training accuracy can be determined by the percentage of '0'.
% A value of '0' means that the class is same in the original as well as
% the predicted class of training dataset.

%preparing class variable for character image 
% 1 stands for ëaí, 2 stands for ëdí, 3 for ëmí.....

Class = [1*ones(80,1);2*ones(80,1);3*ones(80,1);4*ones(80,1);5*ones(81,1);6*ones(80,1);7*ones(79,1);8*ones(80,1);9*ones(80,1);10*ones(80,1)];

%By referring to the func dist2, the squared Euclidean Distance between each
%feature value is calculated
D1 = dist2(a,b); 

%Sorts along the rows in ascending order
[D1_sorted, D1_index] = sort (D1,2); 

%Predicts the class for the second closest match
%Second nearest is chosen because, eac feature value will be nearest to its
%own feature value

C1=Class(D1_index(:,2)); 

Err_Rate = Class - C1;

T1 = tabulate(Err_Rate);
