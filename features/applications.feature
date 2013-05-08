Feature: Browse applications  

  Scenario: See a list of applications
    Given there are Applications
    When I visit the index page
    Then I should see a list of the Applications
    And I should see which ones are already in Bonita
    
  Scenario: See a single application
    Given there is an Application
    When I visit the page for that Application
    Then I should see all the details about that Application
    And I should see the Bonita state of that Application
    
  Scenario: Start an application
    Given there is an Application
    When I start the Appliation
    Then it should be added to Bonita