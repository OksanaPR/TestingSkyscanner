from robot.api.deco import keyword
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
import random
import os



class complexTestsLibrary:
    ROBOT_LIBRARY_SCOPE = 'TESTS'

    @keyword
    def open_browser(self):
        os.environ['MOZ_HEADLESS'] = '1'
        self.driver = webdriver.Firefox()
        self.driver.get('http://todomvc.com/examples/react/#/')

    @keyword
    def generate_random_sentences(self, number, total_items_amount):
        words = [["One", "Two", "Three", "Four"], ["red", "yellow", "green", "blue"], ["cats", "dogs", "zebras", "pandas"],["jumped.", "danced.", "wrote poetry.", "cried."]]
        for i in range(int(number)):
            sentences = ' '.join([random.choice(w) for w in words])
            self.driver.find_element(By.CLASS_NAME, "new-todo").send_keys(sentences, Keys.ENTER)
        total_items = self.driver.find_element(By.CLASS_NAME, "todo-count")
        assert total_items.text == total_items_amount


