import 'package:mysql1/mysql1.dart';
import 'database_config.dart';

class DatabaseConnection {
  final DatabaseConfig _config;
  MySqlConnection? _connection;

  DatabaseConnection(this._config);

  Future<bool> connect() async {
    try {
      _connection = await MySqlConnection.connect(ConnectionSettings(
        host: _config.host,
        port: _config.porta,
        user: _config.usuario,
        password: _config.senha,
        db: _config.dbName,
      ));

      try {
        await _connection!.query('SELECT 1');
        print('✅ Conexão estabelecida com Sucesso!');
        return true;
      } catch (queryError) {
        print('❌ Erro ao executar query de teste: $queryError');
        return false;
      }
    } catch (e) {
      print('❌ Erro ao conectar: $e');
      return false;
    }
  }

  Future<void> close() async {
    await _connection?.close();
    print('🔌 Conexão encerrada!');
  }

  bool get isConnected => _connection != null;

  Future<Results> query(String sql, [List<Object?>? values]) async {
    if (_connection == null) {
      throw Exception('Conexão não estabelecida');
    }
    return await _connection!.query(sql, values);
  }
}
