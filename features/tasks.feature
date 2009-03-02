Feature: Tasks
  In order to keep track of what they want to do with our product
  Users will need
  to create a list of tasks

  Scenario: List Tasks
    Given that I have created a task "task 1"
    When I go to the tasks page
    Then I should see "task 1"
    
  Scenario: Add a Task
    When I go to the tasks page
    When I follow "New task"
    When I fill in "task_description" with "Name your world"
      And I press "Create"
    Then I should see "Task was successfully created."
      And I should see "Name your world"
  
  Scenario: Delete a Task
    Given that I have created a task "task 1"
    When I go to the tasks page
    When I follow "Destroy"
    When I go to the tasks page
    Then I should not see "task 1"
