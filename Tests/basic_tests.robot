*** Settings ***
Library  SeleniumLibrary  run_on_failure=Nothing
Library  String
Library  BuiltIn

Resource  ../Resources/basic_tests_keywords_and_locators.robot

Test Setup  Add item to todos list
Test Teardown  Close All Browsers


*** Test Cases ***
Delete added item from todos list
  Delete item from the list
  Page Should Not Contain Element  ${TODOS_LIST}

Move item in todos to Complited
  Move Active item to Completed

Make Complited item in todos active again
  Move Active item to Completed
  Mark item as Completed
  Page Should Not Contain Element  ${CLEAR_COMPLETED_LINK}
  Calculate items in the list  1 item left

Delete Complited item from todos
  Move Active item to Completed
  Delete item from the list
  Page Should Not Contain Element  ${TODOS_LIST}

Edit todolist item
  Double click list item
  Page Should Contain Element  ${EDITING}
  Enter new value into the list

Clear(Remove) Complited item in todos
  Move Active item to Completed
  Click element  ${CLEAR_COMPLETED_LINK}
  Page Should Not Contain Element  ${CLEAR_COMPLETED_LINK}
  Page Should Not Contain Element  ${TODOS_LIST}

Switch between All, Active and Complited links
  Сhange link focus  ${ALL_LINK}  All  ${ALL_LINK}
  Click Link  ${ACTIVE_LINK}
  Сhange link focus  ${ACTIVE_LINK}  Active  ${ACTIVE_LINK}
  Click Link  ${COMPELETED_LINK}
  Сhange link focus  ${COMPELETED_LINK}  Completed  ${COMPELETED_LINK}

Verify amount of Active items
  Add second item to todo
  Calculate items in the list  2 items left

Verify amount of Active items when items moved to Complited items
  Move Active item to Completed
  Calculate items in the list  0 items left

Move items to Complited with arrow button
  Move item to Completed with Arrow button

Move items from Completed to Active with arrow button
  Move item to Completed with Arrow button
  Click element  ${ARROW_BUTTON}
  Page Should Not Contain Element  ${CLEAR_COMPLETED_LINK}
  Calculate items in the list  1 item left