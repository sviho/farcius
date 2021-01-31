//
//  Temperature.swift
//  Farcius
//
//  Created by Svitlana Honcharuk on 30.01.2021.
//

import Foundation

struct Temperature {
    let fahrenheit, celsius: Int
    init(fahrenheit: Int) {
        self.fahrenheit = fahrenheit
        self.celsius = Int(Double(fahrenheit - 32) * 0.5556)
    }
    
    func getFahrenheit() -> Int {
        return fahrenheit
    }
    
    func getCelsius() -> Int {
        return celsius
    }
}
