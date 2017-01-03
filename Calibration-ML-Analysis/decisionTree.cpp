#include<iostream>
#include<vector>
#include<string>
#include<fstream>
#include<sstream>
using dVec = std::vector<std::vector<double>>;
void readIn(std::vector<std::string>& cols, dVec& data)
{
	std::ifstream infile("RawData.csv");
	std::string line, value;
	std::getline(infile, line);
	std::istringstream iss(line);
	while(std::getline(iss, value, ','))
		cols.push_back(value);

	while(std::getline(infile, line))
	{
		std::istringstream iss(line);
		std::vector<double> d;
		
		while(std::getline(iss, value, ','))
			if(!value.empty())
				d.push_back(stod(value));
		data.push_back(d);
	}
}
void sanatize(dVec& data)
{
	for(auto it = data.begin(); it != data.end();)
	{
		if((*it)[1] <6 || (int)(*it)[1] % 2 == 1)
			it = data.erase(it);
		else
			it++;	
	}
}
int main()
{
	std::vector<std::string> cols;
	dVec data;
	//reads in data from the RawData.csv datasheet.
	readIn(cols, data);
	//remove certain irelevant datapoints (may be unnecessary depending on data)
	sanatize(data);
	
	for(auto &dv : data)
	{
		for(auto d : dv)
			std::cout<<d<<" ";
		std::cout<<std::endl;
	}

	return 0;
}

