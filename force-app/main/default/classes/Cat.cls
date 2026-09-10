// we add 'extends' in the child class then reference the parient class
public class Cat extends Animals {
    
    // we are re-defining the animalType() method in the parent (Animals). So, we need to add 'override'
    public override void animalType(){
        system.debug('this is a CAT');
    }
}