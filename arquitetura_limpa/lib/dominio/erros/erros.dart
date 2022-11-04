abstract class ExceptionPesquisa implements Exception {}

class TextoInvalido implements ExceptionPesquisa {}

class DataSourceError implements ExceptionPesquisa {
  final String mensagem;

  DataSourceError(this.mensagem);
}
