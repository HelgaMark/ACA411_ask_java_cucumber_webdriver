package definitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;

import java.util.Locale;
import java.util.concurrent.Callable;

public class JavaPracticeStepDef {
    @Given("I print Hello World")
    public void iPrintHelloWorld() {
        System.out.println("Hello World");

    }

    @Given("I print {string}")
    public void iPrint(String sWord) {
        System.out.println(sWord);
    }

    @Given("I compare {string} with {string}")
    public void iCompareWith(String sWord1, String sWord2) {
        System.out.println("My first word is " + sWord1 + " and " + "My second word is " + sWord2);
        System.out.println("First char both strings: " + sWord1.charAt(0)+", " + sWord2.charAt(0));
        System.out.println("The length of each string: " + sWord1.length()+", " + sWord2.length());
        System.out.println("Is First string equal to Second: "+ sWord1.equals(sWord2));
        System.out.println("Is First string equal to Second using ignoring the case: "+ sWord1.equalsIgnoreCase(sWord2));
        System.out.println("Is First string equal to Second using Upper the case: "+ sWord1.equals(sWord2.toUpperCase()));
    }

    @Given("I practice with numbers {int} and {int}")
    public void iPracticeWithNumbersAnd(int iNum1, int iNum2) {
        int iSum = iNum1 + iNum2;
        int iDif = iNum1 - iNum2;
        int iProd = iNum1 * iNum2;
        int iQuot = iNum1 / iNum2;


        System.out.println(iNum1 + " + " + iNum2 + " = " + iSum );
        System.out.println(iNum1 + " - " + iNum2 + " = " + iDif );
        System.out.println(iNum1 + " * " + iNum2 + " = " + iProd );
        System.out.println(iNum1 + " / " + iNum2 + " = " + iQuot );
    }

    @Given("I print url for {string} page")
    public void iPrintUrlForPage(String sURL) {
        /*if (sURL.equals("google")) {
            System.out.println("https://www.google.com/");
        }
            else if (sURL.equals("duckduckgo")){
            System.out.println("https://duckduckgo.com/");
            }
        else {
            System.out.println("No URL found");
        }*/
        switch (sURL){
            case "google": System.out.println("https://www.google.com/");
            case "duckduckgo": System.out.println("https://duckduckgo.com/"); break;
            case "swisscows": System.out.println("https://www.swisscows.com/"); break;
            case "searchencrypt": System.out.println("https://www.searchencrypt.com/");break;
            default: System.out.println("No URL found");
        }
    }

    @Given("I practice with array operations")
    public void iPracticeWithArrayOperations() {
        int[] numbers = {5,8,5,9,1,4};

        String[] cars = {"Ford", "Toyota", "BMW", "others"};
        System.out.println("The first car is " + cars[0]);
        for (int i = 0; i<=3; i++) {
            System.out.println("Print cars " + cars[i]);
        }
        System.out.println("Amount of the cars " + cars.length);
        System.out.println("I have " + numbers[1] + " " + cars[1]);

    }

    @Given("I convert {int} foot to centimeters")
    public void iConvertFootToCentimeters(int arg0) {

        int cm = 1;
        double foot = 30.48 * cm;

        System.out.println("1 foot equals 30.48 centimeters");
    }

    @And("I convert {int} US gallon to liters")
    public void iConvertUSGallonToLiters(int arg0) {

        int liter = 1;
        double gallon = 4.54609 * liter;

        System.out.println("1 gallon equals 4.54609 liters");
    }

    @And("I convert {int} Celsius to Fahrenheit")
    public void iConvertCelsiusToFahrenheit(int arg0) {
         int Celsius = 0;
         double Fahrenheit = (Celsius *9/5) +32;

         System.out.println("0 Celsius equals 32 Fahrenheit");
    }

    @Given("I check if number {int} is odd or even")
    public void iCheckIfNumberIsOddOrEven(int a) {
      a = 12;
       if (a % 2 == 0 ) {
           System.out.println("Number 12 is even ");
       }else {
           System.out.println("Number 11 is odd");
       }
    }

    @Given("I got {int} percent on my test")
    public void iGotPercentOnMyTest(int arg0) {

        int score = 89;
         // && and
         if (score >= 90 && score <=100){
             System.out.println("You passed with Grade A");
         }
         else if (score >= 80 && score <= 89 ){
             System.out.println("You passed with Grade B");
        } else if (score >= 70 && score <= 79) {
             System.out.println("You passed with Grade C");
         } else if (score >=60 && score <=69) {
             System.out.println("You passed with Grade D");
         } else if (score <= 59){
            System.out.println("You failed with Grade F");
         }
    }

    @Given("I find the cost of {int} pounds of {string}")
    public void iFindTheCostOfPoundsOfGrapefruit(int pound, String sFruit) {
      /*Use switch to calculate and print the cost of the following products:
      “apples”, “cherries”, “plums”, “grapefruit”, “oranges”.
       Assign price per pound for every product as double.*/

       double[] iPrice = {0.75, 0.85, 0.95, 1.05, 1.15};
       for (int i= 0; i <= iPrice.length; i++);

       double apples = iPrice[0] * pound;
        double cherries = iPrice[1] * pound;
        double plumps = iPrice[2] * pound;
        double grapefruit = iPrice[3] * pound;
        double oranges = iPrice[4] * pound;


        switch (sFruit) {
            case "apples":
                System.out.println("Cost of apples = $ " + apples); break;
            case "cherries":
                System.out.println("Cost of cherries = $  " + cherries); break;
            case "plumps":
                System.out.println("Cost of plumps = $  " + plumps); break;
            case "grapefruit":
                System.out.println("Cost of grapefruit = $  " + grapefruit); break;
            case "oranges":
                System.out.println("Cost of oranges = $  " + oranges); break;
            default:
                System.out.println("This product is unavailable");
        }
    }

    @Given("I practice with days of week")
    public void iPracticeWithDaysOfWeek() {

       String[] week = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
       for (String i : week) {
           System.out.println(i);
       }
    }
}
