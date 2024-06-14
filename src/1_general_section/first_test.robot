*** Settings ***

*** Variables ***
# robot -i smoke_test .\1_introducao\first_test.robot

*** Test Cases ***
Teste 1
    [Tags]    smoke_test    test_1
    [Documentation]    Documentação do teste 1
    ...                Continuando a escrever
    Log To Console    Hello world
    KY - teste

Teste 2
    [Tags]    smoke_test    test_2
    Log To Console    Hello world
    KY - teste

Teste 3
    [Tags]    smoke_test    test_3
    Log To Console    Hello world

Teste 4
    [Tags]    smoke_test    test_4
    Log To Console    Hello world

*** Keywords ***
KY - teste
    Log To Console    Passei no teste



