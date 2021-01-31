//
//  TemperatureGenerator.swift
//  Farcius
//
//  Created by Svitlana Honcharuk on 30.01.2021.
//

import Foundation

struct TemperatureGenerator {
    static func generateTemperature() -> Temperature {
        let fahrenheit = Int.random(in: -10..<110)
        return Temperature(fahrenheit: fahrenheit)
    }
}
