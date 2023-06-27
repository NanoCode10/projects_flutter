import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _imagenFondo(),
          _textoTitulo(),
          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1.4),
                    itemCount: 151,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 5,
                        ),
                        child: InkWell(
                          child: SafeArea(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                                color: Colors.greenAccent,
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Image.asset(
                                      'images/pokeball.png',
                                      height: 100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _imagenFondo() {
    return Positioned(
      top: -50,
      right: -50,
      child: Image.asset(
        'images/pokeball.png',
        fit: BoxFit.fitWidth,
        width: 200,
      ),
    );
  }

  Widget _textoTitulo() {
    return Positioned(
      top: 100,
      left: 20,
      child: Text(
        'Pokedex',
        style: TextStyle(
          color: Colors.black.withOpacity(0.7),
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    );
  }
}
