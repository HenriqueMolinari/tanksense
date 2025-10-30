import 'package:tanksense/database_config.dart';
import 'package:tanksense/database_connection.dart';
import 'package:tanksense/menu.dart';

void main() async {
  final config = DatabaseConfig(
    host: 'localhost',
    porta: 3306,
    usuario: 'root',
    senha: 'unifeob@123',
    dbName: 'tanksense',
  );

  final db = DatabaseConnection(config);
  final menu = Menu(db);

  try {
    await menu.inicializar();
    await menu.executar();
  } catch (e) {
    print('❌ Erro fatal: $e');
  } finally {
    await db.close();
  }
}
//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA