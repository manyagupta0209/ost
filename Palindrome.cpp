#include <iostream>
using namespace std;

int main() {
    string str;
    cout << "Enter a word/number: ";
    cin >> str;

    string rev = string(str.rbegin(), str.rend());

    if (str == rev)
        cout << str << " is a Palindrome" << endl;
    else
        cout << str << " is NOT a Palindrome" << endl;

    return 0;
}
