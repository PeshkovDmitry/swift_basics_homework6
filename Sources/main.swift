protocol Product {
    func info()
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

struct Employee {

    var name: String
    var salary: Double
    var position: Position

    enum Position: String {
        case paymaster = "Paymaster"
        case cook = "Cook"
    }

}


class Pizzeria {

    private var products: [Product]
    private var employees: [Employee]
    
    init(products: [Product], employees: [Employee]) {
        self.products = products
        self.employees = employees
    }

    func add(product: Product) {
        products.append(product)
    }

    func getAll() -> [Product] {
        products
    }

    func employ(employee: Employee) {
        employees.append(employee)
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


var pizzeria = Pizzeria(products: [], employees: [])

pizzeria.add(product: Pizza(
    name: "Napoletana",
    price: 650.00,
    pizzaType: .italian,
    doughType: .thin,
    ingredients: [
        .tomatosauce, 
        .mozzarella, 
        .anchovies, 
        .oliveoil]))

pizzeria.add(product: Pizza(
    name: "Margherita",
    price: 600.00,
    pizzaType: .italian,
    doughType: .thin,
    ingredients: [
        .tomatosauce, 
        .mozzarella, 
        .oliveoil, 
        .basilleaves]))

pizzeria.add(product: FrenchFries(
    price: 100,
    size: .medium
))

pizzeria.employ(employee: Employee(
    name: "Ivan",
    salary: 50000,
    position: .paymaster
))

pizzeria.employ(employee: Employee(
    name: "Olga",
    salary: 50000,
    position: .cook
))


pizzeria.open()

for product in pizzeria.getAll() {
    product.info()
}

pizzeria.close()