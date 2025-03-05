import Foundation

let age = 2

let num = 100

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
