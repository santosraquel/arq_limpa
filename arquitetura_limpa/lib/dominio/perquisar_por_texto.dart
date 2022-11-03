import 'package:arquitetura_limpa/dominio/entidades/resultado_pesquisa.dart';
import 'package:arquitetura_limpa/dominio/erros/erros.dart';
import 'package:arquitetura_limpa/dominio/repositorios/repositorio_pesquisa.dart';
import 'package:dartz/dartz.dart';

abstract class PesquisaPorTexto {
  // either é uma classe do dartz
  // método que retorna uma lista dos resultados da pesquisa
  Future<Either<ExceptionPesquisa, List<ResultadoPesquisa>>> call(
      String pesquisarTexto); // call (chamada)
}

class PesquisaPorTextoImpl implements PesquisaPorTexto {
  final RepositorioPesquisa repositorioPesquisa;

  PesquisaPorTextoImpl(this.repositorioPesquisa);

  @override
  Future<Either<ExceptionPesquisa, List<ResultadoPesquisa>>> call(
      String pesquisarTexto) async {
    return repositorioPesquisa.pesquisa(pesquisarTexto);
  }
}
