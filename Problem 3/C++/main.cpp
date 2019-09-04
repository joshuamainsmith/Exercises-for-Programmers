#include <iostream>
#include <string>

using namespace std;

int main()
{
	char quote[100], author[20];

	cout << "What is the quote? ";
	cin.getline(quote, 100);

	cout << endl << "Who said it? ";
	cin.getline(author, 20);

	cout << author << " says, " << "\"" << quote << "\"" << endl;

	system("pause");

	return 0;
}