import 'package:hive/hive.dart';
import 'package:hive_db_task2/model/account_model.dart';
import 'package:hive_db_task2/model/user_model.dart';

class HiveDB{

  var box = Hive.box("db_name");

  //User
  void storeUser(User user) async{
    box.put("user", user.toJson());
  }

  User loadUser(){
    var user = new User.fromJson(box.get("user"));
    return user;
  }

  void removeUser(){
    box.delete("user");
  }


  //Account
  void storeAccount(Account account) async{
      box.put("account", account.toJson());
  }

  Account loadAccount(){
    var account = new Account.fromJson(box.get("account"));
    return account;
  }

  void removeAccount(){
    box.delete("account");
  }





}