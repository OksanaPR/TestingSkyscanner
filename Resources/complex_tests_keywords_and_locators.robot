*** Keywords ***
Open web application
  Open browser  ${TODOLIST_URL}  ${BROWSER}
  Wait Until Page Contains Element  ${PLACEHOLDER}

Add random string to todo list
  [Arguments]  ${TASK}
  ${RANDOM_STRING} =  Generate Random String	20
  Input text  ${TEXT_FIELDS}  ${RANDOM_STRING}
  Press keys  ${TEXT_FIELDS}  ENTER
  Element Attribute Value Should Be  ${TASK}  value  ${RANDOM_STRING}

Add task to todo list
  [Arguments]  ${ADDED_TASK}  ${TASK}
  Input text  ${TEXT_FIELDS}  ${ADDED_TASK}
  Press keys  ${TEXT_FIELDS}  ENTER
  Element Attribute Value Should Be  ${TASK}  value  ${ADDED_TASK}

Calculate Active items in the list
  [Arguments]  ${ITEMS_ADDED}
  ${ITEMS_AMOUNT} =  Get Text  ${TODO_COUNT}
  Should be equal  ${ITEMS_AMOUNT}  ${ITEMS_ADDED}

Move all items to Completed with Arrow button
  Click element  ${ARROW_BUTTON}
  Page Should Contain Element  ${CLEAR_COMPLETED_LINK}
  Element Text Should Be  ${CLEAR_COMPLETED_LINK}  Clear completed

Calculate Completed items in the list
  [Arguments]  ${NUMBER}
  ${NUMBER_OF_COMPLETED} =  Get Element Count  ${COMPLETED_ITEMS}
  ${RESULT} =	Convert To Integer	${NUMBER}
  Should Be Equal  ${NUMBER_OF_COMPLETED}  ${RESULT}

Calculate All items in the list
  [Arguments]  ${NUMBER}
  ${NUMBER_OF_COMPLETED} =  Get Element Count  ${COMPLETED_ITEMS}
  ${NUMBER_OF_ACTIVE_ITEMS} =  Get Element Count  ${ACTIVE_ITEMS}
  ${TOTAL_ITEMS} =  Evaluate    ${NUMBER_OF_COMPLETED}+${NUMBER_OF_ACTIVE_ITEMS}
  ${RESULT} =	Convert To Integer	${NUMBER}
  Should Be Equal  ${TOTAL_ITEMS}  ${RESULT}

Move any item to Active again
  [Arguments]  ${ANY_ITEM}
  Click element  ${ANY_ITEM}
  Page Should Contain Element  ${ACTIVE_ITEMS}

Move all items to Active again
  Double click element  ${ARROW_BUTTON}
  Page Should Not Contain Element  ${CLEAR_COMPLETED_LINK}

Сhange link focus
  [Arguments]  ${LINK}  ${LINK_NAME}  ${FOCUSED_LINK}
  ${ACTIVE_LINK_TEXT} =  Get Text  ${LINK}
  Should be equal  ${ACTIVE_LINK_TEXT}  ${LINK_NAME}
  Element Attribute Value Should Be  ${FOCUSED_LINK}  class  selected

Delete any item from the list
  [Arguments]  ${ITEM}  ${ITEM_CLOSE_BUTTON}
  Mouse over  ${ITEM}
  Click element  ${ITEM_CLOSE_BUTTON}

Verify deleted item is not in the list
  [Arguments]  ${CURRENT_ITEM}  ${DELETED_ITEM}
  ${ACTIVE_ITEM} =  Get Text  ${CURRENT_ITEM}
  Should Not be equal  ${ACTIVE_ITEM}  ${DELETED_ITEM}


*** Variables ***
${BROWSER}  headlessfirefox
${TODOLIST_URL}  http://todomvc.com/examples/react/#/
${PLACEHOLDER}  xpath://*[@placeholder="What needs to be done?"]
${TEXT_FIELDS}  xpath://*[@class="new-todo"]
${ADDED_SENTENCE}  This is my first task I wanna do in 2021
${ADDED_SEVERAL_SENTENCES}  Long task.Long task. Long task. Long task. Long task. Long task.Long task. Long task. Long task.
${ADDED_NUMBERS}  1234567890123456789012345678901234567890123456789012345678901234567890
${ADDED_CHARACKTERS}  $%^&*!@#$(){}":>?<
${ADDED_SENTENCE_AGAIN}  This is my first task I wanna do in 2021
${NUMBER}  4
${TASK1}  xpath://*[@class="edit"]
${TASK2}  xpath:(//input[@class="edit"])[2]
${TASK3}  xpath:(//input[@class="edit"])[3]
${TASK4}  xpath:(//input[@class="edit"])[4]
${TASK5}  xpath:(//input[@class="edit"])[5]
${TASK6}  xpath:(//input[@class="edit"])[6]
${TASK7}  xpath:(//input[@class="edit"])[7]
${COMPLETED_ITEMS}  xpath://*[@class="completed"]
${ARROW_BUTTON}  xpath://label[@for="toggle-all"]
${CLEAR_COMPLETED_LINK}  xpath://*[@class="clear-completed"]
${TODO_COUNT}  xpath://*[@class="todo-count"]
${ALL_LINK}  xpath://*[@href="#/"]
${ACTIVE_ITEMS}  xpath://li[@class=""]
${ITEM3}  xpath:(//input[@class="toggle"])[3]
${ACTIVE_ITEM_TO_DELETE}  xpath:(//li[@class=""])[3]
${ITEM_CLOSE_BUTTON}  xpath:(//*[@class="destroy"])[3]