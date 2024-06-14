*** Settings ***

*** Variables ***
# robot -d ./results -L trace  .\src\2_builtin\2_5_for_loop.robot

*** Test Cases ***
Teste 1 - For Loop

    FOR  ${i}  IN RANGE  5
        Log To Console    ${i}
        Sleep    1        
    END
    
Teste 2 - Exit For if

    ${a}    Set Variable     1

    FOR  ${i}  IN RANGE  60
        Log To Console    ${i}
        
        ${x}    Evaluate    ${i}+${a}

        Exit For Loop If    ${x}==6

        Sleep    1        
    END

Teste 3 - Exit for loop
    
    FOR  ${i}  IN RANGE  60
        Log To Console    ${i}
    
            Exit For Loop

        Sleep    1        
    END