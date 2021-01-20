from robot.api.deco import keyword
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver import ActionChains
from selenium.webdriver.support.ui import WebDriverWait
import random
import os



class complexTestsLibrary:
    ROBOT_LIBRARY_SCOPE = 'TESTS'

    @keyword
    def open_browser(self):
        os.environ['MOZ_HEADLESS'] = '1'
        self.driver = webdriver.Firefox()
        self.driver.get('http://todomvc.com/examples/react/#/')
        self.driver.implicitly_wait(20)

    @keyword
    def close_browser(self):
        self.driver.close()

    @keyword
    def generate_random_sentences(self, number, total_items_amount):
        words = [["One", "Two", "Three", "Four"], ["red", "yellow", "green", "blue"],
                 ["cats", "dogs", "zebras", "pandas"], ["jumped.", "danced.", "wrote poetry.", "cried."]]
        for i in range(int(number)):
            sentences = ' '.join([random.choice(w) for w in words])
            self.driver.find_element(By.CLASS_NAME, "new-todo").send_keys(sentences, Keys.ENTER)
        total_items = self.driver.find_element(By.CLASS_NAME, "todo-count")
        assert total_items.text == total_items_amount

    @keyword
    def delete_random_element(self, total_items_amount):
        #could not find a way to select index randomly and use it when selecting list item I want to delete
        #i = range(51) - because we added 50 items
        #index = random.choice(i) - that supposed to select a namber from a range
        list_item = self.driver.find_element(By.XPATH, '(//*[@class="view"])[2]')
        hidden_button = self.driver.find_element(By.XPATH, '(//*[@class="destroy"])[2]')
        actions = ActionChains(self.driver)
        actions.move_to_element(list_item)
        actions.click(hidden_button)
        actions.perform()
        total_items = self.driver.find_element(By.CLASS_NAME, "todo-count")
        assert total_items.text == total_items_amount

    @keyword
    def move_items_to_completed(self):
        self.driver.find_element(By.CLASS_NAME, "toggle-all").click()
