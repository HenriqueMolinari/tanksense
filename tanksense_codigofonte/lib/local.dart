// local.dart
import 'entidade_base.dart';

class Local extends EntidadeBase {
  String nome;
  String referencia;
  final List<String> _caracteristicas = [];

  Local(super.id, this.nome, this.referencia);

  // ENCAPSULAMENTO: Apenas para a lista de características
  List<String> get caracteristicas => List.unmodifiable(_caracteristicas);

  @override
  void exibirDados() {
    print('🏠 DADOS DO LOCAL');
    print('─' * 30);
    print('ID: $id');
    print('Nome: $nome');
    print('Referência: $referencia');
    print('Características: ${_caracteristicas.length}');
    print('Tipo: ${obterTipo()}');
    print('─' * 30);
  }

  @override
  String obterTipo() {
    return "Local Industrial";
  }

  void adicionarCaracteristica(String caracteristica) {
    if (caracteristica.isNotEmpty &&
        !_caracteristicas.contains(caracteristica)) {
      _caracteristicas.add(caracteristica);
      print('✅ Característica adicionada: $caracteristica');
    }
  }

  void removerCaracteristica(String caracteristica) {
    if (_caracteristicas.contains(caracteristica)) {
      _caracteristicas.remove(caracteristica);
      print('✅ Característica removida: $caracteristica');
    } else {
      print('❌ Característica não encontrada: $caracteristica');
    }
  }

  bool possuiCaracteristica(String caracteristica) {
    return _caracteristicas.contains(caracteristica);
  }

  void exibirCaracteristicas() {
    if (_caracteristicas.isEmpty) {
      print('📭 Nenhuma característica cadastrada');
      return;
    }

    print('📋 Características do Local:');
    for (int i = 0; i < _caracteristicas.length; i++) {
      print('  ${i + 1}. ${_caracteristicas[i]}');
    }
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'idLocal': id,
      'nome': nome,
      'referencia': referencia,
      'caracteristicas': _caracteristicas,
    };
  }
}
