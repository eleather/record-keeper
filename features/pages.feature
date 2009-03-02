Feature: Background Pages
  In order to record history necessary to the use and understanding of the setting
  Users will need
  to have pages to record their data in
  
  Scenario: List Pages
    Given that I have created a page "page 1" with content "content 1"
    When I go to the pages page
    Then I should see "page 1"
      And I should not see "content 1"
      
  Scenario: Add a Page
    When I go to the pages page
    When I follow "New page"
    When I fill in "page_title" with "page 1"
      And I fill in "page_content" with "content 1"
      And I press "Create"
    Then I should see "Page was successfully created."
      And I should see "page 1"
      And I should see "content 1"
    
  Scenario: View a Page
    Given that I have created a page "page 1" with content "content 1"
    When I go to the pages page
    When I follow "Show"
    Then I should see "page 1"
      And I should see "content 1"

  Scenario: Delete a Page
    Given that I have created a page "page 1" with content "content 1"
    When I go to the pages page
    When I follow "Destroy"
    When I go to the pages page
    Then I should not see "page 1"