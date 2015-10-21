//: ## Question 1
//: ### Leap Year
//: You are given a year, determine if it’s a leap year. A leap year is a year containing an extra day. It has 366 days instead of the normal 365 days. The extra day is added in February, which has 29 days instead of the normal 28 days. Leap years occur every 4 years. 2012 is a leap year and so is 2016. Except that every 100 years special rules apply. Years that are divisible by 100 are not leap years if they are not divisible by 400. For example 1900 was not a leap year, but 2000 was. __Print Leap year! or Not a leap year! depending on the case.__
var year: Int
year = 2010

if year % 100 == 0 && year % 400 != 0
{
    print("Not a leap year!")
}
else
{
    print("leap year!")
}


//: ## Question 2
//: ### Food Spoilage
//: You are working on a smart-fridge. The smart-fridge knows how old the eggs and bacon in it are. You know that eggs spoils after 3 weeks (21 days) and bacon after one week (7 days). Given ```baconAge``` and ```eggsAge``` (in days) determine if you can cook bacon and eggs or what ingredients you need to throw out.
//:
//: If you can cook bacon and eggs print you can cook bacon and eggs. If you need to throw out any ingredients for each one print a line with the text throw out ingredient (throw out bacon or throw out eggs) in any order.
//var eggAge = int
//var baconAge = int

//eggAge = 20
//baconAge = 5

func foodSpoilage(eggAge: Int, baconAge: Int)
{
if baconAge > 7  && eggAge <= 21
{
    print("Throw about the Bacon")
}
else if  baconAge <= 7 && eggAge > 21
{
    print ("Throw out the Eggs")
}
else if baconAge > 7 && eggAge > 21
{
    print("Throw them both out!")
}
else
{
    print("Eggs and Bacon are good to go....and delicious")
}
}
foodSpoilage(20, baconAge: 5)
foodSpoilage(56, baconAge: 54)


//: ## Question 3
//: ### Difference of Square of Sums and Sum of Squares
//: The sum of the squares of the first ten natural numbers is,
//: 1^2 + 2^2 + ... + 10^2 = 385
//:
//: The square of the sum of the first ten natural numbers is,
//: (1 + 2 + ... + 10)^2 = 55^2 = 3025
//:
//: Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
//: __Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.__



