//
//  ImplicitAnimation.swift
//  Animations
//
//  Created by Howard Ge on 2020/4/6.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct ImplicitAnimation: View {
    @State private var animationAmount: CGFloat = 1.0
    
    var body: some View {
        
        Button("点我") {
            self.animationAmount += 1
        }
            .padding(50)                // 数字会决定按钮的大小
            .background(Color.red)        // 前景色，
            .foregroundColor(.white)    // 背景色，
            .clipShape(Circle())        // 圆形，为了后面的演示
            .scaleEffect(animationAmount)
            .animation(.default)
            .blur(radius: (animationAmount - 1) * 3)
    }
}

struct ImplicitAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimation()
    }
}
