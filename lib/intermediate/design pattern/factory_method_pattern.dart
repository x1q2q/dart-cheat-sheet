class FactoryMethodPattern {
  FactoryMethodPattern.go() {
    Creator creator = ConcreteCreator();
    Product exampleProductA = creator.createProduct(ProductType.A);
    print(exampleProductA.getDescription());
    Product exampleProductB = creator.createProduct(ProductType.B);
    print(exampleProductB.getDescription());
  }
}

// mendefinisikan interface produk
abstract class Product {
  String getDescription();
}

enum ProductType { A, B }

// concrete class product
class ExampleProductA implements Product {
  @override
  String getDescription() {
    return 'This is an example of product A';
  }
}

class ExampleProductB implements Product {
  @override
  String getDescription() {
    return 'This is an example of product B';
  }
}

// mendefinisikan interface creator
abstract class Creator {
  // method factory
  Product createProduct(ProductType type);
}

// concrete creator clas
class ConcreteCreator extends Creator {
  @override
  Product createProduct(ProductType type) {
    Product? product;
    switch (type) {
      case ProductType.A:
        product = ExampleProductA();
        break;
      case ProductType.B:
        product = ExampleProductB();
        break;
      default:
    }
    return product!;
  }
}
