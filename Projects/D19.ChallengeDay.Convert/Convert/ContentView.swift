//
//  ContentView.swift
//  Convert
//
//  Created by Howard Ge on 2020/3/23.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isMetricToEnglish = true
    @State private var inputString = ""
    @State private var inIndex = 0
    @State private var outIndex = 0
    var result: Double {
        var outNumber: Double = 0
        let inCoe = inArray[inIndex].coefficient
        let outCoe = outArray[outIndex].coefficient
        let inNumber = Double(inputString) ?? 0
        let rate = isMetricToEnglish ? 1/25.4 : 25.4
        outNumber = inNumber * inCoe * rate / outCoe
        return outNumber
    }
    var inArray:[LengthUnit]  { return isMetricToEnglish ? MetricUnits : EnglishUnits }
    var outArray:[LengthUnit]  { return !isMetricToEnglish ? MetricUnits : EnglishUnits }
    
    var body: some View {
        
        NavigationView{
            VStack{
                Button(action: {self.isMetricToEnglish.toggle()}){
                    Text(isMetricToEnglish ? "公制 → 英制" : "英制 → 公制")
                        .font(.headline)
                }
                .frame(width: 120, height: 40)
                .foregroundColor(.white)
                .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                .cornerRadius(CGFloat(10.0))
                .shadow(radius: CGFloat(15.0))
                
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
