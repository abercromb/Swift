//
//  main.swift
//  lesson6
//
//  Created by Vladislav Elkin on 03.08.2020.
//  Copyright © 2020 Vladislav Elkin. All rights reserved.
//

import Foundation

protocol Weightabe {                      // создаем протокол поддержки веса
    var weight: Double { get set }
}

class Circle: Weightabe {                // имплементируем протокол кругу
    var radius: Double
    var weight: Double
    func calculatePerimiter() -> Double {
        return 2.0 * Double.pi * radius
    }
    init(radius: Double, weight: Double) {
        self.radius = radius
        self.weight = weight
    }
}

struct Queue<T> {
    private var elements: [T] = []
    
    mutating func enqueue(_ element: T)
    {
        elements.append(element);
    }
    
    mutating func dequeue() -> T?
    {
        return size() > 0 ? elements.removeFirst() : nil;
    }
    
    func peak() -> T? {
        return size() > 0 ? elements[0] : nil;
    }
    
    func size() -> Int
    {
        return elements.count;
    }
    
    mutating func clear()
    {
        elements.removeAll();
    }
    
    subscript(index: Int) -> T?
    {
        get
        {
            return elements.indices.contains(index) ? elements[index] : nil;
        }
    }
}

extension Queue {
    func Filter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
}

extension Circle: CustomStringConvertible{
    var description: String {
        return "Radius: \(radius) Weight: \(weight)"
    }
}

var queue = Queue<Circle>();
queue.enqueue(Circle(radius: 12, weight: 44));
queue.enqueue(Circle(radius: 16, weight: 80));
queue.enqueue(Circle(radius: 133, weight: 30));
queue.enqueue(Circle(radius: 123, weight: 22));

let filtredQueue = queue.Filter(predicate: {$0.radius > 12})

print(filtredQueue)
