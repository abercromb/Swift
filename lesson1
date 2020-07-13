//
//  main.swift
//  test1
//
//  Created by Vladislav Elkin on 13.07.2020.
//  Copyright © 2020 Vladislav Elkin. All rights reserved.
//

import Foundation

//1. Решить квадратное уравнение.

let a:Double = 1;
let b:Double = -8;
let c:Double = 15;
let discriminant = (b * b) - (4 * a * c);

if discriminant < 0 {
    print("Корней нет!");
}else if (discriminant == 0){
    let x = (-b + sqrt(discriminant)) / (2 * a);
    print("x = \(x)");
}else{
    let x1 = (-b + sqrt(discriminant)) / (2 * a);
    let x2 = (-b - sqrt(discriminant)) / (2 * a);
    
    print("x1 = \(x1), x2 = \(x2)");
}


//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

let catA: Double = 5;
let catB: Double = 6;

let gipC = sqrt((catA * catA) + (catB * catB));
let S = 0.5 * catB * catA;
let P = catB + catA + gipC;

print("P = \(P), S = \(S), C = \(gipC)")

//3. *Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var deposit: Double = 1000;
var years: Double = 5;
let procent: Double = 7;

while years > 0 {
    deposit += deposit * procent / 100;
    years-=1;
}

print(deposit);

