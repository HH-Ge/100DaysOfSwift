import UIKit

struct fist {
    var imageName: String
    var gestureName: String

}

let gestureArray = [
    fist(imageName: "cube.fill", gestureName: "石头"),
    fist(imageName: "scissors", gestureName: "剪刀"),
    fist(imageName: "stop.fill", gestureName: "布")
]

let ai = gestureArray.shuffled()[0]
print(gestureArray)
print(ai.gestureName)


for i in 0..<gestureArray.count {
    print(gestureArray[i])
}
var a = Int.random(in: 0...2)

print(a)
