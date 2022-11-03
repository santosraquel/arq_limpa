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
    final resultado = await casoUso('Raquel');
    // expect(resultado, isA<Right>());
    // expect(resultado.getOrElse(() => null), isA<List<ResultadoPesquisa>>());
    var nulo = null;
    expect(resultado | nulo, isA<List<ResultadoPesquisa>>());
  });
}
