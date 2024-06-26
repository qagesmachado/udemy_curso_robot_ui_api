*** Settings ***

*** Variables ***
# -d -> Diretório destino onde será salvo o resultado dos testes
    # robot .\src\1_general_section\executando_testes.robot
    # robot -d ./results .\src\1_general_section\executando_testes.robot

## -L -> Nível de log (info, debug, trace)
    # robot -d ./results -L info  .\src\1_general_section\executando_testes.robot
    # robot -d ./results -L debug  .\src\1_general_section\executando_testes.robot
    # robot -d ./results -L trace  .\src\1_general_section\executando_testes.robot

# -i -> Executa teste segundo tag
    # robot -d ./results -i regression  .\src\1_general_section\executando_testes.robot
    # robot -d ./results -i performance  .\src\1_general_section\executando_testes.robot
    # robot -d ./results -i smoke .\src\1_general_section\executando_testes.robot

# -e -> Executa teste segundo tag
    # robot -d ./results -e regression  .\src\1_general_section\executando_testes.robot
    # robot -d ./results -e performance  .\src\1_general_section\executando_testes.robot
    # robot -d ./results -e smoke .\src\1_general_section\executando_testes.robot

# -t -> Executa um teste específico da suite de teste
    # robot -d ./results -t 'Teste 1' .\src\1_general_section\executando_testes.robot
    # robot -d ./results -t 'Teste 2' .\src\1_general_section\executando_testes.robot

# -N -> Nome no titulo do arquivo de log
    # robot -N 'Teste 2' -d ./results  .\src\1_general_section\executando_testes.robot

# -l -> Nome para o aqui de log
    # robot -d ./results -l 'Arquivo de log' .\src\1_general_section\executando_testes.robot

# -v -> Atribui valor a variaveis
    # robot -d ./results -v X:1 -v Y:3 .\src\1_general_section\executando_testes.robot
${X}  
${Y}  
*** Test Cases ***

Teste 1
    [Tags]  regression  performance
    ${X}  Set Variable    3
    ${Y}  Set Variable    3

    Should Be Equal  ${X}  ${Y}

Teste 2
    [Tags]  smoke  regression
    Should not Be Empty  oi
    Should Be Empty  ${EMPTY}
