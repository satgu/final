Predictedvalue=[101.1383 101.0861 101.1716 101.1750 101.2407]
Classvalue=[100 100 100 100 100]
[c index] = min(abs(Predictedvalue-Classvalue(1)))


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