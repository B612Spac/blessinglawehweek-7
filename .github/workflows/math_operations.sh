#!/bin/bash

#prompt user for number

read -p -r "Enter number 1: " num1
read -p -r  "Enter number 2: " num2

#request operation from user

echo "choose an operation"
echo "1. Sum (+)"
echo "2. Subtraction (-)"
echo "3. Multiplication (*)"
echo "4. Division (/)"

#prompt user for operation

read -p -r  "Enter operation 1-4: " operation

#using case statement

case $operation in

	1)
		result=$((num1 + num2))
		echo "Sum is: $result"
		;;
	2)
		result=$((num1 - num2))
		echo "Subtraction is: $result"
		;;
	3)	
		result=$((num1 * num2))
		echo "Multiplication is: $result"
		;;
	4)
		if [ "$num2" -ne 0 ]; then	       
      			result=$((num1 / num2))
       			echo "Division is: $result"
      		else
			echo "Division by zero"
      		fi 
     		;;
	*)
      		echo "Invalid operation selected"
      		;;
esac
