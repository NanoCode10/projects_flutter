import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanocode_pokemon/controller/getDataController.dart';
import 'package:nanocode_pokemon/pages/details_screen.dart';

import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final getDataController = Get.put(GetDataController());

  @override
  void initState() {
    getDataController.geDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: !getDataController.isLoading.value
            ? Stack(
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
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 1.4),
                            itemCount: 151,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
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
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                        color: getDataController
                                                    .getDataModel
                                                    .value
                                                    .results[index]
                                                    .pokTipo ==
                                                "Grass"
                                            ? Colors.greenAccent
                                            : getDataController
                                                        .getDataModel
                                                        .value
                                                        .results[index]
                                                        .pokTipo ==
                                                    "Fire"
                                                ? Colors.redAccent
                                                : getDataController
                                                            .getDataModel
                                                            .value
                                                            .results[index]
                                                            .pokTipo ==
                                                        "Water"
                                                    ? Colors.blueAccent
                                                    : getDataController
                                                                .getDataModel
                                                                .value
                                                                .results[index]
                                                                .pokTipo ==
                                                            "Bug"
                                                        ? Colors
                                                            .lightGreenAccent
                                                        : getDataController
                                                                    .getDataModel
                                                                    .value
                                                                    .results[
                                                                        index]
                                                                    .pokTipo ==
                                                                "Poison"
                                                            ? Colors
                                                                .purpleAccent
                                                            : getDataController
                                                                        .getDataModel
                                                                        .value
                                                                        .results[
                                                                            index]
                                                                        .pokTipo ==
                                                                    "Electric"
                                                                ? Colors.amber
                                                                : getDataController
                                                                            .getDataModel
                                                                            .value
                                                                            .results[index]
                                                                            .pokTipo ==
                                                                        "Groud"
                                                                    ? Colors.brown
                                                                    : getDataController.getDataModel.value.results[index].pokTipo == "Fighting"
                                                                        ? Colors.orange
                                                                        : getDataController.getDataModel.value.results[index].pokTipo == "Psychic"
                                                                            ? Colors.pinkAccent
                                                                            : getDataController.getDataModel.value.results[index].pokTipo == "Dragon"
                                                                                ? Colors.blueGrey
                                                                                : getDataController.getDataModel.value.results[index].pokTipo == "Rock"
                                                                                    ? Colors.grey
                                                                                    : getDataController.getDataModel.value.results[index].pokTipo == "Ice"
                                                                                        ? Colors.lightBlue
                                                                                        : Colors.black,
                                      ),
                                      child: Stack(
                                        children: [
                                          _PokeballInterno(),
                                          _ImagenPokemon(index),
                                          _NombrePokemon(index),
                                          _TipoPokemon(index),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DetailsScreen(
                                          heroTag: index,
                                          Wpoknom: getDataController
                                              .getDataModel
                                              .value
                                              .results[index]
                                              .pokNom,
                                          WpokNum: getDataController
                                              .getDataModel
                                              .value
                                              .results[index]
                                              .pokNum,
                                          WpokTipo: getDataController
                                              .getDataModel
                                              .value
                                              .results[index]
                                              .pokTipo,
                                          WpokImg: getDataController
                                              .getDataModel
                                              .value
                                              .results[index]
                                              .pokImg,
                                          WpokAltura: getDataController
                                              .getDataModel
                                              .value
                                              .results[index]
                                              .pokAltura,
                                          WpokPeso: getDataController
                                              .getDataModel
                                              .value
                                              .results[index]
                                              .pokPeso,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
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

  Widget _PokeballInterno() {
    return Positioned(
      bottom: -9,
      right: -10,
      child: Image.asset(
        'images/pokeball.png',
        height: 100,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _ImagenPokemon(index) {
    return Positioned(
      bottom: 5,
      right: 5,
      child: Hero(
        tag: index,
        child: CachedNetworkImage(
          imageUrl: getDataController.getDataModel.value.results[index].pokImg,
          height: 80,
          fit: BoxFit.fitHeight,
          placeholder: ((context, url) => Center(
                child: CircularProgressIndicator(),
              )),
        ),
      ),
    );
  }

  Widget _NombrePokemon(index) {
    return Positioned(
      top: 30,
      left: 15,
      child: Text(
        getDataController.getDataModel.value.results[index].pokNom,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _TipoPokemon(index) {
    return Positioned(
      top: 55,
      left: 15,
      child: Container(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: Text(
            getDataController.getDataModel.value.results[index].pokTipo,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Colors.black.withOpacity(0.5),
        ),
      ),
    );
  }
}
