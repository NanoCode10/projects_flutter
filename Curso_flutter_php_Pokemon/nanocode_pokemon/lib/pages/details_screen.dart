import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _FechaAtras(),
          _NombreNumeroPokemon(),
          _TipoPokemon(),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Altura:",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(
                              "9999",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Peso:",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(
                              "88888",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _FechaAtras() {
    return Positioned(
      top: 35,
      left: 5,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _NombreNumeroPokemon() {
    return Positioned(
      top: 90,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Nombre',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "#" + "000",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _TipoPokemon() {
    return Positioned(
      top: 130,
      left: 25,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Ghost",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }
}
