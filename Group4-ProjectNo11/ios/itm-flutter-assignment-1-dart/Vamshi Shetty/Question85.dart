class Animal {}
class Dog extends Animal {}

class AnimalShelter {
  Animal getAnimal() => Animal();
}

class DogShelter extends AnimalShelter {
  @override
  Dog getAnimal() => Dog();
}

void main() {
  DogShelter shelter = DogShelter();
  Dog dog = shelter.getAnimal();
  print(dog);
}
