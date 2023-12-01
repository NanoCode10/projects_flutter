import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nanocode_pokemon/models/getDataModel.dart';

class GetDataController extends GetxController {
  var isLoading = false.obs;
  var getDataModel = GetDataModel(results: []).obs;

  geDataFromApi() async {
    isLoading.value = true;
    try {
      var response = await Dio().get(
          'http://192.168.11.125:90/PERSONAL_ApiPokemon/controller/pokemon.php?op=listar');
      final datax = json.decode(response.data);
      getDataModel.value = GetDataModel.fromJson(datax);
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
