// rule of thump, variables are 'private' while methods are 'public'
public class collageStudents {
	private string name; // no one can access or add value directly (s1.name='ahmed' ==> will not work)
   	private Integer age; // same as above. + I want no student age to be less than 17 years

	// setting the name using a method + I do not wnat to allow empty string as a name
    public void setName(String n){
        if(n == ''){
            system.debug('you cant use empty string as a name');
            name = 'Anonimous student';
        }
        else {
            name= n;
        }
    }
    
    // setting the age using a method + I want no student age to be less than 17 years
    public void setAge(Integer a){
        if(a <= 16){
            system.debug('too young to enter collage');
            age = 17;
        }
        else{
            age= a;
        }
    }
    
    public void displayStudent(){
        system.debug('name = '+ name);
        system.debug('age = '+ age);
    }
    
}