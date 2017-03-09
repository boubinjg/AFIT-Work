data = fullMat;

firstQ = data(1:144,:);
secondQ = data(145:288,:);
thirdQ = data(289:432,:);
fourthQ = data(433:end,:);

firstQi = [secondQ; thirdQ; fourthQ;];
secondQi = [firstQ; thirdQ; fourthQ;];
thirdQi = [firstQ; secondQ; fourthQ;];
fourthQi = [firstQ; secondQ; thirdQ;];

names = {'Score','reliability','ISA', 'TLX Mental','TLX Physical','TLX Temporal','TLX Frustration','TLX Effort','TLX Performance','Trust Question','Compliance','Percv Reliability'};
TLXnames = {'Score','reliability','ISA','Trust Question','Compliance','Percv Reliability'};

%classify first tree
sTree = classregtree(firstQi(:,[3 5:6 7:12 14:15 17]), firstQi(:,16), 'Names', {'Score','reliability','ISA', 'TLX Mental','TLX Physical','TLX Temporal','TLX Frustration','TLX Effort','TLX Performance','Trust Question','Compliance','Percv Reliability'});
view(sTree)

classifTLX = zeros(144,1);
for i = 1:144
    FirstQclassifTLX(i,1) = eval(sTree, firstQ(i,[3 5:6 7:12 14:15 17])); 
end


sTree = classregtree(firstQi(:,[3 5:6 14:15 17]), firstQi(:,16), 'Names', {'Score','reliability','ISA','Trust Question','Compliance','Percv Reliability'});
view(sTree)

classif = zeros(144,1);
for i = 1:144
    FirstQclassif(i,1) = eval(sTree, firstQ(i,[3 5:6 14:15 17]));
end

%classify second tree
sTree = classregtree(secondQi(:,[3 5:6 7:12 14:15 17]), secondQi(:,16), 'Names', {'Score','reliability','ISA', 'TLX Mental','TLX Physical','TLX Temporal','TLX Frustration','TLX Effort','TLX Performance','Trust Question','Compliance','Percv Reliability'});
view(sTree)

classifTLX = zeros(144,1);
for i = 1:144
    SecondQclassifTLX(i,1) = eval(sTree, secondQ(i,[3 5:6 7:12 14:15 17])); 
end


sTree = classregtree(secondQi(:,[3 5:6 14:15 17]), secondQi(:,16), 'Names', {'Score','reliability','ISA','Trust Question','Compliance','Percv Reliability'});
view(sTree)

classif = zeros(144,1);
for i = 1:144
    SecondQclassif(i,1) = eval(sTree, secondQ(i,[3 5:6 14:15 17]));
end

%classify third tree
sTree = classregtree(thirdQi(:,[3 5:6 7:12 14:15 17]), thirdQi(:,16), 'Names', {'Score','reliability','ISA', 'TLX Mental','TLX Physical','TLX Temporal','TLX Frustration','TLX Effort','TLX Performance','Trust Question','Compliance','Percv Reliability'});
view(sTree)

classifTLX = zeros(144,1);
for i = 1:144
    ThirdQclassifTLX(i,1) = eval(sTree, thirdQ(i,[3 5:6 7:12 14:15 17])); 
end


sTree = classregtree(thirdQi(:,[3 5:6 14:15 17]), thirdQi(:,16), 'Names', {'Score','reliability','ISA','Trust Question','Compliance','Percv Reliability'});
view(sTree)

classif = zeros(144,1);
for i = 1:144
    ThirdQclassif(i,1) = eval(sTree, thirdQ(i,[3 5:6 14:15 17]));
end

%classify third tree
sTree = classregtree(fourthQi(:,[3 5:6 7:12 14:15 17]), fourthQi(:,16), 'Names', {'Score','reliability','ISA', 'TLX Mental','TLX Physical','TLX Temporal','TLX Frustration','TLX Effort','TLX Performance','Trust Question','Compliance','Percv Reliability'});
view(sTree)

classifTLX = zeros(144,1);
for i = 1:144
    FourthQclassifTLX(i,1) = eval(sTree, fourthQ(i,[3 5:6 7:12 14:15 17])); 
end


sTree = classregtree(fourthQi(:,[3 5:6 14:15 17]), fourthQi(:,16), 'Names', {'Score','reliability','ISA','Trust Question','Compliance','Percv Reliability'});
view(sTree)

classif = zeros(144,1);
for i = 1:144
    FourthQclassif(i,1) = eval(sTree, fourthQ(i,[3 5:6 14:15 17]));
end