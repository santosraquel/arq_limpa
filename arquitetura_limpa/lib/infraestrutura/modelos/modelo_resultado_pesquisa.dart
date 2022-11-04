// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:arquitetura_limpa/dominio/entidades/resultado_pesquisa.dart';

class ModeloResultadoPesquisa extends ResultadoPesquisa {
  final String titulo;
  final String subtitulo;
  final String imagem;

  ModeloResultadoPesquisa(
      {required this.titulo, required this.subtitulo, required this.imagem});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titulo': titulo,
      'subtitulo': subtitulo,
      'imagem': imagem,
    };
  }

  factory ModeloResultadoPesquisa.fromMap(Map<String, dynamic> map) {
    return ModeloResultadoPesquisa(
      map['titulo'] as String,
      map['subtitulo'] as String,
      map['imagem'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModeloResultadoPesquisa.fromJson(String source) =>
      ModeloResultadoPesquisa.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
