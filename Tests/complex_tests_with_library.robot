*** Settings ***
Library  ../Libraries/complexTestsLibrary.py

Test Setup  Open Browser
Test Teardown  Close Browser

*** Test Cases ***
#TC - Delete random item
#  Generate Random Sentences  50  50 items left
#  Delete Random Element  49 items left

TC - Verify All, Active, Completed functionality
  Generate Random Sentences  10  10 items left
  Move Items To Completed

