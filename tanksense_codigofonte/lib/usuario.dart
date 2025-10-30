// usuario.dart
import 'entidade_base.dart';

class Usuario extends EntidadeBase {
  final String _nome;
  final String _email;
  final String _senhaLogin;
  final String _perfil;
  final DateTime _dataCriacao;
  DateTime _ultimoLogin;
  final int _empresaId;
  final List<String> _permissoes = [];

  // CORREÇÃO: Construtor posicional
  Usuario(
    super.id,
    this._nome,
    this._email,
    this._senhaLogin,
    this._perfil,
    this._dataCriacao,
    this._ultimoLogin,
    this._empresaId,
  ) {
    _definirPermissoes();
  }

  // Factory method para criação com parâmetros nomeados
  factory Usuario.criar({
    required int id,
    required String nome,
    required String email,
    required String senhaLogin,
    required String perfil,
    required DateTime dataCriacao,
    required DateTime ultimoLogin,
    required int empresaId,
  }) {
    return Usuario(
      id,
      nome,
      email,
      senhaLogin,
      perfil,
      dataCriacao,
      ultimoLogin,
      empresaId,
    );
  }

  String get nome => _nome;
  String get email => _email;
  String get senhaLogin => _senhaLogin;
  String get perfil => _perfil;
  DateTime get dataCriacao => _dataCriacao;
  DateTime get ultimoLogin => _ultimoLogin;
  int get empresaId => _empresaId;
  List<String> get permissoes => List.unmodifiable(_permissoes);

  @override
  void exibirDados() {
    print('👤 DADOS DO USUÁRIO');
    print('─' * 30);
    print('ID: $id');
    print('Nome: $_nome');
    print('Email: $_email');
    print('Perfil: $_perfil');
    print('Data de Criação: ${_formatarData(_dataCriacao)}');
    print('Último Login: ${_formatarData(_ultimoLogin)}');
    print('Empresa ID: $_empresaId');
    print('Permissões: ${_permissoes.length}');
    print('Tipo: ${obterTipo()}');
    print('─' * 30);
  }

  @override
  String obterTipo() {
    return "Usuário do Sistema";
  }

  void _definirPermissoes() {
    List<String> permissoesBase = ['visualizar_dados'];

    if (isAdministrador()) {
      permissoesBase
          .addAll(['gerenciar_usuarios', 'configurar_sistema', 'acesso_total']);
    }

    if (isOperador() || isAdministrador()) {
      permissoesBase.addAll(['cadastrar_dados', 'editar_dados']);
    }

    _permissoes.addAll(permissoesBase);
  }

  void atualizarUltimoLogin() {
    _ultimoLogin = DateTime.now();
    print('🕒 Último login atualizado para: ${_formatarData(_ultimoLogin)}');
  }

  bool isAdministrador() {
    return _perfil.toLowerCase() == 'administrador';
  }

  bool isOperador() {
    return _perfil.toLowerCase() == 'operador';
  }

  bool isVisualizador() {
    return _perfil.toLowerCase() == 'visualizador';
  }

  bool emailValido() {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(_email);
  }

  void exibirPermissoes() {
    print('🔐 Permissões do Usuário:');
    for (String permissao in _permissoes) {
      print('  ✅ $permissao');
    }
  }

  bool temPermissao(String permissao) {
    return _permissoes.contains(permissao);
  }

  bool validarSenha(String senha) {
    return senha.length >= 6;
  }

  String _formatarData(DateTime data) {
    return '${data.day}/${data.month}/${data.year} ${data.hour}:${data.minute.toString().padLeft(2, '0')}';
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'idUsuario': id,
      'nome': _nome,
      'email': _email,
      'senhaLogin': _senhaLogin,
      'perfil': _perfil,
      'dataCriacao': _dataCriacao.toIso8601String(),
      'ultimoLogin': _ultimoLogin.toIso8601String(),
      'empresa_idEmpresa': _empresaId,
      'permissoes': _permissoes,
    };
  }

  @override
  String toString() {
    return 'Usuario{id: $id, nome: $_nome, email: $_email, perfil: $_perfil}';
  }
}
