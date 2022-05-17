package definitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.assertj.core.api.Assertions;
import org.openqa.selenium.By;

import static java.lang.Thread.sleep;
import static org.assertj.core.api.Assertions.assertThat;
import static org.testng.Assert.assertEquals;
import static support.TestContext.getDriver;

public class WebDriverStepDefs {
    @Given("I navigate {string}")
    public void iNavigate(String sURL) {
        switch (sURL){
            case "google":
                getDriver().get("https://www.google.com/");
                break;
            case "duckduckgo":
                getDriver().get("https://duckduckgo.com/");
                break;
            case "swisscows":
                getDriver().get("https://www.swisscows.com/");
                break;
            case "searchencrypt":
                getDriver().get("https://www.searchencrypt.com/");
                break;
            case "quote":
                getDriver().get("https://skryabin.com/market/quote.html");
                break;
            default: System.out.println("No URL found");
    }

}

    @And("I print page details")
    public void iPrintPageDetails() {
        System.out.println(getDriver().getTitle());
        System.out.println(getDriver().getCurrentUrl());
        System.out.println(getDriver().getWindowHandle());
    }

    @When("I type {string} into email field")
    public void iTypeIntoEmailField(String sEmail) {

        getDriver().findElement(By.xpath("//input[@name='email']")).sendKeys(sEmail);

    }

    @And("I click Submit button")
    public void iClickSubmitButton() {

        getDriver().findElement(By.xpath("//button[@id='formSubmit']")).click();
    }

    @Then("error message {string} should be displayed")
    public void errorMessageShouldBeDisplayed(String sMessage) {
        String sActualMessage = getDriver().findElement(By.xpath("//label[@id='email-error']")).getText();
        System.out.println(sActualMessage);
        Assertions.assertThat(sActualMessage.equals(sMessage));
    }


    @When("I validate date picker")
    public void iValidateDatePicker() throws InterruptedException {
        getDriver().findElement(By.xpath("//input[@id='dateOfBirth']")).click();
        sleep(2000);
        getDriver().findElement(By.xpath("//select[@class='ui-datepicker-month']/option[@value='5']")).click();
        getDriver().findElement(By.xpath("//select[@class='ui-datepicker-year']/option[@value='1993']")).click();
        getDriver().findElement(By.xpath("//td[@data-handler='selectDay']/a[text()='21']")).click();
        String actualDate = getDriver().findElement(By.xpath("//input[@id='dateOfBirth']")).getAttribute("value");
        assertThat(actualDate.equals("06/30/1993"));
    }

    @Then("I validate the date picker entered the date {string}")
    public void iValidateTheDatePickerEnteredTheDate(String date) {
        getDriver().findElement(By.xpath("//input[@id='dateOfBirth']")).click();
        getDriver().findElement(By.xpath("//select[@class='ui-datepicker-month']/option[@value='5']")).click();
        getDriver().findElement(By.xpath("//select[@class='ui-datepicker-year']/option[@value='1993']")).click();
        getDriver().findElement(By.xpath("//td[@data-handler='selectDay']/a[text()='21']")).click();
        String actualDate = getDriver().findElement(By.xpath("//input[@id='dateOfBirth']")).getAttribute("value");
        assertThat(actualDate.equals(date));

    }

    @When("I click on Name field")
    public void iClickOnNameField() {

        getDriver().findElement(By.xpath("//input[@id='name']")).click();
    }

    @Then("I open dialog window")
    public void iOpenDialogWindow() {
        getDriver().findElement(By.xpath("//div[@id='nameDialog']")).isDisplayed();
        String sName = getDriver().findElement(By.xpath("//span[@class='ui-dialog-title']")).getText();
        assertThat(sName.equals("Name"));

    }


    @Then("I type {string} as First Name")
    public void iTypeAsFirstName(String sFirstName) {
        getDriver().findElement(By.xpath("//input[@id='firstName']")).sendKeys(sFirstName);

    }

    @Then("I type {string} as Middle Name")
    public void iTypeAsMiddleName(String sMiddleName) {
        getDriver().findElement(By.xpath("//input[@id='middleName']")).sendKeys(sMiddleName);
    }

    @Then("I type {string} as Last Name")
    public void iTypeAsLastName(String sLastName) {
        getDriver().findElement(By.xpath("//input[@id='lastName']")).sendKeys(sLastName);
    }

    @Then("I click on Save button")
    public void iClickOnSaveButton() {
        getDriver().findElement(By.xpath("//span[contains(text(),'Save')]")).click();
    }

    @Then("I type {string} as First Name {string} as Middle Name {string} as Last Name and validate the Full name is {string}")
    public void iTypeAsFirstNameAsMiddleNameAsLastNameAndValidateTheFullNameIs(String sFirstName, String sMiddleName, String sLastName, String sFullName) {
        getDriver().findElement(By.xpath("//input[@id='firstName']")).sendKeys(sFirstName);
        getDriver().findElement(By.xpath("//input[@id='middleName']")).sendKeys(sMiddleName);
        getDriver().findElement(By.xpath("//input[@id='lastName']")).sendKeys(sLastName);
        getDriver().findElement(By.xpath("//span[contains(text(),'Save')]")).click();
        String sActualName = sFirstName + " " + sMiddleName + " " + sLastName;
        System.out.println("Actual Name is " + sActualName);
        System.out.println("Expected Name is " + sFullName);
        assertThat(sActualName.equals(sFullName));
        assertEquals(sActualName, sFullName);
    }
}
