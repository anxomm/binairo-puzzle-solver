% Fill the rest of the positions not given by 'domain.lp'

value(0;1).
pos(0..N-1,0..N-1) :- dim(N).

% Generate a 0 or a 1 for each pos(x,y) whose cell(x,y,_) does not exist
1 {cell(X,Y,V) : value(V)} 1 :- pos(X,Y), cell(X',Y',_), X!=X', Y!=Y'.

%
% 1.1. Each row must contain the same number of circles of each color.
%

% Cannot be the case that the number of 0's and the number of 1's are different
% for the X row along the columns Yi
:- #count{Yi: cell(X,Yi,0)}=M, #count{Yi: cell(X,Yi,1)}=M', pos(X,_), M!=M'.

%
% 1.2. Each column must contain the same number of circles of each color.
%

% Cannot be the case that the number of 0's and the number of 1's are different
% for the Y column along the rows Xi
:- #count{Xi: cell(Xi,Y,0)}=M, #count{Xi: cell(Xi,Y,1)}=M', pos(_,Y), M!=M'.

%
% 2.1. There cannot be more than 2 consecutive circles of the same color in horizontal.
%
:- cell(X,Y,V), cell(X-1,Y,V), cell(X+1,Y,V).

%
% 2.2. There cannot be more than 2 consecutive circles of the same color in vertical.
%
:- cell(X,Y,V), cell(X,Y-1,V), cell(X,Y+1,V).

%
% 3.1. There cannot be two rows with the same configuration.
%

% For two different rows X and X', the number of similar values along the columns Yi
% cannot be equal to the dimension (all columns)
:- pos(X,_), pos(X',_), X!=X', dim(N), #count{Yi: cell(X,Yi,V), cell(X',Yi,V'), V=V'}=M, M=N.

%
% 3.2. There cannot be two columns with the same configuration.
%

% For two different columns Y and Y', the number of equal values along the rows Xi
% cannot be equal to the dimension (all rows)
:- pos(_,Y), pos(_,Y'), Y!=Y', dim(N), #count{Xi: cell(Xi,Y,V), cell(Xi,Y',V'), V=V'}=M, M=N.


#show cell/3.