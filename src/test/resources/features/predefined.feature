@predefined
Feature: Smoke steps

  @predefined1
  Scenario: Predefined steps for Google
    Given I open url "https://google.com"
    Then I should see page title as "Google"
    Then element with xpath "//input[@name='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//input[@name='q']"
    Then I click on element using JavaScript with xpath "(//input[@name='btnK'])[1]"
    Then I wait for element with xpath "//*[@id='res']" to be present
    Then element with xpath "//*[@id='res']" should contain text "Cucumber"

  @predefined2
  Scenario: Predefined steps for Gibiru
    Given I open url "https://gibiru.com/"
    Then I should see page title as "Gibiru – Protecting your privacy since 2009"
    Then I should see page title contains "Gibiru"
    Then element with xpath "//input[@id='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//input[@id='q']"
    Then I click on element with xpath "//button[@id='button-addon2']"
    Then I wait for element with xpath "//*[@id='web-results']" to be present
    Then element with xpath "//*[@id='web-results']" should contain text "Behavior Driven Development"

  @predefined3
  Scenario: Predefined steps for DuckDuckGo
    Given I open url "https://duckduckgo.com/"
    Then I should see page title as "DuckDuckGo — Privacy, simplified."
    Then I should see page title contains "DuckDuckGo"
    Then element with xpath "//input[@name='q']" should be present
    When I type "Postman" into element with xpath "//input[@name='q']"
    Then I click on element with xpath "//input[@id='search_button_homepage']"
    Then I wait for element with xpath "//*[@id='links']" to be present
    Then element with xpath "//*[@id='links']" should contain text "Postman"

  @predefined4
  Scenario: Predefined steps for Swisscows
    Given I open url "https://swisscows.com/"
    Then I should see page title as "Swisscows the alternative, data secure search engine."
    Then I should see page title contains "Swisscows"
    Then element with xpath "//input[@name='query']" should be present
    When I type "Framework" into element with xpath "//input[@name='query']"
    Then I click on element with xpath "//button[@class='search-submit']"
    Then I wait for element with xpath "//*[@class='web-results']" to be present
    Then element with xpath "//*[@class='web-results']" should contain text "Framework"

    @predefined5
    Scenario: Predefined steps for Searchencrypt
      Given I open url "https://www.searchencrypt.com/"
      Then I should see page title as "Search Encrypt | Home"
      Then I should see page title contains "Encrypt"
      Then element with xpath "//input[@name='q']" should be present
      When I type "Behavior Driven Development" into element with xpath "//input[@name='q']"
      Then I click on element with xpath "//button[@type='submit']"
      Then I wait for element with xpath "//*[@class='serp__results container']" to be present
      Then element with xpath "//*[@class='serp__results container']" should contain text "Behavior Driven Development"
 
    @predefined6
    Scenario: Predefined steps for Startpage
      Given I open url "https://www.startpage.com/"
      Then I should see page title as "Startpage - Private Search Engine. No Tracking. No Search History."
      Then I should see page title contains "Startpage"
      Then element with xpath "//input[@id='q']" should be present
      When I type "Behavior Driven Development" into element with xpath "//input[@id='q']"
      Then I click on element with xpath "//button[@class='search-form-home__button-desktop']"
      Then I wait for element with xpath "//*[@class='show-results']" to be present
      Then element with xpath "//*[@class='show-results']" should contain text "Behavior Driven Development"

    @predefined7
    Scenario: Predefined steps for Yandex
      Given I open url "https://yandex.com/"
      Then I should see page title as "Yandex"
      Then I should see page title contains "Yandex"
      Then element with xpath "//input[@id='text']" should be present
      When I type "Behavior Driven Development" into element with xpath "//input[@id='text']"
      Then I click on element with xpath "//button[@type='submit']"
      Then I wait for element with xpath "//ul[@id='search-result']" to be present
      Then element with xpath "//ul[@id='search-result']" should contain text "Behavior Driven Development"

    @predefined8
    Scenario: Predefined steps for Ecosia
      Given I open url "https://www.ecosia.org/"
      Then I should see page title as "Ecosia - the search engine that plants trees"
      Then I should see page title contains "Ecosia"
      Then element with xpath "//input[@name='q']" should be present
      When I type "Sequoia National Forest" into element with xpath "//input[@name='q']"
      Then I click on element with xpath "//button[@type='submit']"
      Then I wait for element with xpath "//*[@class='mainline-results']" to be present
      Then element with xpath "//*[@class='mainline-results']" should contain text "Sequoia National Forest"

    @predefined9
    Scenario: Predefined steps for Wiki
      Given I open url "https://www.wiki.com/"
      Then I should see page title as "Wiki.com"
      Then I should see page title contains "Wiki"
      Then element with xpath "//input[@name='q']" should be present
      When I type "Behavior Driven Development" into element with xpath "//input[@name='q']"
      Then I click on element with xpath "//input[@name='btnG']"
      Then I should see page title as "Form is not secure"
      Then I wait for 2 sec
      Then I click on element with xpath "//button[@id='proceed-button']"
      Then I wait for 2 sec
      Then I should see page title as "Wiki.com"
      Then I wait for element with xpath "//div[contains(@id,'results')]" to be present
      Then element with xpath "//div[contains(@id,'results')]" should be present
      
    @predefined10
    Scenario: Predefined steps for giveWater
      Given I open url "https://www.givewater.com/"
      Then I should see page title as "Search the Web to Give Clean Water to Those in Need » giveWater Search Engine"
      Then I should see page title contains "giveWater"
      Then element with xpath "//input[@id='site-search']" should be present
      When I type "Mountain water" into element with xpath "//input[@id='site-search']"
      Then I click on element with xpath "//button[@id='button-addon2']"
      Then I wait for element with xpath "//div[@class='mainline-results mainline-results__web']" to be present
      Then element with xpath "//div[@class='mainline-results mainline-results__web']" should contain text "Mountain water"
    
    @predefined11
    Scenario: Predefined steps for Ekoru
      Given I open url "https://ekoru.org/"
      Then I should see page title as "Ekoru - every search cleans our oceans"
      Then I should see page title contains "Ekoru"
      Then element with xpath "//input[@id='fld_q']" should be present
      When I type "Pacific ocean" into element with xpath "//input[@id='fld_q']"
      Then I click on element with xpath "//div[@id='btn_search']"
      Then I wait for element with xpath "//div[@id='div_results']" to be present
      Then element with xpath "//div[@id='div_results']" should contain text "Pacific ocean"

      
      
      
      
      
      
      




  