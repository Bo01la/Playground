public class Example {
    //static method include the 'static' word.
    public static void method1(){
        system.debug('method1 : can be called without creating an object');
    }
    //non-static method doens't include the 'static' word.
    public void method2(){
        system.debug('method1 : must create an object first to call me');
    }
}