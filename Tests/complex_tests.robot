*** Settings ***
Library  SeleniumLibrary  run_on_failure=Nothing
Library  String
Library  BuiltIn

Resource  ../Resources/complex_tests_keywords_and_locators.robot

Test Setup  Open web application
Test Teardown  Close All Browsers


*** Test Cases ***
TC - Delete random item from todo list
  Add task to todo list  ${ADDED_SENTENCE}  ${TASK1}
  Add task to todo list  ${ADDED_SEVERAL_SENTENCES}  ${TASK2}
  Add random string to todo list  ${TASK3}
  Add task to todo list  ${ADDED_NUMBERS}  ${TASK4}
  Add task to todo list  ${ADDED_CHARACKTERS}  ${TASK5}
  Add task to todo list  ${ADDED_SENTENCE_AGAIN}  ${TASK6}
  Add random string to todo list  ${TASK7}
  Calculate All items in the list  7
  Delete any item from the list  ${ACTIVE_ITEM_TO_DELETE}  ${ITEM_CLOSE_BUTTON}
  Calculate All items in the list  6
  Verify deleted item is not in the list  ${ACTIVE_ITEM_TO_DELETE}  ${ADDED_NUMBERS}

TC - Verify All, Active, Completed functionality
  Add task to todo list  ${ADDED_SENTENCE}  ${TASK1}
  Add task to todo list  ${ADDED_SEVERAL_SENTENCES}  ${TASK2}
  Add random string to todo list  ${TASK3}
  Add task to todo list  ${ADDED_NUMBERS}  ${TASK4}
  Add task to todo list  ${ADDED_CHARACKTERS}  ${TASK5}
  Move all items to Completed with Arrow button
  Calculate Active items in the list  0 items left
  Move any item to Active again  ${ITEM3}
  Calculate Active items in the list  1 item left
  Calculate Completed items in the list  4
  Сhange link focus  ${ALL_LINK}  All  ${ALL_LINK}
  Calculate All items in the list  5
  Move all items to Active again
  Calculate Active items in the list  5 items left



