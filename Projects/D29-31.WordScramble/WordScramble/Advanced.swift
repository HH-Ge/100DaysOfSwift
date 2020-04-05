//
//  Advanced.swift
//  WordScramble
//
//  Created by Howard Ge on 2020/4/5.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct Advanced: View {
    @State private var allWords = [String]()
    @State private var usedWords = [String]()   // 使用过的单词数组
    @State private var rootWord = ""            // 词根
    @State private var newWord = ""             // 用户输入的词
    
    @State private var errorTitle = ""          // 错误警告标题
    @State private var errorMessage = ""        // 错误警告信息
    @State private var showingError = false     // 控制显示警告对话框
    
    @State private var showingRules = false     // 控制显示规则
    
    @State private var wordCount = 0
    

    private var greetings: String {
        switch wordCount {
        case 1:
            return "恭喜，"
        case 5:
            return "酷，"
        case 10:
            return "哇塞，"
        case 15:
            return "天哪！"
        case 20:
            return "服了你了，"
        default:
            return ""
        }
    }
 
    private var rules:String { return showingRules ? "游戏规则：利用下面单词中的字母组成新的单词，每个字母只能用一次" : "" }

    
    func addNewWord() {
        // 将单词变为小写，去掉空格
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // 如果是空字符串就退出
        guard answer.count >= 3 else {
            wordError(title: "单词 \(answer) 长度过短", message: "请输入一个长度不小于 3 的单词")
            newWord = ""
            return
        }
        
        // 校验单词是否重复
        guard isOriginal(word: answer) else {
            wordError(title: "单词 \(answer) 已经输入过了", message: "请输入一个没用过的单词")
            newWord = ""
            return
        }
        
        // 校验单词是否来自 词根
        guard isPossible(word: answer) else {
            let title = String("单词 \(answer) 不是从 \(rootWord) 来的")
            let message = String("只能在 \(rootWord) 中选择字母，每个字母只能选择一次")
            wordError(title: title, message: message)
            newWord = ""
            return
        }
        
        // 校验单词拼写错误
        guard isReal(word: answer) else {
            wordError(title: "单词 \(answer) 没有意义", message: "请输入拼写正确的单词")
            newWord = ""
            return
        }
        
        // 将输入的单词加入的数组第一个，保证在列表的第一行显示
        usedWords.insert(answer, at: 0)
        wordCount += 1
        // 清空输入框
        newWord = ""
    }
    
    func startGame() {
        // 在应用的 bundle 中找到 start.txt 的 URL
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. 将 start.txt 赋值给字符串变量 startWords
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. 使用换行符将字符串变量分割为字符串数组
                allWords = startWords.components(separatedBy: "\n")
                
                // 4. 随机选择一个元素作为词根，默认为 nothing
                rootWord = allWords.randomElement() ?? "nothing"
                
                // 如果所有一切都正常，就返回（退出方法）
                return
            }
        }
        
        // 如果发生了问题，调用 fatalError 函数
        fatalError("不能在 bundle 中加载 start.txt。")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord        // 复制词根
        // 遍历输入的单词
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                // 如果字母在词根中找到，在词根中移除掉这个字母
                tempWord.remove(at: pos)
            } else {
                // 如果没找到，返回 false
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("猜单词")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    
                Spacer()
                
                Image(systemName: "questionmark.circle")
                    .onTapGesture {
                        self.showingRules.toggle()
                }
            }
            .foregroundColor(.blue)
            .padding(.horizontal, 15)
            
            Text(rules)
                .font(.subheadline)
                .frame(maxWidth: .infinity, minHeight: 0)
                .padding(.horizontal, 15)
            
            VStack {
                Text(wordCount == 0 ? "" : "\(greetings) 您已经猜出了 \(wordCount) 个单词。")
                    .foregroundColor(.purple)
                
                Text(rootWord)
                    .font(.largeTitle)
                    .bold()
            }
            
            
            VStack {
                TextField("请输入", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                    .keyboardType(.asciiCapable)
                
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
            }
            .onAppear(perform: startGame)
            .alert(isPresented: $showingError) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("好")))
            }
            
            Button("重新开始") {
                self.wordCount = 0
                self.newWord = ""
                self.rootWord = self.allWords.randomElement() ?? "nothing"
                self.usedWords = [String]()
                
            }
            
        }.padding(.top, 20)
    }
}

struct Advanced_Previews: PreviewProvider {
    static var previews: some View {
        Advanced()
    }
}


