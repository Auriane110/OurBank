Algoritmo "OurBank"
tipo
    cliente = registro
    nome: caractere
    saldo: real
    numeroDaConta: inteiro
    fimregistro

    pessoa = registro
    movimentacao : caractere
    valor: real
    numeroDaConta: inteiro
    fimregistro

Var cont: inteiro
    contEx: inteiro
    clientes: vetor[1..100] de cliente
    extrato: vetor[1..300] de pessoa
    clienteNumero: inteiro
procedimento Menu()
  var x,escolhaMenu,w,aux: inteiro
  inicio
         escreval("==================Menu==================")
         escreval("1- Para cadastrar cliente")
         escreval("2- Já e cliente")
         escreval("3- Listar todos os clientes")
         escreval("4- Sair")
         leia(escolhaMenu)
         escolha (escolhaMenu)
            caso 1
                 CadastroCliente()
            caso 2
                 w <- 1
                 x <- 0
                 escreval("Digite o numero da conta do cliente: ")
                 leia(clienteNumero)
                 enquanto w<=cont faca
                   aux <- 0
                   aux <- clientes[w].numeroDaConta
                   se (clienteNumero = aux) entao
                      SubMenu(w)
                      x <- 1
                   senao
                      x <- 0
                   fimse
                   w <- w+1
                 fimenquanto
                 se x = 0 entao
                    escreval("Este cliente não existe OU Você escolheu sair.")
                    //Menu()
                 fimse
            caso 3
                 ListaCliente()
            caso 4
                 escreval("Sistema encerrado com SUCESSO")
            outrocaso
                   Menu()
         fimescolha
fimprocedimento

procedimento SubMenu(y: inteiro)
  var escolhaMenus,auxx,x,z,numeross: inteiro
      quantidade,aux,trans,auxT: real
  inicio
         escreval("==================Bem-Vindo==================")
         escreval("Saldo da conta: ", clientes[y].saldo)
         escreval("1- Saque")
         escreval("2- Deposito")
         escreval("3- Transferencia")
         escreval("4- Extrato")
         escreval("5- Sair")
         leia(escolhaMenus)
         escolha escolhaMenus
            caso 1
                 se contEx <= 300 entao
                    quantidade <- 0
                    escreval("Digite a quantidade de dinheiro que voce quer retirar: ")
                    leia(quantidade)
                    se quantidade <= clientes[y].saldo entao
                       aux <- saque(clientes[y].saldo,quantidade)
                       clientes[y].saldo <- 0
                       clientes[y].saldo <- aux
                       escreval("Saque de ",quantidade," efeituado com Sucesso")
                       contEx <- contEx + 1
                       extrato[contEx].numeroDaConta <- clientes[y].numeroDaConta
                       extrato[contEx].valor <- quantidade
                       extrato[contEx].movimentacao <- "Saque"
                       SubMenu(y)
                    senao
                       escreval("Saldo insuficiente")
                       SubMenu(y)
                    fimse
                 senao
                      escreval("Não é possivel realizar transações")
                 fimse
            caso 2
                 quantidade <- 0
                 aux <- 0
                 escreval("Digite a quantidade de dinheiro que voce quer Depositar: ")
                 leia(quantidade)
                 se quantidade > 0 entao
                    aux <- deposito(clientes[y].saldo,quantidade)
                    clientes[y].saldo <- 0
                    clientes[y].saldo <- aux
                    escreval("Deposito de ",quantidade," efeituado com Sucesso")
                    contEx <- contEx + 1
                    extrato[contEx].numeroDaConta <- clientes[y].numeroDaConta
                    extrato[contEx].valor <- quantidade
                    extrato[contEx].movimentacao <- "Deposito"
                    SubMenu(y)
                 senao
                    escreval("Nenhum valor depositado")
                    SubMenu(y)
                 fimse
            caso 3
                 quantidade <- 0
                 aux <- 0
                 auxx <- 0
                 escreval("Digite o numero da conta que voce quer transferir o dinheiro: ")
                 leia(auxx)
                 escreval("Digite a quantidade de dinheiro que voce quer transferir: ")
                 leia(quantidade)
                 x <- 1
                 enquanto x<=cont faca
                   numeross <- clientes[x].numeroDaConta
                   se (auxx = numeross)entao
                      z <- x
                   fimse
                   numeross <- 0
                   x <- x+1
                 fimenquanto
                 auxT <- 0
                 auxT <- clientes[y].saldo
                 se quantidade > 0 entao
                    se quantidade < auxT entao
                       aux <- saque(clientes[y].saldo,quantidade)
                       clientes[y].saldo <- 0
                       clientes[y].saldo <- aux
                       aux <- 0
                       aux <- deposito(clientes[z].saldo,quantidade)
                       clientes[z].saldo <- 0
                       clientes[z].saldo <- aux
                       escreval("Deposito de ",quantidade," efeituado com Sucesso")
                       contEx <- contEx + 1
                       extrato[contEx].numeroDaConta <- clientes[y].numeroDaConta
                       extrato[contEx].valor <- quantidade
                       extrato[contEx].movimentacao <- "Transferencia"
                       contEx <- contEx + 1
                       extrato[contEx].numeroDaConta <- clientes[z].numeroDaConta
                       extrato[contEx].valor <- quantidade
                       extrato[contEx].movimentacao <- "Transferencia"
                       SubMenu(y)
                    senao
                         escreval("Saldo insuficiente para realizar transferencia.")
                    fimse
                 senao
                    escreval("Nenhum valor Para transferir")
                    SubMenu(y)
                 fimse
            caso 4
                 escreval("================Extrato================")
                 aux <- clientes[y].numeroDaConta
                 numeross <- 0
                 x <- 1
                 z <- 1
                 enquanto x<=contEx faca
                   numeross <- extrato[x].numeroDaConta
                   se (aux = numeross)entao
                      escreval(extrato[x].movimentacao," de : ",extrato[x].valor)
                   fimse
                   numeross <- 0
                   x <- x+1
                 fimenquanto
                 SubMenu(y)
            caso 5
                 escreval("SubMenu fechado com secesso")
                 clienteNumero <- 0
                 Menu()
            outrocaso
                 SubMenu(y)
         fimescolha
fimprocedimento


procedimento CadastroCliente()
  var
  inicio
        escreval("-----------Cadastro de Cliente-----------")
        cont <- cont + 1
        escreval("Digite o nome do cliente")
        leia(clientes[cont].nome)
        escreval("Digite o saldo da conta do cliente")
        leia(clientes[cont].saldo)
        clientes[cont].numeroDaConta <- 100000000+cont
        escreval("Cadastro concluido com SUCESSO Número da conta do cliente cadastrado: ",clientes[cont].numeroDaConta)
        Menu()
fimprocedimento

procedimento ListaCliente()
   var i: inteiro
   inicio
         escreval("===========Lista de Clientes===========")
         se cont > 0 entao
            para i de 1 ate cont faca
               escreval("------------Cliente: ",i,"------------")
               escreval("Nome do cliente: ",clientes[i].nome)
               escreval("Saldo da conta do cliente: ",clientes[i].saldo)
               escreval("Número da conta do cliente: ",clientes[i].numeroDaConta)
               //i <- i+1
            fimpara
            Menu()
         senao
              escreval("Nenhum cliente cadastrado")
              Menu()
         fimse
fimprocedimento

funcao saque(x,y: real): real
var aux: real
inicio
   aux <- x - y
   retorne aux
fimfuncao

funcao deposito(x,y: real): real
var aux: real
inicio
   aux <- x + y
   retorne aux
fimfuncao

Inicio
      cont <- 0
      contEx <- 0
      escreval("++++++++++++++++++++++++++++++++++++++++")
      escreval("------ESTE PROGRAMA E UM SIMULADOR------")
      escreval("---SISTEMA DE GERENCIAMENTO DE CONTAS---")
      escreval("----------Bem-Vindo ao Our Bank----------")
      escreval("++++++++++++++++++++++++++++++++++++++++")
      escreval("")
      Menu()



Fimalgoritmo