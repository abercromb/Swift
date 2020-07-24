//
//  main.swift
//  lesson2
//
//  Created by Vladislav Elkin on 15.07.2020.
//  Copyright © 2020 Vladislav Elkin. All rights reserved.
//

import Foundation

//1.Написать функцию, которая определяет, четное число или нет.

func isEven(_ number: Int) -> Bool {
    return number % 2 == 0 ? true : false;
}

print(isEven(10));
print(isEven(5));
print("\r\n===============================\r\n")

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func function2(_ number: Int) -> Bool{
    return number % 3 == 0 ? true : false;
}

print(function2(9));
print(function2(7));
print("\r\n===============================\r\n")

//3. Создать возрастающий массив из 100 чисел.

var tArray: [Int] = [];
for i in 0...100 {
    tArray.append(i)
}

print(tArray)
print("\r\n===============================\r\n")

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for(index, value) in tArray.enumerated(){
    if isEven(value) || !function2(value) {
        tArray.remove(at: tArray.firstIndex(of: value)!);
    }
}

print(tArray)

print("\r\n===============================\r\n")

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.

func fibonacci(_ n: Int64) -> Int64{
    if n == 1 || n == 2 {
        return 1;
    }
    
    return fibonacci(n - 1) + fibonacci(n - 2);
}

var fibonacciArray: [Int64] = [];

for i in 1...101{
    fibonacciArray.append(fibonacci(Int64(i)));
}

print(fibonacciArray);

print("\r\n===============================\r\n")

/*
 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
*/

func isPrime (_ number: Int64) -> Bool {
    if number < 2 {
        return false;
    }
    for i in 2..<number {
        if number % i == 0 {
            return false;
        }
    }
    
    return true
}
func getPrimeArray (_ count: Int64) -> [Int64] {
    var resultArray: [Int64] = [];
    var i = 2
    while resultArray.count < count {
        if isPrime(Int64(i)) {
            resultArray.append(Int64(i));
        }
        i += 1;
    }
    
    return resultArray;
}
print (getPrimeArray(100));

print("\r\n===============================\r\n")
