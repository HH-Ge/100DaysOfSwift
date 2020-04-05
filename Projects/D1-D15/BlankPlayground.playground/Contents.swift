import UIKit

let rootWord = "balloons"

var str1: [String]
var str2: [String]
var str3: [String]
var str4: [String]
var str5: [String]
var str6: [String]
var str7: [String]
var str8: [String]


var words:[Int: [String]] = [:]

words.updateValue([], forKey: 3)

for i in 3...8 {
    words.updateValue([], forKey: i)
}

words[3]?.append("abc")
words[3]?.append("qwe")
print(words[3]!)
