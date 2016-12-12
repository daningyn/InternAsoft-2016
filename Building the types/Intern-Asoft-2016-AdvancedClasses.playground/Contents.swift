//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, advanced classes"

class Pizza{
    
    var diameter:Double = 0.0
    var crust:String = ""
    var toppings:[String] = []
    private let pi = M_PI
    private var pizzaArea: Double {
        get {
            return area()
        }
    }
    
    // Constructors
    
    init(){}
    init(diameter: Double, crust: String, toppings: [String]){
        self.diameter = diameter
        self.crust = crust
        self.toppings = toppings
    }
    
    //Methods
    func toppingsString()->String{
        var myString = ""
        for topping in toppings{
            myString = myString + topping + " "
        }
        return myString
    }
    func area() -> Double{
        return diameter * diameter * pi
    }
    func price(costPerSquareUnit:Double)->Double{
        return self.area() * costPerSquareUnit
    }
    // Type Methods
    class func personalCheese() -> Pizza {
        return Pizza(diameter: 10.0, crust: "White", toppings: ["Cheese", "Marinara"])
    }
    
}

// The subclass DeepDishPizza

class DeepDishPizza: Pizza{
    
    // Properties
    var panDepth:Double = 4.0
    // Constructors
    override init(){
        super.init()
    }
    
    // Use super keyword to call method in super class
    init(panDepth:Double){
        super.init()
        self.panDepth = panDepth
    }
    
    init(diameter: Double, crust: String, toppings: [String], panDepth:Double) {
        super.init(diameter: diameter, crust: crust, toppings: toppings)
        self.panDepth = panDepth
    }
    
    //MARK: Instance Methods
    func volume() -> Double{
        return area() * panDepth
    }
    
    override func price(costPerSquareUnit: Double) -> Double {
        return volume() * costPerSquareUnit
    }
    
    func price(costPerSquareUnit:Double, panDepth:Double) -> Double{
        self.panDepth = panDepth
        return volume() * costPerSquareUnit
    }
    
    //Type Methods
    override class func personalCheese() -> DeepDishPizza {
        let deepDish = DeepDishPizza(panDepth: 0.5)
        let flat = Pizza.personalCheese()
        deepDish.diameter = flat.diameter
        deepDish.crust = flat.crust
        deepDish.toppings = flat.toppings
        return deepDish
    }

}

let cheesePizza = Pizza.personalCheese()
let deepDishPizza = DeepDishPizza.personalCheese()
print(deepDishPizza.panDepth) // 0.5

cheesePizza.price(costPerSquareUnit: 0.015)
cheesePizza

deepDishPizza.price(costPerSquareUnit: 0.015)
deepDishPizza.volume()

let newPizza = Pizza(diameter: 10, crust: "White", toppings: ["Cheese"])
newPizza.diameter = 12.0
let newerPizza = Pizza.personalCheese()

//using the property observer
newPizza.price(costPerSquareUnit: 0.015)




