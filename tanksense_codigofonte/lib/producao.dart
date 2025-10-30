// producao.dart
import 'entidade_base.dart';

class Producao extends EntidadeBase {
  final int _tanqueId;
  final DateTime _dataHora;
  final double _quantidade;
  final String _tipoProducao;
  final String? _observacoes;
  final Map<String, double> _metricas = {};

  // CORREÇÃO: Usando construtor posicional em vez de nomeado
  Producao(
    super.id, // ← Agora é posicional
    this._tanqueId,
    this._dataHora,
    this._quantidade,
    this._tipoProducao, [
    this._observacoes,
  ]) {
    _calcularMetricas();
  }

  // Método factory para criar com parâmetros nomeados (opcional)
  factory Producao.criar({
    required int id,
    required int tanqueId,
    required DateTime dataHora,
    required double quantidade,
    required String tipoProducao,
    String? observacoes,
  }) {
    return Producao(
        id, tanqueId, dataHora, quantidade, tipoProducao, observacoes);
  }

  int get tanqueId => _tanqueId;
  DateTime get dataHora => _dataHora;
  double get quantidade => _quantidade;
  String get tipoProducao => _tipoProducao;
  String? get observacoes => _observacoes;
  Map<String, double> get metricas => Map.unmodifiable(_metricas);

  @override
  void exibirDados() {
    print('🏭 DADOS DA PRODUÇÃO');
    print('─' * 30);
    print('ID: $id');
    print('Tanque ID: $_tanqueId');
    print('Data/Hora: ${_formatarDataHora(_dataHora)}');
    print('Quantidade: ${_quantidade.toStringAsFixed(2)}m');
    print('Tipo: $_tipoProducao');

    if (_observacoes != null && _observacoes!.isNotEmpty) {
      print('Observações: $_observacoes');
    }

    print('Métricas: ${_metricas.length}');
    print('Tipo: ${obterTipo()}');
    print('─' * 30);
  }

  @override
  String obterTipo() {
    return "Produção Industrial";
  }

  void _calcularMetricas() {
    _metricas['eficiencia'] = _quantidade * 0.85;
    _metricas['produtividade'] = _quantidade / 60;
    _metricas['qualidade'] = _quantidade > 50 ? 95.0 : 85.0;
  }

  double calcularProducaoPorHora() {
    double calcular(double qtd, int minutos) {
      if (minutos <= 0) return 0.0;
      return (qtd / minutos) * 60;
    }

    return calcular(_quantidade, 60);
  }

  String obterClassificacao() {
    if (_quantidade > 100) {
      return "Alta Produção";
    } else if (_quantidade > 50) {
      return "Produção Média";
    } else if (_quantidade > 20) {
      return "Produção Baixa";
    } else {
      return "Produção Mínima";
    }
  }

  bool producaoValida() {
    return _quantidade > 0 &&
        _tipoProducao.isNotEmpty &&
        _dataHora.isBefore(DateTime.now());
  }


  void exibirMetricas() {
    print('📊 Métricas da Produção:');
    _metricas.forEach((nome, valor) {
      print('  📈 $nome: ${valor.toStringAsFixed(2)}');
    });
  }

  String _formatarDataHora(DateTime dataHora) {
    return '${dataHora.day}/${dataHora.month}/${dataHora.year} '
        '${dataHora.hour}:${dataHora.minute.toString().padLeft(2, '0')}';
  }

  String obterResumo() {
    return 'Produção $_tipoProducao: ${_quantidade.toStringAsFixed(2)}m em ${_formatarDataHora(_dataHora)}';
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'idProducao': id,
      'tanque_idTanque': _tanqueId,
      'dataHora': _dataHora.toIso8601String(),
      'quantidade': _quantidade,
      'tipoProducao': _tipoProducao,
      'observacoes': _observacoes,
      'metricas': _metricas,
    };
  }

  @override
  String toString() {
    return 'Producao{id: $id, tanqueId: $_tanqueId, quantidade: ${_quantidade}m, tipo: $_tipoProducao, data: ${_formatarDataHora(_dataHora)}}';
  }
}
