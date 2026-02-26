import 'package:flutter/material.dart';

void main() {
  runApp(PokemonStarterApp()); // Responsável por rodar a aplicação
}

class PokemonStarterApp extends StatelessWidget {
  const PokemonStarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ), //É o que utilizamos para mudar cor, design... estilização do app
      home: PokemonStarterScreen(),
    );
  }
}

class PokemonStarterScreen extends StatefulWidget {
  const PokemonStarterScreen({super.key});

  @override
  State<PokemonStarterScreen> createState() => _PokemonStarterScreenState();
}

  final starters = [
    Pokemon(nome: "Charmander", imagem: "images/charmander.png"),
    Pokemon(nome: "Bulbassaur", imagem: "images/bulbassaur.png"),
    Pokemon(nome: "Squirtle", imagem: "images/squirtle.png"),
  ];
class _PokemonStarterScreenState extends State<PokemonStarterScreen> {

  Pokemon pokemonSelecionado = starters.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PokeHeader(text: "Escolha seu pokemon inicial"),
          PokemonCard(pokemon: pokemonSelecionado),
        ],
      ),
    );
  }
}

// Componente para o título
class PokeHeader extends StatelessWidget {
  const PokeHeader({super.key, required this.text});
  //Como declaramos a String text como "final", precisamos colocar o required no parâmetro

  //Colocando a variável de parâmetro dentro das chaves da super.key, é possível declarar a
  //variável escolhendo a ordem dos parâmetros na chamada do método (observar a chamada do método no statefull)

  final String text; //Como o stateless não muda, incluímos o título do app aqui

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}

//Classe do pokemon
class Pokemon {
  final String nome;
  final String imagem;

  Pokemon({required this.nome, required this.imagem});
}

//Componente do card do pokemon
class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(pokemon.imagem, width: 250, height: 250),
        Text(
          pokemon.nome,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
