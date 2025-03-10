struct Person
{
    var name: String
    var age: Int
    var gender: String
    var height: Double
}

var person = Person(name: "안치욱", age: 26, gender: "M", height: 168)
print(person.name)
print(person.gender)

struct Person17
{
    var name: String
    var age: Int
    var gender: String
    var height: Double
    
    func info()
    {
        print("이름 : \(name), 나이 : \(age), 성별 : \(gender), 키 : \(height)")
    }
}

var chi = Person17(name: "치욱", age: 26, gender: "M", height: 168)
chi.info()

var p1 = Person17(name: "우영우", age: 25, gender: "F", height: 160.5)
p1.info()
var p2 = p1
p2.name = "동그라미"
p1.info()
p2.info()

// Mutating 메소드
struct Point
{
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double)
    {
        x += deltaX
        y += deltaY
    }
}

var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

struct Point3D
{
    var x = 0.0, y = 0.0, z = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double, z deltaZ: Double)
    {
        x += deltaX
        y += deltaY
        z += deltaZ
    }
    // 구조체에서는 내부의 값을 변경하기 위해서 mutating 메소드를 사용해야한다.
    mutating func moveTo(x toX: Double, y toY: Double, z toZ: Double)
    {
        x = toX
        y = toY
        z = toZ
    }
    
    func info()
    {
        print("현재 좌표는 (\(x), \(y), \(z)) 입니다.")
    }
}

var x1 = Point3D(x: 3.0, y: 2.0, z: -1.0)
x1.info()

x1.moveBy(x: 1.0, y: 1.0, z: 1.0)
x1.info()

x1.moveTo(x: 3.0, y: 3.0, z: 3.0)
x1.info()

// 구조체에서는 값을 복사해서 넣어준다. 별개의 저장공간이라고 생각하면 됨.
var x2 = x1
x2.moveTo(x: 9.0, y: 9.0, z: 9.0)
x1.info()
x2.info()


struct Student
{
    var grade: Int
    var stuId: Int
    var name: String
    
    mutating func gradePromotion()
    {
        if grade >= 4
        {
            print("졸업하였습니다.")
            grade += 1
        }
        else
        {
            grade += 1
            print("축하합니다! \(name) 학생은 \(grade)학년이 되었습니다.")
        }
    }
    func info()
    {
        if grade > 4
        {
            print("\(name) 학생은 졸업생 입니다.")
        }
        else
        {
            print("이름 : \(name), 학년 : \(grade)학년, 학번 : \(stuId)")
        }
    }
}

var s1 = Student(grade: 3, stuId: 202012345, name: "이서하")
var s2 = Student(grade: 4, stuId: 201954321, name: "안치욱")
s1.info()
s2.info()

s1.gradePromotion()
s1.info()

s2.gradePromotion()
s2.info()

// enumeration
enum Direction
{
    case north
    case south
    case east, west
}
var directionToHead = Direction.north
print(directionToHead)
directionToHead = .east
print(directionToHead)

var directionToHead1 = Direction.east
var directionToHead2: Direction = .east
print(directionToHead1)
print(directionToHead2)

switch directionToHead
{
case .north : print("북쪽입니다.")
case .south : print("남쪽입니다.")
case .east : print("동쪽입니다.")
case .west : print("서쪽입니다.")
}

enum HTTPCode : Int // 뒤에 오는 type은 rawvalue의 type 이다.
{
    case OK = 200
    case NOT_MODIFY = 304
    case INCORRECT_PAGE = 404
    case SERVER_ERROR = 500
    case HELLO // 자동으로 rawvalue가 할당된다.
}

print(HTTPCode.OK)
print(HTTPCode.OK.rawValue)
print(HTTPCode.HELLO.rawValue)

enum Rank : Int
{
    case one = 1
    case two, three, four, five // 여기도 위에 하나만 할당해주면 rawvalue가 자동으로 할당된다.
}

print(Rank.four.rawValue)


enum Direction1 : Int
{
    case north = 1
    case south, east, west
    
    var value: String
    {
        return "방향 코드는 \(self.rawValue)"
    }
    func getDescription() -> String
    {
        switch self
        {
        case .north : return "북쪽이고 코드는 \(self.rawValue)"
        case .south : return "남쪽이고 코드는 \(self.rawValue)"
        case .east : return "동쪽이고 코드는 \(self.rawValue)"
        case .west : return "서쪽이고 코드는 \(self.rawValue)"
        }
    }
}

var direction = Direction1.north
var dir:Direction1 = .south
print(direction.value)
print(dir.getDescription())

// extension 은 구조체나 클래스를 확장하는것.
extension Double
{
    var km : Double { return self * 1000.0 }
    var mile : Double { return self * 1000.0 * 0.621371 }
    var m : Double { return self }
    var cm : Double { return self / 100.0 }
    var mm : Double { return self / 1000.0}
    var descriprion : String
    {
        return "\(self)km는 \(self.km)m, \(self)cm는 \(self.cm), \(self)mm는 \(self.mm)m 입니다."
    }
}
2.km
5.5.cm
2.mile
7.0.description
let distance = 42.0.km + 195.m
print("마라톤의 총 거리는 \(distance)m 입니다.")

extension Int
{
    mutating func square()
    {
        self = self * self
    }
}

var value = 3
value.square()
print(value)

// Protocol
protocol SampleProtocol
{
    var name : String { get set }
    var description : String { get }
}

struct SamepleProject : SampleProtocol
{
    var name = "안치욱"
    var description: String
    {
        return "Name : \(self.name)"
    }
}

protocol SampleMethodProtocol
{
    func execute(cmd : String)
    func showPort(port : Int) -> String
}

struct Process : SampleMethodProtocol
{
    func execute(cmd : String)
    {
        if cmd == "start"
        {
            print("실행합니다.")
        }
    }
    func showPort(port: Int) -> String
    {
        return "Port : \(port)"
    }
}

let process = Process()
print(type(of: process))

print(process is Process) // is 연산자는 타입 검사 연산자, 비교연산자 같은 것
print(process is SampleMethodProtocol)

// protocol 실습
protocol Player
{
    var playTime : Int { get set }
    func play()
    func pause()
    func next()
    func previous()
}

class AudioPlayer : Player
{
    var playTime: Int = 0
    func play()
    {
        print("음성파일이 재생되었습니다.")
    }
    func pause()
    {
        print("음성파일이 정지되었습니다.")
    }
    func next()
    {
        print("음성파일이 다음으로 넘어갔습니다.")
    }
    func previous()
    {
        print("음성파일이 이전으로 돌아갔습니다.")
    }
}

class VideoPlayer : Player
{
    var playTime: Int = 0
    func play()
    {
        print("영상파일이 재생되었습니다.")
    }
    func pause()
    {
        print("영상파일이 정지되었습니다.")
    }
    func next()
    {
        print("영상파일이 다음으로 넘어갔습니다.")
    }
    func previous()
    {
        print("영상파일이 이전으로 돌아갔습니다.")
    }
}

class MediaPlayer
{
    var player : Player
    
    init(player: Player)
    {
        self.player = player
    }
}


let audioPlayer = AudioPlayer()
let videoPlayer = VideoPlayer()

let mediaPlayer = MediaPlayer(player: audioPlayer)
mediaPlayer.player.play()
mediaPlayer.player.pause()

let mediaPlayer1 = MediaPlayer(player: videoPlayer)
mediaPlayer1.player.play()
mediaPlayer1.player.pause()


