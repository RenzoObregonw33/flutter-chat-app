import 'package:chat/global/environment.dart';
import 'package:chat/models/usuario.dart';
import 'package:chat/models/mensajes_response.dart';
import 'package:chat/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatServices with ChangeNotifier {
  Usuario? usuarioPara; // Nullable - inicialmente null

  Future<List<Mensaje>> getChat(String usuarioId) async {
    final ap = await AuthService.getToken();
    
    final resp = await http.get(
      Uri.parse('${Environment.apiUrl}/mensajes/$usuarioId'),
      headers: {
        'Content-Type': 'application/json',
        'x-token': ap ?? '' 
      }
    );
    
    final mensajeResp = mensajesResponseFromJson(resp.body);

    return mensajeResp.mensajes;
  }
}
 