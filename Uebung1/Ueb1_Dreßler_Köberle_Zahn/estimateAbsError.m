%The function estimateAbsError takes as input a function
% f, a point x0 and an increment h (if h is not provided
% it defaults to (10^-6)*((10^-4)+abs(x0)) )
%
% It returns the estimated absolute Error near x0

function [eps_A, exit_flag] = estimateAbsError(f,x0,h)
exit_flag = 0;

%argument checks:

if nargin < 2
    error('more arguments required');
end

if nargin > 3
    error('too many arguments');
end

if nargin == 2 || h==0
   h = (10^-6)*((10^-4)+abs(x0));
end

%steps from 7 to 11 instead of 6 to 10 because the array starts with 1 (not
%0)
for p = 7:11
    temp = zeros(p,p);
    for k = 1:p
        %calculates the first coloum of the matrix usign
        %the functions output
        temp(k,1)=f(((k-1)*h)+x0);
    end
    
    for i = 2:p
        for j = 2:p-i+2
           %calculates the matrix-entries accordingly
           temp(j-1,i) = temp(j,i-1)-temp(j-1,i-1);
        end
    end

    k=-1;
    for i = 2:p
        corr = 0;
        for j = 2:p-i+1
           if sign(temp(j-1,i)) ~= sign(temp(j,i))
               %counts the number of sign changes
               corr = corr +1;
           end
        end
        %checks all the requirements for k
        if ((corr >= p-1-i && i>=p-1-3) || (corr >= floor(0.8*(p-1-i)) && i < p-1-3)) && (i >= 2) && (i <=p-1-2)
            k = i+1;
            break
        end
    end
    %if k was set (and thus satisfies the requirements) we break the loop
    if k > -1
        break
    end
end

if p > 10 || k == -1
    exit_flag = 1;
end

%the k that is used in this specific program is k-1 from 
%the assignment / script
eps_A = max(abs(temp(:,k)))/sqrt(nchoosek(2*(k-1),(k-1)));

end
