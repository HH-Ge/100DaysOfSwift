//
//  unitList.swift
//  WeSplit
//
//  Created by Howard Ge on 2020/3/14.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct unitRow: View {
    var units: LengthUnit
    
    var body: some View {
        HStack(spacing: 10) {
            Text("ID: \(units.id)")
            Text(units.name)
            Text("\(units.coefficient, specifier: "%.2f")")
            Spacer()
        }
    }
}

struct unitRow_Previews: PreviewProvider {
    static var previews: some View {
        unitList(units: MetricUnits[0])
    }
}
