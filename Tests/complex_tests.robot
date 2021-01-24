*** Settings ***
Library  SeleniumLibrary  run_on_failure=Nothing
Library  String
Library  BuiltIn

Resource  ../Resources/complex_tests_keywords_and_locators.robot

Test Setup  Open web application
Test Teardown  Close All Browsers


*** Test Cases ***
TC - Delete item from todo list
  &{params}=  	Create Dictionary  ${ADDED_SENTENCE}=${TASK1}  ${ADDED_SEVERAL_SENTENCES}=${TASK2}  ${ADDED_NUMBERS}=${TASK3}  ${ADDED_CHARACKTERS}=${TASK4}
  FOR  ${key}  ${value}  IN  &{params}
    Add task to todo list  ${key}  ${value}
  END
  Calculate All items in the list  4
  Delete any item from the list  ${ACTIVE_ITEM_TO_DELETE}  ${ITEM_CLOSE_BUTTON}
  Calculate All items in the list  3
  Verify deleted item is not in the list  ${ACTIVE_ITEM_TO_DELETE}  ${ADDED_NUMBERS}



TC - Verify All, Active, Completed functionality
  &{params}=  	Create Dictionary  ${ADDED_SENTENCE}=${TASK1}  ${ADDED_SEVERAL_SENTENCES}=${TASK2}  ${ADDED_NUMBERS}=${TASK3}  ${ADDED_CHARACKTERS}=${TASK4}
  FOR  ${key}  ${value}  IN  &{params}
    Add task to todo list  ${key}  ${value}
  END
  Move all items to Completed with Arrow button
  Calculate Active items in the list  0 items left
  Move any item to Active again  ${ITEM3}
  Calculate Active items in the list  1 item left
  Calculate Completed items in the list  3
  Сhange link focus  ${ALL_LINK}  All  ${ALL_LINK}
  Calculate All items in the list  4
  Move all items to Active again
  Calculate Active items in the list  4 items left






