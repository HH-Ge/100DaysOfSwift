//
//  temp.swift
//  WeSplit
//
//  Created by Howard Ge on 2020/3/30.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct tempView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentageIndex = 2
    
    let tipPercentages = [5,10,15,20,0]
    
    var tipSelection: Double { return Double(tipPercentages[tipPercentageIndex]) }  //小费费率
    var orderAmount: Double { return Double(checkAmount) ?? 0}                      // 消费金额
    var tipValue: Double { return orderAmount / 100 * tipSelection }                // 小费金额
    var grandTotal: Double { return orderAmount + tipValue }     // 消费总计 = 消费金额 + 小费金额
    var totalPerPerson: Double { return grandTotal / Double(numberOfPeople) }       // 人均消费
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("消费金额：", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("人数", selection: $numberOfPeople) {
                        ForEach(2..<100) { index in
                            Text("\(index) 人")
                        }
                    }
                }
                
                Section(header: Text("小费计算")) {
                    HStack {
                        Text("费率：")
                        Picker("Tip percentage", selection: $tipPercentageIndex) {
                            ForEach(0 ..< tipPercentages.count) { index in
                                Text("\(self.tipPercentages[index])%")
                            }
                        }
                    }
                    Text("金额：￥\(orderAmount / 100 * tipSelection, specifier: "%.2f")")
                }.pickerStyle(SegmentedPickerStyle())
                
                Section(header: Text("总计")) {
                    Text("消费总计：￥\(grandTotal, specifier: "%.2f")")
                    Text("人均消费：￥\(totalPerPerson, specifier: "%.2f")")
                    LocalizedStringKey
                }
            }.navigationBarTitle("WeSplit")
        }
    }
}

struct tempView_Previews: PreviewProvider {
    static var previews: some View {
        tempView()
    }
}
