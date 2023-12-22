import 'dart:convert';

import '../utils/constant.dart';
import 'package:http/http.dart' as http;

Future<String> generateResponse(String prompt) async {
  const apiKey = apiSecretKey;

  var url = Uri.https("api.openai.com", "/v1/chat/completions");

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $apiKey"
    },
    body: jsonEncode({
      "model": "gpt-4-1106-preview",
      "messages": [
        {
          "role": "user",
          "content": prompt,
        }
      ],
      'temperature': 0.7,
      'max_tokens': 200,
      /* 'top_p': 1,
      'frequency_penalty': 0.0,
      'presence_penalty': 0.0,*/
    }),
  );

  // Do something with the response
  Map<String, dynamic> newresponse =
      jsonDecode(utf8.decode(response.bodyBytes));

  if (response.statusCode == 200) {
    // La petición se realizó correctamente.
    // Los datos del usuario se encuentran en el objeto response.body
    print(response.body);
  } else {
    // La petición no se realizó correctamente.
    // El código de error se encuentra en el objeto response.statusCode
    print(response.statusCode);
  }

  return newresponse['choices'][0]['message']['content'];
}
