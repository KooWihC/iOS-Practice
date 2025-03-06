//var index: Int
////print(index)
//
//index = 3
//print(index)
//
//var index1: Int = 0
////var index1 = Int() 이랑 같음
//print(index1)
//
//var index2 = Int(3)
//print(index2)
//
////var index3: Int = nil
//
//var index5 = Int("3")
//print(index5)
//
//var index6 = Int("Swift")
//print(index6)
//print(type(of: index5))
//
//var optInt: Int?
//print(optInt)
//optInt = 5
//print(optInt)
//
//// optional 사용
//var temp1: Int? = 3
//var temp2: Int? = 5
////temp1 + temp2
////temp1 + 30 optional 값들은 그냥 사용 불가
//// unwrapping 필요함
//
//var optInt2: Int? = 3
//print("옵셔널 자체의 값 : \(optInt2)")
//print("!로 강제 언래핑한 값 : \(optInt2!)")
//temp1! + temp2!
//var index7 = Int("123")
//print(type(of: index7))
//var index8 = index7!
//print(type(of: index8))


var temp2: Int? = 123
print(temp2)

if temp2 != nil
{
    print("변환된 값은 \(temp2!) 입니다.")
}
else
{
    print("변환에 실패했습니다.")
}
// 위와 같은 구조를 많이 사용함
// 그래서 swift에서 아래와 같은 문법을 만들어놓음

if let value = temp2 // value 다음에 대입되는 값은 무조건 optional 된 값이어야 한다.
{
    print("변환된 값은 \(value)")
}

var optInt: Int? = 123

if let value = optInt
{
    print("변한된 값은 \(value)")
}
// 이런 과정을 unwrapping 혹은 binding 이라고 한다

var idol: String? = "BTS"

//if let val = idol
//{
//    print("변환된 값은 \(val) 입니다")
//}

func optTest(idol: String?)
{
    guard let val = idol else
    {
        print("idol은 nil 입니다.")
        return
    }
    print(val)
}

optTest(idol: idol)

// Optional형 자동 해제
let optInt3: Int? = 123
if(optInt3 != nil)
{
    print("optInt3 == 123")
}
else
{
    print("optInt3 != 123")
}

// 비교할 때에는 자동으로 unwrapping 된다
let tempInt: Int? = 123
tempInt! == 123
tempInt == 123
tempInt! == Optional(123)
tempInt == Optional(123)

// nil 결합 연산자
var optAge: Int?
print(optAge ?? 20)

var optName: String? = "손흥민"
//var optName: String?
let name = optName ?? "황희찬"
print(name)

// 250306
