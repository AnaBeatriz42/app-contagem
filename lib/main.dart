import 'package:flutter/material.dart'; //importando o widgth do material do google

void main() {
  runApp(const MyApp());
  /* runApp(MaterialApp) - define  que o nosso app sera do tipo material app
   no materialApp pode add varios parametros, no caso defini que a nossa pagina inicial
   será um conteiner  */
}

//WIDGET RESPONSAVEL POR ESTRUTURAR O APP
class MyApp extends StatelessWidget {
  // criando um widget costumizado chamado myapp (atalho stless)
  const MyApp({Key? key}) : super(key: key); //construtor criado automaticamente

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,//removendo o cartãozinho de debug
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int countP = 0;

  void decrement() {
    setState(() {
      countP--;
    });
    print("Decrement!");
    print(countP);
  }

  void increment() {
    setState(() {
      countP++;
    });
    print("Increment!");
    print(countP);
  }

  bool get isEmpty => countP == 0;
  bool get isFull => countP ==20;

  @override
  Widget build(BuildContext context) {// permite alteração de
    print('Build');
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      // permite montar a estrutura basica de uma tela
      body: Container( //criando container pra poder estilizar a tela inteira
        decoration: const  BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fundo.jpg'),// add imagem para fundo de tela
            fit: BoxFit.cover,// pedindoo pra imagem se adptar a tela em altura
          ),
        ) ,
        child: Column(
          // no corpo da tela cria uma coluna
          mainAxisAlignment: MainAxisAlignment.center,
          //centralizando o eixo central da pagina
          children: [
            //especificação de cada filho dessa coluna
             Text(
          isFull ? 'LOTADO!': 'Pode entrar!',
              style: const TextStyle(
                  fontSize: 26, color: Colors.white, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 32,),//separando texto agor na altura
            Text(
              countP.toString(),
              style: const TextStyle(
                  fontSize: 100,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // filhos da linha
                TextButton(// botão
                  onPressed: isEmpty ? null : decrement, // função do botão
                  style: TextButton.styleFrom(// estilizando o botão
                      backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) :  Colors.white, // add cor
                      // padding: const EdgeInsets.all(32) // definindo espaçamento do texto e da borda do botão  e 32 em cada lado
                      fixedSize: const Size(100,100),// tamanho fixo do botão
                      primary: Colors.black12, // definindo cor ao clicar no botão
                      shape: RoundedRectangleBorder( // arredondando o botão
                          borderRadius: BorderRadius.circular(16)
                      )
                  ) ,
                  child: const Text(
                    'Saiu', //texto do botão
                    style: TextStyle(
                        color: Colors.black, fontSize: 16), //estilizando o texto
                  ),
                ),
                const SizedBox(width: 32,),// cria um widget entre os botões de tamanho 32 na largura

                TextButton(
                  // botão
                  onPressed: isFull ? null : increment, // função do botão
                  style: TextButton.styleFrom(// estilizando o botão
                      backgroundColor: isFull ? Colors.white.withOpacity(0.2) :  Colors.white, // add cor
                      //padding: const EdgeInsets.all(32) // definindo espaçamento do texto e da borda do botão  e 32 em cada lado
                      fixedSize: const Size(100,100),// tamanho fixo do botão
                      primary: Colors.black12, // definindo cor ao clicar no botão
                      shape: RoundedRectangleBorder(// arredondando o botão
                          borderRadius: BorderRadius.circular(16)
                      )
                  ) ,
                  child:const Text(
                    'Entrou',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16), //estilizando o texto), // texto do botão
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}






//WIDGET RESPONSAVEL PELA TELA INICIAL
//class HomePage extends StatelessWidget { // não muda de status
 //  HomePage({Key? key}) : super(key: key);
//}

//MENU SUPERIOR COM BARRA LATERAL COLOCAR DENTRO DO scaffold()
/* appBar: AppBar( // widget para barra superior
        title: Text('Bomédico'),
      ),
      drawer: Drawer(),// cria um menu lateral*/
