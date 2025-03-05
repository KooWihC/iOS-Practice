import Foundation

let age = 20

let num = 100

var age1 = 20
age1 = 12
age1 = 111

//var num1 = 121
//num1 = 1212
//num1 = 1234

var myAge = 26
var ratio : Float = 0.12345
var str = "Hello, Swift!"
var isOn : Bool = true


//연산자 실습
let num1 = 5
let num2 = 3
-num1
num1 + num2
num1 - num2
num1 * num2
num1 / num2
num1 % num2

//비교연산자
let num3 = 2
num1 > num2 && num2 > num3
num1 == num2 && num1 > num2
num1 == num2 || num1 > num2
num1 - num2 > num2 - num3 && num2 == 0
num1 + num2 > num3 || num3 > 0

var num4 = 12
num4 += 10

//나의 나이는 ~ 문자열 치환방법 back slash
print("나의 나이는 \(myAge)세야 !")
