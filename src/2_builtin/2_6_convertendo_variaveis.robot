*** Settings ***

*** Variables ***
# robot -d ./results -L trace  .\src\2_builtin\2_6_convertendo_variaveis.robot

*** Test Cases ***

Teste 1 - Convert To Binary

    # 4 3 2 1 0 -> indice
    # 0 1 0 1 0 -> multiplicador
    # M * (2^indice) + 

    # 2^1 = 2
    # 2^3 = 8
    # 10

    ${result}  Convert To Binary    10
    Log To Console    ${result}


Teste 2 - Convert To Boolean

    ${v}  Set Variable    True
    ${f}  Set Variable    False

    ${typev}    Evaluate    type($v)
    ${typef}    Evaluate    type($f)

    ${V}    Convert To Boolean    ${v}
    ${F}    Convert To Boolean    ${f}

    ${typeV}    Evaluate    type($V)
    ${typeF}    Evaluate    type($F)

Teste 3 - Convert To Integer

    ${n}  Set Variable    123
    
    ${typen}    Evaluate    type($n)

    ${n}    Convert To Integer    ${n}

    ${typen}    Evaluate    type($n)

Teste 4 - Convert To Number
    ${n}  Set Variable    123
    
    ${typen}    Evaluate    type($n)

    ${n}    Convert To Number    ${n}

    ${typen}    Evaluate    type($n)
    Log To Console    ${n}

Teste 5 - Convert To String
    ${T}  Set Variable    ${True}
    ${typeT}    Evaluate    type($T)

    ${t}    Convert To String    ${T}
    ${typet}    Evaluate    type($t)