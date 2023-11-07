import 'dart:async';

import 'package:stripe/messages.dart';

import '../client.dart';
import '_resource.dart';

class AccountLinkResource extends Resource<AccountLinkResponse> {
  AccountLinkResource(Client client) : super(client);

  Future<AccountLinkResponse> retrieve(String connectedAccountId) async {
    final map = await post(
      'account_links',
      data: {
        "account": connectedAccountId,
        "refresh_url": "https://example.com/reauth",
        "return_url": "https://example.com/return",
        "type": "account_onboarding",
      },
    );
    return AccountLinkResponse.fromJson(map);
  }
}
