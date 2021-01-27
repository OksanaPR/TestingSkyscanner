*** Settings ***
Library  restAPI_keywords.py



*** Test Cases ***
TC - Validate all users
    ${USERS}    Get all users
    Assert Users Response     ${USERS}
    Validate All Users Json    ${USERS['body']['results'][0]}