import 'package:arquitetura_limpa/infraestrutura/modelos/modelo_resultado_pesquisa.dart';

abstract class PesquisaDatasource {

  Future<List<ModeloResultadoPesquisa>obterPesquisa(String pesquisarTexto){

  }
}
