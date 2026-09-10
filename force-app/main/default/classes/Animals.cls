// we need to add 'virtual' before the parent class
public virtual class Animals {
    public void isAnimal(){
        system.debug('yes it is classified as animal');
    }
    
    
    // we need to add 'virtual' before the parent method that we will override in child class
    public virtual void animalType(){
        system.debug('this depends on the child class');
    }
}