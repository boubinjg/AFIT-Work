data = fullMat;

firstQ = data(1:144,:);
secondQ = data(145:288,:);
thirdQ = data(289:432,:);
fourthQ = data(433:end,:);

firstQi = [secondQ; thirdQ; fourthQ;];
secondQi = [firstQ; thirdQ; fourthQ;];
thirdQi = [firstQ; secondQ; fourthQ;];
fourthQi = [firstQ; secondQ; thirdQ;];

firstTree = TreeBagger(15, firstQi, firstQi(:,16));
firstFit = predict(firstTree, firstQ);

secondTree = TreeBagger(15, secondQi, secondQi(:,16));
secondFit = predict(secondTree, secondQ);

thirdTree = TreeBagger(15, thirdQi, thirdQi(:,16));
thirdFit = predict(thirdTree, thirdQ);

fourthTree = TreeBagger(15, thirdQi, thirdQi(:,16));
fourthFit = predict(fourthTree, fourthQ);

predictionSet = [firstFit; secondFit; thirdFit; fourthFit];

prediction = str2double(predictionSet);