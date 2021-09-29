//
//  main.swift
//  Homeworks
//
//  Created by Daniil on 29.09.2021.
//

import Foundation

struct Queue<T> {
    private var elements: [T] = []

    init(_ elements: [T]) {
        self.elements = elements
    }

    func count() -> Int {
        return elements.count
    }

    mutating func enqueue(_ element: T) {
        elements.append(element)
    }

    mutating func dequeue() -> T {
       return elements.removeFirst()
    }

    func peek() -> T {
        return elements[0]
    }

    mutating func filter(_ condition: (T) -> Bool) {
        var new_elements = [T]()

        for i in self.elements {
            if condition(i) {
                new_elements.append(i)
            }
        }

        self.elements = new_elements
    }

    mutating func map(_ transform: (T) -> T) {
        var new_elements = [T]()

        for i in self.elements {
            new_elements.append(transform(i))
        }

        self.elements = new_elements
    }

    subscript(_ i: Int) -> T? {
        return i < self.elements.count ? self.elements[i] : nil
    }
}

var queue = Queue<Int>(Array(1...10))
print(queue.count())
print(queue.peek())
queue.filter{$0 % 2 == 0}
print(queue)
queue.map{$0 * 10}
print(queue)
print(queue[3])
print(queue[10])
