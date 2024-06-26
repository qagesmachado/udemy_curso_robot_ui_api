*** Settings ***

*** Variables ***
# robot -d ./results -L trace  .\src\2_builtin\2_7_listas_dicionarios.robot

&{dict1}    nome=Gustavo    sobrenome=Silva    idade=30
@{list1}    banana     morango     uva     melancia
*** Test Cases ***

Teste - Dicionário

    # ${dict1}    Create Dictionary    nome=Gustavo    sobrenome=Silva    idade=30

    Log To Console   ${dict1}    # CERTO
    # Log To Console   &{dict1}  # ERRADO

    Log To Console   ${dict1.nome}  
    Log To Console   ${dict1.sobrenome}
    Log To Console   ${dict1.idade}  
        
    FOR  ${i}  IN  &{dict1}
        Log To Console    ${i} 
    END

Teste - Lista
    
    # ${list1}    Create List    banana     morango     uva     melancia
    Log To Console    ${list1} 

    Log To Console    ${list1}[0]
    Log To Console    ${list1}[1]
    Log To Console    ${list1}[2]
    Log To Console    ${list1}[3]
    # Log To Console    ${list1}[4]
    
    FOR  ${j}  IN  @{list1}
        Log To Console    ${j}
    END
    

