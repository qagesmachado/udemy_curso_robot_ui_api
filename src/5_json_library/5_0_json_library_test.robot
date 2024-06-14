*** Settings ***
Library  JSONLibrary

*** Variables ***
    # robot -d ./results -L trace  .\src\5_json_library\5_0_json_library_test.robot

*** Test Cases ***
Teste
    ${file}    Load Json From File    C:/repositories/robot_basic_udemy/src/5_json_library/teste.json
    Log To Console    ${file}
    ${tipo}    Evaluate    type($file)
    
    ${file_first_name}    Set Variable    ${file}[nome]
    ${file_last_nome}    Set Variable    ${file}[sobrenome]

*** Keywords ***


