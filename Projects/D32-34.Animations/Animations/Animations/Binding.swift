//
//  Binding.swift
//  Animations
//
//  Created by Howard Ge on 2020/4/6.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct Binding: View {
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        VStack {
            Stepper("缩放系数（1~10）：\(animationAmount, specifier:"%g")",
                value: $animationAmount.animation(),
                in: 1...10)
                .padding()

            Spacer()

            Button("点我") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct Binding_Previews: PreviewProvider {
    static var previews: some View {
        Binding()
    }
}
