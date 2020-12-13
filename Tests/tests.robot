*** Settings ***
Library  SeleniumLibrary  run_on_failure=Nothing
Library  String
Library  BuiltIn

Resource  ../Resources/locators.robot
Resource  ../Resources/keywords.robot
Test Teardown  Close All Browsers


*** Test Cases ***
Test Case 1 - Add item to todos list
  Open TODOS App
  Add item to TODOS App

Test Case 2 - Delete item from todos list
  Open TODOS App
  Add item to TODOS App
  Mouse over  ${TODOS_TASK}
  Click element  ${CLOSE_BUTTON}
  Page Should Not Contain Element  ${TODOS_LIST}

Test Case 3 - Move item in todos to Complited
  Open TODOS App
  Add item to TODOS App
  Move Active item to Completed

Test Case 4 - Make Complited item in todos active again
  Open TODOS App
  Add item to TODOS App
  Move Active item to Completed
  Mouse over  ${TODOS_TASK}
  Click element  ${LIST_CHECKBOX}
  Page Should Not Contain Element  ${CLEAR_COMPLETED_LINK}
  Check items amount

Test Case 5 - Delete Complited item from todos
  Open TODOS App
  Add item to TODOS App
  Move Active item to Completed
  Mouse over  ${TODOS_TASK}
  Click element  ${CLOSE_BUTTON}
  Page Should Not Contain Element  ${TODOS_LIST}

Test Case 6 - Edit todolist item
  Open TODOS App
  Add item to TODOS App
  Mouse over  ${TODOS_TASK}
  Double Click Element  ${LIST_ELEMENT}
  Page Should Contain Element  ${EDITING}
  Enter new value into the list

Test Case 7 - Clear(Remove) Complited item in todos
  Open TODOS App
  Add item to TODOS App
  Move Active item to Completed
  Click element  ${CLEAR_COMPLETED_LINK}
  Page Should Not Contain Element  ${CLEAR_COMPLETED_LINK}
  Page Should Not Contain Element  ${TODOS_LIST}

Test Case 8 - Switch between All, Active and Complited links
  Open TODOS App
  Add item to TODOS App
  ${ACTIVE_LINK_TEXT} =  Get Text  ${ALL_LINK}
  Should be equal  ${ACTIVE_LINK_TEXT}  All
  Element Attribute Value Should Be  ${ALL_LINK}  class  selected
  Click Link  ${ACTIVE_LINK}
  ${ACTIVE_LINK_TEXT} =  Get Text  ${ACTIVE_LINK}
  Should be equal  ${ACTIVE_LINK_TEXT}  Active
  Element Attribute Value Should Be  ${ACTIVE_LINK}  class  selected
  Click Link  ${COMPELETED_LINK}
  ${ACTIVE_LINK_TEXT} =  Get Text  ${COMPELETED_LINK}
  Should be equal  ${ACTIVE_LINK_TEXT}  Completed
  Element Attribute Value Should Be  ${COMPELETED_LINK}  class  selected

Test Case 9 - Verify amount of Active items
  Open TODOS App
  Add item to TODOS App
  ${TASK1} =  Generate Random String	12
  Input text  ${TEXT_FIELDS}  ${TASK1}
  Press keys  ${TEXT_FIELDS}  ENTER
  Element Attribute Value Should Be  ${ACTUAL_TEXT2}  value  ${TASK1}
  ${ITEMS_AMOUNT} =  Get Text  ${TODO_COUNT}
  Should be equal  ${ITEMS_AMOUNT}  2 items left

Test Case 10 - Verify amount of Active items when items moved to Complited items
  Open TODOS App
  Add item to TODOS App
  Move Active item to Completed
  ${ITEMS_AMOUNT} =  Get Text  ${TODO_COUNT}
  Should be equal  ${ITEMS_AMOUNT}  0 items left

Test Case 11 - Move items to Complited with arrow button
  Open TODOS App
  Add item to TODOS App
  Move item to Completed with Arrow button

Test Case 12 - Move items from Completed to Active with arrow button
  Open TODOS App
  Add item to TODOS App
  Move item to Completed with Arrow button
  Click element  ${ARROW_BUTTON}
  Page Should Not Contain Element  ${CLEAR_COMPLETED_LINK}
  Check items amount