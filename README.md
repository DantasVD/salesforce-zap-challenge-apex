# Desafio grupo ZAP CRM

Pequeno componente em lwc para consultar e armazenar dados de uma api na conta.

## Abordagem escolhida

Foi criado um componente em lwc que é apenas um botão e abre um modal que funciona em 2 fases sendo a primeira a fase de inserção do CEP e consulta a segunda apenas uma visualização do retorno com um botão para salvar.

## Classes utilizadas e seus objetivos
* BuscaCepController - Classe de controller do lwx utilizada para isolar e realizar a interação da tela com o código apex
* ViacepModel - Classe de model para realizar o parse do retorno da requisição e facilitar o trabalho de tratamento de dados além de poder ser reutilizada em qualquer outro local      do sistema que queira utilizar o mesmo tipo de dados vindo da api do viacep.
* BuscaCepCallout - Classe de callout feita pra isolar a requisição facilitando assim a reutilização da mesma
* AccountService - Classe de serviço para conta
* Accounts - Classe de domínio para a conta
* AccountsSelector - Classe de Selector para a conta

# Observações
  * Foram utilizadas classes da fflib
  * Foi utilizado unity of work na service para casos futuros de alteração em massa de contas do mesmo CEP tenhamos maior controle sobre os sucessos e falhas na atualização de dados
  
 



## Referências 

- [Camada de domínio e selector](https://trailhead.salesforce.com/pt-BR/content/learn/modules/apex_patterns_dsl)
- [Camada de serviço](https://trailhead.salesforce.com/pt-BR/content/learn/modules/apex_patterns_sl)
