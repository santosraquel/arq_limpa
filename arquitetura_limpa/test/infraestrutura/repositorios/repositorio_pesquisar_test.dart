import 'package:arquitetura_limpa/dominio/entidades/resultado_pesquisa.dart';
import 'package:arquitetura_limpa/dominio/erros/erros.dart';
import 'package:arquitetura_limpa/infraestrutura/dataSource/pesquisa_datasource.dart';
import 'package:arquitetura_limpa/infraestrutura/modelos/modelo_resultado_pesquisa.dart';
import 'package:arquitetura_limpa/infraestrutura/repositorios/repositorio_pesquisar_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class PesquisaDatasourceMock extends Mock implements PesquisaDatasource {}

main() {
  final dataSource = PesquisaDatasourceMock();
  final repositorio = RepositorioPesquisarImpl(dataSource);

  test('Deve retornar uma lista de resultado da pesquisa ', () async {
    when(dataSource.obterPesquisa(any))
        .thenAnswer((_) async => <ModeloResultadoPesquisa>[]);

    final resultado = await repositorio.pesquisa("Raquel");

    expect(resultado | null, isA<List<ResultadoPesquisa>>());
  });

  test('Deve retornar um DataSourceError se o dataSource falhar ', () async {
    when(dataSource.obterPesquisa(any)).thenThrow(Exception());

    final resultado = await repositorio.pesquisa("Raquel");

    expect(resultado.fold((l) => l, (r) => r), isA<DataSourceError>());
  });
}
