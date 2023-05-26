# Bootcamp: 100 Days of Code: The Complete Python Pro Bootcamp for 2023

                                                                # Day 1: 

                                                        # Exercise 1 - Printing

print("Day 1 - Python Print Function\nThe function is declared like this:\nprint('what to print')" )

                                                        # Exercise 2 - Debugging Practice

#Fix the code below 👇

print("Day 1 - String Manipulation")
print('String Concatenation is done with the "+" sign.')
print('e.g. print("Hello " + "world")')
print("New lines can be created with a backslash and n.")

                                                        # Exercise 3 - Input Function

#Write your code below this line 👇

print(len(input("What is your name? ")))

                                                        #Exercise 4 - Variables 

# 🚨 Don't change the code below 👇
a = input("a: ")
b = input("b: ")
# 🚨 Don't change the code above 👆

####################################
#Write your code below this line 👇

aux = a
a = b
b = aux

#Write your code above this line 👆
####################################

# 🚨 Don't change the code below 👇
print("a: " + a)
print("b: " + b)

                                                                # Day 2: 
                            
                                                        # Exercise 1 - Data Types 

# 🚨 Don't change the code below 👇
two_digit_number = input("Type a two digit number: ")
# 🚨 Don't change the code above 👆

####################################
#Write your code below this line 👇

#print(type(two_digit_number))

num_1 = two_digit_number[0]
num_2 = two_digit_number[1]

num = int(num_1)
num2 = int(num_2)

print(num + num2)

                                                        # Exercise 2 - BMI Calculator
# 🚨 Don't change the code below 👇
height = input("enter your height in m: ")
weight = input("enter your weight in kg: ")
# 🚨 Don't change the code above 👆

#Write your code below this line 👇

IBM = int(float(weight) / (float(height) ** 2))

print(IBM)


                                                        # Exercise 3 - Life in Weeks 

# 🚨 Don't change the code below 👇
age = input("What is your current age? ")
# 🚨 Don't change the code above 👆

#print(type(age))

#Write your code below this line 👇

years = 1
months = 12
weeks = 52
days = 365

total_years = years * 90

total_month = months * total_years
total_weeks = weeks * total_years
total_days = days * total_years

years_user = int(age) #print(type(years_user))

months_user = months * years_user
weeks_user = weeks * years_user
days_user = days * years_user

months_remaining = total_month - months_user
weeks_remaining = total_weeks - weeks_user 
days_remaining = total_days - days_user

print(f"You have {days_remaining} days, {weeks_remaining} weeks, and {months_remaining} months left.")

                                                                # Day 3: 
                                                
                                                        # Exercise 1 - Odd or Even

# 🚨 Don't change the code below 👇
number = int(input("Which number do you want to check? "))
# 🚨 Don't change the code above 👆

#Write your code below this line 👇

if number % 2 == 0: 
    print("This is an even number.")
else:
    print("This is an odd number.")

                                                        # Exercise 2 - BMI 2.0

# 🚨 Don't change the code below 👇
height = float(input("enter your height in m: "))
weight = float(input("enter your weight in kg: "))
# 🚨 Don't change the code above 👆

#Write your code below this line 👇

IBM = int(float(weight) / (float(height) ** 2))

if IBM < 18.5:
    print("Your BMI is 18, you are underweight.")
elif IBM > 18.5 and IBM < 25:
    print("Your BMI is 23, you have a normal weight.")
elif IBM > 25 and IBM < 30:
    print("Your BMI is 29, you are slightly overweight.")
elif IBM > 30 and IBM < 35:
    print("Your BMI is 33, you are obese.")
else: 
    print("Your BMI is 40, you are clinically obese.")

                                                        # Exercise 3 - Leap Year  

# 🚨 Don't change the code below 👇
year = int(input("Which year do you want to check? "))
# 🚨 Don't change the code above 👆

#Write your code below this line 👇

if year % 4 == 0: 
    if year % 100 == 0:
        if year % 400 == 0:
            print("Leap year.")
        else:
            print("Not leap year.")
    else:
        print("Leap year.")
else: 
    print("Not leap year.")

                                                        # Exercise 4 - Pizza Order Practice   

# 🚨 Don't change the code below 👇
print("Welcome to Python Pizza Deliveries!")
size = input("What size pizza do you want? S, M, or L ")
add_pepperoni = input("Do you want pepperoni? Y or N ")
extra_cheese = input("Do you want extra cheese? Y or N ")
# 🚨 Don't change the code above 👆

#Write your code below this line 👇

bill = 0

if size == 'S': 
    bill += 15
elif size == 'M':
    bill += 20
elif size == 'L':
    bill += 25
else: 
    print('You have not got choose an option.')

if add_pepperoni == 'Y':
    if size == 'S':
        bill += 2
    else:
        bill += 3

if extra_cheese == 'Y':
    bill += 1

print(f"Your final bill is: ${bill}")
