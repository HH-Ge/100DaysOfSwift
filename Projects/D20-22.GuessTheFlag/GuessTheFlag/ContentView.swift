//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Howard Ge on 2020/3/15.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            // Color.blue.edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .topLeading, endPoint: .bottomLeading).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack(spacing: 20) {
                    Text("猜国旗")
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Text("请点击下面你认为正确的国旗")
                            .font(.subheadline)
                            .fontWeight(.black)
                    Text(countries[correctAnswer])
                    .font(.title)
                    .fontWeight(.black)
                }.foregroundColor(.white)
                
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), radius: 5, x: 5, y: 5)
                    }
                }
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("你已经得了 ？？ 分"), dismissButton: .default(Text("继续")){
                self.askQuestion()
            })
        }
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "恭喜你，答对了！！"
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
