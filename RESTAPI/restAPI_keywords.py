from robot.api.deco import keyword
import requests
import json
import restAPI_library
import jsonschema


class restAPI_keywords:
    ROBOT_LIBRARY_SCOPE = 'TESTS'
    restAPI_library.get_method("https://swapi.dev/api/people/")
   # assert requests.status_codes == 200
    print(requests.status_codes)

    @keyword
    def validateDataResponse(self):
        schemaToValidate = {
            "type": "object",
            "results": {
                "name": {"type": "string"},
                "height": {"type": "number"},
                "mass": {"type": "number"}
            }
        }

    def validateJson(jsonData):
        try:
            validate(instance=jsonData, schema=schemaToValidate)
        except jsonschema.exceptions.ValidationError as err:
            return False
        return True

        # Convert to Python object
        jsonData = json.loads(requests.get("https://swapi.dev/api/people/"))
        isValid = validateJson(jsonData)

        if isValid:
            print(jsonData)
            print("Given JSON data is Valid")
        else:
            print(jsonData)
            print("Given JSON data is InValid")









