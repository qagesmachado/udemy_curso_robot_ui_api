*** Settings ***

*** Variables ***
# robot -d ./results -L trace  .\src\2_builtin\2_2_variaveis_argumentos.robot

*** Test Cases ***
Teste 1 - Argumentos e Retorno de Keyword
    ${x}    ${y}    ${z}  keyword-1

    keyword-2    ${x}  ${y}  ${z}
    
*** Keywords ***
keyword-1
    ${a}  Set Variable  1
    ${b}  Set Variable  2
    ${c}  Set Variable  3

    [Return]    ${a}    ${b}    ${c}

keyword-2
    [Arguments]    ${var_1}    ${var_2}    ${var_3}
    Log To Console    ${var_1}
    Log To Console    ${var_2}
    Log To Console    ${var_3}