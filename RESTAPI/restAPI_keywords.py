from robot.api.deco import keyword
import requests
import json
import restAPI_library


class restAPI_keywords:
    ROBOT_LIBRARY_SCOPE = 'TESTS'
    restAPI_library.get_method("https://swapi.dev/api/people/")
    assert requests.status_codes == 200
    print(requests.status_codes)










