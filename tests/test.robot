*** Settings ***
Library   Browser

*** Variables ***
${date} =	Get Current Date

*** Test Cases **

Verifica abertura da página
    New Page              http://localhost:3000/
    Get Text              h1               contains    Sistema Financeiro           
    Get Element States    id=month_area    contains    visible
    Get Element States    id=input_area    contains    visible
    Get Element States    id=table_area    contains    visible


Verifica scroll de meses
    New Browser                 chromium                    headless=false
    New Page                    http://localhost:3000/
    ${current_month_title}=     Get Text                    id=mount_title 
    Click                       id=arrow_rigth
    ${new_month_title}=         Get Text                    id=mount_title 
    Should Not Be Equal         ${current_month_title}      ${new_month_title}
    Click                       id=arrow_left
    ${new_month_title}=         Get Text                    id=mount_title
    Should Be Equal             ${current_month_title}      ${new_month_title}


Validacoes de data
    New Page    http://localhost:3000/
    Type Text   id=date_input  05252022


Validacoes de Categoria
    New Page             http://localhost:3000/
    Select Options By    id=category    value       rent
  

Validacoes de titulo
    New Page    http://localhost:3000/
    Type Text   id=title    Casa

Validacoes de valor
    New Page    http://localhost:3000/
    Type Text   id=value    1000

Verifica a adição de novo gasto
    New Page            http://localhost:3000/
    Type Text           id=date_input           05252022
    sleep                       3    
    Select Options By   id=category             value       rent
    sleep                       3
    Type Text           id=title                Casa
    sleep                       3
    Type Text           id=value                1000
    sleep                       3
    Click               id=add
    sleep                       3
    








