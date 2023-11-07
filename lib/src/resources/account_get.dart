import 'dart:async';

import 'package:stripe/messages.dart';

import '../client.dart';
import '_resource.dart';

class AccountGetResource extends Resource<AccountCreateResponse> {
  AccountGetResource(Client client) : super(client);

  Future<AccountCreateResponse> retrieve(String accountId) async {
    final map = await get('accounts/$accountId');
    return AccountCreateResponse.fromJson(map);
  }
}
