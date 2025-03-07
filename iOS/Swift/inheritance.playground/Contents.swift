class Vehicle
{
    var speed = 0
    func speedUP(){ speed += 10}
    func speedDn(){ speed -= 10}
}

class Car: Vehicle
{
    var wheelCount: Int
    var seatCount: Int
    init(wheelCount: Int, seatCount: Int)
    {
        self.wheelCount = wheelCount
        self.seatCount = seatCount
    }
}
var car = Car(wheelCount: 4, seatCount: 2)
car.speedUP()
print(car.speed)

class Truck: Car
{
    var loadage: Int = 0
    func load(){ print("load") }
    func unLoad(){ print("unLoad") }
    
    override func speedUP()
    {
        speed += 5
    }
}

var truck = Truck(wheelCount: 6, seatCount: 2)
truck.load()
truck.unLoad()
truck.speedUP()
print(truck.speed)

class sportCar: Car
{
    override func speedUP()
    {
        speed += 20
    }
}

var ferrari = sportCar(wheelCount: 4, seatCount: 2)
ferrari.speedUP()
print(ferrari.speed)

class dumpTruck: Car
{
    var loadage: Int
    func load() { print("load") }
    func unLoad() { print("unLoad") }
    
    init(loadage: Int, wheelCount: Int, seatCount: Int)
    {
        self.loadage = loadage
        super.init(wheelCount: wheelCount, seatCount: seatCount)
    }
    override func speedUP()
    {
        speed += 5
    }
}

var dT = dumpTruck(loadage: 100000, wheelCount: 4, seatCount: 4)
dT.speedUP()
print(dT.speed)

