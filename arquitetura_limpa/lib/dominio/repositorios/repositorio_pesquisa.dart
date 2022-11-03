import 'package:arquitetura_limpa/dominio/entidades/resultado_pesquisa.dart';
import 'package:arquitetura_limpa/dominio/erros/erros.dart';
import 'package:dartz/dartz.dart';

abstract class RepositorioPesquisa {
  Future<Either<ExceptionPesquisa, List<ResultadoPesquisa>>> pesquisa(
      String pesquisaTexto);
}
