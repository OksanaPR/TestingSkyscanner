import requests


def get_method():
    try:
        response = requests.get("https://swapi.dev/api/people/",timeout=3)
        response.raise_for_status()
    except requests.exceptions.RequestException as error1:
        print("OOps: Something Else", error1)
    except requests.exceptions.HTTPError as error2:
        print("Http Error:", error2)
    except requests.exceptions.ConnectionError as error3:
        print("Error Connecting:", error3)
    except requests.exceptions.Timeout as error4:
        print("Timeout Error:", error4)

get_method()