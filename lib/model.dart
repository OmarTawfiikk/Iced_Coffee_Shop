class DrinkModel {
  final String name;
  final String image;
  final String title;
  final double price;

  DrinkModel({
    required this.name,
    required this.image,
    required this.title,
    required this.price,
  });

  static List<DrinkModel> drinks = [
    DrinkModel(
      name: 'Banana',
      image: 'assets/drinks/Banana.png',
      title: 'MilkShake',
      price: 70.00,
    ),
    DrinkModel(
      name: 'Brownie Island',
      image: 'assets/drinks/Brownie Island.png',
      title: 'MilkShake',
      price: 104.50,
    ),
    DrinkModel(
      name: 'Burger',
      image: 'assets/drinks/burger.png',
      title: 'Sandwich',
      price: 80.00,
    ),
    DrinkModel(
      name: 'Carmel',
      image: 'assets/drinks/carmel.png',
      title: 'MilkShake',
      price: 100.00,
    ),
    DrinkModel(
      name: 'Chicken',
      image: 'assets/drinks/chicken.png',
      title: 'Sandwich',
      price: 90.50,
    ),
    DrinkModel(
      name: 'Chocolate',
      image: 'assets/drinks/Chocolate.png',
      title: 'MilkShake',
      price: 100.50,
    ),
    DrinkModel(
      name: 'Peanut Butter',
      image: 'assets/drinks/Peanut Butter.png',
      title: 'MilkShake',
      price: 124.50,
    ),
    DrinkModel(
      name: 'Salted Caramel',
      image: 'assets/drinks/Salted Caramel.png',
      title: 'MilkShake',
      price: 150.00,
    ),
    DrinkModel(
      name: 'Strawberry',
      image: 'assets/drinks/Strawberry.png',
      title: 'MilkShake',
      price: 100.50,
    ),
  ];


}