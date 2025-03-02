// Данные о составе пицц взяты отсюда 
// https://www.pizzarecipe.org/different-types-of-pizza/#Italian%20pizza%20types

enum DoughType: String {
    case thick = "Thick"
    case thin = "Thin"
}

enum Ingredients: String {
    case tomatosauce = "Tomato sauce"
    case mozzarella = "Mozzarella"
    case anchovies = "Anchovies"
    case oliveoil = "Olive oil"
    case basilleaves = "Basil leaves"
    case chilipeppers = "Chili peppers"
    case garlic = "Garlic"
    case salami = "Salami"
    case hotpeppers = "Hot peppers"
    case buffalomozzarella = "Buffalo mozzarella "
}

struct Pizza {
    var name: String
    var price: Float
    var pizzaType: PizzaType
    var doughType: DoughType
    var ingredients: [Ingredients]

    enum PizzaType: String {
        case italian = "Italian"
        case american = "American"
        case mexican = "Mexican"
        case german = "German"
    }

}

struct FrenchFries {
    var price: Double
    var size: FrenchFriesSize 

    enum FrenchFriesSize: String {
        case small = "Small"
        case medium = "Medium"
        case big = "Big"
    }

}





class Pizzeria {
    private var pizzas: [Pizza]
    
    init(pizzas: [Pizza]) {
        self.pizzas = pizzas
    }

    func addPizza(pizza: Pizza) {
        pizzas.append(pizza)
    }

    func getAll() -> [Pizza] {
        self.pizzas
    }

}

var pizzeria = Pizzeria(pizzas: [])

pizzeria.addPizza(pizza: Pizza(
    name: "Napoletana",
    price: 650.00,
    pizzaType: Pizza.PizzaType.italian,
    doughType: DoughType.thin,
    ingredients: [
        Ingredients.tomatosauce, 
        Ingredients.mozzarella, 
        Ingredients.anchovies, 
        Ingredients.oliveoil]))

pizzeria.addPizza(pizza: Pizza(
    name: "Margherita",
    price: 600.00,
    pizzaType: Pizza.PizzaType.italian,
    doughType: DoughType.thin,
    ingredients: [
        Ingredients.tomatosauce, 
        Ingredients.mozzarella, 
        Ingredients.oliveoil, 
        Ingredients.basilleaves]))

for pizza in pizzeria.getAll() {
    print("----------------------")
    print("Title: \(pizza.name)")
    print("Price: \(pizza.price)")
    print("Type: \(pizza.pizzaType.rawValue)")
    print("DoughType: \(pizza.doughType.rawValue)")
    print("Ingredients")
    for ingr in pizza.ingredients {
        print("-> \(ingr.rawValue)")
    }
}