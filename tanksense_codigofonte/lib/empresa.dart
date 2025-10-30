// empresa.dart
import 'entidade_base.dart';

class Empresa extends EntidadeBase {
  final String _nome;
  final String _cnpj;
  final List<String> _departamentos = [];

  Empresa(super.id, this._nome, this._cnpj);

  String get nome => _nome;
  String get cnpj => _cnpj;
  List<String> get departamentos => List.unmodifiable(_departamentos);

  @override
  void exibirDados() {
    print('🏢 DADOS DA EMPRESA');
    print('─' * 30);
    print('ID: $id');
    print('Nome: $_nome');
    print('CNPJ: $_cnpj');
    print('Departamentos: ${_departamentos.length}');
    print('Tipo: ${obterTipo()}');
    print('─' * 30);
  }

  @override
  String obterTipo() {
    return "Empresa Industrial";
  }

  void adicionarDepartamentos(List<String> novosDepartamentos) {
    for (int i = 0; i < novosDepartamentos.length; i++) {
      String depto = novosDepartamentos[i];
      if (!_departamentos.contains(depto)) {
        _departamentos.add(depto);
        print('✅ Departamento adicionado: $depto');
      }
    }
  }

  Map<String, dynamic> toMapCompleto() {
    Map<String, dynamic> mapa = toMap();
    mapa['departamentos'] = _departamentos;
    mapa['qtd_departamentos'] = _departamentos.length;
    return mapa;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'idEmpresa': id,
      'nome': _nome,
      'cnpj': _cnpj,
    };
  }
}
