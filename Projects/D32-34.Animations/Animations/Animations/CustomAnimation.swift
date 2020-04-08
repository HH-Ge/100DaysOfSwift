//
//  CustomAnimation.swift
//  Animations
//
//  Created by Howard Ge on 2020/4/6.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct CustomAnimation: View {
    @State private var animationAmount: CGFloat = 1
    @State private var offsetAmount: CGFloat = 0
    @State private var show1 = false
    var title1: String {
        return show1 ? "解散" : "集合"
    }
    var opacity1: Double {
        return show1 ? 1 : 0
    }
    @State private var show2 = false
    var title2: String {
        return show2 ? "解散" : "集合"
    }
    var scale2: CGFloat {
        return show2 ? 1 : 0.00001
    }

    var body: some View {
        print("show1: \(show1), title: \(title1), opacity: \(opacity1)")
        //print("show2: \(show2), title: \(title2), opacity: \(scale2)")
        return VStack() {
            VStack{
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 60, height: 40)
                        .foregroundColor(.blue)
                        .offset(x: offsetAmount)
                        .animation(
                            Animation.easeInOut(duration: 2)            // 动画形式和持续时间
                                .delay(1)                               // 延迟时间
                                .repeatCount(2, autoreverses: true)     // 重复次数，是否复位（单向、双向）
                                .repeatForever(autoreverses: false)     // 连续动画
                    )
                        .onAppear{
                            self.offsetAmount = 280
                    }
                }
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 100)
                .background(Color(.gray))
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 60, height: 40)
                        .foregroundColor(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                        .offset(x: offsetAmount)
                        .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false))
                        .onAppear{
                            self.offsetAmount = 280
                    }
                }
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 100)
                .background(Color(.gray))
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 60, height: 40)
                        .foregroundColor(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                        .offset(x: offsetAmount)
                        .animation(Animation.easeIn(duration: 2).repeatForever(autoreverses: false))
                        .onAppear{
                            self.offsetAmount = 280
                    }
                }
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 100)
                .background(Color(.gray))
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 60, height: 40)
                        .foregroundColor(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                        .offset(x: offsetAmount)
                        .animation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false))
                        .onAppear{
                            self.offsetAmount = 280
                    }
                }
                    
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 100)
                .background(Color(.gray))
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 60, height: 40)
                        .foregroundColor(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                        .offset(x: offsetAmount)
                        .animation(Animation.interpolatingSpring(stiffness: 20, damping: 0.6).repeatForever(autoreverses: false))
                        .onAppear{
                            self.offsetAmount = 250
                    }
                }
                    
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 100)
                .background(Color(.gray))
            }
            
           
            HStack {
                Button(action: {
                    self.show1.toggle()
                }) {
                Text(title1)
                }
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 60, height: 40)
                    .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                    .opacity(opacity1)
                    .animation(Animation.easeInOut(duration: 1))
                Spacer()
                Button(action: {
                    self.show2.toggle()
                }) {
                Text(title2)
                }
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 60, height: 40)
                    .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                    .scaleEffect(scale2)
                    .animation(Animation.easeInOut(duration: 1))
            }.padding()
            
            
            
            Spacer()
            Button("Tap Me") {
                // self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
                // .scaleEffect(animationAmount)
                .overlay(
                    Circle()
                        .stroke(Color.red)
                        .scaleEffect(animationAmount)
                        .opacity(Double(2 - animationAmount))
                        .animation(
                            Animation.easeOut(duration: 1).repeatForever(autoreverses: false)
                    )
            )
                .onAppear {
                    self.animationAmount = 2
            }
        }
    }
}

struct CustomAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnimation()
    }
}
