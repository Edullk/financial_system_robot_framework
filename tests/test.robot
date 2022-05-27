*** Settings ***
Library    Browser
Library    DateTime

*** Test Cases **

Verifica abertura da página
    New Browser           chromium                  
    New Page              http://localhost:3000/
    Get Text              h1                        contains    Sistema Financeiro    
    Get Element States    id=month_area             contains    visible
    Get Element States    id=input_area             contains    visible
    Get Element States    id=table_area             contains    visible


Verifica scroll de meses
    New Page                   http://localhost:3000/
    ${current_month_title}=    Get Text                  id=mount_title 
    Click                      id=arrow_rigth
    ${new_month_title}=        Get Text                  id=mount_title 
    Should Not Be Equal        ${current_month_title}    ${new_month_title}
    Click                      id=arrow_left
    ${new_month_title}=        Get Text                  id=mount_title
    Should Be Equal            ${current_month_title}    ${new_month_title}

Validacoes de data
    New Page     http://localhost:3000/
    ${date}=     Get Current Date          result_format=%m%d%Y
    Type Text    id=date_input             ${date}

Validacoes de Categoria
    New Page             http://localhost:3000/
    Select Options By    id=category               value    rent

Validacoes de titulo
    New Page     http://localhost:3000/
    Type Text    id=title                  Casa

Validacoes de valor
    New Page     http://localhost:3000/
    Type Text    id=value                  1000

Verifica a adição de nova despesa
    New Page             http://localhost:3000/
    ${date}=             Get Current Date                  result_format=%m%d%Y
    ${date_format}=      Get Current Date                  result_format=%d/%m/%Y
    Type Text            id=date_input                     ${date}                   
    Select Options By    id=category                       value                     rent
    Type Text            id=title                          Casa
    Type Text            id=value                          1000
    Click                id=add
    Get Text             id=table_item_date                contains                  ${date_format}
    Get Text             id=table_item_category_Aluguel    contains                  Aluguel
    Get Text             id=table_item_name                contains                  Casa
    Get Text             id=table_item_value               contains                  R$ 1000

Verifica valor e soma des despesas
    New Page             http://localhost:3000/
    ${date}=             Get Current Date                      result_format=%m%d%Y
    Type Text            id=date_input                         ${date}                 
    Select Options By    id=category                           value                   rent
    Type Text            id=title                              Casa
    Type Text            id=value                              1000
    Click                id=add
    Get Text             id=table_item_category_Aluguel        contains                Aluguel
    Get Text             id=Despesas_1000                      contains                R$ 1000
    Type Text            id=date_input                         ${date}                 
    Select Options By    id=category                           value                   food
    Type Text            id=title                              Jantar
    Type Text            id=value                              100
    Click                id=add
    Get Text             id=table_item_category_Alimentação    contains                Alimentação
    Get Text             id=Despesas_1100                      contains                R$ 1100

Verifica a adição de nova receita
    New Page             http://localhost:3000/
    ${date}=             Get Current Date                  result_format=%m%d%Y
    ${date_format}=      Get Current Date                  result_format=%d/%m/%Y
    Type Text            id=date_input                     ${date}                   
    Select Options By    id=category                       value                     salary
    Type Text            id=title                          Pagamento
    Type Text            id=value                          2000
    Click                id=add
    Get Text             id=table_item_date                contains                  ${date_format}
    Get Text             id=table_item_category_Salário    contains                  Salário
    Get Text             id=table_item_name                contains                  Pagamento
    Get Text             id=table_item_value               contains                  R$ 2000

Verifica valor e soma das receitas
    New Page             http://localhost:3000/
    ${date}=             Get Current Date                  result_format=%m%d%Y
    Type Text            id=date_input                     ${date}                 
    Select Options By    id=category                       value                   salary
    Type Text            id=title                          Pagamento
    Type Text            id=value                          2000
    Click                id=add
    Get Text             id=table_item_category_Salário    contains                Salário
    Get Text             id=Receitas_2000                  contains                R$ 2000
    Type Text            id=date_input                     ${date}                 
    Select Options By    id=category                       value                   salary
    Type Text            id=title                          Ações
    Type Text            id=value                          4000
    Click                id=add
    Get Text             id=Receitas_6000                  contains                R$ 6000

Verifica valor e resultado do balanço

    New Page             http://localhost:3000/
    ${date}=             Get Current Date                  result_format=%m%d%Y
    Type Text            id=date_input                     ${date}                 
    Select Options By    id=category                       value                   salary
    Type Text            id=title                          Pagamento
    Type Text            id=value                          2000
    Click                id=add
    Get Text             id=table_item_category_Salário    contains                Salário

    Type Text            id=date_input                     ${date}     
    Select Options By    id=category                       value       rent
    Type Text            id=title                          Casa
    Type Text            id=value                          1000
    Click                id=add
    Get Text             id=table_item_category_Aluguel    contains    Aluguel

    Get Text    id=Balanço_1000    contains    R$ 1000
