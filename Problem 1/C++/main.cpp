#include <iostream>
#include <string>

using namespace std;

int main()
{
	cout << "What is your name? ";

	string name;

	cin >> name;

	cout << "Hello, " << name << ", nice to meet you!" << endl;

	system("pause");

	return 0;
}