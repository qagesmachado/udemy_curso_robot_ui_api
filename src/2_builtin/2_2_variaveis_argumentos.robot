*** Settings ***

*** Variables ***
# robot -d ./results -L trace  .\src\2_builtin\2_2_variaveis_argumentos.robot


# Local -> Pode ser usada apenas dentro do contexto local que foi declarado
# Teste -> Declarada no contexto do teste
# Global -> Declarada globalmente pra ser usado em qualquer teste

*** Test Cases ***

Teste 1
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