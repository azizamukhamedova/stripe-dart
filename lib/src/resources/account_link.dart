import 'dart:async';

import 'package:stripe/messages.dart';

import '../client.dart';
import '_resource.dart';

class AccountLinkResource extends Resource<AccountCreateResponse> {
  AccountLinkResource(Client client) : super(client);

  Future<AccountCreateResponse> retrieve() async {
    final map = await post(
      'accounts',
      data: {
        "type": "custom",
        "capabilities": {
          "card_payments": {"requested": true},
          "transfers": {"requested": true},
        },
      },
    );
    return AccountCreateResponse.fromJson(map);
  }
}
