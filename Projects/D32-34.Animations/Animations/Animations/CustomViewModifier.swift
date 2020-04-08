//
//  CustomViewModifier.swift
//  Animations
//
//  Created by Howard Ge on 2020/4/7.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct CustomViewModifier: View {
    @State var isShow = false
    var body: some View {
        VStack(spacing: 15) {
            Button(self.isShow ? "解散" : "集合"){
                self.isShow.toggle()
            }
            
             if isShow {
                Text("Hello, World!")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 200, alignment: .center)
                    .background(isShow ? Color.red : Color.blue)
                    
             }
        }.transition(.pivot)
    }
}

struct CustomViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewModifier()
    }
}


struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}


extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}
