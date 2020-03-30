//
//  Data.swift
//  WeSplit
//
//  Created by Howard Ge on 2020/3/14.
//  Copyright © 2020 Howard. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import CoreLocation

let MetricUnits: [LengthUnit] = load("MetricUnits.json")
let EnglishUnits: [LengthUnit] = load("EnglishUnits.json")
let AllUnits: [LengthUnits] = load("AllUnits.json")
let temp = 0

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
