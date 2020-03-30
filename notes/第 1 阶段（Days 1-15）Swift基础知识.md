# 第 1 阶段（Days 1-15）Swift 基础知识 - Introduction to Swift

前面 12 天是对学习 Swift 的热身。每天观看一分钟的视频（可惜看不了），然后完成后面的小测验。

## [百日学 Swift（Day 1）](https://www.hackingwithswift.com/100/1) – variables, simple data types, and string interpolation（变量，简单数据类型和字符串插值）

### [1. Variables（变量）](https://www.hackingwithswift.com/sixty/1/1/variables) – [test](https://www.hackingwithswift.com/review/variables)

> 打开 Xcode 的欢迎界面，选择 `Get Started with a Playground`，这是一种沙盒，可以在里面直接键入 Swift 代码并马上看见结果。

变量必须***先声明再使用***，使用 `var`关键字声明变量。

```swift
let number = 52
var str = "Hello Swift"
var image: Image	// 显示指定类型为 Image
```

> 注：不显式指定类型，Swift 可以根据值推导类型。

### [2. Strings and integers（整型和字符型）](https://www.hackingwithswift.com/sixty/1/2/strings-and-integers) – [test](https://www.hackingwithswift.com/review/strings-and-integers)

Swift 是类型安全语言，变量必须指定类型，`String`是字符型，`Int`是整数型，变量指明类型后不能赋予其他类型的值。

```swift
var population = 12_432_000	// 使用 _ 可以替代平时书写数字的逗号（没大用）
population = "hello"		// 这会报错，因为不能把 String 赋给 Int 类型的变量
```

### [3. Multi-line strings（多行字符）](https://www.hackingwithswift.com/sixty/1/3/multi-line-strings) – [test](https://www.hackingwithswift.com/review/multi-line-strings)

```swift
var str1 = """
this goes
over multiple
lines
"""

print(str1)

var str2 = """
this goes \
in one \
line
"""

print(str2)
```

使用三个双引号`"""` 输入多行文字，如果每行末尾使用了`\`，则下一行文字不会另起。上述代码运行结果是：

```
this goes
over multiple
lines
this goes in one line

```

### [4. Doubles and booleans（双精度型和布尔型）](https://www.hackingwithswift.com/sixty/1/4/doubles-and-booleans) – [test](https://www.hackingwithswift.com/review/doubles-and-booleans)

给变量赋予一个带小数的值时，Swift 自动设定类型为双精度型（`Double`），这和整型是不一样的。给变量赋予 `true`或者 `false`时，Swift 自动设定类型为布尔型（`Bool`），用来判断是否。

### [5. String interpolation（字符串插值）](https://www.hackingwithswift.com/sixty/1/5/string-interpolation) – [test](https://www.hackingwithswift.com/review/string-interpolation)

Swift 提供了一种字符串插值的方法用于拼接字符串。后面会看到不仅可以插值，甚至可以运行代码。

``` swift
var score = 87
var str = "Your score is (\score)"
```

此时，str 的值为：Your score is 87

### [6. Constants（常量）](https://www.hackingwithswift.com/sixty/1/6/constants) – [test](https://www.hackingwithswift.com/review/constants)

使用 let 声明，***只能赋值一次，不能重新赋值***。

### [7. Type annotations（类型注解）](https://www.hackingwithswift.com/sixty/1/7/type-annotations) – [test](https://www.hackingwithswift.com/review/type-annotations)

即显式声明类型

```swift
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true
```

### [8. Simple types: Summary（简单类型小结）](https://www.hackingwithswift.com/sixty/1/8/simple-types-summary) – [test](https://www.hackingwithswift.com/review/simple-types-summary)

> - 可以使用var和创建常量let。最好尽可能多地使用常量。
> - 字符串以双引号开头和结尾，但是如果希望它们跨多行运行，则应使用三组双引号。
> - 整数保存整数，双精度数保留小数，布尔值保留真或假。
> - 字符串插值允许从其他变量和常量创建字符串，并将其值放在字符串中。
> - Swift使用类型推断为每个变量或常量分配类型，但是可以根据需要显式指定类型。

## [百日学 Swift（Day 2）](https://www.hackingwithswift.com/100/2) – arrays, dictionaries, sets, and enums（数组，字典，Set 和枚举）

### [1. Arrays（数组）](https://www.hackingwithswift.com/sixty/2/1/arrays) – [test](https://www.hackingwithswift.com/review/arrays)

存放***单一类型数据***的集合。声明数组的形式如下，注意类型说明要用方括号 `[]` 括起来。数组中元素的个数为数组的***长度***。使用***下标（索引）***访问数组中的元素。第一个元素的索引是 0。可访问元素的索引最大值为`数组长度-1`，超过这个值的索引会报错。

```swift
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]
beatles[1]  // 值为 paul
```

### [2. Sets](https://www.hackingwithswift.com/sixty/2/2/sets) – [test](https://www.hackingwithswift.com/review/sets)

与数组的区别有两点：

- 元素数据的存放是***无序的（随机存放）***
- 元素数据都是***唯一的（不重复）***

```swift
let colors = Set(["red", "green", "blue"])
print(colors)

let colors2 = Set(["red", "green", "blue", "red", "blue", "yellow"])
print(colors2)
```

```shell
["blue", "red", "green"]
["red", "blue", "green", "yellow"]	// 重复的值被去掉了
```

### [3. Tuples（元组）](https://www.hackingwithswift.com/sixty/2/3/tuples) – [test](https://www.hackingwithswift.com/review/tuples)

特点：

- 不能向元组添加数据或者从其中删除数据，因为元组的***大小是固定的***
- 不能改变元组的类型
- 可以通过索引或者名称访问元组，但是不能越界访问或者访问不存在的名称。

```swift
var name = (first: "Taylor", last: "Swift")
name.0	// 值为 Taylor
name.last 	// 值为 Swift
```

### [4. Arrays vs sets vs tuples（数组、Set 和元组）](https://www.hackingwithswift.com/sixty/2/4/arrays-vs-sets-vs-tuples) – [test](https://www.hackingwithswift.com/review/arrays-vs-sets-vs-tuples)

三者很像，具体应用各有侧重。可以考虑以下原则：

- 元组：用于特定的、固定长度，每个元素都有固定的位置和名称
- Set ：收集不重复的值，可以快速检索
- 数组：允许重复值，有序排列

数组是三者中最常用的。

```swift
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")	// 元组
let set = Set(["aardvark", "astronaut", "azalea"])								// Set
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]			// 数组
```

### [5. Dictionaries（字典）](https://www.hackingwithswift.com/sixty/2/5/dictionaries) – [test](https://www.hackingwithswift.com/review/dictionaries)

字典就像数组一样是值的集合，但是不必使用整数位置存储，而是使用所需的任何内容来访问。像字典一样，对于每个 `key` 都有对应的 `value`。和数组一样，字典以方括号开头和结尾，并且每个项目都以逗号分隔。多数情况下，key 都使用 String 类型。

> **注意：**使用类型注释时，字典用括号括起来，在您的标识符和值类型之间加冒号。例如`[String: Double]`和`[String: String]`。

```swift
let heights = [				// 记录身高	
    "Li Lei": 1.83,			// 李雷的身高
    "Han Meimei": 1.65		// 韩梅梅的身高
]
heights["Li Lei"]			// 值是 1.83
```

### [6. Dictionary default values（字典的默认值）](https://www.hackingwithswift.com/sixty/2/6/dictionary-default-values) – [test](https://www.hackingwithswift.com/review/dictionary-default-values)

如果尝试使用一个不存在的键从字典中读取一个值，Swift会返回`nil`——根本没有。尽管这可能是想要的结果，但是还有另一种选择：我们可以为字典提供一个默认值，以供在需要缺少键的情况下使用。

```swift
let favoriteIceCream = [		// 喜爱的冰淇淋
    "李雷": "Chocolate",
    "韩梅梅": "Vanilla"
]
```

```swift
favoriteIceCream["李雷"]			// 李雷最喜欢的冰淇淋
```

但是，如果尝试获取林涛最喜欢的冰淇淋，则会得到 `nil`：

```swift
favoriteIceCream["林涛"]
```

可以通过将字典的默认值设置为“Unknown”来解决此问题，以便在未找到林涛最喜欢的冰淇淋时，返回“Unknown”而不是nil：

```swift
favoriteIceCream["林涛", default: "Unknown"]
```

### [7. Creating empty collections（创建空集合）](https://www.hackingwithswift.com/sixty/2/7/creating-empty-collections) – [test](https://www.hackingwithswift.com/review/creating-empty-collections)

```swift
var teams = [String: String]()				// 创建空字典
teams["Paul"] = "Red"						// 向字典添加条目
var scores = Dictionary<String, Int>()		// 创建空字典，key是String，value是Int

var results = [Int]()						// 创建空数组，元素是 Int
var results = Array<Int>()					// 创建元素是Int的数组

var words = Set<String>()					// 创建空 Set，元素是 String
var numbers = Set<Int>()					// 创建空 Set，元素是 Int
```

注意：字典和数组的创建方式有两种，而 Set 的创建方法只有一种，虽然写了两个，但是方式是一样的，只是数据类型不同。

### [8. Enumerations（枚举）](https://www.hackingwithswift.com/sixty/2/8/enumerations) – [test](https://www.hackingwithswift.com/review/enumerations)

枚举定义了一组值，在取值的时候，只能取其中的一个。

```swift
enum Department {			// 设置枚举：部门，只能是四个值中的一个。这样可以避免写错			
    case Tech
    case Finance
    case Sales
    case Market
}
let dept = Department.Tech	// 设定部门为 Tech，
```

### [9. Enum associated values（枚举关联值）](https://www.hackingwithswift.com/sixty/2/9/enum-associated-values) – [test](https://www.hackingwithswift.com/review/enum-associated-values)

除了存储简单值之外，枚举还可以存储附加到每种情况的***关联***值。这使可以给枚举添加附加信息，使它们可以代表存在更多细微差别的数据。

```swift
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let talking = Activity.talking(topic: "football")
```

### [10. Enum raw values（枚举原始值）](https://www.hackingwithswift.com/sixty/2/10/enum-raw-values) – [test](https://www.hackingwithswift.com/review/enum-raw-values)

Swift 会自动为每个数字分配一个从 0 开始的数字，可以使用该数字得到对应的枚举值，这就是枚举的***原始值***（raw value）。

```swift
enum FamilyName: Int {
    case 赵
    case 钱
    case 孙
    case 李
}
```

但有时候可能需要修改原始值值。如：百家姓的第一个姓氏的值为 0 ，不大符合习惯，所以改成下面这样：

```swift
enum FamilyName: Int {
    case 赵 = 1
    case 钱
    case 孙
    case 李
}
```

这样 **赵** 的取值就是 1 了，后面的也都依次改变。如果要取其中的值，可以：

```swift
let family = FamilyName(rawValue: 4)	// 这样会取到 李
```

### [11. Complex types: Summary（复杂类型：总结）](https://www.hackingwithswift.com/sixty/2/11/complex-types-summary) – [test](https://www.hackingwithswift.com/review/complex-types-summary)

> - 数组，集合，元组和字典都是在单个值下存储一组项目。它们各自以不同的方式执行此操作，因此使用哪种方法取决于所需的行为。
> - 数组按添加顺序存储项目，并使用数字位置访问它们。
> - Set 存储项目时没有任何顺序，因此您不能使用数字位置访问它们。
> - 元组的大小是固定的，您可以在每个项目中附加名称。您可以使用数字位置或名称来阅读项目。
> - 词典根据键存储项目，您可以使用这些键阅读项目。
> - 枚举是对相关值进行分组的一种方式，因此可以使用它们而不会出现拼写错误。
> - 可以将原始值附加到枚举，以便可以从整数或字符串创建它们，也可以添加关联的值以存储其他信息。

## [百日学 Swift（Day 3）](https://www.hackingwithswift.com/100/3)– operators and conditions（操作符和条件）

### [1. Arithmetic Operators（算数运算符）](https://www.hackingwithswift.com/sixty/3/1/arithmetic-operators) – [test](https://www.hackingwithswift.com/review/arithmetic-operators)

`+`，`-`，`*`，`/`，`%`（取余）

### [2. Operator overloading（运算符重载）](https://www.hackingwithswift.com/sixty/3/2/operator-overloading) – [test](https://www.hackingwithswift.com/review/operator-overloading)

`+`可以用来连接字符串

```swift
let meaningOfLife = 42
let doubleMeaning = 42 + 42

let students = "学生 "
let action = students + "刻苦学习"

let firstHalf = ["张学友", "刘德华"]
let secondHalf = ["黎明", "郭富城"]
let fourKings = firstHalf + secondHalf
```

### [3. Compound assignment operators（复合赋值符）](https://www.hackingwithswift.com/sixty/3/3/compound-assignment-operators) – [test](https://www.hackingwithswift.com/review/compound-assignment-operators)

`+=`，`-=`，`*=`，`/=`，将自身与给定数值计算后再赋值给自身。

```swift
var score = 95
score -= 5		// 等价于 score = score - 5，score的最后结果为 90
var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards" // 最后结果为：The rain in Spain falls mainly on the Spaniards
```

### [4. Comparison operators（比较运算符）](https://www.hackingwithswift.com/sixty/3/4/comparison-operators) – [test](https://www.hackingwithswift.com/review/comparison-operators)

`==`，`!=`，`<=`，`<`，`>`，`>=`，可用于比较数值和字符串。

### [5. Conditions（条件）](https://www.hackingwithswift.com/sixty/3/5/conditions) – [test](https://www.hackingwithswift.com/review/conditions)

```swift
let score = 86
if score >= 90 {
    print("A")
} else if score >= 60 {
    print("B")
} else {
    print ("C")
}
```

### [6. Combining conditions（组合条件）](https://www.hackingwithswift.com/sixty/3/6/combining-conditions) – [test](https://www.hackingwithswift.com/review/combining-conditions)

`&&` 与，`||` 或

### [7. The ternary operator（三元运算符）](https://www.hackingwithswift.com/sixty/3/7/the-ternary-operator) – [test](https://www.hackingwithswift.com/review/the-ternary-operator)

`条件 ？条件为真的结果 : 条件为假的结果`

### [8. Switch statements（Switch 语句）](https://www.hackingwithswift.com/sixty/3/8/switch-statements) – [test](https://www.hackingwithswift.com/review/switch-statements)

```swift
switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough	// 继续执行下一种条件，“穿透”
default:		// 所有 case 不符合时给的默认处理
    print("Enjoy your day!")
}
```

### [9. Range operators（范围运算符）](https://www.hackingwithswift.com/sixty/3/9/range-operators) – [test](https://www.hackingwithswift.com/review/range-operators)

Swift提供了两种生成范围的方式：`..<`和`...`运算符。

- 半开范围运算符`..<`，创建范围不超过最终值，但  ***不包括*** 最终值；
- 封闭范围运算符`...`，创建范围不超过最终值，但***包括***最终值。

例如，范围`1..<5`包含数字1、2、3和4，而范围`1...5`包含数字1、2、3、4和5。

### [10. Operators and conditions summary（运算符和条件小结）](https://www.hackingwithswift.com/sixty/3/10/operators-and-conditions-summary) – [test](https://www.hackingwithswift.com/review/operators-and-conditions-summary)

> - Swift 具有用于进行算术和比较的运算符；
> - 算术运算符有多种变体，可以在适当的位置修改其变量：`+=`，`-=`等等。
> - 可以使用`if`，`else`和`else if`根据条件的结果运行代码。
> - Swift 具有三元运算符，该运算符将校验与正确和错误的代码块结合在一起。
> - 如果有多个条件使用相同的值，则通常更容易使用`switch`。
> - 可以使用范围运算符`..<`和`...`，具体取决于应排除还是包括最后一个数字。

## [百日学 Swift（Day 4）](https://www.hackingwithswift.com/100/4) – loops, loops, and more loops（循环，循环，再循环）

### [1. For loops（for 循环）](https://www.hackingwithswift.com/sixty/4/1/for-loops) – [test](https://www.hackingwithswift.com/review/for-loops)

```swift
// 方式 1
let count = 1...10
for number in count {
    print("你看到的数字是：\(number)")
}
// 方式 2
let courses = ["语文", "数学", "英语"]
for course in courses {
    print("\(course) 在课表中")
}
// 方式 3
print("人生就是 ")
for _ in 1...5 {
    print("努力")
}
```

> 方式 3 中使用的`_`符号，表示循环体没有用到循环变量，在此忽略。实际上，在 Swift 中的任何地方，凡是遇到这种情况都可以使用。我称之为*“**忽略一切**”*的`_`。另外，

### [2. While loops（while 循环）](https://www.hackingwithswift.com/sixty/4/2/while-loops) – [test](https://www.hackingwithswift.com/review/while-loops)

```swift
var countDown = 10

while countDown >= 0 {
    print(countDown)
    countDown -= 1
}

print("点火!")
```

### [3. Repeat loops（repeat 循环）](https://www.hackingwithswift.com/sixty/4/3/repeat-loops) – [test](https://www.hackingwithswift.com/review/repeat-loops)

```swift
var countDown = 10

repeat {
    print(countDown)
    countDown -= 1
} while countDown >= 0	// 循环至少执行一次

print("点火!")
```

### [4. Exiting loops（跳出循环）](https://www.hackingwithswift.com/sixty/4/4/exiting-loops) – [test](https://www.hackingwithswift.com/review/exiting-loops)

```swift
var countDown  = 10
while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("没完没了的，烦了，不玩了!")
        break	// 跳出循环
    }

    countDown -= 1
}
```

### [5. Exiting multiple loops（跳出多重循环）](https://www.hackingwithswift.com/sixty/4/5/exiting-multiple-loops) – [test](https://www.hackingwithswift.com/review/exiting-multiple-loops)

```swift
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("如果是 50 就跳出循环!")
            break outerLoop		// 跳出多重循环
        }
    }
}
```

### [6. Skipping items（略过项目）](https://www.hackingwithswift.com/sixty/4/6/skipping-items) – [test](https://www.hackingwithswift.com/review/skipping-items)

```swift
for i in 1...10 {
    if i % 2 == 1 {
        continue	// 如果是奇数就不打印
    }
    print(i)
}
```

### [7. Infinite loops（死循环）](https://www.hackingwithswift.com/sixty/4/7/infinite-loops) – [test](https://www.hackingwithswift.com/review/infinite-loops)

```swift
var counter = 0

while true {		// 循环条件始终为真，循环将一直进行下去。
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}
```

### [8. Looping summary（循环小结）](https://www.hackingwithswift.com/sixty/4/8/looping-summary) – [test](https://www.hackingwithswift.com/review/looping-summary)

> - 循环可以重复运行代码，直到条件为假时停止。
> - 最常见的循环是`for`，它将循环中的每个项目分配给一个临时常数。
> - 如果不需要`for`循环给的临时常量，请改用下划线，这样Swift可以忽略它。
> - 可以给`while`循环一个用于检查的明确条件。
> - 类似于`while`循环，但`repeat`循环始终至少在其循环体中运行一次。
> - 可以使用`break`退出单个循环，但如果是嵌套循环，则需要在 `break`后加上在外部循环之前放置的标签。
> - 可以使用`continue`跳过循环项目。
> - 并使用`while true`会造成死循环。所以一定要确保有条件终止循环！

## [百日学 Swift（Day5）](https://www.hackingwithswift.com/100/5) – functions, parameters, and errors（函数，参数和错误）

### [1. Writing functions（编写函数）](https://www.hackingwithswift.com/sixty/5/1/writing-functions) – [test](https://www.hackingwithswift.com/review/writing-functions)

Swift 函数以`func`关键字开头，然后是函数名称，然后打开和关闭括号。函数的所有主体（应在请求函数时运行的代码）都放在花括号内。

### [2. Accepting parameters（接受参数）](https://www.hackingwithswift.com/sixty/5/2/accepting-parameters) – [test](https://www.hackingwithswift.com/review/accepting-parameters)

Swift 允许将值发送到函数，然后可以在函数内部使用它，以这种方式发送到函数中的值称为***参数***。

为了让函数接受参数，请给每个参数起一个名称，然后输入一个冒号`:`，然后指明 Swift 数据类型。所有这些都在函数名称后面的括号内。

```swift
func square(number: Int) {
    print(number * number)
}
```

### [3. Returning values（返回值）](https://www.hackingwithswift.com/sixty/5/3/returning-values) – [test](https://www.hackingwithswift.com/review/returning-values)

除了接收数据，函数还可以返回数据。在函数的参数列表后写 `->`，然后告诉 Swift 将返回哪种数据类型。在函数内部，`return`语句将返回其中的值。

```swift
func square(number: Int) -> Int {
    return number * number
}
// 调用函数
let result = square(number: 8)
print(result)
```

### [4. Parameter labels（参数标签）](https://www.hackingwithswift.com/sixty/5/4/parameter-labels) – [test](https://www.hackingwithswift.com/review/parameter-labels)

Swift 允许为每个参数提供两个名称：一个在调用函数时在外部使用，另一个在函数内部在内部使用，中间用空格隔开。

```swift
func sayHello(to name: String) { 	// 两个名称，to 给外部使用，name 给内部使用
    print("Hello, \(name)!")		// 内部使用 name
}
//调用函数
sayHello(to: "Taylor")				// 外部使用 to
```

### [5. Omitting parameter labels（省略参数标签）](https://www.hackingwithswift.com/sixty/5/5/omitting-parameter-labels) – [test](https://www.hackingwithswift.com/review/omitting-parameter-labels)

可以将参数标签写为 `_`，这样调用的时候就不用写参数标签了。缺点就是表意不清，更适合哪种一看就知道是啥参数意义的。

```swift
func greet(_ person: String) {
    print("你好, \(person)!")
}
// 调用
greet("麦兜")
```

### [6. Default parameters（默认参数）](https://www.hackingwithswift.com/sixty/5/6/default-parameters) – [test](https://www.hackingwithswift.com/review/default-parameters)

```swift
func greet(_ person: String, nicely: Bool = true) {	// nicely 的参数默认值为 true
    if nicely == true {
        print("你好, \(person)!")
    } else {
        print("😓 呃~~怎么又是 \(person) ...")
    }
}
```

可以通过两种方式进行调用：

```swift
greet("麦兜")
greet("麦兜", nicely: false)
```

### [7. Variadic functions（可变参数函数）](https://www.hackingwithswift.com/sixty/5/7/variadic-functions) – [test](https://www.hackingwithswift.com/review/variadic-functions)

可以在参数类型后面加上`...`使其变为可变参数。因此，`Int`参数是单个整数，而`Int...`表示可以为一个或多个整数。

在函数内部，Swift 将传入的值转换为整数数组，因此可以根据需要循环使用它们。

```swift
// 一次传递三个参数，打印结果会被空格分开
print("学生", "努力", "学习")
// 打印平方数
func square(numbers: Int...) {	// numbers 为可变参数
    for number in numbers {
        print("\(number) 的平方是 \(number * number)")
    }
}
// 调用函数
square(numbers: 1, 2, 3, 4, 5)
```

### [8. Writing throwing functions（编写抛出错误函数）](https://www.hackingwithswift.com/sixty/5/8/writing-throwing-functions) – [test](https://www.hackingwithswift.com/review/writing-throwing-functions)

有时，函数由于输入错误或内部出错而失败。Swift 通过在返回类型之前标记`throws`的方式来抛出函数错误，然后使用关键字`throw`在出现问题时执行抛出操作。首先，需要定义一个`enum`描述可能引发的错误。这些必须始终基于 Swift 中的`Error`类型。

我们将编写一个检查密码是否正确的函数，因此，如果用户尝试使用明显的密码，则会抛出错误：

```swift
enum PasswordError: Error {	// 自定义的错误，类型必须是 Error
    case obvious
}
```

例如：

```swift
func checkPassword(_ password: String) throws -> Bool {	// 遇到错误会抛出的函数，使用 throws 关键字定义
    if password == "password" {
        throw PasswordError.obvious		// 当 password 的值为 "password" 时，使用 throw 关键字抛出错误
    }
    return true
}
```

### [9. Running throwing functions（运行抛出错误）](https://www.hackingwithswift.com/sixty/5/9/running-throwing-functions) – [test](https://www.hackingwithswift.com/review/running-throwing-functions)

使用 `do...try...catch`捕捉错误。

```swift
do {
    try checkPassword("password")				// 尝试调用函数
    print("一切正常")						  	 // 没有遇到错误
} catch {
    print("对不起，出错了~~")					   // 遇到错误
}
```

### [10. inout parameters（inout 参数）](https://www.hackingwithswift.com/sixty/5/10/inout-parameters) – [test](https://www.hackingwithswift.com/review/inout-parameters)

在函数参数类型之前加上 `inout`关键字表示该参数可以通过本函数进行修改。

以往的做法：

```swift
func doubleInPlace(number: Int) -> Int {
    return number * 2
}

var a = 15

a = doubleInPlace(number: a)

print(a)
```

使用 inout ：

```swift
func doubleInPlace(number: inout Int) {
     number *= 2		// 在这里修改了 传入的变量 a 的值
}

var a = 15

doubleInPlace(number: &a)

print(a)

```

*个人感受这个东西还是不用的好，出错八成不好查。*

### [11. Functions summary（函数小结）](https://www.hackingwithswift.com/sixty/5/11/functions-summary) – [test](https://www.hackingwithswift.com/review/functions-summary)

> - 函数可以复用代码。
> - 函数可以接受参数——只需告诉Swift每个参数的类型即可。
> - 函数可以返回值，只需指定要发送回什么类型。如果要返回几件事，请使用元组。
> - 可以在内部和外部使用不同的名称作为参数，也可以完全省略外部名称。
> - 参数可以具有默认值，这有助于在特定值常见时减少编写代码。
> - 可变参数函数接受零个或多个特定参数，而Swift将输入转换为数组。
> - 函数可能引发错误，使用 `do...try...catch`捕捉错误。
> - 可以`inout`用来更改函数中的变量，但是通常最好返回一个新值。

## [百日学 Swift（Day 6）](https://www.hackingwithswift.com/100/6) – closures part one（闭包：第 1 部分）

### [1. Creating basic closures（创建基础闭包）](https://www.hackingwithswift.com/sixty/6/1/creating-basic-closures) – [test](https://www.hackingwithswift.com/review/creating-basic-closures)

在 Swift 中可以像使用其他类型（如字符串和整数）一样使用函数。这意味着可以创建一个函数并将其分配给一个变量，使用该变量调用该函数，甚至将该函数作为参数传递给其他函数。

以这种方式使用的函数称为*闭包*，尽管它们像函数一样工作，但编写方式有所不同。

让我们从一个简单的示例开始，该示例显示一条消息：

```swift
let driving = {
    print("我在开车")
}
```

这样可以有效地创建一个没有名称的函数，并将该函数分配给`driving`。现在，您可以`driving()`像调用常规函数一样进行调用，如下所示：

```swift
driving()
```

### [2. Accepting parameters in a closure（在闭包中接受参数）](https://www.hackingwithswift.com/sixty/6/2/accepting-parameters-in-a-closure) – [test](https://www.hackingwithswift.com/review/accepting-parameters-in-a-closure)

创建闭包时，它们没有名称或空格来写入任何参数。这并不意味着他们不能*接受*参数，只是他们以不同的方式*接受*参数：它们*在*大括号*内*列出。

要使闭包接受参数，请在开括号后面的括号内列出它们，然后加上`in`以便Swift知道闭包的主体正在开始。

例如，我们可以制作一个接受地名字符串作为其唯一参数的闭包，如下所示：

```swift
let driving = { (place: String) in
    print("我要开车去\(place)")
}
```

函数和闭包之间的区别之一是，在运行闭包时不使用参数标签。

```swift
driving("杭州")
```

### [3. Returning values from a closure（从闭包返回值）](https://www.hackingwithswift.com/sixty/6/3/returning-values-from-a-closure) – [test](https://www.hackingwithswift.com/review/returning-values-from-a-closure)

闭包也可以返回值，它们的写法与参数类似：您可以将其写在闭包中，就在`in`关键字之前。

为了说明这一点，我们将使用`driving()`闭包并使其返回其值，而不是直接打印它。这是原始的：

```swift
let driving = { (place: String) in
    print("我要开车去\(place)")
}
```

我们希望闭包返回一个字符串而不是直接打印消息，因此我们需要使用`-> String`before `in`，然后`return`像普通函数一样使用：

```swift
let drivingWithReturn = { (place: String) -> String in
    return "我要开车去\(place)"
}
```

现在，我们可以运行该闭包并打印其返回值：

```swift
let message = drivingWithReturn("杭州")
print(message)
```

### [4. Closures as parameters（闭包作为参数）](https://www.hackingwithswift.com/sixty/6/4/closures-as-parameters) – [test](https://www.hackingwithswift.com/review/closures-as-parameters)

因为闭包可以像字符串和整数一样使用，所以可以将它们传递给函数。

首先，这是我们的基本闭包`driving()`

```swift
let driving = {
    print("I'm driving in my car")
}
```

如果我们想将该闭包传递给函数，以便可以在该函数内部运行，则可以将参数类型指定为`() -> Void`。这意味着“不接受任何参数，然后返回`Void`”

因此，我们可以编写一个`travel()`接受各种旅行行为的函数，并在此之前和之后打印一条消息：

```swift
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
```

现在，我们可以使用`driving`闭包来调用它，如下所示：

```swift
travel(action: driving)
```

### [5. Trailing closure syntax（尾随闭包语法）](https://www.hackingwithswift.com/sixty/6/5/trailing-closure-syntax) – [test](https://www.hackingwithswift.com/review/trailing-closure-syntax)

如果函数的最后一个参数是闭包，Swift 可以使用称为*尾随闭包*的特殊*语法*。与其将闭包中作为参数传递，不如在括号内的函数之后直接传递它。

为了证明这一点，这又是我们的`travel()`功能。它接受`action`闭包，以便可以在两个`print()`调用之间运行：

```swift
func travel(action: () -> Void) {
    print("准备出发")
    action()
    print("已到达目的地，本次导航结束")
}
```

因为它的最后一个参数是闭包，所以我们可以对`travel()`使用尾随闭包语法进行**调用**，如下所示：

```swift
travel() {
    print("高德导航持续为您服务")
}
```

实际上，由于没有任何其他参数，我们可以完全消除括号：

```swift
travel {
    print("高德导航持续为您服务")
}
```

尾随闭包语法在Swift中非常普遍。

## [百日学 Swift（Day7）](https://www.hackingwithswift.com/100/7) – closures part two（闭包：第 2 部分）

### [1. Using closures as parameters when they accept parameters（闭包作为参数时接受参数）](https://www.hackingwithswift.com/sixty/6/6/using-closures-as-parameters-when-they-accept-parameters) – [test](https://www.hackingwithswift.com/review/using-closures-as-parameters-when-they-accept-parameters)

传递给函数的闭包也可以接受给自己的参数。

`() -> Void`意思是“不接受任何参数，什么也不返回”，但是可以在`()`中添加参数类型。

为了说明这一点，我们可以编写一个`travel()`函数，该函数接受闭包作为唯一参数，然后该闭包又接受字符串：

```swift
func travel(action: (String) -> Void) {
    print("准备出发")
    action("杭州")
    print("开始导航")
}
```

现在，当我们`travel()`使用结尾闭包语法进行调用时，同样需要提供字符串类型的参数：

```swift
travel { (place: String) in
    print("目的地是\(place)")
}
```

**换一种写法试试：**

``` swift
func travel(destination: String, action: (String) -> Void) {	// action 是闭包，也是最后一个参数
  print("准备出发")
  action(destination)	// 将参数传递给闭包
  print("已到达目的地，本次导航结束")
}

travel(destination: "杭州") { (place: String) in    // 调用 travel 函数时，尾随闭包加上参数
  print("目的地是 \(place) ")						 // 在闭包中使用参数
}
// 把 destination 也写成 place 是很多人的惯常做法，这里只是为了看清楚谁是谁
```

### [2. Using closures as parameters when they return values（将可以返回值的闭包作为参数）](https://www.hackingwithswift.com/sixty/6/7/using-closures-as-parameters-when-they-return-values) – [test](https://www.hackingwithswift.com/review/using-closures-as-parameters-when-they-return-values)

重写上面的 travel()  函数

```swift
func travel(destination: String, action: (String) -> String) {	// action 是尾随闭包，返回 String
  print("I'm getting ready to go.")
  let description = action(destination)	// 将参数传递给闭包
  print(description)
  print("I arrived!")
}

travel(destination: "Beijing") { (place: String) -> String in		// 调用 travel 函数时，尾随闭包加上参数
  return "I'm going to \(place) in my car"							// 在闭包中使用参数
}
```

运行结果与 1. 相同

### [3. Shorthand parameter names（简化参数名）](https://www.hackingwithswift.com/sixty/6/8/shorthand-parameter-names) – [test](https://www.hackingwithswift.com/review/shorthand-parameter-names)

我们刚刚做了一个`travel()`函数，其中一个参数是闭包，其本身接受一个参数并返回一个字符串。然后在对`print()`的两次调用之间运行该闭包。

这是代码中的内容：

```swift
func travel(destination: String, action: (String) -> String) {	// action 是尾随闭包，返回 String
  print("准备出发")
  let description = action(destination)	// 将参数传递给闭包
  print(description)
  print("到达目的地，本次导航结束")
}
```

我们可以这样调用`travel()`：

```swift
travel(destination: "杭州") { (place: String) -> String in		// 调用 travel 函数时，尾随闭包加上参数
  return "目的地是 \(place) "	// 在闭包中使用参数
}
```

由于 Swift *知道*该闭包的参数必须是字符串，因此我们可以将其删除类型说明：

```swift
travel { place -> String in
    return "目的地是 \(place) "
}
```

同时也知道闭包必须返回一个字符串，因此我们可以删除返回值类型：

```swift
travel { place in
    return "目的地是 \(place) "	// 简化到这里就足够了
}
```

由于闭包只有一行代码必须是返回值的那一行，因此可以删除`return`关键字：

```swift
travel { place in
    "目的地是 \(place) "
}
```

还可以更短！！可以使用占位符替代闭包所需的参数名，占位符以美元符号`$`命名，然后从0开始计数。

```swift
travel {
    "I'm going to \($0) in my car"	// 
}
```

> 大叔认为这种简化意义不大，因为随着简化，可读性越来越差，如果是复杂业务。。。还是简化到保留 return 语句为好。

### [4. Closures with multiple parameters（具有多个参数的闭包）](https://www.hackingwithswift.com/sixty/6/9/closures-with-multiple-parameters) – [test](https://www.hackingwithswift.com/review/closures-with-multiple-parameters)

```swift
// 函数定义
func travel(action: (String, Int) -> String) {
    print("准备出发")
    let description = action("杭州", 90)
    print(description)
    print("已到达目的地")
}
// 函数调用
travel {
    "本次前往 \($0) 的平均时速为 \($1) 公里."
}
```

### [5. Returning closures from functions（从函数返回闭包）](https://www.hackingwithswift.com/sixty/6/10/returning-closures-from-functions) – [test](https://www.hackingwithswift.com/review/returning-closures-from-functions)

大叔真心不建议这么玩儿！因为语法有点混乱，它使用`->`两次：一次指定函数的返回值，第二次指定闭包的返回值。

```swift
func travel() -> (String) -> Void {
    return {
        print("前往 \($0)")
    }
}
```

现在，我们可以调用`travel()`以获取该闭包，然后将其作为函数调用：

```swift
let result = travel()
result("杭州")
```

从技术上讲是允许的——尽管实际上不建议这样做！– `travel()`可以直接从以下位置调用返回值：

```swift
let result2 = travel()("杭州")
```

### [6. Capturing values（捕获值）](https://www.hackingwithswift.com/sixty/6/11/capturing-values) – [test](https://www.hackingwithswift.com/review/capturing-values)

如果您在闭包内部使用任何外部值，则Swift会*捕获*它们——将它们存储在闭包旁边，因此即使它们不再存在，也可以对其进行修改。

现在，我们有一个`travel()`返回闭包的函数，并且返回的闭包接受字符串作为其唯一参数，并且不返回任何内容：

```swift
func travel() -> (String) -> Void {
    return {
        print("准备出发，前往 \($0)")
    }
}
```

我们可以调用`travel()`以获取闭包，然后自由调用该闭包：

```swift
let result = travel()
result("杭州")
```

如果我们`travel()`在闭包内部使用要创建的值，则会发生闭包捕获。例如，我们可能想跟踪返回的闭包被调用的频率：

```swift
func travel() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). 准备前往 \($0)")
        counter += 1
    }
}
```

即使该`counter`变量是在内部创建的`travel()`，它也会被闭包捕获，因此对于该闭包仍将保持活动状态。

因此，如果我们`result("杭州")`多次调用，计数器将不断增加：

```swift
result("杭州")
result("杭州")
result("杭州")
```

> 对于 5. 和 6. 的用法，看是看懂了，一是真心觉得混乱，二是实在没想出什么应用场景，暂时就不记住了，特别是在脑容量逐年递减的时候。😆

### [7. Closures summary（闭包小结）](https://www.hackingwithswift.com/sixty/6/12/closures-summary) – [test](https://www.hackingwithswift.com/review/closures-summary)

> - 可以为变量分配闭包，然后再调用它们。
> - 闭包可以接受参数和返回值，例如常规函数。
> - 可以将闭包作为参数传递给函数，并且这些闭包可以具有自己的参数和返回值。
> - 如果函数的最后一个参数是闭包，则可以使用尾随闭包语法。
> - Swift会自动提供诸如`$0`和的速记参数名称`$1`，但并非所有人都使用它们。
> - 如果在闭包内部使用外部值，则将捕获它们，以便闭包以后可以引用它们。

## [百日学 Swift （Day 8）](https://www.hackingwithswift.com/100/8) – structs, properties, and methods（结构体 第 1 部分：结构体，属性和方法）

### [1. Creating your own structs（创建自定义结构体）](https://www.hackingwithswift.com/sixty/7/1/creating-your-own-structs) – [test](https://www.hackingwithswift.com/review/creating-your-own-structs)

关键字：struct，内部的变量称为 属性 property

```swift
struct Sport {							// 声明结构体
    var name: String					// 存储属性
}

var tennis = Sport(name: "田径")		  // 实例化
print(tennis.name)					   // 使用属性
tennis.name = "马拉松"					 // 修改属性
```

### [2. Computed properties（计算属性）](https://www.hackingwithswift.com/sixty/7/2/computed-properties) – [test](https://www.hackingwithswift.com/review/computed-properties)

```swift
struct Sport {
    var name: String				// 存储属性
    var isOlympicSport: Bool		// 存储属性

    var olympicStatus: String {		// 计算属性
        if isOlympicSport {
            return "\(name) 是奥运会项目"
        } else {
            return "\(name) 是非奥运会项目"
        }
    }
}
let chessBoxing = Sport(name: "国际象棋", isOlympicSport: false)	//实例化
print(chessBoxing.olympicStatus)	// 使用计算属性
```

### [3. Property observers（属性观察器）](https://www.hackingwithswift.com/sixty/7/3/property-observers) – [test](https://www.hackingwithswift.com/review/property-observers)

属性观察器，可以在任何属性更改之前或之后运行代码。为了说明这一点，我们将编写一个`Progress`跟踪任务和完成百分比的结构：

```swift
struct Progress {
    var task: String
    var amount: Int
}
```

现在，我们可以创建该结构的实例并随时间调整其进度：

```swift
var progress = Progress(task: "已下载 ", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100
```

我们*想要*发生的是Swift每次`amount`更改都会打印一条消息，我们可以使用`didSet`属性观察器。每次`amount`更改时，它将运行一些代码：

```swift
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task)：\(amount)%")
        }
    }
}
```

您还可以`willSet`用来*在*属性更改*之前*采取措施，但这很少使用。

### [4. Methods（方法）](https://www.hackingwithswift.com/sixty/7/4/methods) – [test](https://www.hackingwithswift.com/review/methods)

结构体内部可以具有函数，并且这些函数可以根据需要使用结构的属性。结构内部的函数称为*方法*，但它们仍使用和函数相同的`func`关键字。

我们可以用一个`City`结构来证明这一点。其中有一个`population`存储城市人口的属性，以及一个`collectTaxes()`返回人口乘以1000的方法。由于该方法属于该方法，`City`因此可以读取当前城市的`population`属性。

这是代码：

```swift
struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}
```

该方法属于该结构，因此我们在该结构的实例上调用它，如下所示：

```swift
let london = City(population: 9_000_000)
london.collectTaxes()
```

### [5. Mutating methods（可变方法）](https://www.hackingwithswift.com/sixty/7/5/mutating-methods) – [test](https://www.hackingwithswift.com/review/mutating-methods)

当需要在方法内部更改属性时，可以使用`mutating`关键字对其进行标记，使之成为*可变方法*，如下所示：

```swift
struct Person {
    var name: String

    mutating func makeAnonymous() {	// 改变属性的可变方法
        name = "无名氏"
    }
}
```

因为它更改了属性，所以 **Swift 仅允许在`Person`的实例上调用可变方法**：

```swift
var person = Person(name: "Ed")
person.makeAnonymous()
```

### [6. Properties and methods of strings（字符串的属性和方法）](https://www.hackingwithswift.com/sixty/7/6/properties-and-methods-of-strings) – [test](https://www.hackingwithswift.com/review/properties-and-methods-of-strings)

- `count`属性读取字符串中的字符数：

```swift
print(string.count)	// 注意汉字字符和英文字符
```

- `hasPrefix()`方法，如果字符串以特定字母开头，则返回true：

```swift
print(string.hasPrefix("Do"))
```

- 通过调用字符串的`uppercased()`方法将其改为全部大写：

```swift
print(string.uppercased())
```

- 甚至可以让 Swift 将字符串的字母排序成一个数组：

```swift
print(string.sorted())
```

字符串具有更多的属性和方法——尝试键入`string.`，通过 Xcode 的自动完成功能来查看其它的属性和方法。

### [7. Properties and methods of arrays（数组的属性和方法）](https://www.hackingwithswift.com/sixty/7/7/properties-and-methods-of-arrays) – [test](https://www.hackingwithswift.com/review/properties-and-methods-of-arrays)

假设有这样的一个数组

```swift
var rankList = ["C","Swift","Object-C"]
```

- 可以使用`count`属性读取数组中的元素数：

```swift
print(rankList.count)
```

- 如果要添加新元素，使用`append()`方法：

```swift
rankList.append("Java")
```

- 可以使用`firstIndex()`方法在数组内找到任何项，如下所示：

```swift
rankList.firstIndex(of: "Swift")
```

这将返回1，因为数组从0开始计数。

- 就像使用字符串一样，可以让Swift将数组中的项目按字母顺序排序：

```swift
print(rankList.sorted())
```

- 最后，如果要删除项目，请使用如下`remove()`方法：

```swift
rankList.remove(at: 0)
```

数组还有很多的属性和方法——尝试键入`rankList.`，通过 Xcode 的自动完成功能来查看其它的属性和方法。

> 注意：在操作的时候要避免数组越界

## [百日学 Swift（Day 9）](https://www.hackingwithswift.com/100/9) – access control, static properties, and laziness（结构体 第 2 部分：访问控制、静态属性和懒加载）

### [1. Initializers（初始化器）](https://www.hackingwithswift.com/sixty/7/8/initializers) – [test](https://www.hackingwithswift.com/review/initializers)

初始化程序是特殊的方法，提供了创建结构的不同方法。默认情况下，所有结构都带有一个结构，称为*成员初始化程序* ——这要求您在创建结构时为每个属性提供一个值。

可以提供自己的初始化程序来替换默认的初始化程序。不必在初始化器前写 `func`，但需要确保初始化结束时所有的属性都有值。

### [2. Referring to the current instance（引用当前实例）](https://www.hackingwithswift.com/sixty/7/9/referring-to-the-current-instance) – [test](https://www.hackingwithswift.com/review/referring-to-the-current-instance)

```swift
struct Person {
    var name: String

    init(name: String) {
        print("\(name) 被创建!")
        self.name = name		// self.name引用属性，而name引用参数。 
    }
}
```

### [3. Lazy properties（懒惰属性）](https://www.hackingwithswift.com/sixty/7/10/lazy-properties) – [test](https://www.hackingwithswift.com/review/lazy-properties)

```swift
struct FamilyTree {
    init() {
        print("创建家谱")
    }
}
```

我们可以将该`FamilyTree`结构用作`Person`结构内部的属性，如下所示：

```swift
struct Person {
    var name: String
    var familyTree = FamilyTree()

    init(name: String) {	// 初始化并未给family值（调用FamilyTree）
        self.name = name
    }
}

var confucius = Person(name: "孔子")	// 但是仍会调用，因为要确保每个属性都有值，所以打印了。
```

但是，如果我们不总是需要某个人的家谱怎么办？如果我们将`lazy`关键字添加到`familyTree`属性，则Swift仅在`FamilyTree`首次访问该结构时才会创建该结构：

```swift
lazy var familyTree = FamilyTree()
```

这样初始化后，familyTree 为 nil，就不会打印了。

因此，如果您想看到消息“创建家谱” ，您需要至少访问一次该属性：

```swift
confucius.familyTree
```

### [4. Static properties and methods（静态属性和方法）](https://www.hackingwithswift.com/sixty/7/11/static-properties-and-methods) – [test](https://www.hackingwithswift.com/review/static-properties-and-methods)

```swift
struct Student {
    static var classSize = 0	// 静态变量
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1	// classSize属性属于结构本身而不是结构实例
    }
}

let lilei = Student(name: "李雷")
let hanmeimei = Student(name: "韩梅梅")
print(Student.classSize)	// 结果是 2
```

### [5. Access control（访问控制）](https://www.hackingwithswift.com/sixty/7/12/access-control) – [test](https://www.hackingwithswift.com/review/access-control)

```swift
struct Person {
    private var id: String	// 将 id 属性设为私有，只有结构体内部可以访问，结构体外部不可访问

    init(id: String) {
        self.id = id
    }

    func identify() -> String {
        return "我的身份证号码是 \(id)"
    }
}
```

- 如果使用 `public` 关键字，则会允许所有其他代码访问。

### [6. Structs summary（结构体小结）](https://www.hackingwithswift.com/sixty/7/13/structs-summary) – [test](https://www.hackingwithswift.com/review/structs-summary)

> - 可以使用结构创建自己的类型，这些结构可以具有自己的属性和方法。关键字 `struct`
> - 可以使用存储属性，或使用计算属性即时计算值。
> - 如果要在方法内更改结构体的属性，则必须将方法标记为`mutating`。
> - 初始化程序`init()`是创建结构的特殊方法。默认情况下，将获得一个成员初始化器，但是如果创建自己的初始化器，则必须为所有属性赋予一个值（虽然可能不必要传递所有的参数给初始化器）。
> - 使用`self`常量来引用方法内部结构的当前实例。
> - `lazy`关键字告诉 Swift 只能创建属性，当第一次使用时再调用或赋值。
> - 可以使用`static`关键字在结构的所有实例之间共享属性和方法。
> - 访问控制可以限制其它代码使用属性和方法。

## [百日学 Swift（Day 10）](https://www.hackingwithswift.com/100/10) – classes and inheritance（类和继承）

### [1. Creating your own classes（创建自定义类）](https://www.hackingwithswift.com/sixty/8/1/creating-your-own-classes) – [test](https://www.hackingwithswift.com/review/creating-your-own-classes)

类和结构体有 5 个区别。

`区别 1`：类永远不会带有成员初始化器。这意味着，如果类中有不带默认值的属性，则必须始终创建初始化程序对`这些`属性初始化。而结构体则不需要。

> 初始化器 **initializer** 在其他语言中或者称为 **构造函数**

### [2. Class inheritance（类的继承）](https://www.hackingwithswift.com/sixty/8/2/class-inheritance) – [test](https://www.hackingwithswift.com/review/class-inheritance)

`区别 2`：类可以继承，结构体不能。被继承的称为“父类”或“超类”，继承的类称为“子类”。子类拥有父类所有的属性和方法，还可以添加自己的属性和方法。

出于安全原因，初始化子类时总是要调用`super.init()`——以防万一父类在创建时会做一些重要的工作。**但要放在对子类的属性初始化之后。**父类属性不能直接先用 self  方式初始化，但在 `super.init()`之后可以使用 self 方式修改父类属性值。

```swift
class Person {			// 父类
    var name: String	// 父类属性
    var age: Int
    var description: String {"\(name) + \(age)"}	// 父类计算属性
    
    init(name: String, age: Int) {	// 父类的初始化器
        self.name = name
        self.age = age
    }
}

class Teacher: Person {		// 子类 继承 父类 Person
    var lesson: String		// 子类的属性
    var school: String = "雨燕中学"			// 带默认值的属性
    init(name: String, age: Int, lesson: String) {	// 子类的初始化
        // 初始化子类属性，
        // 一定要放在 super.init 之前，否则报错：
        // Property 'self.param' not initialized at implicitly generated super.init call
        self.lesson = lesson	
        // 调用父类初始化器，初始化父类属性
        // 如果只是使用 self.父类属性 进行初始化，一样会报错
        super.init(name: name, age: age)
    }
}

let t1 = Teacher(name: "张三", age: 41, lesson: "英语")
print("我是 \(t1.name), \(t1.age)岁. 我在 \(t1.school) 教 \(t1.lesson) 。")
print("t1.decription : \(t1.description).")	// 计算属性也被赋值了

// 输出结果：空格是为了更好的显示属性的使用。
我是 张三, 41岁. 我在 雨燕中学 教 英语。
t1.decription : 张三 + 41.
```

> **记住**：在初始化器或者声明属性的时候都可以为属性提供一个 `默认值`。

### [3. Overriding methods（覆写方法）](https://www.hackingwithswift.com/sixty/8/3/overriding-methods) – [test](https://www.hackingwithswift.com/review/overriding-methods)

子类可以使用自己的实现替换父类的方法，这称为 `覆写 overriding` 。

```swift
class Person {                          // 父类
    var name: String                    // 父类属性
    var age: Int
    
    func ability() {                    // 父类方法
        print("我会吃喝拉撒睡")
    }
    
    init(name: String, age: Int) {      // 父类初始化
        self.name = name
        self.age = age
    }
}

class Teacher: Person {                 // 子类
    var lesson: String                  // 子类属性
    var school: String = "雨燕中学"
    
    override func ability() {           // 覆写父类方法
        print("我会教书.")
    }
    
    func ability(lesson: String) {      // 重载
        print("我会教\(lesson).")
    }
    
    init(name: String, age: Int, lesson: String) {      // 子类初始化
        self.lesson = lesson
        super.init(name: name, age: age)
    }
    
}

let t1 = Teacher(name: "张三", age: 31, lesson: "英语")
print("我是\(t1.name), 我\(t1.age)岁.")
t1.ability()
t1.ability(lesson: t1.lesson)
print("我在\(t1.school)教\(t1.lesson).")

// 运行结果：
我是张三, 我31岁.
我会教书.
我会教英语.
我在雨燕中学教英语.
```

> **覆写**和**重载**的区别：
>
> - 覆写 overriding ：同方法名，同参数名，同参数类型，同参数个数，同返回类型
> - 重载 overloading ：同样的方法名、参数名、参数类型，***参数个数和返回类型不同***

### [4. Final classes（最终类）](https://www.hackingwithswift.com/sixty/8/4/final-classes) – [test](https://www.hackingwithswift.com/review/final-classes)

在 `class` 关键字前面加上 `final` 关键字，会将类声明为 final 类，任何其他类都不能继承该类。

### [5. Copying objects（复制对象）](https://www.hackingwithswift.com/sixty/8/5/copying-objects) – [test](https://www.hackingwithswift.com/review/copying-objects)

`区别 3`：类的对象复制，复制副本和原始副本指向同一个对象，改变其中一个会影响到另一个。而结构体则是分别指向两个对象。

```swift
class Person {
    var name: String = "张三"
}

var p1 = Person()
print("=== 复制前 ===")
print("p1.name : \(p1.name)")
print("=== 复制后 ===")
var p1Copy = p1                    // 复制 类 对象
p1Copy.name = "李四"
print("p1.name : \(p1.name)")
print("p1Copy.name : \(p1Copy.name)")
// 运行结果
=== 复制前 ===
p1.name : 张三
=== 复制后 ===
p1.name : 李四
p1Copy.name : 李四
```

```swift
struct Person {
    var name: String = "张三"
}

var p1 = Person()
print("=== 复制前 ===")
print("p1.name : \(p1.name)")
print("=== 复制后 ===")
var p1Copy = p1                    // 复制 结构体 对象
p1Copy.name = "李四"
print("p1.name : \(p1.name)")
print("p1Copy.name : \(p1Copy.name)")
// 运行结果
=== 复制前 ===
p1.name : 张三
=== 复制后 ===
p1.name : 张三
p1Copy.name : 李四
```

### [6. Deinitializers（析构器）](https://www.hackingwithswift.com/sixty/8/6/deinitializers) – [test](https://www.hackingwithswift.com/review/deinitializers)

`区别 4` ：类可以有反初始化器，有的语言可能称之为析构函数，这个函数在销毁类的实例的时候被调用。

```swift
class Person {
    var name = "张三"

    init() {							// 初始化器，构造函数
        print("创建一个对象：\(self)")
    }
    
    deinit {							// 反初始化器，析构函数
        print("\(self)  被销毁")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}
// 运行结果
创建一个对象：__lldb_expr_43.Person
Hello, I'm 张三
__lldb_expr_43.Person  被销毁
创建一个对象：__lldb_expr_43.Person
Hello, I'm 张三
__lldb_expr_43.Person  被销毁
创建一个对象：__lldb_expr_43.Person
Hello, I'm 张三
__lldb_expr_43.Person  被销毁
```

### [7. Mutability（可变性）](https://www.hackingwithswift.com/sixty/8/7/mutability) – [test](https://www.hackingwithswift.com/review/mutability)

`区别 5` ：对于使用 let 声明的常量，如果是类，可以修改类中的变量属性；如果是结构体，则不能修改其中的变量属性（要想修改必须用`var` 声明）。

```swift
class Singer {
    var name = "Taylor Swift"
}

let taylor = Singer()		// taylor 为常量……
taylor.name = "Ed Sheeran"	// taylor 的变量属性 name 被修改了……
print(taylor.name)
```

### [8. Classes summary（类小结）](https://www.hackingwithswift.com/sixty/8/8/classes-summary) – [test](https://www.hackingwithswift.com/review/classes-summary)

> - 类和结构体相似，它们都可以使用属性和方法创建自定义类型。
> - 一个类可以从另一个类继承，并获得父类的所有属性和方法。谈论类层次结构是很常见的——一个类基于另一个，而另一个类本身又基于另一个。**（一个类不能继承多个类，全是单线联系的地下党）**
> - 可以使用`final`关键字标记一个类，这将阻止其他类从该类继承。
> - 通过方法重写，子类可以使用新的实现替换其父类中的方法。
> - 当两个变量指向同一类实例时，它们都指向同一块内存——改变一个会改变另一个。
> - 类可以具有一个反初始化器，该反初始化器是在销毁该类的实例时运行的代码。
> - 类并不像构造结构体那样强烈地强制执行常量——如果将类属性声明为变量，则无论是否将类实例声明为常量，都可以对其进行更改。

## [百日学 Swift（Day 11）](https://www.hackingwithswift.com/100/11) – protocols, extensions, and protocol extensions（协议、扩展和协议扩展）

### [1. Protocols（协议）](https://www.hackingwithswift.com/sixty/9/1/protocols) – [test](https://www.hackingwithswift.com/review/protocols)

协议规定了（只是规定）用来实现某一特定功能所必需的方法和属性。任意能够满足协议要求的类型被称为遵循(conform)这个协议。类，结构体或枚举类型都可以遵循协议，并提供具体实现来完成协议定义的方法和功能。

其写法与类的继承类似，在需要指明遵循协议的类和变量后面加上`:`，然后写上协议名字。

无法创建协议的实例，因为协议只是描述了所需要的内容，而不是让我们直接创建。

遵循协议的类和结构体，需要定义协议中规定的变量（名字和类型要和协议一致）并且实现协议中声明的各个方法。

```swift
protocol Identifiable {				// 声明协议
    var id: String { get set}
}

struct User: Identifiable {			// 定义结构体，声明遵循协议
    var  id: String
}

func displayId(thing: Identifiable) {  // 定义函数，指明参数遵循协议，实际上，参数 thing 可以是任何遵循协议的对象。
    print("My ID is \(thing.id)")
}

var user = User(id: "k123")			// 实例化一个遵循协议的对象

displayId(thing: user)				// 调用函数，使用遵循协议的对象
```

### [2. Protocol inheritance（协议继承）](https://www.hackingwithswift.com/sixty/9/2/protocol-inheritance) – [test](https://www.hackingwithswift.com/review/protocol-inheritance)

与类相同，协议也可以继承；与类不同的是，协议可以有多继承。多继承时需要将要遵循的协议之间用`,`分开。

```swift
protocol Payable {
    func calculateWages() -> Int	// 协议中只是规定了要有 calculateWages 方法，没有实现
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation {     // 继承了上面三个协议
    // 协议内容
}

struct emp: Employee {
    var id: String
    var name: String
    
    func calculateWages() -> Int {	// 遵循协议，实现其中的方法
        print("实现 Payable 协议")
        return 5
    }
    
    func study() {
        print("实现 NeedsTraining 协议")
    }

    func takeVacation(days: Int) {
        print("实现 HasVacation 协议")
        print("\(self.name) 有 \(days)天年假。")
    }
}
```

### [3. Extensions（扩展）](https://www.hackingwithswift.com/sixty/9/3/extensions) – [test](https://www.hackingwithswift.com/review/extensions)

扩展就是向一个已有的类、结构体或枚举类型添加新功能。关键字是 `extension`

扩展可以对一个类型添加新的功能，但是**不能重写已有的功能**。

Swift 中的扩展可以：

- 添加计算型属性和计算型静态属性（**不能是存储属性**）
- 定义实例方法和类型方法（其中可以使用已有的方法和属性）
- 提供新的构造器
- 定义下标
- 定义和使用新的嵌套类型
- 使一个已有类型符合某个协议

```swift
extension Int {
    func square() -> Int {      // 扩展方法
        return self * self
    }
    var isEven: Bool {          // 扩展计算属性，显然不能向闭包中传递其他参数
        return self % 2 == 0
    }
}

let number = 6

print(number.square())          // 调用扩展方法
print(3.isEven)            		// 使用扩展计算属性
```

### [4. Protocol extensions（协议扩展）](https://www.hackingwithswift.com/sixty/9/4/protocol-extensions) – [test](https://www.hackingwithswift.com/review/protocol-extensions)

协议中描述了应该有哪些方法，但是不能在其中具体实现。类扩展中可以提供实现，但是每次只能对一种类型。

而通过对协议的扩展则可以让遵循该协议的所有类都能使用扩展内容。

```swift
extension Collection {							// 对 Collection 协议进行扩展
    func summarize() {							// 扩展一个方法
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
    
    var isEvenCount: Bool {						// 扩展一个计算属性
        return count % 2 == 0
    }   
}
let beatles = Set(["John", "Paul", "George", "Ringo"])
let pythons = ["Eric", "Graham", "Terry", "John", "Michael", "Terry"]

// 无论是 Set 还是 数组，它们都遵循 Collection 协议，从而能使用上面的扩展。
beatles.summarize()
print(beatles.isEvenCount)

pythons.summarize()
print(pythons.isEvenCount)

```

### [5. Protocol-oriented programming（面向协议编程）](https://www.hackingwithswift.com/sixty/9/5/protocol-oriented-programming) – [test](https://www.hackingwithswift.com/review/protocol-oriented-programming)

面向协议编程就是围绕协议和协议扩展进行编程。在协议扩展中，可以为扩展的方法提供默认值，这样遵循协议的类型就不必非要实现扩展方法。如果需要，也还是可以重写扩展方法的。

```swift
extension Identifiable {			// 扩展协议
    func identify() {				// 扩展方法，提供默认值
        print("I am default")
        print("My ID is \(id).")
    }
}

struct Person: Identifiable {		// 遵循 Identifiable 协议，使用扩展协议中方法的默认值
    var id: String					// 定义协议规定的存储变量
}

struct User: Identifiable {			// 遵循 Identifiable 协议
    var id: String					// 定义协议规定的存储变量
    func identify() {				// 重写扩展协议的方法
        print("I am a user.")
        print("My ID is \(id).")
    }
}

let person = Person(id: "p1")
person.identify()
person.showId()
let user = User(id: "u1")
user.identify()
user.showId()
```

### [6. Protocols and extensions summary（协议和扩展小结）](https://www.hackingwithswift.com/sixty/9/6/protocols-and-extensions-summary) – [test](https://www.hackingwithswift.com/review/protocols-and-extensions-summary)

> - 协议描述了一致性类型必须具有的方法和属性，但未提供这些方法的实现。
> - 可以在类似于类的其他协议之上构建协议。
> - 类扩展允许将方法和计算属性添加到特定类型，例如`Int`。
> - 协议扩展可以向协议添加方法和计算的属性。
> - 面向协议的编程是一种将应用程序体系结构设计为一系列协议，然后使用协议扩展来提供默认方法实现的实践。

## [百日学 Swift（Day 12）](https://www.hackingwithswift.com/100/12) – optionals, unwrapping, and typecasting（可选项、解包和类型转换）

### [1. Handling missing data（处理丢失的数据）](https://www.hackingwithswift.com/sixty/10/1/handling-missing-data) – [test](https://www.hackingwithswift.com/review/handling-missing-data)

其实应该翻译成处理未知数值比较贴切。当不能确定存储属性的值时，Swift 提供了`可选项`的方式，表示该属性可能为`nil`（空）。要使类型可选，在其后加上`?`即可。

```swift
var age: Int? = nil
```

### [2. Unwrapping optionals（可选项的解包）](https://www.hackingwithswift.com/sixty/10/2/unwrapping-optionals) – [test](https://www.hackingwithswift.com/review/unwrapping-optionals)

```swift
var number: Int?
```

由于可选项可能为 nil，所以在使用的时候要先确保其有值，因为 nil 在绝大多数时候是不能参与运算的。

```swift
number = 2
print(number? * 10)
```

这样会报错：`Value of optional type 'Int?' must be unwrapped to a value of type 'Int'`

使用`!`可以对可选项强行解包，但是前提是可选项不能是 nil。如果 number 是 nil 还是会报错的。

```swift
print(number! * 10)
```

可以用`??`加上默认值的方法避免空值。但这种方法有局限性。

 ```swift
print((a ?? 0) + 2)	// 如果 a 是 nil，就取默认值 0
 ```

使用`if let`方式可以较好地处理。

```swift
if let unwrapped = number {
    print("\(unwrapped * 10)")	// number 不为 nil 时
} else
    print("Missing number.")	// unwrapped 为 nil，即 number 为 nil 时
}
```

### [3. Unwrapping with guard（使用 guard 解包）](https://www.hackingwithswift.com/sixty/10/3/unwrapping-with-guard) – [test](https://www.hackingwithswift.com/review/unwrapping-with-guard)

`if let`的替代方法是`guard let`，具体用法是在`guard let`后面直接写`else`和处理无值情况的闭包，如果有值则继续执行后面的语句。

```swift
func greet(_ name: String?) {
    guard let unwrapped = name else {		// 处理空值，注意 else
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")	// 注意，这里不再使用 name，而是要用保证有值的 unwrapped
}
```

### [4. Force unwrapping（强制解包）](https://www.hackingwithswift.com/sixty/10/4/force-unwrapping) – [test](https://www.hackingwithswift.com/review/force-unwrapping)

使用`!`可以对可选项强行解包，但是可能会因为出问题。比如，如果尝试将字符串转换为整数，会因为转换失败造成程序崩溃。`!`通常被称为“崩溃操作符”。**程序员必须对程序中每个`!`负责**，只有确定是安全的时候才应强制解包。

```swift
let danjia = "42"			// 如果 danjia 里面保存的值为 "单价"，执行下面语句时会崩溃
let price = Int(danjia)!
```

### [5. Implicitly unwrapped optionals（隐式解包）](https://www.hackingwithswift.com/sixty/10/5/implicitly-unwrapped-optionals) – [test](https://www.hackingwithswift.com/review/implicitly-unwrapped-optionals)

即在声明变量时在类型后面加上`!`，这样今后使用时就不必解包了，当成非可选项处理。

```swift
let age: Int! = nil
```

由于这样操作将视同为已经解包，所以不需要`if let`和`guard let`来处理。然而，如果真心没有值，是`nil`的话，那程序就崩溃了。

隐式解包一般会用在这样的场景，某个变量开始没有值，但一旦使用后就保证一直有值。这样因为保证有值，就可以少去使用`if let` 的麻烦。

### [6. Nil coalescing （nil 合并）](https://www.hackingwithswift.com/sixty/10/6/nil-coalescing) – [test](https://www.hackingwithswift.com/review/nil-coalescing)

假设有下面这样一个函数

```swift
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
```

如果调用的参数 id 为 15（反正不是 1 就行），将返回 nil。可以使用一个默认值来代替 nil。使用下面的方法

```swift
let user = username(for: 15) ?? "无名氏"
```

双问号的意思就是如果函数返回 nil，就取双问号后面的值。

### [7. Optional chaining（可选项链）](https://www.hackingwithswift.com/sixty/10/7/optional-chaining) – [test](https://www.hackingwithswift.com/review/optional-chaining)

Swift 提供了一种使用可选项的便捷方式：如果要访问 `a.b.c.` 并且其中 `b` 是可选项，那么可以使用可选链：`a.b?.c`。

程序运行时，Swift 先检查 b 的值，如果是 nil，其他的就统统忽略，直接返回 nil；而如果有值则会按部就班地解包、执行。

```swift
let names = ["John", "Paul", "George", "Ringo"]		// Swift 自动推断为字符串数组

let beatle = names.first?.uppercased()				// 因为第一个元素有值，所以 beatle 的值为 “JOHN”

let names2: [String] = []		// 声明空数组时必须指明元素类型

let beatle2 = names2.first?.uppercased()	// 此时 first 不存在，为 nil，所以 beatle2 的值为 nil
```

### [8. Optional try](https://www.hackingwithswift.com/sixty/10/8/optional-try) – [test](https://www.hackingwithswift.com/review/optional-try)

回忆一下第 5 天（Day 5）时曾经写过下面的程序。

我们将编写一个检查密码是否正确的函数，因此，如果用户尝试使用明显的密码，则会抛出错误：

```swift
enum PasswordError: Error {	// 自定义的错误，类型必须是 Error
    case obvious
}
```

```swift
func checkPassword(_ password: String) throws -> Bool {	// 遇到错误会抛出的函数，使用 throws 关键字定义
    if password == "password" {
        throw PasswordError.obvious		// 当 password 的值为 "password" 时，使用 throw 关键字抛出错误
    }
    return true
}
```

```swift
// 使用 `do...try...catch`捕捉错误。
do {
    try checkPassword("password")				// 尝试调用函数
    print("一切正常")						  	 // 没有遇到错误
} catch {
    print("对不起，出错了~~")					   // 遇到错误
}
```

这里可以有两种方法替换 try。第一种，使用 `if let`。

```swift
if let result = try? checkPassword("password") {
    print("结果是 \(result)")
} else {
    print("完蛋，出错了。")
}
```

第二种，在确认有值的时候使用 `try!`，但是如果没有值，程序可不会报错而是直接崩溃。 

```swift
try! checkPassword("sekrit")
print("OK!")
```

### [9. Failable initializers](https://www.hackingwithswift.com/sixty/10/9/failable-initializers) – [test](https://www.hackingwithswift.com/review/failable-initializers)

在写强制解包的时候，使用过下面的代码

```swift
let str = "5"
let num = Int(str)
```

这里将 str 转换成 Int 类型，但是因为 str 可以是任何东西，所以实际上返回的是一个可选的整数。这就是 failable initializer。

可以在自定义的结构体或者类中使用 init?() 来替代init()，如果有问题就返回nil。返回值就会成为期待类型的可选项，供解包用。

如，Person 结构体需要使用一个 9 个字母长的 id，如果不是 9 个字母就返回 nil，否则程序正常进行。

```swift
struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}
```

### [10. Typecasting（类型转换）](https://www.hackingwithswift.com/sixty/10/10/typecasting) – [test](https://www.hackingwithswift.com/review/typecasting)

Swift 总是要清楚每个变量的类型，但是有时候我们了解的要比 Swift 多一些。如下面三个类：

```swift
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}
```

这里 Fish 和 Dog 都继承 Animal，所以我们可以创建下面的数组

```swift
let pets = [Fish(), Dog(), Fish(), Dog()]
```

那么 pets 的类型被推断为 Animal。如果遍历 pets 时遇到 Dog 调用 makeNoise 函数，就要使用关键字 as? 来返回一个可选项，这个可选项在类型转换失败的时候返回 nil。

```swift
for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
```

### [11. Optionals summary（可选项小结）](https://www.hackingwithswift.com/sixty/10/11/optionals-summary) – [test](https://www.hackingwithswift.com/review/optionals-summary)

> - 可选项用于以清晰明确的方式表示值的缺失。
> - Swift不会允许在不解开可选参数的情况下使用`if let`或使用`guard let`。
> - 可以使用感叹号强制打开可选的选项，但是如果强制打开`nil`的代码，则会崩溃。
> - 隐式解包没有常规可选项的安全检查。
> - 可以使用 nil 合并来解开可选值，如果其中没有任何内容，则提供默认值。关键字是 ??
> - 可选链可以用来操作可选控件，但是如果可选控件结果为空，则代码直接返回 nil，其他部分被忽略。
> - 您可以使用`try?`将throwing函数转换为可选的返回值，但是如果返回值为 nil 时程序会崩溃。
> - 如果在初始化输入错误时需要初始化失败时返回 nil，可以使用`init?()`替代`init()`。
> - 可以使用类型转换将一种类型的对象转换为另一种类型

# Days 13-15: Consolidation I（巩固练习 1）

> 学而时习之，不亦说乎。
>
> ​										——《论语 · 学而》

接下来的三天是复习巩固前面 12 天学习的 Swift 基础知识。

HackingSwift 网站上针对这三天的复习，几乎对前面 12 天的每个知识点都做了总结和重新阐述。这里我就不浪费更多的笔墨重复那些前面已经在笔记中叙述过的东西了，只会挑一两句特别重要的记录下来。

## Day 13 - Swift 复习 第 1 天

### [1. Variables and constants](https://www.hackingwithswift.com/read/0/2/variables-and-constants) - 变量和常量

- 关键字 `var` 和 `let`
- 名字必须唯一

### [2. Types of Data](https://www.hackingwithswift.com/read/0/3/types-of-data) - 数据类型

- String，Float， Double， Int，Bool
- 显式声明，隐式声明（自动推断）

### [3. Operators](https://www.hackingwithswift.com/read/0/4/operators) - 操作符

- 算术运算符，比较运算符……

### [4. String interpolation](https://www.hackingwithswift.com/read/0/5/string-interpolation) - 字符串插值

- `"The value is \(value)"`

### [5. Arrays](https://www.hackingwithswift.com/read/0/6/arrays) - 数组

- 数组中的元素类型是一样的
- 空数组一定要声明类型
- 两个数组使用`+`合并为一个数组
- 下标从 0 开始

### [6. Dictionaries](https://www.hackingwithswift.com/read/0/7/dictionaries) - 字典

- `key: value`
- 一般 key 的类型为 String，当值的类型不确定或者不是一种时，可以使用 Any，

```swift
let dict: [String: Any] = ["id": 15, "name": "Swift"]
```

由于值的类型是 Any，所以使用时要注意返回的是可选项。

### [7. Conditional statements](https://www.hackingwithswift.com/read/0/8/conditional-statements) - 条件语句

- `if...else...`
- `if...else if.. else...`

### [8. Loops](https://www.hackingwithswift.com/read/0/9/loops)- 循环

- `a..<b` 和 `a...b`
- `for...in...`
- `while...`
- `continue` 和 `break`

### [9. Switch case](https://www.hackingwithswift.com/read/0/10/switch-case) - Switch 语句

```swift
switch 判定项 {
case 判定值1:
	语句
case 判定值2:
	语句
case 判定值3:
	语句
default:
    语句
}
```

## [Day 14](https://www.hackingwithswift.com/100/14) – Swift 复习 第 2 天

### [1. Functions](https://www.hackingwithswift.com/read/0/11/functions) - 函数

- 参数（参数标签）及其类型
- 返回值及其类型

### [2. Optionals](https://www.hackingwithswift.com/read/0/12/optionals) - 可选项

- `?`和`!`的使用
- 强制解包、隐含解包
- 程序员要对程序中的每个`!`负责！！！！

### [3. Optional chaining](https://www.hackingwithswift.com/read/0/13/optional-chaining) - 可选链

- 链式应用中遇到`?`就先判断，是nil就忽略其他部分，不是才正常运行。

- `??`的用法

### [4. Enumerations](https://www.hackingwithswift.com/read/0/14/enumerations) - 枚举

```swift
enum 名称 {
    case 枚举名1
    case 枚举名2(附加值: 类型)
    case 枚举名3
}
```

### [5. Structs](https://www.hackingwithswift.com/read/0/15/structs)- 结构体

好像没啥好写的

### [6. Classes](https://www.hackingwithswift.com/read/0/16/classes) - 类

- 继承

### Values vs References 值与引用

When you copy a struct, the whole thing is duplicated, including all its values. This means that changing one copy of a struct doesn't change the other copies – they are all individual. With classes, each copy of an object points at the same original object, so if you change one they all change. Swift calls structs "value types" because they just point at a value, and classes "reference types" because objects are just shared references to the real value.

This is an important difference, and it means the choice between structs and classes is an important one:

- If you want to have one shared state that gets passed around and modified in place, you're looking for classes. You can pass them into functions or store them in arrays, modify them in there, and have that change reflected in the rest of your program.
- If you want to avoid shared state where one copy can't affect all the others, you're looking for structs. You can pass them into functions or store them in arrays, modify them in there, and they won't change wherever else they are referenced.

## [Day 15](https://www.hackingwithswift.com/100/15) – Swift 复习 第 3 天

### [1. Properties](https://www.hackingwithswift.com/read/0/17/properties) - 属性

- 属性观察者：属性改变前的操作（`willSet`）和属性改变后的操作（`didSet`）
- 计算属性：

### [2. Static properties and methods](https://www.hackingwithswift.com/read/0/18/static-properties-and-methods) - 静态属性和方法

- 关键字`static`

### [3. Access control](https://www.hackingwithswift.com/read/0/19/access-control) - 访问控制

> 为了简单起见，代码中可以设置访问级别的特性（属性、基本类型、函数等）统一称为“实体”。

- *open* 和 *public* 级别可以让实体被同一模块源文件中的所有实体访问，在模块外也可以通过导入该模块来访问源文件里的所有实体。通常情况下，你会使用 open 或 public 级别来指定框架的外部接口。open 和 public 的区别在后面会提到。
- *internal* 级别让实体被同一模块源文件中的任何实体访问，但是不能被模块外的实体访问。通常情况下，如果某个接口只在应用程序或框架内部使用，就可以将其设置为 internal 级别。
- *fileprivate* 限制实体只能在其定义的文件内部访问。如果功能的部分实现细节只需要在文件内使用时，可以使用 fileprivate 来将其隐藏。
- *private* 限制实体只能在其定义的作用域，以及同一文件内的 extension 访问。如果功能的部分细节只需要在当前作用域内使用时，可以使用 private 来将其隐藏。

open 为最高访问级别（限制最少），private 为最低访问级别（限制最多）。

open 只能作用于类和类的成员，它和 public 的区别主要在于 open 限定的类和成员能够在模块外能被继承和重写。将类的访问级别显示指定为 `open` 表明你已经设计好了类的代码，并且充分考虑过这个类在其他模块中用作父类时的影响。

### [4. Polymorphism and typecasting](https://www.hackingwithswift.com/read/0/20/polymorphism-and-typecasting) - 多态和类型转换

- 多态 overriding。。。
- 类型转换 `as`

### [5. Closures](https://www.hackingwithswift.com/read/0/21/closures) - 闭包 

这里目前讲的都是比较浅显的，除去尾随闭包外，还有逃逸闭包、自动闭包等。

### 轻松一刻（我只做了一部分，还不一定对，你试试吧）

## Bonus: find the Swifty words!

I’ve made a word search to help you test your knowledge of the most useful terms for Swift developers. You can [download it as a PDF here](https://www.hackingwithswift.com/files/100/15-wordsearch.pdf), then use the clues below to figure out what words to look for. If you get stuck, try looking through my [Swift glossary](https://www.hackingwithswift.com/glossary).

**There are 50 in total, and words can go in all directions – good luck!**

1. Fixed-size collection of values of any type - *array*
2. A custom type with cases and associated values - *enum*
3. Makes a method shared across all instances of a class or struct - *public*
4. How we check for and extract the value inside an optional - *unwrap*
5. Type that stores data as pairs of keys and values - *dictionary*
6. Places variables into strings easily - *String*
7. Loop type commonly used to make infinite loops - *repeat*
8. A list of criteria that a type must conform to - *protocol*
9. Evaluates multiple conditions in one block of code - *switch*
10. Special method that creates instances of structs and classes - *init*
11. Functions that accept one or more parameters of a specific type - *closure*
12. Code to handle errors thrown by `do` - *try*
13. Value passed into a function - *parameter*
14. Unwrapping alternative to `if let` - *guard let*
15. Sends back a value from a function - *return* 
16. A catch-all case for switch blocks - *default*
17. An anonymous function that you can pass around as data - 
18. A whole number - 
19. Telling Swift the specific type a variable should be - 
20. Question marks after optionals - 
21. Code that is triggered when properties change - 
22. May or may not exist - *optional*
23. Keyword that lets function parameters be modified outside the function - mutating
24. Access control that restricts a property to being used only inside its type - *private*
25. Skips the rest of the current loop iteration
26. Loop that always executes at least once 
27. The return type of a function that returns nothing - *void*
28. How we refer to the current instance of an object
29. Struct initializer that assigns values to all properties 
30. The name for how values used in a closure are stored for later use - 
31. A variable attached to a struct or class - *property*
32. A type that spans values between two numbers
33. Special syntax for final parameter closures
34. Type that holds a large floating-point number - *double*
35. The name for math symbols like + and - - *arithmetic operator*
36. The ability to treat an object of one type as another type - *typecast*
37. Adds extra functionality to a type
38. The name for a function that exists inside a struct or class
39. Exits a loop immediately - *break*
40. Keyword for a function that can trigger errors
41. Key that lets us replace a method inherited from a superclass
42. When one class builds on another - *inherit*
43. Reads the length of a string
44. Apple's all-in-one code editing environment - *Xcode*
45. Operator that takes three operands - 
46. Puts off work until later
47. Name for a method called before class destruction
48. Ordered collection of values stored in a single value
49. A class that cannot be inherited from
50. Holds either true or false - Bool

