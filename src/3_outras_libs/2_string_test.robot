*** Settings ***
Library  String

*** Variables ***
    # robot -d ./results -L trace  .\src\4_string\4_0_string_test.robot

*** Test Cases ***
Teste conversao minusculo maisculo
    ${var}    Set Variable    Esta É uma Variavel
    ${var_Max}     Convert To Lower Case    ${var} 
    ${var_Min}     Convert To Upper Case    ${var} 
    
    Log To Console    ${var_Max}-${var_Min}

Teste Strip
    ${stripped}     Strip String    ${SPACE}Teste${SPACE}

Replace String test    

    ${var}    Set Variable    Teste${\n}2 
    Log To Console    message=${var}
    ${var}     Replace String    ${var}    ${\n}    ${SPACE}
    Log To Console    message=${var}

Teste Random
    ${var}    Set Variable    ROBOT-
    ${random}    Generate Random String    length=8     chars=[NUMBERS]

    ${result}    Set Variable    ${var}${random}
    Log To Console    ${result} 

*** Keywords ***


