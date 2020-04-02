//
//  ContentView.swift
//  RockScissorsPaper
//
//  Created by Howard Ge on 2020/4/1.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct Fist {                       //出拳
    var id: Int                     // 编号，用于计算结果
    var imageName: String = ""      // 图片名称
    var name: String = ""           // 手势名称
}

let fistArray = [                   // 所有出拳的情况初始化为数组
    Fist(id: 0, imageName: "cube.fill", name: "石头"),
    Fist(id: 1, imageName: "scissors", name: "剪刀"),
    Fist(id: 2, imageName: "stop.fill", name: "布")
]



struct ContentView: View {
    
    @State var aiFist: Fist = Fist(id: -1)          // ai出拳
    @State var playerFist: Fist = Fist(id: -1)      // 玩家出拳
    @State var lastAiFist: Fist = Fist(id: -1)      // 上次 AI 的出拳，目的是在下一次比赛前保持画面

    @State var result: String = ""                  // 单局比赛结果

    @State var games = 0                            // 总局数
    @State var playerWin = 0                        // 玩家胜局数
    @State var evenGames = 0                        // 平局数
    
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text("石头、剪刀、布")
                .font(.largeTitle)
                .padding()
            
            
            HStack(spacing: 20) {
                card(playerName: "AI", fist: lastAiFist)        //抽取子视图，必须传 lastAiFist
                card(playerName: "Player", fist: playerFist)
            }
            
            HStack {
                ForEach(0..<3) { index in                                       // 循环生成三个按钮，注意不能使用闭合范围，
                    Button(action: {                                            // 按钮响应动作
                        self.aiFist = fistArray[Int.random(in: 0...2)]          // ai出拳为随机
                        self.lastAiFist = self.aiFist                           // 赋值给 lastAiFist 供显示
                        self.playerFist = fistArray[index]                      // 根据按钮点击的 index 确定玩家出拳
                        self.pk(ai: self.lastAiFist, player: self.playerFist)   // 判断比赛结果
                    }) {
                        Image(systemName: fistArray[index].imageName)           // 按钮显示的图片
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    }
                    .frame(width: 80, height: 40)
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(5)
                }
            }
            Spacer()
            // Text("AI 出拳：\(lastAiFist.id), \(lastAiFist.name)")      // 调试用
            // Text("玩家 出拳：\(playerFist.id), \(playerFist.name)")    // 调试用
            Text("本局结果：\(result)")
                .font(.title)
            
            Text("共 \(games) 局，玩家胜 \(playerWin) 局，平 \(evenGames) 局")
            
            Button(action: {         // 复位按钮
                self.games = 0
                self.playerWin = 0
                self.evenGames = 0
            }){
                Text("重新开始")
            }
            .frame(width: 100, height: 40)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(5)
            .shadow(radius: 3)
            Spacer()
        }
    }
    
    // 判定比赛结果
    func pk(ai: Fist, player: Fist) {
        
        games += 1                          // 总局数 + 1
        
        if ai.id == player.id {
            result = "平局"
            evenGames += 1
        } else if (ai.id - player.id) == -1 || (ai.id - player.id) == 2 {
            result = "AI 胜"
        } else {
            result = "玩家 胜"
            playerWin += 1                  // 玩家胜局数 + 1
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()       // 因为所有的 @State 属性都有默认值，所以这里不用传入任何参数，但有时候写参数可以直接看见特定情况的视图变化
    }
}




struct card: View {                             // 出拳子视图
    var playerName: String
    var fist: Fist
    
    var body: some View {
        VStack {
            Text(playerName)
                .font(.title)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
            
            Image(systemName: fist.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
                .foregroundColor(.red)
                .padding()
            
            Text(fist.name)
                .font(.title)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 250)
        .border(Color.blue, width: 2)
    }
}
