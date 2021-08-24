*** Settings ***
Documentation                Testar Selenium och RobotFramework
Resource                     ../Resources/keywords_general.robot
Resource                     ../Resources/keywords.robot
Library                      SeleniumLibrary
Test suit
Test Setup                   Begin Web Test
Test Teardown                End Web Test
*** Test Cases ***
Test to log into app.lablef
  [Documentation]    Test to verify the login-page works
  [Tags]             JiraTag
# JiraTag = LG3-21 etc
  Go to Web Page
  Given that user enters a valid username and password
  When user presses LOGIN
  Then user should be logged in
  Test to upload the Ebike dataset
   [Documentation]    Test to upload the Ebike dataset
  [Tags]              Update Ebike
# JiraTag = LG3-21 etc
  Given that  the user on the home page
  When user clicks on the Add a dataset button
  And user select and upload the CSV file
  And enter name and description of dataset
  Then user should able to see the uploaded dataset
