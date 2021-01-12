*** Settings ***
Library  ../Libraries/complexTestsLibrary.py

Test Setup  Open Browser

*** Test Cases ***
TC - Delete random item
  Generate Random Sentences  50  50 items left
