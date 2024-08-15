class AbstractFactoryPattern {
  AbstractFactoryPattern.go() {
    // membuat modern furniture factory
    FurnitureFactory modernFurnitureFactory = ModernFurnitureFactory();
    Chair modernChair = modernFurnitureFactory.createChair();
    Table modernTable = modernFurnitureFactory.createTable();
    print(modernChair.getDescription());
    print(modernTable.getMaterial());

    // membuat classic furniture factory
    FurnitureFactory classicFurnitureFactory = ClassicFurnitureFactory();
    Chair classicChair = classicFurnitureFactory.createChair();
    Table classicTable = classicFurnitureFactory.createTable();
    print(classicChair.getDescription());
    print(classicTable.getMaterial());
  }
}

// mengabstraksi produk
abstract class Chair {
  String getDescription();
}

abstract class Table {
  String getMaterial();
}

// concrete product
class ModernChair implements Chair {
  @override
  String getDescription() {
    return 'This modern chair';
  }
}

class ClassicChair implements Chair {
  @override
  String getDescription() {
    return 'This classic chair';
  }
}

class ModernTable implements Table {
  @override
  String getMaterial() {
    return 'With a glass';
  }
}

class ClassicTable implements Table {
  @override
  String getMaterial() {
    return 'With a wood';
  }
}

// mengabstaksi factory
abstract class FurnitureFactory {
  Chair createChair();
  Table createTable();
}

// concrete factories
class ModernFurnitureFactory implements FurnitureFactory {
  @override
  Chair createChair() {
    return ModernChair();
  }

  @override
  Table createTable() {
    return ModernTable();
  }
}

class ClassicFurnitureFactory implements FurnitureFactory {
  @override
  Chair createChair() {
    return ClassicChair();
  }

  @override
  Table createTable() {
    return ClassicTable();
  }
}
