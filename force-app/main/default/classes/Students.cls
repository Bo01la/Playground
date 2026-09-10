public class Students {
	private string studentName;
    private Integer studentAge;
    
    //adding constructor with validation for age (!<18) and name != ''
    // note: constructor must have the exact class name
    // by using constructor, we can assign the student name/age values immediatly when creating the object
    public Students(string name, integer age){
        if(name == ''){
            system.debug('name can not be empty');
        }
        else{
            // note, if the paramater in the constuctor was called 'studentName' not 'name', then we would have to use this.studentName = name
            studentName = name;
        }
        
        if(age < 18){
            system.debug('age can not be < 18');
        }
        else{
            studentAge = age;
        }
    }
    
    public void display(){
        system.debug('name = '+ studentName);
        system.debug('age = '+ studentAge);
    }
}