import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  final Uri _url = Uri.http('$baseUrl', 'transactions');

  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(_url).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction) async {
    final String transactionJson = jsonEncode(transaction.toJson());
    final Response response =
        await client.post(_url, headers: headers, body: transactionJson);

    return Transaction.fromJson(jsonDecode(response.body));
  }
}
