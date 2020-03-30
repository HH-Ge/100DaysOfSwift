//
//  ContentView.swift
//  Convert
//
//  Created by Howard Ge on 2020/3/23.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isMetricToEnglish = true         // 转换方式：默认公制转英制
    @State private var inputString = ""                 // 输入值（字符）
    @State private var inIndex = 0                      // 输入单位索引
    @State private var outIndex = 0                     // 输出单位索引
    
    // 转换结果，计算属性
    var result: Double {
        var outNumber: Double = 0                       // 计算结果
        let inCoe = inArray[inIndex].coefficient        // 输入单位系数
        let outCoe = outArray[outIndex].coefficient     // 输出单位系数
        let inNumber = Double(inputString) ?? 0         // 输入值，控制非数字
        let rate = isMetricToEnglish ? 1/25.4 : 25.4    // 转换率，1 英寸 = 2.54 毫米
        outNumber = inNumber * inCoe * rate / outCoe    // 计算转换
        return outNumber
    }
    
    var inArray:[LengthUnit]  { return isMetricToEnglish ? MetricUnits : EnglishUnits }     // 输入单位数组
    var outArray:[LengthUnit]  { return !isMetricToEnglish ? MetricUnits : EnglishUnits }   // 输出单位数组
    
    var body: some View {
        
        NavigationView{
            VStack{
                Button(action: {self.isMetricToEnglish.toggle()}){                          // 单击切换转换方式
                    Text(isMetricToEnglish ? "公制 → 英制" : "英制 → 公制")
                        .font(.headline)
                }
                .frame(width: 120, height: 40)
                .foregroundColor(.white)
                .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                .cornerRadius(CGFloat(10.0))
                .shadow(color: Color(.black).opacity(0.2), radius: 10, x: 5, y: 10)
                
                Spacer(minLength: 30)
                
                Form{
                    Section(header: Text("将 \(isMetricToEnglish ? "公制" : "英制")")
                        .font(.subheadline).bold()
                    ){
                        TextField("输入\(isMetricToEnglish ? "公制" : "英制")长度", text: $inputString)
                        .frame(maxWidth: .infinity)
                        .keyboardType(.decimalPad)
                            
                        Picker("", selection: $inIndex){
                            ForEach(0..<inArray.count) { index in
                                Text(self.inArray[index].name)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("转换为 \(!isMetricToEnglish ? "公制" : "英制")")
                        .font(.subheadline).bold()
                    ){
                        Text("单位")
                        Picker("", selection: $outIndex){
                            ForEach(0..<outArray.count) { index in
                                Text(self.outArray[index].name)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("结果")
                        .font(.subheadline).bold()
                    ) {
                        Text("\(result, specifier: "%.2f")")
                    }
                }
                }.navigationBarTitle("长度转换").padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
