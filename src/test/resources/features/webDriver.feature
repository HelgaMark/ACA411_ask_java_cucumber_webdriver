#Exercise for WebDriver experience
# Author: Olga Markova
  # this comment is an example for https://github.com/HelgaMark/ACA411_ask_java_cucumber_webdriver
@webDriver
  Feature: Exercise for WebDriver experience
    Background: I navigate "quote"
      Given I open url "https://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
    @webDriver1
      Scenario: Open URL using site name
       # Given I navigate "quote"
       And I print page details

     @webDriver2
      Scenario: Email field verification
        When I type "abc" into email field
        And I click Submit button
        Then error message "Please enter a valid email address." should be displayed
        And  I wait for 2 sec

    @webDriver3
    Scenario: Date picker
       When I validate date picker
       Then I validate the date picker entered the date "6/21/1993"

      @webDriver4
      Scenario: Full name validation
        When I click on Name field
        Then I open dialog window
        # Then I type "A" as First Name
        # Then I type "B" as Middle Name
        # Then I type "C" as Last Name
        Then I type "A" as First Name "B" as Middle Name "C" as Last Name and validate the Full name is "A B C"
        # Then I click on Save button
        # Then I validate the Full name is "A B C"












