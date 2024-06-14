*** Settings ***
Library    RequestsLibrary

*** Variables ***


*** Keywords ***
Autenticar
    [Arguments]    ${login}    ${senha}    ${expected_result}

    ${header}    Create Dictionary    Content-Type=application/json

    ${RESPONSE}    POST On Session    alias=api    url=/login    headers=${header}    data={"email": "${login}","password": "${senha}"}    expected_status=${expected_result}
    Log To Console    ${RESPONSE.json()}

    IF  ${expected_result} == 200
        ${token}    Set Variable        ${RESPONSE.json()['authorization']}
        Log To Console    ${token}
        RETURN    ${token}
    ELSE IF    ${expected_result} == 401
        Log To Console    ${RESPONSE.json()['message']}
        Should Be Equal    ${RESPONSE.json()['message']}    Email e/ou senha inválidos
        RETURN
    END

    

    

    

