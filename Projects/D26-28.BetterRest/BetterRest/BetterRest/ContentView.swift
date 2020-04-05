//
//  ContentView.swift
//  BetterRest
//
//  Created by Howard Ge on 2020/4/3.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @State private var wakeUp = defaultWakeTime     // 计划起床时间
    @State private var sleepAmount = 8.0            // 期待睡眠时长
    @State private var coffeeAmount = 1             // 每日饮用咖啡数量
    
    @State private var alertTitle = ""              // 对话框标题
    @State private var alertMessage = ""            // 对话框内容
    @State private var showingAlert = false         // 对话框显示状态
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    // 按钮调用方法
    func calculateBedtime() {
        let model = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)    // 读取起床时间的时和分
        let hour = (components.hour ?? 0) * 60 * 60     // 将小时换算成秒
        let minute = (components.minute ?? 0) * 60      // 将分钟换算成秒
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))   // 使用模型预测
            let sleepTime = wakeUp - prediction.actualSleep     // 得出就寝时间
            let formatter = DateFormatter()                     // 使用 DateFormatter 转换显示格式
            formatter.timeStyle = .short
            alertTitle = "合理就寝时间是："
            alertMessage = formatter.string(from: sleepTime)
        } catch {
            // 出错处理
            alertTitle = "出错啦！~"
            alertMessage = "很遗憾，程序发生了错误。"
        }
        showingAlert = true        // 无论是否出错，总是显示对话框
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                // 计划起床时间
                VStack(alignment: .leading, spacing: 10){
                    Text("打算几点起床呢？")
                        .font(.headline)
                        .padding(.top)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                // 预期睡眠时长
                VStack(alignment: .leading, spacing: 10){
                    Text("想睡多久呢？")
                        .font(.headline)
                        .padding(.top)
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") 小时")
                    }
                    .padding(.horizontal)
                }
                // 每日饮用咖啡杯数
                VStack(alignment: .leading, spacing: 10){
                    Text("每天喝几杯咖啡☕️？")
                        .font(.headline)
                        .padding(.top)
                    Stepper(value: $coffeeAmount, in: 1...20) {
                        Text("\(coffeeAmount) 杯")
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarTitle("BetterRest")
            .navigationBarItems(trailing:
                // our button here
                Button("预计就寝时间") {
                    self.calculateBedtime()
                }
            )
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage).font(.system(size: 24)), dismissButton: .default(Text("好")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
