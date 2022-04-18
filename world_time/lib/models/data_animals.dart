enum AnimalType { land, air }

class Animal {
  String imageUrl;
  AnimalType type;

  Animal(this.imageUrl, this.type);
}

final allAnimals = [
  Animal('assets/bird.png', AnimalType.air),
  Animal('assets/dog.png', AnimalType.land),
  Animal('assets/cat.png', AnimalType.land),
];
