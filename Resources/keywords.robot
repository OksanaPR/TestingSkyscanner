
Resource  ../Resources/locators.robot

*** Keywords ***

Open TODOS App
  Open browser  ${TODOLIST_URL}  ${BROWSER}
  Wait Until Page Contains Element  ${PLACEHOLDER}

Add item to TODOS App
  ${TASK} =	Generate Random String	12
  Input text  ${TEXT_FIELDS}  ${TASK}
  Press keys  ${TEXT_FIELDS}  ENTER
  Element Attribute Value Should Be  ${ACTUAL_TEXT}  value  ${TASK}

Move Active item to Completed
  Mouse over  ${TODOS_TASK}
  Select Checkbox  ${LIST_CHECKBOX}
  Page Should Contain Element  ${CLEAR_COMPLETED_LINK}
  Element Text Should Be  ${CLEAR_COMPLETED_LINK}  Clear completed

Move item to Completed with Arrow button
  Click element  ${ARROW_BUTTON}
  Page Should Contain Element  ${CLEAR_COMPLETED_LINK}
  Element Text Should Be  ${CLEAR_COMPLETED_LINK}  Clear completed

Check items amount
  ${ITEMS_AMOUNT} =  Get Text  ${TODO_COUNT}
  Should be equal  ${ITEMS_AMOUNT}  1 item left

Enter new value into the list
  Press keys  ${EDIT_FIELD}  CTRL+A
  Press keys  ${EDIT_FIELD}  BACKSPACE
  Press keys  ${EDIT_FIELD}  ${NEW_ITEM_VALUE}
  Press keys  ${TEXT_FIELDS}  ENTER
  Element Attribute Value Should Be  ${ACTUAL_TEXT}  value  ${NEW_ITEM_VALUE}