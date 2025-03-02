// Данные о составе пицц взяты отсюда 
// https://www.pizzarecipe.org/different-types-of-pizza/#Italian%20pizza%20types

protocol Product {
    func info()
}

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

struct Pizza: Product {

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

    func info() {
        print("------ Pizza ----------")
        print("Title: \(name)")
        print("Price: \(price)")
        print("Type: \(pizzaType.rawValue)")
        print("DoughType: \(doughType.rawValue)")
        print("Ingredients")
        for ingr in ingredients {
            print("-> \(ingr.rawValue)")
        }
    }

}

struct FrenchFries: Product {

    var price: Double
    var size: Size 

    enum Size: String {
        case small = "Small"
        case medium = "Medium"
        case big = "Big"
    }

    func info() {
        print("---- French Fries -----")
        print("Size: \(size.rawValue)")
        print("Price: \(price)")
    }

}

class Pizzeria {

    private var products: [Product]
    
    init(products: [Product]) {
        self.products = products
    }

    func add(product: Product) {
        products.append(product)
    }

    func getAll() -> [Product] {
        products
    }

}

protocol PizzeriaBehavior {
    func open()
    func close()
}

extension Pizzeria: PizzeriaBehavior {
    
    func open() {
        print("We are open!")
    }

    func close() {
        print("Sorry, we are closed")
    }

}

var pizzeria = Pizzeria(products: [])

pizzeria.add(product: Pizza(
    name: "Napoletana",
    price: 650.00,
    pizzaType: Pizza.PizzaType.italian,
    doughType: DoughType.thin,
    ingredients: [
        Ingredients.tomatosauce, 
        Ingredients.mozzarella, 
        Ingredients.anchovies, 
        Ingredients.oliveoil]))

pizzeria.add(product: Pizza(
    name: "Margherita",
    price: 600.00,
    pizzaType: Pizza.PizzaType.italian,
    doughType: DoughType.thin,
    ingredients: [
        Ingredients.tomatosauce, 
        Ingredients.mozzarella, 
        Ingredients.oliveoil, 
        Ingredients.basilleaves]))

pizzeria.add(product: FrenchFries(
    price: 100,
    size: FrenchFries.Size.medium
))

pizzeria.open()

for product in pizzeria.getAll() {
    product.info()
}

pizzeria.close()