//
//  CustomStacks.swift
//  ViewsAndModifiers
//
//  Created by Howard Ge on 2020/3/16.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct CustomStacks: View {
    var body: some View {
        GridStack(rows: 3, columns: 3) {row, col in
            //let i = cal(row: row, col: col)
            Text("\(cal(row: row, col: col))")
                .frame(width: 25, height: 25)
                .border(Color.gray, width: 1)
            
        }
    }
}

func cal(row: Int, col: Int) -> Int {
    if row == 2 && col == 0 {
        return 1
    }else {
        return (2 - row) * 3 + col + 1
    }
}

struct CustomStacks_Previews: PreviewProvider {
    static var previews: some View {
        CustomStacks()
    }
}


