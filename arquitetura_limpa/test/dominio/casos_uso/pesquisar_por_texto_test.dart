import 'dart:js_util';

import 'package:arquitetura_limpa/dominio/entidades/resultado_pesquisa.dart';
import 'package:arquitetura_limpa/dominio/erros/erros.dart';
import 'package:arquitetura_limpa/dominio/perquisar_por_texto.dart';
import 'package:arquitetura_limpa/dominio/repositorios/repositorio_pesquisa.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class RepositorioPesquisaMock extends Mock implements RepositorioPesquisa {}

main() {
  final repositorioPesquisa = RepositorioPesquisaMock();

  final casoUso = PesquisaPorTextoImpl(
      repositorioPesquisa); // criando uma instancia de PesquisaPorTextoImpl

  test('Deve retornar uma lista do resultado da pesquisa', () async {
    // when (quando) - mockito
    when(repositorioPesquisa.pesquisa(any))
        .thenAnswer((_) async => Right(<ResultadoPesquisa>[]));

    final resultado = await casoUso("Raquel");
    // expect(resultado, isA<Right>());
    // expect(resultado.getOrElse(() => null), isA<List<ResultadoPesquisa>>());
    expect(resultado | null, isA<List<ResultadoPesquisa>>());
  });

  test('Deve retornar um exception caso o texto seja inválido', () async {
    // when (quando) - mockito
    when(repositorioPesquisa.pesquisa(any.toString()))
        .thenAnswer((_) async => Right(<ResultadoPesquisa>[]));
    var resultado = await casoUso(NullRejectionException);

    // expect(resultado.isLeft(), true);
    expect(resultado.fold((l) => l, (r) => r), isA<TextoInvalido>());

    resultado = await casoUso("");

    expect(resultado.fold((l) => l, (r) => r), isA<TextoInvalido>());
  });
}
