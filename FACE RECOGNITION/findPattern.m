function [pattern]=findPattern(data)
% display data
highest =data(1);
highestIndex =data(1);
patternArray=zeros(1,36);
for a=2: size(data,2)
   
    if data(a)>highest
        highest=data(a);
        highestIndex=a;
    end
end
disp(strcat('highest index:',num2str(highestIndex)))
disp(strcat('highest num:',num2str(highestIndex)))
disp(strcat('11th num :',num2str(data(1))));

% generate pattern

for a=1; size(patternArray,2)
    if a==highestIndex
        patternArray(1,a)=1;
    end
end 
pattern=patternArray;