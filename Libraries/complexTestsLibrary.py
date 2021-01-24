from robot.api.deco import keyword
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver import ActionChains
import random
import os


class complexTestsLibrary:
    ROBOT_LIBRARY_SCOPE = 'TESTS'
    URL = 'http://todomvc.com/examples/react/#/'
    words = [["One", "Two", "Three", "Four"], ["red", "yellow", "green", "blue"],
             ["cats", "dogs", "zebras", "pandas"], ["jumped.", "danced.", "wrote poetry.", "cried."]]
    todo_field = 'new-todo'
    view = '(//*[@class="view"]){}'
    destroy_button = '(//*[@class="destroy"]){}'
    count = 'todo-count'
    items_left = '49 items left'
    toggle_button = 'label[for="toggle-all"]'
    completed_class = 'clear-completed'
    text = 'Clear completed'
    toggle = '(//*[@class="toggle"]){}'
    completed_button = 'a[href="#/completed"]'
    completed_amount = 'completed'

    
    @keyword
    def open_browser(self):
        os.environ['MOZ_HEADLESS'] = '1'
        self.driver = webdriver.Firefox()
        self.driver.get(self.URL)
        self.driver.implicitly_wait(30)

    @keyword
    def close_browser(self):
        self.driver.close()

    @keyword
    def generate_random_sentences(self, number, total_items_amount):
        for i in range(int(number)):
            sentences = ' '.join([random.choice(w) for w in self.words])
            self.driver.find_element(By.CLASS_NAME, self.todo_field).send_keys(sentences, Keys.ENTER)
        total_items = self.driver.find_element(By.CLASS_NAME, self.count)
        assert total_items.text == total_items_amount

    @keyword
    def delete_random_element(self):
        i = random.randint(1, 50)
        list_item = self.driver.find_element(By.XPATH, self.view.format([i]))
        hidden_button = self.driver.find_element(By.XPATH, self.destroy_button.format([i]))
        actions = ActionChains(self.driver)
        actions.move_to_element(list_item)
        actions.click(hidden_button)
        actions.perform()
        total_items = self.driver.find_element(By.CLASS_NAME, self.count)
        assert total_items.text == self.items_left

    @keyword
    def move_items_to_completed(self):
        self.driver.find_element(By.CSS_SELECTOR, self.toggle_button).click()
        clear_completed = self.driver.find_element(By.CLASS_NAME, self.completed_class)
        assert clear_completed.text == self.text

    @keyword
    def calculate_active_items(self, active_items):
        items_left = self.driver.find_element(By.CLASS_NAME, self.count)
        assert items_left.text == active_items

    @keyword
    def move_any_item_to_active(self):
        i = random.randint(1, 11)
        self.driver.find_element(By.XPATH, self.toggle.format([i])).click()

    @keyword
    def calculate_completed_items(self):
        self.driver.find_element(By.CSS_SELECTOR, self.completed_button).click()
        completed_items = self.driver.find_elements(By.CLASS_NAME, self.completed_amount)
        assert len(completed_items) == 49

    @keyword
    def move_all_items_to_active(self):
        button = self.driver.find_element(By.CSS_SELECTOR, self.toggle_button)
        action = ActionChains(self.driver)
        action.double_click(button).perform()