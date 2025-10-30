// local.dart
import 'entidade_base.dart';

class Local extends EntidadeBase {
  final String _nome;
  final String _referencia;
  final List<String> _caracteristicas = [];

  Local(super.id, this._nome, this._referencia);

  String get nome => _nome;
  String get referencia => _referencia;
  List<String> get caracteristicas => List.unmodifiable(_caracteristicas);

  @override
  void exibirDados() {
    print('🏠 DADOS DO LOCAL');
    print('─' * 30);
    print('ID: $id');
    print('Nome: $_nome');
    print('Referência: $_referencia');
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
      'nome': _nome,
      'referencia': _referencia,
      'caracteristicas': _caracteristicas,
    };
  }
}
