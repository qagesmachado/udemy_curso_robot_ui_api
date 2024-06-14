*** Settings ***

*** Variables ***
# robot -d ./results -L trace  .\src\2_builtin\2_3_should.robot

*** Test Cases ***

Teste 1 Should Be Empty

    ${b}    Set Variable    ${Empty}
    ${c}    Set Variable    1
    Should Be Empty      ${b}
    Should Be Empty      ${Empty}
    Should Not Be Empty          ${c}
    Should Not Be Empty          ${SPACE}

Teste 2 Should Be Equal
    ${a}    Set Variable    1
    ${b}    Set Variable    1
    ${c}    Set Variable    2
    Should Be Equal          ${a}     ${b}
    Should Not Be Equal      ${a}     ${c}

Teste 3 Should Be Equal com conversão
    ${a}    Set Variable    1
    ${b}    Set Variable    1

    Should Be Equal As Integers    ${a}     ${b}
    Should Be Equal As Numbers        ${a}     ${b}
    
    ${a_1}    Convert To Integer    ${a}
    ${b_1}    Convert To Integer    ${b}

    Should Be Equal As Strings    ${a_1}    ${b_1}

Teste 5 - Should Booleano
    Should Be True           1   
    Should Not Be True       0  

Teste 6 - Regex
    
    ${a}    Set Variable    Gustavo

    Should Contain   ${a}     a    t
    Should Start With     ${a}    Gust
    Should Match    ${a}     gustavo        ignore_case=True

    

    

