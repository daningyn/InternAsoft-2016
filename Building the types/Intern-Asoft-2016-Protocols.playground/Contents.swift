//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, protocols"

// Protocol syntax
protocol SomeProtocol {
    
}

// Property Requirements
protocol FullyNamed {
    var fullName: String {get}
}

struct Person: FullyNamed {
    var fullName: String
}

let danh = Person(fullName: "Danh Nguyen")
print(danh.fullName) // Danh Nguyen

class PersonClass: FullyNamed {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    var fullName: String {
        return "\(self.name) \(self.age) years old"
    }
}

let danh1 = PersonClass(name: "Danh", age: 23)
print(danh1.fullName) // Danh 23 years old

// Method Requirements
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 50.0
    let m = 267994.0
    let a = 1501.0
    let c = 13122.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())") // Here's a random number: 0.37464991998171
print("And another one: \(generator.random())") // And another one: 0.729023776863283

// Mutating Method Requirements
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        default:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle() // on
lightSwitch.toggle() // off

// Initializer Requirements
protocol SomeProtocol1 {
    init()
}
class SomeSuperClass {
    init() {}
}
class SomeSubClass: SomeSuperClass, SomeProtocol {
    required override init() {
        
    }
}

// Protocols as Types
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 10, generator: LinearCongruentialGenerator())
for _ in 0...12 {
    print("Random dice roll is \(d6.roll())")
}

// Delegation

protocol DiceGame {
    var dice: Dice { get }
    func play()
}
protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

// Adding Protocol Conformance with an Extension

protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "It is in TextualDescription"
    }
}
let test = Dice(sides: 10, generator: LinearCongruentialGenerator())
print(test.textualDescription) // It is in TexttualDescription

extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "It is in TextualDescription"
    }
}
let test1 = SnakesAndLadders()
print(test1.textualDescription) // It is in TexttualDescription

// Declaring Protocol Adoption with an Extension
struct EnglandBull {
    var name: String
    var textualDescription: String {
        return "A dog named \(name)"
    }
}
extension EnglandBull: TextRepresentable {}

let dog = EnglandBull(name: "Phe")
let dog1: TextRepresentable = dog
print(dog1.textualDescription) // A dog named Phe


// Collections of Protocol Types
let things: [TextRepresentable] = [test, test, dog1]
for thing in things {
    print(thing.textualDescription)
}

// Protocol Inheritance
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}

print(game.prettyTextualDescription)

// Class-Only Protocols
protocol SomeInheritedProtocol {
    
}
protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol {
    // class-only protocol definition goes here
}

// Optional Protocol Requirements
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

class FiveSource: CounterDataSource {
    var fixedIncrement: Int {
        return 5
    }
}

var count = Counter()
count.dataSource = FiveSource()
for _ in 1..<4 {
    count.increment()
    print(count.count)
}

// Protocol Extensions
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

let generator1 = LinearCongruentialGenerator()
print("Here's a random number: \(generator1.random())")
// Prints "Here's a random number: 0.37464991998171"
print("And here's a random Boolean: \(generator1.randomBool())")
// Prints "And here's a random Boolean: true"




