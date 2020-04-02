# 第 2 阶段（Days 16-25）: SwiftUI入门（项目 1-3）

Now that you’ve mastered the basics of Swift, in these days you’ll start building real SwiftUI apps using what you learned.

## [百日学 Swift（Day 16）](https://www.hackingwithswift.com/100/16) – Project 1, part one（项目 1 ：第 1 部分）

> SwiftUI 基础知识（包括`Form`, `NavigationView`, `@State`等）和 UI 设计基础知识。

### [1. WeSplit: Introduction](https://www.hackingwithswift.com/books/ios-swiftui/wesplit-introduction)（WeSplit 项目介绍）

首先创建 WeSplit 项目。

启动 Xcode，然后选择`Create A New Xcode Project`。您将看到一个选项列表，选择`iOS`和`Single View App`，然后按`Next`。在随后的屏幕上，需要执行以下操作：

- 产品名称`Product Name`，输入 `WeSplit`。
- 组织标识符`Organization Identifier`，可以输入所需的任何内容，但一般是输入倒序的域名。
- 语言`Language`，选择`Swift`。
- 用户界面`User Interface`，选择SwiftUI。
- 确保***未选中***底部的所有复选框。

准备好后，单击`Next`，然后选择某个位置来保存项目并单击`Create`。Xcode 会考虑一两秒钟，然后创建您的项目并打开一些代码供您编辑。

### [2. Understanding the basic structure of a SwiftUI app](https://www.hackingwithswift.com/books/ios-swiftui/understanding-the-basic-structure-of-a-swiftui-app)（了解 SwiftUI 项目的基本结构）

- `AppDelegate.swift`包含用于管理应用程序的代码。在这里添加代码曾经很常见，但是如今却很少见。
- `SceneDelegate.swift`包含用于在应用程序中启动一个窗口的代码。这在iPhone上没什么用，但在iPad上（用户可以同时打开您的应用的多个实例），这很重要。
- `ContentView.swift`包含您程序的初始用户界面（UI），并且我们将在该项目中完成所有工作。
- `Assets.xcassets`是*资产目录* –您要在应用程序中使用的图片的集合。您还可以在此处添加颜色，以及应用程序图标，iMessage贴纸等。
- `LaunchScreen.storyboard`是一个可视化编辑器，用于创建一小段UI，以在应用程序启动时显示。
- `Info.plist`是一个特殊值的集合，这些特殊值向系统描述了您的应用程序的工作方式-它是哪个版本，您支持的设备方向等等。不是代码，但仍然很重要的事情。
- `Preview Content`是一个黄色的组（`Group`），其中包含`Preview Assets.xcassets` –这是另一个资产目录，这一次专门针对例如您在设计用户界面时要使用的图像，以使您了解它们在外观时的外观该程序正在运行。

- `ContentView.swift` 是默认显示的视图，可以认为是程序的入口

随着开发的深入，一般还会有以下一些 ***组***（Group，类似文件夹）

- `Models` 负责存放系统所需要的数据模型
- `Resources` 负责存放本地 json 数据或一些需要的静态资源。

> 因为每个父视图最多只能存放10个视图，因此开发的思路是使用子视图像拼图那样逐步拼成最终的组合视图。子视图应该按照逻辑关系***分组***保存。

在编辑区的右侧，有个预览区，称为画布 Canvas。Xcode只能在macOS Catalina或更高版本上显示画布。如果看不到画布并且已经在运行 Catalina，可以到`Editor`菜单中选择`Canvas`。如果没有Catalina，则需要在模拟器中运行代码才能查看其外观。

**提示：**有时，会发现代码中的错误使 Xcode 的画布无法更新——可以看到类似`Automatic preview updating paused`的信息，此时可以按`Resume`对其进行修复（快捷方式：⌥  + ⌘  + P）。没有 Resume 按钮时，可以先重新构建程序，再恢复预览。重新构建的步骤是：

- 清理 build 文件夹，快捷键 ⇧ ⌘ K，这步不是必须的，但是实践中发现最好还是做这一步。
- 构建程序，快捷键 ⌘ B，构建成功时会提示`Build successful`，否则会提示`Build Fail`。

另外，要想看到各种交互效果，需要点击预览窗格中的 播放 `►` 按钮，而要想在控制台看到输出结果，还需要右击这个按钮选择 `debug` 方式。恢复普通预览，只需再次单击刚才那个按钮（现在的图标是 `◉`）。如果修改代码后不能预览，可以考虑重新构建程序，重启 live preview 等方法进行尝试。

### [3. Creating a form](https://www.hackingwithswift.com/books/ios-swiftui/creating-a-form)（创建表单）

首先说下 SwiftUI 的视图 View。官方文档说，视图是应用程序用户界面的组成部分，可以用修饰器配置视图。

（1）文本框`Text`

类似 HTML 中的 label，只显示，不能输入。

```swift
Text("Hello World")
```

（2）表单`Form {  }`

表单是一组控件的容器，用于输入数据。

```swift
var body: some View {
    Form {
        Text("Hello World")
    }
}
```

（3）`Group`

SwiftUI 规定，在一个父容器中最多允许有 10 个子组件。如果想显示更多内容，必须将其分别放在容器中。Group 就是容器的一种。下面的代码就可以显示 11 行文本了。

```swift
Form {
    Group {
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
    }

    Group {
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
    }
}
```

（4）`Section`

与 Group 的功能一样，但是在视觉上略有不同。

### [4. Adding a navigation bar（增加导航栏）](https://www.hackingwithswift.com/books/ios-swiftui/adding-a-navigation-bar)

Form 的修饰器 `.naigationBarTitle` 为 Form 添加一个导航栏标题，默认大字体左对齐。

```swift
.navigationBarTitle("SwiftUI", displayMode: .inline)	// 小字体，居中
```

### [5. Modifying program state](https://www.hackingwithswift.com/books/ios-swiftui/modifying-program-state)（修改程序状态）

> Views are a function of their state. 视图是其自身状态的函数

状态（state）是存储程序运行时需要的各种数据的总称。

回忆一下，`ContentView`是一个结构，可以将其创建为常量。这意味着它是*不可变的* ——我们不能随意更改其值。在创建要更改属性的 struct 方法时，我们需要添加`mutating`关键字：`mutating func doSomeWork()`。但是，Swift不允许我们对计算的属性进行突变，这意味着我们不能编写`mutating var body: some View`——只是不允许这样做。

使用 `@State` 属性包装器将一个在视图结构体中声明的变量设置为用于保存状态。

控件中如果需要使用这个状态可以直接引用。修改这个状态时要加上`self.`，如果忘记加，Xcode 会有提示。

```swift
struct ContentView: View {					//这是结构体，其中的变量应该是静态的
    @State var tapCount = 0					// 使用 @State 可以将其设置为一个状态

    var body: some View {
        Button("Tap Count: \(tapCount)") {	// 直接使用状态变量
            self.tapCount += 1				// 修改时要加上 self. ，忘记加 Xcode 会提示
        }
    }
}
```

### [6. Binding state to user interface controls](https://www.hackingwithswift.com/books/ios-swiftui/binding-state-to-user-interface-controls)（将状态绑定到用户界面控件）

> **双向绑定**：控件本身的属性与状态变量绑定，其中一个发生变化，会影响到另一个。（model 和 view 绑定）

但如果想记录控件修改后的值并更新状态，就需要使用**双向绑定**，即控件会显示状态变量的值，同时修改后的值也会保存到状态变量中，供其他控件引用。双向绑定引用变量时要在变量前面加上`$`符号。

```swift
struct ContentView: View {
    @State private var name = ""				// 设定 name 为状态变量
    @State private var tapCount = 0				// 设定 tapCount 为状态变量
    var body: some View {
        Form {
            TextField("请输入姓名", text: $name)	// 双向绑定，输入后会改变name的值，注意$符号
            Text("你好，\(name)")				 // 引用状态
            Button("点我 +1") {
                self.tapCount += 1			   // 修改状态，注意 self 的使用
            }
            Text("点击次数：\(tapCount)")		// 引用状态
        }
    }
}
```

### [7. Creating views in a loop](https://www.hackingwithswift.com/books/ios-swiftui/creating-views-in-a-loop)（利用循环创建视图）

（1）创建100行

```swift
Form {
    ForEach(0 ..< 100) { number in
        Text("第 \(number) 行")	//这个不受 10 个子组件的限制是因为循环体内只有一个组件
    }
}
```

（2）创建 Picker

```swift
struct ContentView: View {
    let students = ["李雷","韩梅梅","林涛"]
    @State private var selectedStudentId = 0
    
    var body: some View {
        VStack {
            Text("请选择学生：")
            Picker("姓名", selection: $selectedStudentId) {
                ForEach(0 ..< students.count) { id in
                    Text(self.students[id])
                }
            }
            Text("选中的学生： \(students[selectedStudentId])")
        }
    }
}
```

说明：

1. `students`数组不需要标明`@State`，因为它是一个常数，它不会改变。
2. `selectedStudentId`属性默认值是0，但可以更改，这就是为什么将其标记为`@State`的原因。
3. `Picker`有一个标签，“姓名”，它告诉用户它做什么。
4. 与`Picker`双向绑定的状态变量`selectedStudentId`，表示最开始显示选择 0，但随着用户移动选择器而更新属性。
5. 在`ForEach`内部，遍历`students`数组，并且为每个学生创建一个文本视图，用来显示该学生的姓名。

## [百日学 Swift（Day 17）](https://www.hackingwithswift.com/100/17) – Project 1, part two（项目 1 ：第 2 部分）

> 应用前面学习的`Form`, `@State`, `Picker`等

### [1. Reading text from the user with TextField](https://www.hackingwithswift.com/books/ios-swiftui/reading-text-from-the-user-with-textfield)（使用 TextField 输入文本）

```swift
struct ContentView: View {
    @State private var checkAmount = ""     // 消费金额，使用字符型是因为等下要输入的是字符
    @State private var numberOfPeople = 2   // 人数，默认为 2
    @State private var tipPercentageIndex = 2    // 取值为 tipPercentages 数组的下标，默认为 2
    
    let tipPercentages = [5,10,15,20,0]     // 小费百分率数组：可能的小费比率
    
    var body: some View {
        Form {
            Section {
                TextField("消费金额：", text: $checkAmount)  // 输入消费金额
                    .keyboardType(.decimalPad)
            }
            Section {
                Text("￥\(checkAmount)")     			   // 显示消费金额
            }
        }
    }
}

```

在文本输入框中键入数字，会同步显示在下方的文本框里。这是因为 checkAmount 是状态属性，用 @State 标记。

- ####  修饰器 keyboardType()

使用参数指定输入时使用何种键盘外观。常见的参数有以下几种：

| 序号 | 参数          | 描述                             |
| ---- | ------------- | -------------------------------- |
| 1    | .default      | 默认键盘                         |
| 2    | .numberPad    | 纯数字键盘，0-9                  |
| 3    | .phonePad     | 拨号键盘，`0-9`，`*`，`#`        |
| 4    | .decimalPad   | 带小数点键盘，数字键盘加上小数点 |
| 5    | .emailAddress | 带有 `@`，`.`，空格的键盘        |
| 6    | .URL          | 带有`/`，`.`，`.com` 的键盘      |

> - 设计 UI 时，最好考虑指定键盘，这样既可以避免输入不需要的内容，同时用户体验度还会大幅度提高。
> - 检查键盘外观正确与否可能需要在模拟器 simulator 上运行（快捷键⌘ R）, Live Preview 不显示。

### [2. Creating pickers in a form](https://www.hackingwithswift.com/books/ios-swiftui/creating-pickers-in-a-form)（在表单中创建 Picker）

```swift
struct ContentView: View {
        
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentageIndex = 2
    
    let tipPercentages = [5,10,15,20,0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("消费金额：", text: $checkAmount)          // 输入消费金额
                        .keyboardType(.decimalPad)
                    Picker("人数", selection: $numberOfPeople) {        // 人数选择
                        ForEach(2..<100) { index in                    // 从 2 人到 99 人
                            Text("\(index) 人")
                        }
                    }
                }
                Section {
                    Text("￥\(checkAmount)")     // 显示消费金额
                }
            }.navigationBarTitle("WeSplit")     // 导航栏标题，要加在 Form 上，不能加在 NavigationView 上
        }
    }
}
```

**提示：**很容易想到修饰符`.navigationBarTitle`应附加到`NavigationView`的末尾，但实际上却需要将其附加到`Form`的末尾。原因是，程序运行时导航视图能够显示很多视图，所以将标题附加到导航视图***里面***的东西才能让iOS系统根自由地改变标题。

看上去这是为了 picker 而 picker。在选择人数时，点击后跳转到另一个屏幕，居然有100行……！！如果 app 做成这种样纸估计就没人看了。权当 了解一下picker的一种形式吧。后面能看到其他的形式，至少比这样显得聪明一点。

### [3. Adding a segmented control for tip percentages](https://www.hackingwithswift.com/books/ios-swiftui/adding-a-segmented-control-for-tip-percentages)（为小费费率添加分段控件）

```swift
struct ContentView: View {
    @State private var checkAmount = ""     // 消费金额
    @State private var numberOfPeople = 2   // 人数，默认为 2，实际上是 Picker 中循环的 index 值
    @State private var tipPercentageIndex = 2 // 小费百分率数组下标，取值为 tipPercentages 数组的下标，默认为 2
    
    let tipPercentages = [5,10,15,20,0]     // 小费百分率数组：可能的小费比率
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("支票金额：", text: $checkAmount)  // 输入消费金额
                        .keyboardType(.decimalPad)
                    Picker("人数", selection: $numberOfPeople) {
                        ForEach(2..<100) { index in     // 生成多行供选择人数
                            Text("\(index) 人")
                        }
                    }
                }
                Section(header: Text("支付小费")) {		// 节标题
                    Picker("Tip percentage", selection: $tipPercentageIndex) {
                        ForEach(0 ..< tipPercentages.count) { index in  // 遍历tipPercentages
                            Text("\(self.tipPercentages[index])%")
                        }
                    }
                }.pickerStyle(SegmentedPickerStyle())   // 使用分段控件选择百分率
                Section {
                    Text("￥\(checkAmount)")     
                }
            }.navigationBarTitle("WeSplit")     // 导航栏标题，要加在 Form 上，不能加在 NavigationView 上
        }
    }
}
```

- #### 修饰器 pickerStyle ()

用于 Picker 的自定义外观和互动方式。主要有以下几种：（官方文档基本上没描述，大叔自己实验后试着描述一下）

| 序号 | 类型                   | 描述                                                         |
| ---- | ---------------------- | ------------------------------------------------------------ |
| 1    | DefaultPickerStyle     | 显示默认值，后面跟着 `>`，单击后切换到选择屏幕，列表显示选择项，选中者带`√` |
| 2    | PopUpButtonPickerStyle | iOS 无效，只适用 mac OS                                      |
| 3    | RadioGroupPickerStyle  | iOS 无效，只适用 mac OS                                      |
| 4    | SegmentedPickerStyle   | 分段显示，所有值都列出在灰色背景条上，选中滑块切换值         |
| 5    | WheelPickerStyle       | 显示为轮状，默认显示默认值，可上下拨动改变值                 |

### [4. Calculating the total per person](https://www.hackingwithswift.com/books/ios-swiftui/calculating-the-total-per-person)（计算每个人的小计）

这个相对简单，将输入的变量进行计算，记得计算前都要进行类型转换，转换的类型应该以最终结果为准。

```swift
struct ContentView: View {
    
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
                }
            }.navigationBarTitle("WeSplit")
        }
    }
}
```

【补充知识：[格式化占位符](https://zh.wikipedia.org/wiki/%E6%A0%BC%E5%BC%8F%E5%8C%96%E5%AD%97%E7%AC%A6%E4%B8%B2)】（维基百科）



## [百日学 Swift（Day 18）](https://www.hackingwithswift.com/100/18) – Project 1, part three（项目 1 ：第 3 部分）

昨天选人数的 Picker 太丑了，体验也不好。类似教程里面说的，这个地方还是不要用这种控件，至少要改成 TextField。我改成了 stepper，毕竟 10 人以上的大聚会毕竟少见（当然也可以调整 stepper 的取值范围），并对界面进行了细微的调整。

### 1. 项目盘点

（1）Form 中 Section 将表单分为了一个一个的区域，可以带个标题，这样看起来比较舒服

（2）Section 中默认就是一行一行的排列的表单控件，如果想给 TextField 等控件加上标签，可以考虑 HStack。实际上，个人感觉可以认为 Section 中就是 HStack 的集合。

（3）SwiftUI 中父视图中只能包含不多于 10 个子视图。（即一个 VStack 中，最多只能有10个同级HStack）

（4）TextField 控件输入的时候，尽量使用 `.keyboardType` 修饰器，这样会大大提高用户体验。

（5）`.navigationBarTitle` 修饰器要加在Form上，因为 NavigationView 中可能包括很多内容，如果在这里使用修饰符，SwiftUI 可能不太能搞懂你究竟想把标题放在哪里。

（6）计算属性不可能使用 `@State`，呵呵。

（7）使用 Text 显示数字可以用参数 `specifier` 来设定格式。典型的带两位小数的格式是：`%.2f`

### 2. 挑战

（1）使用 TextField 输入人数

（2）如果没有消费，消费总计和人均小计的字体为蓝色

> 项目的源码可以到 [GitHub](https://github.com/HH-Ge/100DaysOfSwift/tree/master/Projects/D16-18.WeSplit) 上查看。

## [百日学 Swift（Day 19）](https://www.hackingwithswift.com/100/swiftui/19) – Challenge day（挑战：长度单位转换）

> 根据教程要求，独立编写了长度单位转换，引入了本地数据以简化代码。将两个长度单位分别用 json 文件保存。利用结构体读取数据，形成数组。

#### 1. 数据模型 Units.swift

```swift
import Foundation

struct LengthUnits: Hashable, Codable, Identifiable { // 混装，备用
    var id: Int
    var category: String
    var items: [LengthUnit]
}

struct LengthUnit: Hashable, Codable, Identifiable  { // 某个制式的内容
    var id: Int				// 为 0 的是基准单位
    var name: String		// 名称
    var coefficient: Double	// 与基准单位的转换系数（倍数）
}

```

#### 2. json 数据文件

> json 文件保存在 Resources 文件夹，是加载读取的默认路径。

分别将两种制式存入不同文档，这样既方便读取，又便于今后扩展某个制式。

（1）公制单位：MetricUnits.json

```json
[
    {
        "id" : 0,
        "name" : "毫米",
        "coefficient" : 1.0
    },
    {
        "id" : 1,
        "name" : "厘米",
        "coefficient" : 10.0
    },
    {
        "id" : 2,
        "name" : "米",
        "coefficient" : 1000.0
    },
    {
        "id" : 3,
        "name" : "千米",
        "coefficient" : 1000000.0
    }
]
```

（2）英制单位：EnglishUnits.json

```json
[
    {
        "id" : 0,
        "name" : "英寸",
        "coefficient" : 1.0
    },
    {
        "id" : 1,
        "name" : "英尺",
        "coefficient" : 12.0
    },
    {
        "id" : 2,
        "name" : "码",
        "coefficient" : 36.0
    },
    {
        "id" : 3,
        "name" : "英里",
        "coefficient" : 60120.0
    }
]
```

（3）混装 AllUnits.json

```json
[
    {
        "id": 0,
        "category": "Metric",
        "items": [
            {
                "id" : 0,
                "name" : "毫米",
                "coefficient" : 1.0
            },
            {
                "id" : 1,
                "name" : "厘米",
                "coefficient" : 10.0
            },
            {
                "id" : 2,
                "name" : "米",
                "coefficient" : 1000.0
            },
            {
                "id" : 3,
                "name" : "千米",
                "coefficient" : 1000000.0
            }
        ]
    },
    {
        "id": 1,
        "category": "English",
        "items": [
            {
                "id" : 0,
                "name" : "英寸",
                "coefficient" : 1.0
            },
            {
                "id" : 1,
                "name" : "英尺",
                "coefficient" : 12.0
            },
            {
                "id" : 2,
                "name" : "码",
                "coefficient" : 36.0
            },
            {
                "id" : 3,
                "name" : "英里",
                "coefficient" : 60120.0
            }
        ]
    }
]
```

#### 3. 加载数据 Data.swift

与数据模型一道保存在 Models 中，便于管理。

> 应用运行后，会加载全局变量，分别保存了不同制式的数组供视图使用。

```swift
import Foundation
import UIKit
import SwiftUI
import CoreLocation

let MetricUnits: [LengthUnit] = load("MetricUnits.json")
let EnglishUnits: [LengthUnit] = load("EnglishUnits.json")
let AllUnits: [LengthUnits] = load("AllUnits.json")
let temp = 0

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
```

#### 4. 视图文件 ConvertUnit.swift

> 主要练习了以下几个方面：
>
> - 全局变量加载本地 json 文件
> - 表单视图的排列，Section的应用
> - 表单控件的使用，包括 TextField、Picker及其修饰器（键盘的选择、Picker的样式）
> - 巩固练习了容器组件 VStack、HStack 和 NavigationView。
> - 巩固练习了 Button、Text 等视图组件及其修饰器的使用。
> - 巩固练习了状态的使用和双向绑定。

```swift
import SwiftUI

struct ContentView: View {
    @State private var isMetricToEnglish = true
    @State private var inputString = ""
    @State private var inIndex = 0
    @State private var outIndex = 0
    
    var inArray:[LengthUnit]  { return isMetricToEnglish ? MetricUnits : EnglishUnits }
    var outArray:[LengthUnit]  { return !isMetricToEnglish ? MetricUnits : EnglishUnits }
    
    var result: Double {
        var outNumber: Double = 0
        let inCoe = inArray[inIndex].coefficient
        let outCoe = outArray[outIndex].coefficient
        let inNumber = Double(inputString) ?? 0
        let rate = isMetricToEnglish ? 1/25.4 : 25.4	// 两种制式基准单位的转换
        outNumber = inNumber * inCoe * rate / outCoe	
        return outNumber
    }
    
    var body: some View {
        
        NavigationView{
            VStack{
                Button(action: {self.isMetricToEnglish.toggle()}){
                    Text(isMetricToEnglish ? "公制 → 英制" : "英制 → 公制")
                        .font(.headline)
                }
                .frame(width: 120, height: 40)
                .foregroundColor(.white)
                .background(Color(
                    #colorLiteral(red: 0.2392156869, 		// 颜色字面量
                                  green: 0.6745098233, 
                                  blue: 0.9686274529, 
                                  alpha: 1)))
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
```

### 【项目心得】

> 1. json文件的书写一定要仔细检查，系统对格式的要求超级严格。至少要使用[线上工具](http://www.bejson.com/)校验一下。
>2. 拼写、拼写、拼写，在有自动提示的前提下，基本上关键字不会出错，但是自定义的变量名还是很容易错的。
> 3. 阴影修饰一定要在圆角修饰**之后**。
> 4. 发现错误不用怕，慢慢找，总能查出原因的。
> 

**需要进一步研究：**

> 1. keyboard的呼出与隐藏，要再继续多实验几次。
>2. 修饰器还需要多熟悉

## [百日学 Swift（Day 20）](https://www.hackingwithswift.com/100/swiftui/20) – Project 2, part one（项目 2 ：第 1 部分）

### [1. Guess the Flag: Introduction](https://www.hackingwithswift.com/books/ios-swiftui/guess-the-flag-introduction)（猜旗子项目介绍）

核心：构建一个项目，帮助用户认识国旗。其中会应用到堆栈`VStack`，图像`Image`，警告`Alert`，按钮`Button`，资产目录等 SwiftUI 的新内容。

素材下载网址为 [https://github.com/twostraws/HackingWithSwift](https://github.com/twostraws/HackingWithSwift)，注意要选择 SwiftUI 的文件夹。然后运行 Xcode，创建一个新的 iOS 的 Single View App，名字叫做 `GuessFlag`。Let's go ！！

### [2. Using stacks to arrange views](https://www.hackingwithswift.com/books/ios-swiftui/using-stacks-to-arrange-views)（使用 Stack 排列视图）

（1）堆栈分为：垂直堆栈`VStack`（按代码顺序从上到下分布），水平堆栈`HStack`（按代码顺序从左到右分布），层叠堆栈`ZStack`（按代码顺序从底层到顶层，稍微有点怪异，大概是区别于 VStack）

（2）堆栈的参数有 Spacing（表示堆栈内组件间的距离），alignment（表示堆栈内的组件对齐方式）

（3）对齐有9个基准，ZStack也是可以对齐的。对齐总是以个头尺寸最大的家伙为基准的。

（4）Space 占位符，可以撑满堆栈或将组件分隔。

示例代码：

```Swift
ZStack(alignment: .topLeading) {
    Rectangle().frame(width: 400, height: 400).foregroundColor(.gray)
    VStack(alignment: .leading, spacing: 20) {
        Text("Text VStack").font(.headline)
        Spacer()
        HStack(alignment: .center, spacing: 15) {
            Spacer()
            Text("HStack")
            Spacer()
            Image(systemName: "square.stack.3d.down.right.fill")
            Spacer()
        }.frame(width: 200, height: 100).background(Color.purple).foregroundColor(.white)
    }.frame(width: 300, height: 300).background(Color.blue)
}
```

### [3. Colors and frames](https://www.hackingwithswift.com/books/ios-swiftui/colors-and-frames)（颜色和框架）

（1）Color literal 可以方便地设置自定义颜色

（2）铺平底色的方法是在 ZStack 的最下层 `Color.red`（Color本身就是视图，因此可以独立占一层）

（3）填满屏幕：`Color.red.edgesIgnoringSafeArea(.all)`

（4）指定尺寸大小有绝对和相对两种方式。

```swift
.frame(width: 300, height: 600)	// 绝对方式，指定准确值
.frame(maxWidth: .infinity)		// 相对方式，水平撑满屏幕（不包括安全区域）
```

### [4. Gradients](https://www.hackingwithswift.com/books/ios-swiftui/gradients)（渐变）

（1）渐变由以下几部分组成：

- 要显示的颜色数组
- 尺寸和方向信息
- 要使用的渐变类型

（2）渐变有三种形式：

- 线性渐变

```swift
LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
```

- 径向渐变

```swift
RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
```

- 角度渐变（也称 圆锥渐变）

```swift
AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
```

所有这些渐变都可以单独用作视图，也可以用作修改器的一部分——例如，以将它们用作文本视图的背景。

### [5. Buttons and images](https://www.hackingwithswift.com/books/ios-swiftui/buttons-and-images)（按钮和图像）

（1）按钮 Button

- 单纯文字按钮

```swift
Button("点我!") {
    print("按钮被点击了！")	// 这个要在预览窗格中的 live preview 按钮上右击，选择 debug 才能看到控制台输出
}
```

- 复杂按钮

```swift
Button(action: {
    print("按钮被点击了")		
}) { 
    HStack {
        Image(systemName: "cursor.rays")
        Text("点我!")
    }
}
```

（2）图像 Image

SwiftUI具有`Image`用于处理应用程序中图片的专用类型，主要创建方式有三种：

- `Image("pencil")` 将加载您已添加到项目中的名为“铅笔”的图像。
- `Image(decorative: "pencil")`会加载同一张图片，但不会为启用了屏幕阅读器的用户读出。这对于不传递其他重要信息的图像很有用。
- `Image(systemName: "pencil")`将加载iOS内置的铅笔图标。这里的名称来自 Apple 的 SF Symbols 图标集，您可以搜索所需的图标——从网络上下载Apple的免费SF Symbols应用程序以查看完整的图标集。有关 SF Symbols 的内容请参见苹果官网[相关内容](https://developer.apple.com/design/)。

**提示：**如果您发现图像已被某种颜色填充，例如显示为纯蓝色而不是实际图片，则可能是SwiftUI为它们着色以显示它们是可轻敲的。要解决此问题，请使用`renderingMode(.original)`修饰符强制SwiftUI显示原始图像，而不是重新着色的版本。

（3）将图片应用到按钮

```swift
Button(action: {
    print("Edit button was tapped")
}) {
    HStack(spacing: 10) { 
        Image(systemName: "pencil")
        Text("Edit")
    }
}
```

### [6. Showing alert messages](https://www.hackingwithswift.com/books/ios-swiftui/showing-alert-messages)（显示警告消息）

警告——一个弹出窗口，其中包含标题，消息和一个或两个按钮（取决于具体需要）。

视图是我们程序状态的函数，警报也不例外。因此，不是说“显示警报”，而是创建警报并设置显示警报的条件。

```swift
struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        Button("显示警告") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {	//双向绑定
            Alert(title: Text("你好!"), 
                  message: Text("很高兴认识你。"), 
                  dismissButton: .default(Text("好")))
        }
    }
}
```

按钮点击改变 `showingAlert` 的状态，`alert` 修饰器监视到状态改变，触发警报显示。

## [百日学 Swift（Day 21）](https://www.hackingwithswift.com/100/swiftui/21) – Project 2, part two（项目 2 ：第 2 部分）

没有完全按照教程的内容，适当做了一些调整

### 1. 准备工作

（1）创建国旗的结构体，两个属性：国旗图片名（`flagName`）和国家名（`name`）。

```swift
struct country {            // 国家
    var flagName: String    // 图片名称
    var name: String     	// 国家名称
}
```

（2）初始化国旗数组

```swift
let countryArray: [country] = [                     // 初始化，这个内容不能放在 ContentView 中，否则报错
    country(flagName: "Estonia", name: "爱沙尼亚"),
    country(flagName: "France", name: "法国"),
    country(flagName: "Germany", name: "德国"),
    country(flagName: "Ireland", name: "爱尔兰"),
    country(flagName: "Italy", name: "意大利"),
    country(flagName: "Nigeria", name: "尼日利亚"),
    country(flagName: "Poland", name: "波兰"),
    country(flagName: "Russia", name: "俄罗斯"),
    country(flagName: "Spain", name: "西班牙"),
    country(flagName: "UK", name: "英国"),
    country(flagName: "US", name: "美国")
]
```

以上两步的代码要放在 ContentView 结构体之外，否则会报错。

（3）准备好题目

```swift
    @State private var countries = countryArray.shuffled()          // 打乱数组元素顺序
    @State private var correctAnswer = Int.random(in: 0...2)        // 在 0-2 之间随机选一个值
```

> #### Shuffled 和 shuffle 的区别
>
> 打乱的效果是一样的，只是用途不同。
>
> - ##### shuffled
>
>     是一个普通函数，***有返回值***，可以赋值给其他数组。
>
> ```swift
> func shuffled() -> [Base.Element]
> ```
>
> ------
>
> - ##### Shuffle
>
>     是一个 mutating 函数，用于改变自身，所以***没有返回值***，改变的是***调用者***自己。
>
> ```swift
> mutating func shuffle()
> ```

*（4）声明记录分数的状态

```swift
@State private var score = 0                                    // 得分，答对数量
@State private var questionNum = 0                              // 题目数
```

### [2. Stacking up buttons](https://www.hackingwithswift.com/books/ios-swiftui/stacking-up-buttons)（堆叠按钮）

有了前面的准备，现在开始设计 UI，使用 VStack 作为容器。

（1）先使用一个 VStack 将文字部分包裹好。

```swift
VStack(spacing: 20) {
    Text("猜国旗")
        .font(.largeTitle)
        .fontWeight(.black)
    Text("请点击下面你认为正确的国旗")
        // .font(.subheadline)
        .fontWeight(.bold)
    Text(countries[correctAnswer].name)
        .font(.title)
        .fontWeight(.black)
}.foregroundColor(.white)
```

（2）使用循环创建三个按钮，按钮的图片为国旗，动作为调用 `flagTapped()`，传入当前按钮的索引值供检查正确与否。

```swift
ForEach(0..<3) { number in
	Button(action: {
		self.flagTapped(number)             	// 按钮动作
	}) {
		Image(self.countries[number].flagName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.gray, lineWidth: 1))
    }
    .shadow(color: Color(.white), radius: 5, x: 15, y: 15)
}
```

（3）将按钮与文字部分共同放入一个 VStack 中。

（4）使用 ZStack 包裹，在最底层增加底色。

```swift
ZStack {
    // Color.blue.edgesIgnoringSafeArea(.all)  		是另一种使用纯色的方法
    LinearGradient(
        gradient: Gradient(colors: [.blue, .black]), 
        startPoint: .topLeading, 
        endPoint: .bottomLeading).edgesIgnoringSafeArea(.all)  // 使用渐进做底色

    VStack(spacing: 30) {
        VStack(spacing: 20) {		//文字部分
```

（5）适当调整界面，如边距、字体、颜色等.

```swift
var body: some View {
        ZStack {
            // Color.blue.edgesIgnoringSafeArea(.all)
            LinearGradient(
                gradient: Gradient(colors: [.blue, .black]), 
                startPoint: .topLeading, 
                endPoint: .bottomLeading).edgesIgnoringSafeArea(.all)  // 使用渐进做底色
            
            VStack(spacing: 30) {
                VStack(spacing: 20) {		//文字部分
                    Text("猜国旗")
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Text("请点击下面你认为正确的国旗")
                            // .font(.subheadline)
                            .fontWeight(.bold)
                    Text(countries[correctAnswer].chsName)	// 国家中文名字
                    .font(.title)
                    .fontWeight(.black)
                }.foregroundColor(.white)
                
                ForEach(0..<3) { number in					// 三个按钮
                    Button(action: {
                        self.flagTapped(number)             // 按钮动作
                    }) {
                        Image(self.countries[number].name)	// 图片名称
                            .renderingMode(.original)		// 显示原图
                            .clipShape(Capsule())			// 剪裁成胶囊形状
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))	// 边框 
                    }
                    .shadow(color: Color(.black), radius: 5, x: 0, y: 5)	// 阴影
                }
                Spacer()
            }
            .padding(.top, 30)	// 边距
        }
        .alert(isPresented: $showingScore) {
            Alert(
                title: Text(scoreTitle), 
                message: Text("你已经猜了 \(questionNum) 次\n你猜对了 \(score) 次"), 
                dismissButton: .default(Text("继续")){
                	self.askQuestion()
            })
        }
    }
```

### [2. Showing the player’s score with an alert](https://www.hackingwithswift.com/books/ios-swiftui/showing-the-players-score-with-an-alert)（使用警告消息显示玩家得分）

（1）声明控制警告对话框的状态

```swift
@State private var showingScore = false                         // 控制显示警告，默认不显示
@State private var scoreTitle = ""                              // 警告信息
```

（2）响应按钮的点击动作的函数 flagTapped

```swift
func flagTapped(_ number: Int) {
    questionNum += 1                        // 题目数量 +1
    if number == correctAnswer {
        scoreTitle = "恭喜你，答对了！！"
        score += 1                          // 答对时，得分 +1
    } else {
        scoreTitle = "不太对呢，再想想？"
    }
    showingScore = true
}
```

（3）给 ZStack 加上 alert 修饰

```swift
.alert(isPresented: $showingScore) {
    Alert(
        title: Text(scoreTitle), 
        message: Text("你已经猜了 \(questionNum) 次\n你猜对了 \(score) 次"), 
        dismissButton: .default(Text("继续")){	
        	self.askQuestion()		// 点击 继续 按钮的动作
    })
}
```

（4）复位题目 askQuestion

```swift
func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
}
```

### [3. Styling our flags](https://www.hackingwithswift.com/books/ios-swiftui/styling-our-flags)（修改国旗的样式）

```
Image(self.countries[number].name)	// 图片名称
    .renderingMode(.original)		// 显示原图
    .clipShape(Capsule())			// 剪裁成胶囊形状
    .overlay(Capsule().stroke(Color.black, lineWidth: 1))	// 边框 
```

## [百日学 Swift（Day 22）](https://www.hackingwithswift.com/100/swiftui/22) – Project 2, part three（项目 2 ：第 3 部分）

### 1. 项目盘点

（1）练习了各种堆栈容器的包裹，通过堆栈可以迅速地将子组件组合成视图，同时也能让我们感受到视图的设计可以从细节开始，围绕功能做出一个个子组件或者子视图，再用容器组合到一起。

（2）练习了使用条件控制状态和应用计算属性。

（3）学习了 alert 修饰，练习了各种修饰器。

（4）练习了诸如底色、图像原图显示等小技巧。

### 2. 挑战

目前项目中已经在警告框里显示了题目数和回答正确数，试着完成下面的任务：

- 警告信息中答错了要告诉正确答案

- 警告信息中，要有答对答错的计数和正确率

> 项目的源码可以到 [GitHub](https://github.com/HH-Ge/100DaysOfSwift/tree/master/Projects/D20-22.GuessTheFlag) 上查看。
>



## [百日学 Swift（Day 23）](https://www.hackingwithswift.com/100/swiftui/23) – Project 3, part one（项目 3 ：第 1 部分）

### [1. Views and modifiers: Introduction](https://www.hackingwithswift.com/books/ios-swiftui/views-and-modifiers-introduction)（视图和修饰器简介）

本项目实际上是第一个*技术项目* ——深入探索 SwiftUI 功能，并仔细研究其运作方式以及*运作机制*。

本项目中将研究视图和视图修饰器，并希望回答对此最常见的问题—— SwiftUI 为什么将视图定义为结构体？为什么使用这么多`some View`？*修饰器如何真正起作用？

首先，创建一个名为 ViewsAndModifiers 的新 Single View App 项目。

### [2. Why does SwiftUI use structs for views?](https://www.hackingwithswift.com/books/ios-swiftui/why-does-swiftui-use-structs-for-views)（为何 SwiftUI 中的视图使用的是结构体）

首先，结构比类更简单，更快，从而可以带来更好的性能。这的确是非常重要的原因，但还不是全部。尽管性能很重要，但视图采用结构体还有更重要的原因：它迫使我们考虑以一种干净的方式隔离状态。类可以自由更改值，这可能导致代码混乱—— SwiftUI 如何知道何时更改了值然后要更新UI？

通过生成不会随时间变化的视图，SwiftUI 鼓励将设计思路转向更具功能性的方向：把视图变得简单，惰性的东西将数据转换为UI，而不是变得无法控制的智能化东西。

当查看可以作为视图的事物时，可以看到这一点。前面已经使用`Color.blue`和`LinearGradient`作为视图——它们都是包含很少数据的琐碎类型。实际上，没有比使用`Color.blue`视图更简单的了：除了*用蓝色填充我的空间*之外，它不包含任何其他信息。

相比之下，Apple的[UIView文档](https://developer.apple.com/documentation/uikit/uiview)列出了大约200种`UIView`具有的属性和方法，无论是否需要它们，所有这些属性和方法都将传递给其子类。

### [3. What is behind the main SwiftUI view?](https://www.hackingwithswift.com/books/ios-swiftui/what-is-behind-the-main-swiftui-view)（SwiftUI 视图的背后是什么？）

每次新建文件都会看到下面的代码

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello World")
    }
}
```

然后，可能我们想把屏幕的背景色设置成蓝色，于是

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .background(Color.blue)
    }
}
```

但是会发现，蓝色只应用到了文字的后面，其他的地方还是白茫茫一片。于是可能会问：怎么才能把视图的后面的东西变成蓝色？但是实际上对 SwiftUI 而言，***视图后面空空如也***。当然你要非得使用 SwiftUI 之外的招数把它“***黑***”成蓝色我没话说。

那么只好换个思路，那就是让 Text 视图占满屏幕，

```swift
Text("Hello World")
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.blue)
```

这就好了，嗯，还可以更好，

```swift
Text("Hello World")
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.blue)
    .edgesIgnoringSafeArea(.all)
```

看看，这下彻底了！

### [4. Why modifier order matters](https://www.hackingwithswift.com/books/ios-swiftui/why-modifier-order-matters)（为何修饰器的顺序很重要）

下面的代码*不会*在屏幕中间看到带有“ Hello World ”的 200x200 红色按钮。相反，会看到一个 200x200 的空正方形，中间是背景为红色的 “ Hello World”。

```swift
Button("Hello World") {
    print(type(of: self.body))
}    
.background(Color.red)
.frame(width: 200, height: 200)
```

Swift 的`type(of:)`方法会打印特定值的确切类型，在这种情况下，它将打印以下内容：

`ModifiedContent<ModifiedContent<Button<Text>, _BackgroundModifier<Color>>, _FrameLayout>`

这里面有两件事：

- 每次修改视图时，SwiftUI都会使用泛型 **ModifiedContent<OurThing, OurModifier>** 到修饰器。
- 当我们应用多个修饰器时，它们会叠加起来： **ModifiedContent<ModifiedContent<…**

要了解类型是什么，得从最里面的类型开始，然后逐步解决：

- 最里面的类型是`ModifiedContent<Button<Text>, _BackgroundModifier<Color>`：按钮上的文本带有背景色。
- 外面包裹的是`ModifiedContent<…, _FrameLayout>`，前面第一个视图（按钮+背景色）有个框架。

所以，这种以`ModifiedContent`堆叠的类型结尾说明**修饰器每次都是对前面的结果进行修饰，而不是修饰最初的视图**。这么一来，修饰器的顺序就变得非常重要了

如果我们重写代码，先用 frame 修饰，再应用背景色，那么可能会得到预期的结果：

```swift
Button("Hello World") {
    print(type(of: self.body))
}
.frame(width: 200, height: 200)
.background(Color.red)
```

修饰器有一个重要的*副作用*。我们可以多次应用相同的效果：每个修饰符都会简单地添加到以前的内容中。

例如，SwiftUI 为我们提供了`padding()`修饰符，该修饰符在视图周围添加了一些空间，从而不会与其他视图或屏幕边缘发生冲突。如果我们应用填充，然后应用背景色，然后应用更多填充和不同的背景色，则可以为视图提供多个边框，如下所示：

```swift
Text("Hello World")
    .padding()
    .background(Color.red)
    .padding()
    .background(Color.blue)
    .padding()
    .background(Color.green)
    .padding()
    .background(Color.yellow)
```

### [5. Why does SwiftUI use “some View” for its view type?](https://www.hackingwithswift.com/books/ios-swiftui/why-does-swiftui-use-some-view-for-its-view-type)（SwiftUI 为何选择 some View 作为视图类型）

`some View`的意思是*某种符合`View`协议的特定类型*。

返回`some View`与仅返回`View`相比，有两个重要区别：

- 我们必须始终返回相同类型的视图。
- 即使我们不知道返回哪种视图类型，编译器也会知道。

第一个差异对性能很重要：SwiftUI 需要能够查看视图并了解它们的改动，以便可以正确更新用户界面。如果允许我们随机更改视图，SwiftUI 要准确找出更改的内容确实很慢——几乎需要放弃所有内容，并在每次小的更改后重新开始。

第二个区别很重要，因为SwiftUI使用`ModifiedContent`的方式来构建其数据。

因此，虽然不允许编写这样的视图：

```swift
struct ContentView: View {
    var body: View {
        Text("Hello World")
    }
}
```

编写这样的视图是完全合法的：

```swift
struct ContentView: View {
    var body: Text {
        Text("Hello World")
    }
}
```

【深入研究】

类似 VStack 的容器，系统使用 TupleView （元组视图）实现。在容器里每创建一个子视图时，系统会添加到这个 TupleView 中。不过有个数限制，不得超过 10 个。

> 查看源码发现下面的内容
>
> ```swift
> extension ViewBuilder {
> 
> public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View
> }
> ```
>
> 推测这是每个父容器只能允许10个子视图的原因。（地雷秘密终于找到了~~嘿嘿😜）

### [6. Conditional modifiers](https://www.hackingwithswift.com/books/ios-swiftui/conditional-modifiers)（条件修饰器）

> 要尽量使用 三元运算符 而不是 if 语句来控制修饰器。

```swift
struct ContentView: View {
    @State private var useRedText = false

    var body: some View {
        Button("Hello World") {
            self.useRedText.toggle()            		// 切换 useRedText 状态
        }
        .foregroundColor(useRedText ? .red : .blue)		// 根据状态进行选择
    }
}
```

有时可以使用常规`if`条件根据某种状态返回不同的视图，但这仅在少数情况下才可行。

例如，不允许使用以下代码：

```swift
var body: some View {
    if self.useRedText {
        return Text("Hello World")
    } else {
        return Text("Hello World")
            .background(Color.red)
    }
}
```

请记住，`some View`表示某种特定类型的 View。 由于 SwiftUI 使用通用包装器`ModifiedContent`创建新视图的方式，`Text(…)`和`Text(…).background(Color.red)`是不同的基础类型，并且与`some View`并不兼容。

### [7. Environment modifiers](https://www.hackingwithswift.com/books/ios-swiftui/environment-modifiers)（环境修饰器）

在容器上应用修饰器会将同一修饰效果同时应用于容器内的多个子视图。

```swift
VStack {
    Text("Gryffindor")
    Text("Hufflepuff")
    Text("Ravenclaw")
    Text("Slytherin")
}
.font(.title)
```

这称为环境修改器，与应用于视图的常规修改器不同。

从编码角度来看，这些修饰符的使用方式与常规修饰符完全相同。但是，它们的行为略有不同，因为如果这些子视图中的任何一个覆盖了相同的修饰符，则子版本优先。

**但也不都是这样！！！**

```swift
VStack {
        Text("Gryffindor").blur(radius: 5)
        Text("Hufflepuff")
        Text("Ravenclaw").blur(radius: 3)
        Text("Slytherin")
        }.font(.largeTitle)
        .blur(radius: 2)
```

可以看出，font 对所有的文本都起作用，而 blur 的作用则是叠加的（没有单独设定 blur 的默认值为 0）

**所以……只能是试验！！！**

### [8. Views as properties](https://www.hackingwithswift.com/books/ios-swiftui/views-as-properties)（视图作为属性）

可以像这样创建两个文本视图作为属性，然后在`VStack`内使用它们：

```swift
struct ContentView: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")

    var body: some View {
        VStack {
            motto1
            motto2
        }
    }
}
```

甚至可以在使用这些属性时直接将修饰器应用于这些属性，

```swift
VStack {
    motto1
        .foregroundColor(.red)
    motto2
        .foregroundColor(.blue)
}
```

Swift 不允许创建一个引用其他存储属性的存储属性（**应该是创建 `计算属性`**），因为在创建对象时会引起问题。这意味着直接将属性创建为TextField会有问题。

```swift
@State var str = "hello"
var abc = TextField("引用变量 str", text: $str)
```

结果报错，看起来是少了 self，其实即使加上也没有用

```shell
Cannot use instance member 'str' within property initializer; property initializers run before 'self' is available
```

所以需要改成计算属性：就不会报错了

```swift
@State var str = "hello"
var abc: some View {
	TextField("引用变量 str", text: $str)
}
```

### [9. View composition](https://www.hackingwithswift.com/books/ios-swiftui/view-composition)（组合视图）

主要是以下几个个方面：

（1）将复杂视图拆分成小的视图组件，便于维护和扩展。

（2）将类型、外观相似的视图抽取为子视图，可以充分代码复用。注意：最外层的视图不能被抽取——这是显而易见的。

（3）抽取的时候尽量不带有对整个子视图的修饰，便于在实际应用的时候进行个性化修饰。

（4）抽取子视图的方法是，在要抽取的视图或者容器上使用⌘ 点击，在快捷菜单中选择`Extract subView`，输入子视图名称即可。

### [10. Custom modifiers](https://www.hackingwithswift.com/books/ios-swiftui/custom-modifiers)（自定义修饰器）

（1）定义修饰器，两步。

```swift
struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}
```

（2）应用自定义修饰器

```swift
Color.blue
    .frame(width: 300, height: 200)
    .watermarked(with: "版权所有 盗版必究")
```

### [11. Custom containers](https://www.hackingwithswift.com/books/ios-swiftui/custom-containers)（自定义容器）

（1）自定义 网格堆栈

```swift
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        return self.content(row, column)
                        .padding(2)
                    }
                }
            }
        }
    }
}

struct GridStack_Previews: PreviewProvider {
    static var previews: some View {
        GridStack(rows: 3, columns: 3){ row, col in
            Text("R\(row) C\(col)")
                .padding()
                .frame(width:80, height: 50)
                .border(Color.gray, width: 1)
        }
    }
}
```

（2）使用自定义容器

```swift
struct CustomStacks: View {
    var body: some View {
        GridStack(rows: 3, columns: 3) {row, col in
            Text("\(cal(row: row, col: col))")
                .frame(width: 25, height: 25)
                .border(Color.gray, width: 1)      
        }
    }
}

func cal(row: Int, col: Int) -> Int {
    if row == 2 && col == 0 {
        return 1
    }else {
        return (2 - row) * 3 + col + 1
    }
}
```

上面只是做出来这个网格堆栈，具体应用还需要看实际需求。

## [百日学 Swift（Day 24）](https://www.hackingwithswift.com/100/swiftui/24) – Project 3, part two（项目 3 ：第 2 部分）

### 1. 项目盘点

（1）深入了解了 SwiftUI 关于 View 和 some View 的相关知识。

（2）了解了修饰器顺序作用的原因。

（3）使用条件状态控制修饰器。

（4）使用容器组合视图。

（5）自定义修饰符和容器。

### 2. 挑战

- 扩展 font 修饰器，加上需要的样式，像CSS中的 H1 到 H5。
- 在项目 2 中为国旗图片抽取子视图，在其中加上默认的渲染方式和必要的修饰。

> 项目的源码可以到 [GitHub](https://github.com/HH-Ge/100DaysOfSwift/tree/master/Projects/D23-24.ViewsAndModifiers) 上查看。
>



## Day 25: Consolidation II

In the last few days we covered some of the fundamentals of iOS development, and before we move on to the next set of projects it’s important to take a step back and review what you’ve learned.

### [百日学 Swift（Day 25）](https://www.hackingwithswift.com/100/swiftui/25) – Consolidation II, Milestone: Projects 1-3（第 2 阶段总结，里程碑：项目 1-3）

###  1. 学习内容

截至目前，已经完成了两个 SwiftUI 项目和一个技术项目，后面依旧会是这样的节奏继续进行。今天来回忆一下第 2 阶段学到的内容。

- 构建包括文本与控件（如`Picker`）的滚动表单，SwiftUI会变成漂亮的基于表格的布局，还可以通过滑动出新屏幕做出新的选择。
- 创建一个`NavigationView`并给予一个标题，不仅能够将新的视图推送到屏幕上，还能够设置标题并避免内容出现问题。
- 使用`@State`存储变化的数据及这样做的原因。记住，所有的 SwiftUI 视图都是结构体，这意味着如果没有类似`@State`的内容就无法更改它们。
- 为`TextField`和`Picker`等用户界面控件创建双向绑定，了解如何使用`$variable`读取和写入值。
- 使用`ForEach`循环快速创建大量视图。
- 使用`VStack`，`HStack`和`ZStack`构建复杂的布局，并将它们组合在一起以构成网格。
- 将颜色和渐变可以用作视图，还可以为它们指定特定的 frame，以便控制它们的大小。
- 通过提供一些文本或图像以及点击按钮时执行的尾随闭包来创建按钮。
- 通过定义显示警报的条件来创建警报，然后从其他位置切换该状态。
- SwiftUI 如何（以及为什么！）广泛使用不透明的结果类型（`some View`），与修饰器紧密地联系起来让修饰器的顺序变得非常重要。
- 如何使用三元运算符创建条件修饰器，这些条件修饰器根据程序状态应用不同的结果。
- 如何使用视图组合和自定义视图修饰器将代码分解为小部分，从而能够构建更复杂的程序而不会丢失代码。

### 2. 知识要点

- 结构体和类
- 使用 ForEach
- 使用绑定

### 3. 挑战

尝试实现“石头、剪刀、布”的游戏。

（1）为出拳创建结构体并将三种拳放入到一个数组里面备用，这个要在 ContentView 外面做，不然很多报错，我还没试出来怎么放在里面去。

```swift
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
```

其中，每种拳的图片暂时借用了 SF 符号简单显示了，今后如果要使用其他图片，只要将图片文件复制到 `Assets.xcassets`文件夹，然后把 imageName 替换成对应的名字即可。

（2）搭建视图

- VStack 包裹全部内容
    - 标题
    - HStack 包裹两张卡片，显示 AI 和玩家的出拳，使用子视图
    - HStack 包裹三个按钮，分别代表三种拳，使用循环生成
    - 本局比赛结果
    - 比赛统计
    - 复位按钮

（3）子视图

- VStack
    - 比赛方名字
    - 出拳图片
    - 拳名字

参数包括：玩家名字和出拳

（4）从视图中逐步找到需要的状态变量

```swift
    @State var aiFist: Fist = Fist(id: -1)          // ai出拳
    @State var playerFist: Fist = Fist(id: -1)      // 玩家出拳
    @State var lastAiFist: Fist = Fist(id: -1)      // 上次 AI 的出拳，目的是在下一次比赛前保持画面

    @State var result: String = ""                  // 单局比赛结果

    @State var games = 0                            // 总局数
    @State var playerWin = 0                        // 玩家胜局数
    @State var evenGames = 0                        // 平局数
```

（5）更新主视图中调用子视图的语句，加上应该传入的参数

```swift
HStack(spacing: 20) {
    card(playerName: "AI", fist: lastAiFist)        //抽取子视图，必须传 lastAiFist，才能保证下次比赛前画面不刷新
    card(playerName: "Player", fist: playerFist)
}
```

（6）更新 Button 中的 action 内容

```swift
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
```

（7）更新显示比赛结果的 Text

```swift
Text("本局结果：\(result)")
	.font(.title)
Text("共 \(games) 局，玩家胜 \(playerWin) 局，平 \(evenGames) 局")
```

（8）更新复位按钮的响应代码

```swift
Button(action: {         // 复位按钮
    self.games = 0
    self.playerWin = 0
    self.evenGames = 0
}){
    Text("重新开始")
}
```

应该没问题了！挑战成功！！

### 4. 挑战收获

- 使用 `id: Int` 来判定胜负，代码上好写。换成字符串就麻烦了。
- 视图中使用的结构体和一些不变的内容尽量写在视图以外，这个还需要进一步研究。
- ForEach 循环生成按钮的范围值不能使用闭合范围，否则报错`Cannot convert value of type 'ClosedRange<Int>' to expected argument type 'Range<Int>'`
- 子视图的抽取
- 状态变量的设计，要根据视图的需要逐步产生，最好有默认值，这样 preview 时不用传参。但有时候为了看到某个特定的结果，也可以传入必要的参数。
- 容器、组件、修饰器的练习



