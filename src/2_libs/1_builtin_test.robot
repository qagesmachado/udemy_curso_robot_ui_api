*** Comments ***
robot -d ./results -L trace src\2_libs\1_builtin_test.robot

https://robotframework.org/robotframework/latest/libraries/BuiltIn.html

*** Test Cases ***
Teste 1
    # Declaração de variável
    ${x}    Set Variable    2
    ${y}    Set Variable    3
    
    # Validação
    Should Not Be Equal    ${x}    ${y}
    
    # Conversão
    ${typex}    Evaluate    type($x)
    Log To Console    ${typex}

    ${x}    Convert To Integer    ${x}

    ${typex}    Evaluate    type($x)
    Log To Console    ${typex}

    # Dicionário e Listas

    ${dict}    Create Dictionary    nome=Gustavo    idade=19
    ${list}    Create List    1    2    3    4

    Log To Console    ${list}[0]
    Log To Console    ${dict}[nome]

