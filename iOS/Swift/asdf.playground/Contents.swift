import Foundation

//let age = 2

//let num = 100

//var age1 = 20
//age1 = 12
//age1 = 111

//var num1 = 121
//num1 = 1212
//num1 = 1234

var myAge = 26
var ratio : Float = 0.12345
var str = "Hello, Swift!"
var isOn : Bool = true


// 연산자 실습
let num1 = 5
let num2 = 3
-num1
num1 + num2
num1 - num2
num1 * num2
num1 / num2
num1 % num2

// 비교연산자
let num3 = 2
num1 > num2 && num2 > num3
num1 == num2 && num1 > num2
num1 == num2 || num1 > num2
num1 - num2 > num2 - num3 && num2 == 0
num1 + num2 > num3 || num3 > 0

var num4 = 12
num4 += 10

// 나의 나이는 ~ 문자열 치환방법 back slash
print("나의 나이는 \(myAge)세야 !")

// if 조건문
let adult1 = 19
let age1 = 15

if age1 < adult1
{
    print("당신은 미성년자네요")
}
let gender = "male"
if age < adult1
{
    if gender == "male"
    {
        print("당신은 미성년 남성이네요")
    }
    else
    {
        print("당신은 미성년 여성이네요")
    }
}

// guard 조건문

func guardTest()
{
    guard age1 >= adult1
    else
    {
        print("당신은 미성년자입니다.")
        return
    }
    print("당신은 성인입니다.")
}

guardTest()

// 다중선택문 if-else
let browser = "Chrome"
let browserName : String

if browser == "IE"
{
    browserName = "인터넷 익스플로러"
}
else if browser == "Safari"
{
    browserName = "사파리"
}
else if browser == "Chrome"
{
    browserName = "크롬"
}
else
{
    browserName = "알려지지 않은 브라우저"
}

print("브라우저명은 \(browserName) 입니다!")

// 다중선택문 간략화 if-else
let browser1 = "Safari"

let browserName1 = if browser1 == "IE"
{
    "인터넷 익스플로러"
}
else if browser1 == "Safari"
{
    "사파리"
}
else if browser1 == "Chrome"
{
    "크롬"
}
else
{
    "알려지지 않은 브라우저"
}

print("브라우저명은 \(browserName1) 입니다!!")


// 다중선택문 switch-case

let browser2 = "IE"
let browserName2 : String

switch browser2
{
    case "IE" : browserName2 = "인터넷 익스플로러"
    case "FF" : browserName2 = "파이어 폭스"
    case "Chrome" : browserName2 = "크롬"
    case "Opera" : browserName2 = "오페라"
    case "Safari" : browserName2 = "사파리"
    default : browserName2 = "알려지지 않은 브라우저"
}
print("브라우저명은 \(browserName2) 입니다!!!")

// switch-case 간략

let browser3 = "FF"
let browserName3 = switch browser3
{
    case "IE" : "인터넷 익스플로러"
    case "FF" : "파이어 폭스"
    case "Chrome" : "크롬"
    case "Opera" : "오페라"
    case "Safari" : "사파리"
    default : "알려지지 않은 브라우저"
}
print("브라우저명은 \(browserName3) 입니다!!!!")

// 구구단 출력
for i in 1...9
{
    for j in 1...9
    {
        print("\(i) * \(j) = \(i*j) ")
    }
    print("")
}

// for ~ in 구문
var bts = ["진", "슈가", "제이홉", "RM", "지민", "뷔", "정국"]

for name in bts
{
    print("hello, \(name)")
}

var capitals = ["KR":"Seoul", "EN":"London", "FR":"Paris"]

for (country, capital) in capitals
{
    print("\(country)'s capital is \(capital)")
}

// while 구문
var age = 0

while age < 5
{
    print("\(age)살 입니다.")
    age += 1
}

// repeat ~ while 구문 후위연산자 느낌~
//var n = 0
//
//repeat
//{
//    n = n + 1
//    print("\(n)")
//}
//while n < 10
        
// break, continue
for row in 0...5
{
    if row == 2
    {
        break
    }
    print("\(row) was executed!")
}

for row in 0...5
{
    if row == 2
    {
        continue
    }
    print("\(row) was executed!")
}

// Array 활용
let member = bts[0]
print("첫번째 멤버는 \(member) 입니다.")

bts[3] = "RM"
for name in bts
{
    print(name)
}

let length = bts.count // elements 개수 세는 법
print(length)

for index in 0...length - 1
{
    print("\(index + 1)번째 멤버는 \(bts[index]) 입니다")
}

bts.append("치욱") // 맨 뒤에 넣기
print(bts)

bts.insert("서하", at: 6) // 원하는 위치에 삽입
print(bts)

bts.remove(at: 6) // 원하는 index element 삭제
print(bts)

bts.append(contentsOf: ["태훈", "지원"]) // Array의 형태도 삽입 가능
print(bts)

bts += ["서하", "은서"] // 연산자로도 element 삽입 가능
print(bts)

let part = bts[7...10] // 슬라이싱? 가능
print(part)

bts[0...2] = ["재환", "현빈"] // 대입 가능
print(bts)

// Set 선언과 초기화
var set1: Set<String> = Set<String>()
var set2: Set<String> = []
var set3: Set<String> = ["진", "슈가", "제이홉", "RM", "지민"]

// Set에서는 형지정을 생략하면 Array로 인식된다.
print(set3)
var nums = [1, 2, 3]
print(nums)

for name in set3
{
    print(name)
}

// Set 활용
let result = set3.insert("진")
print(result) // 같은 값이 있으면 삽입 실패

let result1 = set3.insert("뷔")
print(result1)

let result2 = set3.remove("뷔")
print(result2)

let result3 = set3.remove("뷔")
print(result3)


// 함수의 매개변수
func sayHelloWithName(name: String, age: Int) -> String
{
    return "\(name) is \(age) years old."
}
print(sayHelloWithName(name: "Chichi", age: 26))

// 내부 매개변수, 외부 매개변수(인수라벨)
// 호출 시에는 외부매개변수명을 사용, 함수 정의 시에는 내부매개변수 사용
func sayHello(exName name: String, exAge age: Int) -> String
{
    return "\(name) is \(age) years old."
}

print(sayHello(exName: "Ahn", exAge: 12))

// 함수 호출시 매개변수를 생략하고 싶을 때에는 언더스코어 "_"를 사용한다
func sayHi(_ name: String, _ age: Int) -> String
{
    return "\(name) is \(age) years old."
}

print(sayHi("Seoha", 16))


// 함수의 형
//func hello1()
//{
//    print("Hello World")
//}
//
//let func1:()->() = hello1
//func1()


// 함수형 반환값
func hello(name: String)
{
    print("Hello \(name)")
}

func hello1() -> (String)->()
{
    return hello
}

let hello2 = hello1()
hello2("홍길동")
