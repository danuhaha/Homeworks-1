//
//  main.swift
//  Homeworks
//
//  Created by Daniil on 11.09.2021.
//

import Foundation

print("ЧЕТНОСТЬ \n")

func isOdd(number: Int) {
    if number%2 == 0 {
        print("Число \(number) четное \n")
    } else {
        print("Число \(number) нечетное \n")
    }
}

isOdd(number: 5)
isOdd(number: 6)

print("ДЕЛИМОСТЬ НА 3 \n")

func isDivisibleByThree(number: Int) {
    if number%3 == 0 {
        print("Число \(number) делится на 3 без остатка \n")
    } else {
        print("Число \(number) не делится на 3 без остатка \n")
    }
}

isDivisibleByThree(number: 5)
isDivisibleByThree(number: 3)

print("МАССИВ \n")

//MARK: создание массива

var arr = [Int]()

for i in 1...100 {
    arr.append(i)
}

print(arr)
print("\n")

//MARK: удаление четных и не делящихся на 3 чисел

var i = 0
while i < arr.count {
    if arr[i] % 2 == 0 || arr[i] % 3 != 0 {
        arr.remove(at: i)
    } else {
        i += 1
    }
}

print(arr)
print("\n")

print(" ЧИСЛА ФИБОНАЧЧИ \n")

func fib(amount: Int) -> Array <Int> {
    var arr = [Int]()

    if amount == 1{
        arr.append(0)
    } else if amount == 2 {
        arr.append(0)
        arr.append(1)
    } else if amount > 2 {
        arr.append(0)
        arr.append(1)
        for i in 2...amount-1 {
            arr.append(arr[i-2]+arr[i-1])
        }
    } else {
        print("Error")
    }

    return arr
}

print(fib(amount: 50))
print("\n")

print("ПРОСТЫЕ ЧИСЛА \n")

//MARK: создание массива для поиска простых чисел

var primes = [Int]()
for i in 2...545 {
    primes.append(i)
}

//MARK: поиск составных (не простых) чисел

var numbersToRemove = Set<Int>()

for i in 0...primes.count/2 {
    let p = primes[i]

    var k = 1
    while i + k * p < primes.count {
        numbersToRemove.insert(primes[i + k * p])
        k += 1
    }
}

//MARK: удаление составных чисел из массива

var j = 0
while j < primes.count {
    if numbersToRemove.contains(primes[j]) {
        primes.remove(at: j)
    } else {
        j += 1
    }
}

print(primes)


