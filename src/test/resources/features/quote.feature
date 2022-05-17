#Exercise for Quote application
  # Epic: https://jira.portnov.com/browse/ACA-670
  # Author: Olga Markova
  @quote
  Feature: Quote Page Scenarios
    Background:
      Given I open url "https://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"

     @quote1
    Scenario: Validate responsive UI behavior
      # resize to desktop size
       When I resize window to 1920 and 1080
       Then I wait for 5 sec
       Then element with xpath "//b[@id='location']" should be displayed
       Then element with xpath "//b[@id='currentDate']" should be displayed
       Then element with xpath "//b[@id='currentTime']" should be displayed
       # resize to laptop size
       When I resize window to 1440 and 900
       Then I wait for 5 sec
       Then element with xpath "//b[@id='location']" should be displayed
       Then element with xpath "//b[@id='currentDate']" should be displayed
       Then element with xpath "//b[@id='currentTime']" should be displayed
      # resize to mobile size
       When I resize window to 393 and 851
       Then I wait for 5 sec
       But element with xpath "//b[@id='location']" should not be displayed
       But element with xpath "//b[@id='currentDate']" should not be displayed
       But element with xpath "//b[@id='currentTime']" should not be displayed

     @quote2
    Scenario: Validate minimal “Username” field length requirement as 2 characters
       When I type "Q" into element with xpath "//input[@name='username']"
       Then I wait for 5 sec
       Then I click on element with xpath "//button[@id='formSubmit']"
       Then element with xpath "//label[@id='username-error']" should be displayed
       Then element with xpath "//label[@id='username-error']" should have text as "Please enter at least 2 characters."
       Then I wait for 3 sec
       Then I clear element with xpath "//input[@name='username']"
       Then I wait for 3 sec
       Then I click on element with xpath "//button[@id='formSubmit']"
       Then I wait for 2 sec
       Then element with xpath "//label[@id='username-error']" should be displayed
       Then element with xpath "//label[@id='username-error']" should have text as "This field is required."
       Then I wait for 3 sec
       When I type "AA" into element with xpath "//input[@name='username']"
       Then I click on element with xpath "//button[@id='formSubmit']"
       But element with xpath "//label[@id='username-error']" should not be displayed

     @quote3
    Scenario: Validate that email field accepts only valid email addresses
       When I type "tester@-example.com" into element with xpath "//input[@name='email']"
       Then I wait for 2 sec
       Then I click on element with xpath "//button[@id='formSubmit']"
       Then element with xpath "//label[@id='email-error']" should be displayed
       Then element with xpath "//label[@id='email-error']" should have text as "Please enter a valid email address."
       Then I wait for 3 sec
       Then I clear element with xpath "//input[@name='email']"
       Then I click on element with xpath "//button[@id='formSubmit']"
       Then I wait for 2 sec
       Then element with xpath "//label[@id='email-error']" should be displayed
       Then element with xpath "//label[@id='email-error']" should have text as "This field is required."
       Then I wait for 2 sec
       When I type "tester@gmail.com" into element with xpath "//input[@name='email']"
       Then I click on element with xpath "//button[@id='formSubmit']"
       But element with xpath "//label[@id='email-error']" should not be displayed

     @quote4
    Scenario: Validate that Confirm Password is disabled if Password field is empty
       When I type "12" into element with xpath "//input[@id='password']"
       Then I click on element with xpath "//button[@id='formSubmit']"
       Then I wait for 2 sec
       Then element with xpath "//label[@id='password-error']" should be displayed
       Then element with xpath "//label[@id='password-error']" should have text as "Please enter at least 5 characters."
       Then I wait for 2 sec
       When I type "12345" into element with xpath "//input[@id='password']"
       Then I click on element with xpath "//button[@id='formSubmit']"
       Then I wait for 2 sec
       Then element with xpath "//input[@id='confirmPassword']" should be enabled
       Then I wait for 2 sec
       And element with xpath "//label[@id='confirmPassword-error']" should be displayed
       Then element with xpath "//label[@id='confirmPassword-error']" should have text as "This field is required."
       Then I wait for 3 sec
       Then I clear element with xpath "//input[@id='password']"
       Then I wait for 3 sec
       Then I click on element with xpath "//button[@id='formSubmit']"
       Then element with xpath "//label[@id='password-error']" should be displayed
       Then element with xpath "//label[@id='password-error']" should have text as "This field is required."
       Then I wait for 3 sec
       And element with xpath "//input[@id='confirmPassword']" should be disabled

     @quote5
    Scenario: Validate “Name” field behavior Modal dialog: verify that upon clicking inside of Name field popup dialog appears
       When I click on element with xpath "//input[@id='name']"
       Then element with xpath "//div[@id='nameDialog']" should be displayed
       Then I type "Peter" into element with xpath "//input[@id='firstName']"
       Then I type "Benjamin" into element with xpath "//input[@id='middleName']"
       Then I type "Parker" into element with xpath "//input[@id='lastName']"
       And I click on element with xpath "//span[contains(text(),'Save')]"
       Then I wait for 3 sec
       Then element with xpath "//input[@id='name']" should have attribute "value" as "Peter Benjamin Parker"
       Then I wait for 2 sec

     @quote6
    Scenario: Validate that Accepting Privacy Policy is required to submit the form, then check the field
       When I click on element with xpath "//button[@id='formSubmit']"
       Then element with xpath "//label[contains(text(), ' - Must check! ')]" should be displayed
       Then I wait for 2 sec
       Then I click on element with xpath "//input[@name='agreedToPrivacyPolicy']"
       Then I wait for 2 sec
       And element with xpath "//label[@class='required checkbox_radio']" should have text as "I have read and accept Privacy Policy."

     @quote7
    Scenario: Try entering the following non-required fields in the order
       Then I type "1112223344" into element with xpath "//input[@name='phone']"
       When I click on element with xpath "//select[@name='countryOfOrigin']"
       And I click on element with xpath "//option[@value='Canada']"
       Then element with xpath "//option[@value='Canada']" should be selected
       Then I wait for 3 sec
       Then I click on element with xpath "//input[@name='gender'][@value='male']"
       Then I wait for 3 sec
       Then I click on element with xpath "//input[@name='allowedToContact']"
       And I click on element with xpath "//label[contains(text(),'Additional Information')]"
       Then I wait for 2 sec
       Then I type "135 West 50th Street Seventh Floor New York, NY 10020 USA" into element with xpath "//textarea[@id='address']"
       Then I click on element with xpath "//select[@name='carMake']//option[@value='BMW']"
       And I wait for 2 sec
       Then I click on element with xpath "//button[@id='thirdPartyButton']"
       And I accept alert
       Then I wait for 2 sec
       Then I click on element with xpath "//input[@id='dateOfBirth']"
       And element with xpath "//div[@id='ui-datepicker-div']" should be displayed
       Then I click on element with xpath "//select[@data-handler='selectMonth']//option[@value='6']"
       And I click on element with xpath "//select[@data-handler='selectYear']//option[@value='1990']"
       And I click on element with xpath "//td[@data-handler='selectDay']//a[contains(text(),'23')]"
       Then I wait for 3 sec

     @quote8
     Scenario:  Submit the form and verify the data. Validate that after form submission entered fields values are present on the page. Validate that password is not displayed on the page
        Then I type "tester Vasya" into element with xpath "//input[@name='username']"
        Then I type "VasyaQA@yahoo.com" into element with xpath "//input[@name='email']"
        Then I type "12345" into element with xpath "//input[@id='password']"
        Then I type "12345" into element with xpath "//input[@id='confirmPassword']"
        When I click on element with xpath "//input[@id='name']"
        Then element with xpath "//div[@id='nameDialog']" should be displayed
        Then I type "Vasya" into element with xpath "//input[@id='firstName']"
        Then I type "Ivanovich" into element with xpath "//input[@id='middleName']"
        Then I type "Vasilyev" into element with xpath "//input[@id='lastName']"
        And I click on element with xpath "//span[contains(text(),'Save')]"
        Then I wait for 3 sec
        Then I type "1112223344" into element with xpath "//input[@name='phone']"
        Then I click on element with xpath "//select[@name='countryOfOrigin']//option[@value='Germany']"
        Then I click on element with xpath "//input[@name='gender'][@value='male']"
        Then I wait for 3 sec
        Then I click on element with xpath "//select[@name='carMake']//option[@value='Toyota']"
        Then I type "1600 Pennsylvania Ave NW, Washington, DC 20500" into element with xpath "//textarea[@id='address']"
        Then I click on element with xpath "//input[@name='allowedToContact']"
        And I wait for 2 sec
        Then I click on element with xpath "//input[@name='agreedToPrivacyPolicy']"
        Then I click on element with xpath "//button[@id='formSubmit']"
        Then element with xpath "//div[@id='quotePageForm']" should be displayed
        And element with xpath "//b[@name='username']" should contain text "tester Vasya"
        And element with xpath "//b[@name='email']" should contain text "VasyaQA@yahoo.com"
        And element with xpath "//b[@name='name']" should contain text "Vasya Ivanovich Vasilyev"
        And element with xpath "//b[@name='phone']" should contain text "1112223344"
        And element with xpath "//b[@name='countryOfOrigin']" should contain text "Germany"
        And element with xpath "//b[@name='password']" should contain text "[entered]"
        And element with xpath "//b[@name='firstName']" should contain text "Vasya"
        And element with xpath "//b[@name='middleName']" should contain text "Ivanovich"
        And element with xpath "//b[@name='lastName']" should contain text "Vasilyev"
        And element with xpath "//b[@name='gender']" should contain text "male"
        And element with xpath "//b[@name='carMake']" should contain text "Toyota"
        And element with xpath "//b[@name='address']" should contain text "1600 Pennsylvania Ave NW, Washington, DC 20500"
        And element with xpath "//b[@name='allowedToContact']" should contain text "true"
        And element with xpath "//b[@name='agreedToPrivacyPolicy']" should contain text "true"
        When I click on element with xpath "//button[@id='return']"
        Then I switch to first window


