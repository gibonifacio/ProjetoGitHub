# ProjetoGitHub


A solução foi desenvolvida em Swift, utilizando o framework UIKit para a criação da interface do projeto. Foram implementadas duas UITableViews: uma para exibir os dados dos repositórios e outra para os pull requests. Durante o desenvolvimento, utilizei a biblioteca nativa UIKit e o pacote Kingfisher, que foi utilizado para converter a url de imagem do usuario em UIImage e armazenar as  imagens em cache, para não requisitar toda vez a imagem quando a tela é carregada.

A arquitetura utilizada foi MVVM. Para melhor organização do projeto, as estruturas foram divididas em pastas específicas:

- Repository e Pull Request: cada uma com arquivos dedicados aos respectivos modelos.
- Enum: para centralizar os erros listados no projeto.
- Service: para lidar com as requisições de rede.
  
Na pasta Service, criei um protocolo chamado NetworkServiceProtocol, para aplicar a função no arquivo NetworkService e em seu Mock. A classe NetworkService conforma ao protocolo, implementando uma função responsável por validar a URL, armazenar os dados e retorna-los em uma variável do tipo Data.


Nos arquivos RepositoryManager e PullRequestManager, o retorno da função do NetworkService é armazenado em uma variável, que então, decodifica os dados com base nas Structs, e retorna um objeto do tipo GitHubAPI e um array de PullRequest, respectativamente.

Na minha ViewModel, eu possuo uma função que retorna o resultado da requisição, para ser utilizado na minha View. . Além disso, as Views foram organizadas com pastas para seus respectivos protocolos Delegate e DataSource.

Por fim, criei o Mock que conforma ao NetworkServiceProtocol, e implementei a função para ter um JSONFake para testar a API de Repository. Tive algumas dificuldades em fazer os testes, e por isso, só realizei um teste que faz a injeção de dependência com o mock, e verifica se os dados não são nulos e o valor do nome do usuário. 
