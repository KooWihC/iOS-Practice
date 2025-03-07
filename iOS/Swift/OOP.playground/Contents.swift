class Person
{
    let name = "손흥민"
    var age = 32
}

let person = Person()
person.name
person.age


let age = person.age
person.age = 20

print(person.name)
//person.name = "홍길동"
let person2 = Person()

class Vehicle
{
    var speed: Int = 0
    
    func speedUp()
    {
        speed += 10
    }
    
    func speedDn()
    {
        speed -= 10
    }
}

var someVehicle = Vehicle()
someVehicle.speedUp()
print(someVehicle.speed)

var chiVehicle = Vehicle()
chiVehicle.speed = 100
print(chiVehicle.speed)

class Vehicle1
{
    var speed = 0
    func speedUp(){ speed += 10 }
    func speedDn(){ speed -= 10 }
    func speed2Mile() -> Double
    {
        return Double(speed) * 0.6213
    }
}

var someVehicle1 = Vehicle1()
someVehicle1.speedUp()
print(someVehicle1.speed)
var mile = someVehicle1.speed2Mile()
print(mile)

class Vehicle2
{
    var speed = 0
    var mile: Double
    {
        get { return Double(speed) * 0.6213}
        set(newSpeed) { speed = Int(newSpeed * 1.6)}
    }
    
    func speedUp(){ speed += 10 }
    func speedDn(){ speed -= 10 }
    func speed2Mile() -> Double
    {
        return Double(speed) * 0.6213
    }
}
var someVehicle2 = Vehicle2()
someVehicle2.speedUp()
print(someVehicle2.speed2Mile())
print(someVehicle2.mile)
someVehicle2.mile = 2.2345
print(someVehicle2.speed)

class Vehicle3
{
    var speed = 0.0
    var mile: Double
    {
        get { return speed * 0.62 }
        set(newValue) { speed = newValue * 1.6 }
    }
    func speedUp(){ speed += 10 }
    func speedDn(){ speed -= 10 }
    func speed2Mile() -> Double
    {
        return speed * 0.62
    }
}

let v3 = Vehicle3()
v3.speedUp()
let mile1 = v3.mile
print(v3.speed, mile1)

class Vehicle4
{
    var speed = 0.0
    {
        willSet(newSpeed)
        {
            print("현재속도 = \(speed), 새로운 속도 = \(newSpeed)")
        }
        didSet(oldSpeed)
        {
            print("현재속도 = \(speed), 이전속도 = \(oldSpeed)")
        }
    }
    var mile: Double
    {
        get { return speed * 0.62 }
        set(newValue){ speed = newValue * 1.6 }
    }
    func speedUp() { speed += 10 }
    func speedDn() { speed -= 10 }
    func speed2Mile() -> Double
    {
        return speed * 0.62
    }
}

var vehicle4 = Vehicle4()
vehicle4.speed = 100
vehicle4.speed = 50

import Darwin

class Square
{
    var size = 0.00
    var garo = 0.00
    var sero = 0.00
    func setSize(getSize: Double) -> ()
    {
        size = getSize
    }
    
    func sqrroot()
    {
        garo = sqrt(size)
        sero = garo
    }
}

var sq1 = Square()

sq1.setSize(getSize: 16.0)
sq1.sqrroot()
print(sq1.garo, sq1.sero)

class SquareRoot
{
    var width = 0.0
    var height = 0.0
    
    var area: Double
    {
        get { return width * height }
        set(newVal)
        {
            width = sqrt(newVal)
            height = width
        }
    }
    func double() -> (Double, Double)
    {
        width = width * 2
        height = height * 2
        return (width, height)
    }
}

let sq2 = SquareRoot()
sq2.width = 10
sq2.height = 10
print(sq2.area)

sq2.area = 25
print(sq2.width)
print(sq2.double())

class Square1
{
    var width: Double = 0.0
    var height: Double = 0.0
    
    var area: Double
    {
        get { return width * height }
        set(newVal) { width = sqrt(newVal); height = width }
    }
    
    func duplicate() -> (Double, Double)
    {
        width *= 2
        height *= 2
        return (width, height)
    }
    
    init(w: Double, h: Double)
    {
        width = w; height = h
    }
    init()
    {
        width = 10
        height = 10
    }
    init(w: Double)
    {
        width = w
        height = width
    }
}
var sqtest = Square1() // 기본 생성자로 (10.0, 10.0)으로 선언됨
print(sqtest.area) // 100.0


class Square2
{
    var width = 0.0
    var height = 0.0
    
    var area: Double
    {
        get { return width * height }
        set(newVal) { width = sqrt(newVal); height = width }
    }
    
    func duplicate() -> (Double, Double)
    {
        width *= 2
        height *= 2
        return (width, height)
    }
    
    init(width: Double, height: Double)
    {
        self.width = width
        self.height = height
        self.duplicate()
    }
}

