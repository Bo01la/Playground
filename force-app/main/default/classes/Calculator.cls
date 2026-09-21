public class Calculator {
  public integer num1;
  public integer num2;
  public decimal result;
  public string operator;

  public void display() {
    calculation(num1, num2, operator);
    System.debug(num1 + ' ' + operator + ' ' + num2 + ' = ' + result);
  }

  private decimal calculation(integer n1, integer n2, string op) {
    switch on op.trim() {
      when '+' {
        result = n1 + n2;
        return result;
      }
      when '-' {
        result = n1 - n2;
        return result;
      }
      when '*' {
        result = n1 * n2;
        return result;
      }
      when '/' {
        if (n2 != 0) {
          result = n1 * n2;
        } else {
          System.debug('we can not devide on 0 !!');
          return -1;
        }
        return result;
      }
      when else {
        System.debug('enter a valid operator + - / *');
        return -1;
      }
    }
  }
}
