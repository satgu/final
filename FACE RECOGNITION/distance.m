Predictedvalue=[48	131	37.0135	34.3402	31.1207	39.4906	7.5166];
Classvalue=[101];
doublegap = min(abs(Predictedvalue-Classvalue(1)))


clc;
% Sample data
numberOfRows = 5;
Classvalue = rand(numberOfRows, 1)
Predictedvalue = rand(numberOfRows, 1)
% Find min distance
minDistance = inf;
for ni = 1 : numberOfRows
	for vi = 1 : numberOfRows
		distances(vi, ni) = abs(Predictedvalue(ni) - Classvalue(vi));
		if distances(vi, ni) < minDistance
			minPredictedvalueRow = ni;
			minClassvalueRow = vi;
			minDistance = distances(vi, ni);
		end
	end
end
% Report to command window:
distances
fprintf('Closest distance is %f which occurs between row %d of Predictedvalue and row %d of Classvalue\n',...
	minDistance, minPredictedvalueRow, minClassvalueRow);