//
//  ContentView.swift
//  Animations
//
//  Created by Howard Ge on 2020/4/5.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: Double = 0.0

    var body: some View {
        
            Button("点我") {
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    self.animationAmount += 360
                }
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(Angle(degrees: animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
