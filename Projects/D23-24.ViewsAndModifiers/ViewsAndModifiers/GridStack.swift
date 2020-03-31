//
//  GridStack.swift
//  ViewsAndModifiers
//
//  Created by Howard Ge on 2020/3/16.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        return self.content(row, column)
                        .padding(2)
                    }
                }
            }
        }
    }
}

struct GridStack_Previews: PreviewProvider {
    static var previews: some View {
        GridStack(rows: 3, columns: 3){ row, col in
            Text("R\(row) C\(col)")
                .padding()
                .frame(width:80, height: 50)
                .border(Color.gray, width: 1)
        }
    }
}
