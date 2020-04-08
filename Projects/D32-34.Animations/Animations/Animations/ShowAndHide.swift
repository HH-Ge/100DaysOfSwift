//
//  ShowAndHide.swift
//  Animations
//
//  Created by Howard Ge on 2020/4/7.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct ShowAndHide: View {
    @State private var isShowingRed = false
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }
            Spacer()
            HStack {
                if self.isShowingRed {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 200, height: 200)
                        .transition(.asymmetric(insertion: .opacity, removal: .scale))
                }
            }
            .frame(width: 200, height: 200, alignment: .center)
            
            
            
            
            
            
            
        }
    }
}

struct ShowAndHide_Previews: PreviewProvider {
    static var previews: some View {
        ShowAndHide()
    }
}
