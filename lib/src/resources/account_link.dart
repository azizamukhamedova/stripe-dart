import 'dart:async';

import 'package:stripe/messages.dart';

import '../client.dart';
import '_resource.dart';

class AccountLinkResource extends Resource<AccountLinkResponse> {
  AccountLinkResource(Client client) : super(client);

  Future<AccountLinkResponse> retrieve(String connectedAccountId) async {
    final map = await post(
      'accounts',
      data: {
        "account": connectedAccountId,
        "type": "account_onboarding",
      },
    );
    return AccountLinkResponse.fromJson(map);
  }
}
