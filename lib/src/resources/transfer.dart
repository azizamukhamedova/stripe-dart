import 'dart:async';

import 'package:stripe/messages.dart';

import '../client.dart';
import '_resource.dart';

class TransferResource extends Resource<Price> {
  TransferResource(Client client) : super(client);

  Future<void> create(
    int amount,
    String connectedAccountId,
    String transferGroup,
  ) async {
    await post(
      'transfers',
      data: {
        'amount': amount,
        'currency': "usd",
        'destination': connectedAccountId,
        'transfer_group': transferGroup,
      },
    );
    // final map = await post(
    //   'transfers',
    //   data: {
    //     'amount': 400,
    //     'currency': "usd",
    //     'destination': "acct_1N8SXtCMs7Z45UIN",
    //     'transfer_group': "ORDER_95",
    //   },
    // );
    // return Price.fromJson(map);
  }
}
