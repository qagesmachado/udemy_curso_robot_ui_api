*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Library    String


*** Variables ***


*** Keywords ***
# CRUD
Criação de usuário
    [Arguments]    ${USER}

    # Getting the file
    ${body}    Get File    path=${EXECDIR}/src_projects/server_rest/data_driven/user_template.json
    ${body}    Replace String Using Regexp    ${body}    _nome       ${USER}[nome]
    ${body}    Replace String Using Regexp    ${body}    _email       ${USER}[email]
    ${body}    Replace String Using Regexp    ${body}    _password       ${USER}[password]
    ${body}    Replace String Using Regexp    ${body}    _administrador       ${USER}[administrador]

    ${header}    Create Dictionary    Content-Type=application/json

    ${RESPONSE}    POST On Session    alias=api    url=/usuarios    headers=${header}    data=${body}    expected_status=201
    ${USER_ID}    Set Variable    ${RESPONSE.json()['_id']}
    Log To Console    ${USER_ID}

    [Return]    ${USER_ID}

Buscar usuário
    [Arguments]    ${USER_ID}    ${expected_status}    ${USER}
    ${RESPONSE}    GET On Session    alias=api    url=/usuarios/${USER_ID}    expected_status=${expected_status}
    ${retorno_get}    Set Variable    ${RESPONSE.json()}

    IF  '${expected_status}'== '200'
        ${email}        Set Variable    ${RESPONSE.json()['email']}
        Should Be Equal    ${email}     ${USER.email}
    END
    
    Log To Console    ${retorno_get}

Atualizar usuário
    [Arguments]    ${USER_ID}    ${USER}
    ${header}    Create Dictionary    Content-Type=application/json

    # Getting the file
    ${body}    Get File    path=${EXECDIR}/src_projects/server_rest/data_driven/user_template.json
    ${body}    Replace String Using Regexp    ${body}    _nome       ${USER}[nome]
    ${body}    Replace String Using Regexp    ${body}    _email       ${USER}[email]
    ${body}    Replace String Using Regexp    ${body}    _password       ${USER}[password]
    ${body}    Replace String Using Regexp    ${body}    _administrador       ${USER}[administrador]

    ${RESPONSE}    PUT On Session    alias=api    url=/usuarios/${USER_ID}  headers=${header}   data=${body}  expected_status=200
    ${retorno_put}    Set Variable    ${RESPONSE.json()}
    Log To Console    ${retorno_put}

Deletar usuário
    [Arguments]    ${USER_ID}    ${USER}
    DELETE On Session    alias=api    url=/usuarios/${USER_ID}    expected_status=200

    # Validação não existe usuário
    Buscar usuário    USER_ID=${USER_ID}    expected_status=400    USER=${USER}




