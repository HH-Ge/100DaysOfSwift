//
//  CustomModifier.swift
//  ViewsAndModifiers
//
//  Created by Howard Ge on 2020/3/16.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct CustomModifier: View {
    var body: some View {
        ZStack {
            Color.blue
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .watermarked(with: "版权所有 盗版必究")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Gryffindor").blur(radius: 5)
                Text("Hufflepuff")
                Text("Ravenclaw").blur(radius: 3)
                Text("Slytherin")
            }
            .font(.largeTitle)
            .blur(radius: 2)
            
            
        }
    }
}

struct CustomModifier_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifier()
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .padding(5)
            //.background(Color.gray)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}
