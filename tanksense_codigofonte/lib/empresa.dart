// empresa.dart
import 'entidade_base.dart';

class Empresa extends EntidadeBase {
  String nome;
  String cnpj;
  final List<String> _departamentos = [];

  Empresa(super.id, this.nome, this.cnpj);

  // ENCAPSULAMENTO: Apenas para a lista de departamentos
  List<String> get departamentos => List.unmodifiable(_departamentos);

  @override
  void exibirDados() {
    print('🏢 DADOS DA EMPRESA');
    print('─' * 30);
    print('ID: $id');
    print('Nome: $nome');
    print('CNPJ: $cnpj');
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
      'nome': nome,
      'cnpj': cnpj,
    };
  }
}
