function [predictedNumber]=numberPrediction(binaryImage)
load('net.mat')

featureData=getFeatures(binaryImage);
% pattern=getnumberpattern('a');
featureReshape=reshape(featureData,[8,1])
y=net(featureReshape);


disp(y);
% reshape nn result
reshapedY=reshape(y,[1,36]);
matchedPattern=findPattern(reshapedY);
disp('this is pattern');
disp(mat2str(matchedPattern))

% number prediction based on nn result
predictionRes=getNumber(matchdPattern);
disp(strcat('predicted number:',predictionRes));
predictedNumber=predictionRes;

end