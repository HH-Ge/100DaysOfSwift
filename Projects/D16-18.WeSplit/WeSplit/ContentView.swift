//
//  ContentView.swift
//  WeSplit
//
//  Created by Howard Ge on 2020/3/13.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var checkAmount = ""          // 消费金额，使用字符型是因为等下要输入的是字符
  @State private var numberOfPeople = 2        // 人数，默认为 2
  @State private var tipPercentageIndex = 2    // 小费百分率数组下标，取值为 tipPercentages 数组的下标，默认为 2
  
  let tipPercentages = [5,10,15,20,0]     // 小费百分率数组：可能的小费比率
  
  // 下面都是计算属性
  var tipSelection: Double { return Double(tipPercentages[tipPercentageIndex]) }  // 小费费率
  var orderAmount: Double { return Double(checkAmount) ?? 0}                      // 消费金额，转换成数字
  var tipValue: Double { return orderAmount / 100 * tipSelection }                // 小费金额
  var grandTotal: Double { return orderAmount + tipValue }                        // 消费总计 = 消费 + 小费
  var totalPerPerson: Double { return grandTotal / Double(numberOfPeople) }       // 人均消费

  
  var body: some View {
      NavigationView {
          Form {

              Section {
                  HStack {
                      Text("消费金额：￥")
                      TextField("请输入消费金额", text: $checkAmount)  // 输入消费金额
                          .keyboardType(.decimalPad)
                  }
                  HStack {
                      Text("消费人数：")
                      Stepper(value: $numberOfPeople, in: 2...10) {
                          Text("\(numberOfPeople) 人")
                      }
                  }
              }
              
              Section(header: Text("小费计算")) {
                  HStack {
                      Text("小费费率：")
                      Picker("Tip percentage", selection: $tipPercentageIndex) {
                          ForEach(0 ..< tipPercentages.count) { index in  // 遍历tipPercentages
                              Text("\(self.tipPercentages[index])%")
                          }
                      }
                  }
                  Text("小费金额：￥\(orderAmount / 100 * tipSelection, specifier: "%.2f")")  // specifier 指定数字格式
              }.pickerStyle(SegmentedPickerStyle())   // 使用分段控件选择小费百分率
              
              Section(header: Text("总计")) {
                  Text("消费总计：￥\(grandTotal, specifier: "%.2f")")
                Text("人均消费：￥\(totalPerPerson, specifier: "%.2f")").bold()
              }
              
          }.navigationBarTitle("WeSplit")     // 导航栏标题，要加在 Form 上，不能加在 NavigationView 上
      }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
