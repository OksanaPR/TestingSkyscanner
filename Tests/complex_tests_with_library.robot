*** Settings ***
Library  ../Libraries/complexTestsLibrary.py

Test Setup  Open Browser
Test Teardown  Close Browser

*** Test Cases ***
TC - Delete random item
  Generate Random Sentences  50  50 items left
  Delete Random Element

TC - Verify All, Active, Completed functionality
  Generate Random Sentences  50  50 items left
  Move Items To Completed
  Calculate Active Items  0 items left
  Move Any Item To Active
  Calculate Active Items  1 item left
  Calculate Completed Items
  Move All Items To Active
  Calculate Active Items  50 items left


