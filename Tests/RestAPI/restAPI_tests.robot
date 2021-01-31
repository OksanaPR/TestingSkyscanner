*** Settings ***
Library  ../../Libraries/RestAPI/keywords.py


*** Test Cases ***
TC - Verify GET request for all users
    ${Users}  Get Request  ${people_endpoint}
    Assert Response Status  ${Users}
    ${response}  Get Json Response  ${people_endpoint}
    Validate Json Response For Persons  ${response}  ${number}  ${name1}


TC - Verify GET request for one user
    ${User}  Get Request  ${people_endpoint}/2
    Assert Response Status  ${User}
    ${response}  Get Json Response  ${people_endpoint}/2
    Validate Person Json Response  ${response}  ${name2}  ${height}  ${color}
    Validate One User Json Schema  ${people_endpoint}/2

TC - Verify GET request for all films
    ${Films}  Get Request  ${film_endpoint}
    Assert Response Status  ${Films}
    ${response}  Get Json Response  ${film_endpoint}
    Validate Json Response For Films  ${response}  ${number1}  ${title1}

TC - Verify GET request for one film
    ${Film}  Get Request  ${film_endpoint}/3
    Assert Response Status  ${Film}
    ${response}  Get Json Response  ${film_endpoint}/3
    Validate Film Json Response  ${response}  ${title2}  ${director}  ${release_data}
    validate one film json schema  ${film_endpoint}/3


*** Variables ***
${people_endpoint}  https://swapi.dev/api/people
${film_endpoint}  https://swapi.dev/api/films
${number}  82
${number1}  6
${name1}  Luke Skywalker
${name2}  C-3PO
${title1}  A New Hope
${title2}  Return of the Jedi
${director}  Richard Marquand
${release_data}  1983-05-25
${height}  167
${color}  gold
