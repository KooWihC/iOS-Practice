import UIKit

struct Car: Codable
{
    let model: String
    let makder: String
}

struct Name: Codable
{
    let firstName: String
    let lastName: String
}

struct Person: Codable
{
    let name: String
    let age: Int
}

let person = Person(name: "안치욱", age: 26)

if let json = try? JSONEncoder().encode(person), let jsonStr = String(data: json, encoding: .utf8)
{
    print(jsonStr)
}
