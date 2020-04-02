//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Howard Ge on 2020/3/15.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct country {            // 国家
    var flagName: String    // 图片名称
    var name: String        // 国家名称
}
let countryArray: [country] = [                     // 初始化，这个内容不能放在 ContentView 中，否则报错
    country(flagName: "Estonia", name: "爱沙尼亚"),
    country(flagName: "France", name: "法国"),
    country(flagName: "Germany", name: "德国"),
    country(flagName: "Ireland", name: "爱尔兰"),
    country(flagName: "Italy", name: "意大利"),
    country(flagName: "Nigeria", name: "尼日利亚"),
    country(flagName: "Poland", name: "波兰"),
    country(flagName: "Russia", name: "俄罗斯"),
    country(flagName: "Spain", name: "西班牙"),
    country(flagName: "UK", name: "英国"),
    country(flagName: "US", name: "美国")
]

struct ContentView: View {

   
    @State private var countries = countryArray.shuffled()          // 打乱数组元素顺序
    @State private var correctAnswer = Int.random(in: 0...2)        // 在 0-2 之间随机选一个值
    
    @State private var showingScore = false                         // 控制显示警告
    @State private var scoreTitle = ""                              // 警告信息
    
    @State private var score = 0                                    // 得分，答对数量
    @State private var questionNum = 0                              // 题目数
    
    var body: some View {
        ZStack {
            // Color.blue.edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .topLeading, endPoint: .bottomLeading).edgesIgnoringSafeArea(.all)  // 底色
            
            VStack(spacing: 30) {
                VStack(spacing: 20) {
                    Text("猜国旗")
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Text("请点击下面你认为正确的国旗")
                            // .font(.subheadline)
                            .fontWeight(.bold)
                    Text(countries[correctAnswer].name)
                    .font(.title)
                    .fontWeight(.black)
                }.foregroundColor(.white)
                VStack(spacing: 50){
                    ForEach(0..<3) { number in
                        Button(action: {
                            self.flagTapped(number)             // 按钮动作
                        }) {
                            Image(self.countries[number].flagName)
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.gray, lineWidth: 1))
                        }
                        .shadow(color: Color(.gray), radius: 5, x: 3, y: 3)
                    }
                    
                }
                Spacer()
            }
            .padding(.top, 30)
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("你已经猜了 \(questionNum) 次\n你猜对了 \(score) 次"), dismissButton: .default(Text("继续")){
                self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ number: Int) {
        questionNum += 1                        // 题目数量 +1
        if number == correctAnswer {
            scoreTitle = "恭喜你，答对了！！"
            score += 1                          // 答对时，得分 +1
            
        } else {
            scoreTitle = "不太对呢，再想想？"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
