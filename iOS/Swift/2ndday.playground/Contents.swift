func sayHello(name: String)
{
    print("Hello \(name)")
}

func doSomething(name: String, handler: (String) -> Void)
{
    handler(name)
}

doSomething(name: "손흥민", handler: sayHello)

doSomething(name: "홍길동", handler: {name in print("hi \(name)")}) // handler의 형추론

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(s1: String, s2: String) -> Bool
{
    return s1 > s2
}

var reverseNames = names.sorted(by: backward(s1: s2:))

reverseNames = names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 > s2})
//reverseNames = names.sorted(by: $0 > $1) $n은 n번째 매개변수
//reverseNames = names.sorted(by: >) 형추론으로 인해 이렇게까지 생략 가능

print(reverseNames)


// 후행 closure

func printHello(name: String, handler: (String) -> ())
{
    handler(name)
}
printHello(name: "홍길동", handler: { name1 in print("Hello \(name1)")})

printHello(name: "홍길동", handler: { name in print("Hello \(name)")})



func exec(handler: () -> ())
{
    handler()
}

exec{
    print("Hello")
}

// Escaping Closure
func exec(handler: @escaping () -> ()) -> (() ->())
{
    return handler
}

let func2 = exec
{
    print("Hello")
}

func2()

// Capturing Values
func captureValue() -> (() -> ())
{
    var count = 3
    print(count)
    let closure =
    {
        count += 1
        print(count)
    }
    return closure
}

let func1 = captureValue()
func1()
