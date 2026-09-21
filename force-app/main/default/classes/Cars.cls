public class Cars {
  private string brand;
  private integer year;
  private integer speed;

  // constructor method (we do not add void or any return type to constructors) we also must use this. when assigning varibles
  public Cars(string brand, integer year, integer speed) {
    this.brand = brand;
    this.year = year;
    this.speed = speed;
  }

  // constructor method (we do not add void or any return type to constructors) we also must use this. when assigning varibles
  public Cars() {
    this.brand = 'default: audi';
    this.year = 1993;
    this.speed = 100;
  }

  private Integer speedUp() {
    this.speed += 20;
    return this.speed;
  }

  public void currentStatus() {
    system.debug('brand: ' + brand + ' year: ' + year + ' speed: ' + speed);
  }

  public void accelirate() {
    speedUp();
    system.debug('brand: ' + brand + ' year: ' + year + ' speed: ' + speed);
  }
}
