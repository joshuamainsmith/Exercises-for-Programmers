#include <iostream>
#include <string>

using namespace std;

int main()
{
	string name;
	int count = 0;

	cout << "What is the input string? ";

	cin >> name;

	cout << name << " has " << name.length() << " characters." << endl;

	system("pause");

	return 0;
}