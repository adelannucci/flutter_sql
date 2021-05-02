import 'package:bytebank/models/contact.dart';

import '../app_database.dart';

class ContactDao {
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  static const tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  Future<int> save(Contact contact) async {
    final database = await getDatabase();
    return database.insert(_tableName, _toMap(contact));
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final database = await getDatabase();
    return _toList(await database.query(_tableName));
  }

  List<Contact> _toList(List<Map<String, dynamic>> results) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> map in results) {
      final Contact contact = Contact(
        map[_id],
        map[_name],
        map[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
