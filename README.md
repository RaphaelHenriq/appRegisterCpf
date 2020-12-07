# appRegisterCpf

O RegisterCpf é um aplicativo de fins de aprendizado com foco em utilização do CoreData e requisição de dados de API. O aplicativo consiste primeiro em registrar números de CPFs, segundo em armazenar estes números em uma lista, e terceiro consultar uma tela de serviços.

- Na primeira ocorrerá o registro dos números, aonde há regras para que o usuário preencha apenas 11 números, sem letras, pontuações e caracteres especiais. Essas regras expostas ao usuário através de alertas (UIAlertController), sendo necessário ação dele para continuar. 
- No segundo ocorre a listagem desses registro de CPFs, com o número em questão e a data que foi registrada. Também há a opção do usuário apagar um registro.
- Na terceira, onde o usuário pode consultar os serviços Digio, é uma tela que praticamente todo seu conteúdo é advinda de uma requisição API, através de um json. Essa tela foi feita com um layout mais rigoroso, para demonstrar habilidades de layout, como sombras, deslocamentos horizontais e renderização de imagens. Também foi desenvolvido respostas para possíveis erros na requisição, como erros de URL, erros Parsing e erros de internet
- Arquitetura escolhida foi MVVM, com modularização e injeção de dependência em muitas classes. 
- Para navegação foi desenvolvida uma TabBarController e NavigationController, além também de uma BaseViewController geral para ser herdada pelas outras ViewControllers. Vale ressaltar a tela de Informação presente na Navigationcontroller, que gera informações pertinentes para a tela RegisterCpf e ListingCpf.
- Todos os arquivos foram bem dividos para que tivesse um arquivo para Strings, para Extensions, para serviços de API e URLs.
- Foi realizado testes unitários em funções de retorno da RegisterViewModel, onde ocorre a verificação do estado do campo que é preenchido o CPF. Também há uma classe de mock para esses testes, facilitando a utilização e organização do código.
