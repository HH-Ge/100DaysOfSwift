//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Howard Ge on 2020/3/15.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var str = "hello"
    var abc: some View {
        TextField("引用变量 str", text: $str)
    }
    
    
    
    var body: some View {
        VStack {
            VStack(spacing: 30){
                Text("说  明")
                    .font(.largeTitle)
                Text("本节代码分别保存在 CustomStack、GridStack 和 CustomModifier 三个文件中。")
                    .font(.title)
                    .lineSpacing(10)
                    .frame(alignment: .leading)
                
                
                Button("Hello World") {
                    print(type(of: self.body))
                }
                .background(Color.red)
                .frame(width: 200, height: 200)
                
                TextField("Placeholder", text: $str)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

