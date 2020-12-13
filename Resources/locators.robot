
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
${LIST_ELEMENT}  css:.view label
${EDITING}  xpath://*[@class="editing"]
${EDIT_FIELD}  xpath://*[@class="edit"]
${NEW_ITEM_VALUE}  newItemAdded
${ALL_LINK}  xpath://*[@href="#/"]
${ACTIVE_LINK}  xpath://*[@href="#/active"]
${COMPELETED_LINK}  xpath://*[@href="#/completed"]
${TODO_COUNT}  xpath://*[@class="todo-count"]
${ARROW_BUTTON}  xpath://label[@for="toggle-all"]