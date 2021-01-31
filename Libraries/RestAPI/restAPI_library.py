import requests

def get_method(URL):
    try:
        response = requests.get(URL,timeout=3)
        response.raise_for_status()
    except requests.exceptions.HTTPError as error1:
        raise TypeError("Http Error:", error1)
    except requests.exceptions.Timeout as error2:
        raise TimeoutError("Timeout Error:", error2)
    except requests.exceptions.ConnectionError as error3:
        raise ConnectionError("Error Connecting:", error3)

    return response


