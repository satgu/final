function [predictedNumber]=classPrediction(binaryImage)
load('net.mat')

featureData=getFeatures(binaryImage);
featureReshape=reshape(featureData,[8,1])
y=net(featureReshape);


display(y);
% reshape nn result
reshapedY=reshape(y,[1,8]);
matchedPattern=findPattern(reshapedY);
display('this is pattern');
display(mat2str(matchedPattern))

% class prediction based on nn result
predictionResponse=getNumber(matchedPattern);
display(strcat('predicted number:',predictionResponse));
predictedNumber=predictionResponse;

end