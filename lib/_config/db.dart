import 'package:my_app/_Utils/env.dart';
import 'package:mysql_client/mysql_client.dart';

class DBConnection {
  static Future<MySQLConnection> connect() async {
    final conn = await MySQLConnection.createConnection(
      host: Environment.host,
      userName: Environment.username,
      password: Environment.password,
      databaseName: Environment.database,
      port: int.parse(Environment.port),
    );
    await conn.connect();
    return conn;
  }
}
