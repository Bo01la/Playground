public class FootballTeam {
  string name;
  integer age;
  static string club = 'Digla';

  // creating a constructor method:
  public FootballTeam(string name, integer age) {
    this.name = name;
    this.age = (age < 15 || age > 40) ? this.age = -1 : age;
  }

  // creating a default constructor method:
  public FootballTeam() {
    this.name = 'default player';
    this.age = 11;
  }

  public void display() {
    system.debug(name + ' ' + age + ' ' + club);
  }
}
