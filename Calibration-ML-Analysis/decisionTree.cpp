#include<iostream>
#include<vector>
#include<string>
#include<fstream>
#include<sstream>
int main()
{
	std::string line, value;
	std::ifstream infile("RawData.csv");
	
	std::vector<std::string> cols;
	std::vector<std::vector<double>> data;

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
	for(auto s : cols)
	{
		std::cout<<s<<" ";
	}
	
	

	return 0;
}

