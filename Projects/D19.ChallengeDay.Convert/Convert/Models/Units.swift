//
//  Units.swift
//  WeSplit
//
//  Created by Howard Ge on 2020/3/14.
//  Copyright © 2020 Howard. All rights reserved.
//

import Foundation
// import CoreLocation

struct LengthUnits: Hashable, Codable, Identifiable {
    var id: Int
    var category: String
    var items: [LengthUnit]
}

struct LengthUnit: Hashable, Codable, Identifiable  {
    var id: Int
    var name: String
    var coefficient: Double
}
