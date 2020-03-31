//
//  unitList.swift
//  WeSplit
//
//  Created by Howard Ge on 2020/3/14.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct unitList: View {
    var units: LengthUnit
    
    var body: some View {
        List(MetricUnits) { unit in
            unitRow(units: unit)
        }
    }
}

struct unitList_Previews: PreviewProvider {
    static var previews: some View {
        unitList(units: MetricUnits[0])
    }
}
