
import 'package:my_app/_Utils/account.dart';
import 'package:my_app/_config/db.dart';

class History {
  static Future<bool> createHistory(String action) async {
    try {
      
      var account = await Account.getAccount();
      var id = account['id'];
      var connection = await DBConnection.connect();
      var unixTimeStamp = DateTime.now().millisecondsSinceEpoch;
      var result =  await  connection.execute("INSERT INTO history VALUES(NULL,'$id','$unixTimeStamp')");

      if(result.affectedRows > BigInt.one){
        connection.close();
        return true;
      }
      connection.close();
      return false;
    } catch (error) {
      print('Error fetching products: $error');
      return false; // return empty kalau error
    }
    
  }
  static Future<List<Map<String,dynamic>>> getHistorys() async {
    try {
      var connection = await DBConnection.connect();
      var unixTimeStamp = DateTime.now().millisecondsSinceEpoch;
      var result =  await  connection.execute("SELECT* FROM history");

      List<Map<String,dynamic>> historys = [];

      if(result.rows.isNotEmpty){
        for(var row in result.rows){
          historys.add(row.assoc());
        }
      }

      connection.close();
      return historys;
    } catch (error) {
      print('Error fetching products: $error');
      return []; // return empty kalau error
    }
    
  }
}