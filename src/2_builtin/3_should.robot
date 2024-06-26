*** Settings ***

*** Variables ***
# robot -d ./results -L trace  .\src\2_builtin\2_3_should.robot

*** Test Cases ***
Teste 1 - Should Be Empty e Not Empty
    ${b}    Set Variable    ${Empty}
    ${c}    Set Variable    1
    Should Be Empty      ${b}
    Should Be Empty      ${Empty}
    Should Not Be Empty          ${c}
    Should Not Be Empty          ${SPACE}

Teste 2 - Should Be Equal e Not Equal
    ${a}    Set Variable    1
    ${b}    Set Variable    1
    ${c}    Set Variable    2
    Should Be Equal          ${a}     ${b}
    Should Not Be Equal      ${a}     ${c}

Teste 3 - Regex
    
    ${a}    Set Variable    Gustavo

    Should Contain   ${a}     a    t
    Should Start With     ${a}    Gust
    Should Match    ${a}     gustavo        ignore_case=True