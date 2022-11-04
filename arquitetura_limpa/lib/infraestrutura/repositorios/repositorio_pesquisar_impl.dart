import 'package:arquitetura_limpa/dominio/erros/erros.dart';
import 'package:arquitetura_limpa/dominio/entidades/resultado_pesquisa.dart';
import 'package:arquitetura_limpa/dominio/repositorios/repositorio_pesquisa.dart';
import 'package:arquitetura_limpa/infraestrutura/dataSource/pesquisa_datasource.dart';
import 'package:dartz/dartz.dart';

class RepositorioPesquisarImpl implements RepositorioPesquisa {
  final PesquisaDatasource dataSource;

  RepositorioPesquisarImpl(this.dataSource);

  @override
  Future<Either<ExceptionPesquisa, List<ResultadoPesquisa>>> pesquisa(
      String pesquisaTexto) async {
    try {
      final resultado = await dataSource.obterPesquisa(pesquisaTexto);
      return Right(resultado);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
