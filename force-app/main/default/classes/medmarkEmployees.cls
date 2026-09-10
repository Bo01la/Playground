// a class for all Medmark employees data (all must be working at Medmark)
public class medmarkEmployees {
	public String name;
    public static String company='Medmark (can not be changed when creating multiple objects of the class)';
    public void displayEmployee(){
        system.debug('name = '+ name);
        system.debug('company = '+ company);
    }
}