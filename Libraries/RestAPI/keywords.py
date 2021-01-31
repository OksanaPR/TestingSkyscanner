import restAPI_library
from robot.api.deco import keyword
import jsonschema
from jsonschema import validate,exceptions
import json


class keywords:
    ROBOT_LIBRARY_SCOPE = 'TESTS'

    @keyword
    def get_request(self, URL):
        return restAPI_library.get_method(URL)

    @keyword
    def assert_response_status(self, response):
        assert response.status_code == 200

    @keyword
    def get_json_response(self, URL):
        return restAPI_library.get_method(URL).content

    @keyword
    def validate_json_response_for_persons(self, response, number, name):
        data = json.loads(response)
        assert data['count'] == int(number)
        assert data['results'][0]['name'] == name

    @keyword
    def validate_person_json_response(self, response, name, height, color):
        data = json.loads(response)
        assert data['name'] == name
        assert data['height'] == height
        assert data['skin_color'] == color

    @keyword
    def validate_json_response_for_films(self, response, number, title):
        data = json.loads(response)
        assert data['count'] == int(number)
        assert data['results'][0]['title'] == title

    @keyword
    def validate_film_json_response(self, response, title, director, release_date):
        data = json.loads(response)
        assert data['title'] == title
        assert data['director'] == director
        assert data['release_date'] == release_date


    @keyword
    def validate_one_user_json_schema(self,URL):
        schema_one_user = {
                              "type": "object",
                              "properties": {
                                "name": {"type": "string"},
                                "height": {"type": "string"},
                                "mass": {"type": "string"},
                                "hair_color": {"type": "string"},
                                "skin_color": {"type": "string"},
                                "eye_color": {"type": "string"},
                                "birth_year": {"type": "string"},
                                "gender": {"type": "string"},
                                "homeworld": {"type": "string"},
                                "films": {"type": "array",
                                  "items": [
                                    {"type": "string"}]
                                },
                                "species": {
                                  "type": "array",
                                  "items": [
                                    {"type": "string"}
                                  ]
                                },
                                "vehicles": {
                                  "type": "array",
                                  "items": {}
                                },
                                "starships": {
                                  "type": "array",
                                  "items": {}
                                },
                                "created": {"type": "string"},
                                "edited": {"type": "string"},
                                "url": {"type": "string"}
                              },
                              "required": [
                                "name",
                                "height",
                                "mass",
                                "hair_color",
                                "skin_color",
                                "eye_color",
                                "birth_year",
                                "gender",
                                "homeworld",
                                "films",
                                "species",
                                "vehicles",
                                "starships",
                                "created",
                                "edited",
                                "url"
                              ]
                            }
        response = restAPI_library.get_method(URL).json()
        try:
            validate(instance=response, schema=schema_one_user)
        except exceptions.ValidationError as err:
            raise TypeError("Validation error:", err)
        return True

    @keyword
    def validate_one_film_json_schema(self, URL):
        schema_one_film = {
             "type": "object",
              "properties": {
                "title": {"type": "string"},
                "episode_id": {"type": "integer"},
                "opening_crawl": {"type": "string"},
                "director": {"type": "string"},
                "producer": {"type": "string"},
                "release_date": {"type": "string"},
                "characters": {
                  "type": "array",
                  "items": [
                    {"type": "string"},
                    {"type": "string"},
                    {"type": "string"}
                ]
                },
                "planets": {
                  "type": "array",
                  "items": [
                    {"type": "string"},
                    {"type": "string"},
                    {"type": "string"}
                  ]
                },
                "starships": {
                  "type": "array",
                  "items": [
                    {"type": "string"},
                    {"type": "string"},
                    {"type": "string"}
                  ]
                },
                "vehicles": {
                  "type": "array",
                  "items": [
                    {"type": "string"},
                    {"type": "string"},
                    {"type": "string"}
                  ]
                },
                "species": {
                  "type": "array",
                  "items": [
                    {"type": "string"},
                    {"type": "string"},
                    {"type": "string"}
                  ]
                },
                "created": {"type": "string"},
                "edited": {"type": "string"},
                "url": {"type": "string"}
              },

            }
        response = restAPI_library.get_method(URL).json()
        try:
            validate(instance=response, schema=schema_one_film)
            print('Data is correct')
        except exceptions.ValidationError as err:
            raise TypeError("Validation error:", err)
        return True









