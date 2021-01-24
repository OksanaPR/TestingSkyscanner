*** Keywords ***
Open todo list
  Open browser  ${TODOLIST_URL}  ${BROWSER}
  Wait Until Page Contains Element  ${PLACEHOLDER}

Add item to todos list
  ${TASK} =	Generate Random String	12
  Input text  ${TEXT_FIELDS}  ${TASK}
  Press keys  ${TEXT_FIELDS}  ENTER
  Element Attribute Value Should Be  ${ACTUAL_TEXT}  value  ${TASK}

Delete item from the list
  Mouse over  ${TODOS_TASK}
  Click element  ${CLOSE_BUTTON}

Move Active item to Completed
  Mouse over  ${TODOS_TASK}
  Select Checkbox  ${LIST_CHECKBOX}
  Page Should Contain Element  ${CLEAR_COMPLETED_LINK}
  Element Text Should Be  ${CLEAR_COMPLETED_LINK}  Clear completed

Mark item as Completed
  Mouse over  ${TODOS_TASK}
  Click element  ${LIST_CHECKBOX}

Double click list item
  Mouse over  ${TODOS_TASK}
  Double Click Element  ${LIST_ELEMENT}

Move item to Completed with Arrow button
  Click element  ${ARROW_BUTTON}
  Page Should Contain Element  ${CLEAR_COMPLETED_LINK}
  Element Text Should Be  ${CLEAR_COMPLETED_LINK}  Clear completed

Add second item to todo
  ${NEW_TASK} =  Generate Random String  12
  Input text  ${TEXT_FIELDS}  ${NEW_TASK}
  Press keys  ${TEXT_FIELDS}  ENTER
  Element Attribute Value Should Be  ${ACTUAL_TEXT2}  value  ${NEW_TASK}

Сhange link focus
  [Arguments]  ${LINK}  ${LINK_NAME}  ${FOCUSED_LINK}
  ${ACTIVE_LINK_TEXT} =  Get Text  ${LINK}
  Should be equal  ${ACTIVE_LINK_TEXT}  ${LINK_NAME}
  Element Attribute Value Should Be  ${FOCUSED_LINK}  class  selected

Calculate items in the list
  [Arguments]  ${ITEMS_ADDED}
  ${ITEMS_AMOUNT} =  Get Text  ${TODO_COUNT}
  Should be equal  ${ITEMS_AMOUNT}  ${ITEMS_ADDED}

Enter new value into the list
  Press keys  ${EDIT_FIELD}  CTRL+A
  Press keys  ${EDIT_FIELD}  BACKSPACE
  Press keys  ${EDIT_FIELD}  ${NEW_ITEM_VALUE}
  Press keys  ${TEXT_FIELDS}  ENTER
  Element Attribute Value Should Be  ${ACTUAL_TEXT}  value  ${NEW_ITEM_VALUE}

Verify All focused
  [Arguments]  ${FOCUSED_LINK}  ${LINK_NAME}
  ${ACTIVE_LINK_TEXT} =  Get Text  ${FOCUSED_LINK}
  Should be equal  ${ACTIVE_LINK_TEXT}  ${LINK_NAME}
  Element Attribute Value Should Be  ${ALL_LINK}  class  selected

*** Variables ***
${BROWSER}  headlessfirefox
${TODOLIST_URL}  http://todomvc.com/examples/react/#/
${PLACEHOLDER}  xpath://*[@placeholder="What needs to be done?"]
${TEXT_FIELDS}  xpath://*[@class="new-todo"]
${ACTUAL_TEXT}  xpath://*[@class="edit"]
${ACTUAL_TEXT2}  xpath:(//input[@class="edit"])[2]
${TODOS_TASK}  xpath://*[@class="todo-list"]
${CLOSE_BUTTON}  xpath://*[@class="destroy"]
${TODOS_LIST}  xpath://*[@class="main"]
${LIST_CHECKBOX}  xpath://*[@class="toggle"]
${CLEAR_COMPLETED_LINK}  xpath://*[@class="clear-completed"]
${TODOS_COUNT}  xpath://*[@class="todo-count"]
${LIST_ELEMENT}  xpath://*[@class="view"]
${EDITING}  xpath://*[@class="editing"]
${EDIT_FIELD}  xpath://*[@class="edit"]
${NEW_ITEM_VALUE}  newItemAdded
${ALL_LINK}  xpath://*[@href="#/"]
${ACTIVE_LINK}  xpath://*[@href="#/active"]
${COMPELETED_LINK}  xpath://*[@href="#/completed"]
${TODO_COUNT}  xpath://*[@class="todo-count"
${ARROW_BUTTON}  xpath://label[@for="toggle-all"]