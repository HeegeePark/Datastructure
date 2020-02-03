#include <iostream>
#include <string>
#include <stdlib.h>
using namespace std;


int main() {
	string S;
	
	int nums[4];
	string num1, num2;
	int count = 0;
		
	cin >> nums[0] >> nums[1] >> nums[2] >> nums[3];


	// 두 정수를 문자열로 이어붙여 정수로 변환
	num1 = to_string(nums[0]) + to_string(nums[1]);
	num2 = to_string(nums[2]) + to_string(nums[3]);

	cout << stoll(num1) + stoll(num2) << "\n";

	system("pause");
	return 0;
}