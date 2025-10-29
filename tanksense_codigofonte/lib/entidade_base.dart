// entidade_base.dart
abstract class EntidadeBase {
  final int _id;

  EntidadeBase(this._id);

  int get id => _id;

  void exibirDados();

  Map<String, dynamic> toMap();

  String obterTipo() {
    return "Entidade Base";
  }

  bool temIdValido() {
    if (_id > 0) {
      return true;
    } else {
      return false;
    }
  }
}
