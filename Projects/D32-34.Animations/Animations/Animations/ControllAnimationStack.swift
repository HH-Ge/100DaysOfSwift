//
//  ControllAnimationStack.swift
//  Animations
//
//  Created by Howard Ge on 2020/4/6.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct ControllAnimationStack: View {
    @State private var enabled1 = false
    @State private var enabled2 = false
    @State private var enabled3 = false
    var body: some View {
        VStack {
            Button("先背景，再框体") {
                
            }
            .background(Color.blue)
            .frame(width: 200, height: 200)
            .foregroundColor(.white)
            
            Spacer()
            
            Button("圆角剪切在动画之后") {
                self.enabled1.toggle()
            }
            .frame(width: 200, height: 100)
            .background(enabled1 ? Color.blue : Color.red)
            .foregroundColor(.white)
            .animation(.default)
            .clipShape(RoundedRectangle(cornerRadius: enabled1 ? 30 : 0))
            
            Spacer()
            
            Button("圆角剪切在动画之前") {
                self.enabled2.toggle()
            }
            .frame(width: 200, height: 100)
            .background(enabled2 ? Color.blue : Color.red)
            
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: enabled2 ? 30 : 0))
            .animation(.default)
            
            Spacer()
            
            Button("多个动画效果") {
                self.enabled3.toggle()
            }
            .frame(width: 200, height: 100)
            .background(enabled3 ? Color.blue : Color.red)
            .animation(.easeInOut(duration: 2))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: enabled3 ? 30 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1))
            
            Spacer()
            
            Button("颜色切换动画被禁用") {
                self.enabled3.toggle()
            }
            .frame(width: 200, height: 100)
            .background(enabled3 ? Color.blue : Color.red)
            .animation(nil)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: enabled3 ? 30 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1))
        }
    }
}

struct ControllAnimationStack_Previews: PreviewProvider {
    static var previews: some View {
        ControllAnimationStack()
    }
}
