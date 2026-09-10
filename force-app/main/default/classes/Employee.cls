public class Employee {
	public String name;
    public String title;
    public Integer salary;
    public void displayData(){
        system.debug('employee name is: '+ name);
        system.debug('employee title is: '+ title);
        system.debug('employee salary is: '+ salary);
    }
}