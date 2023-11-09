import 'dart:async';

import 'package:stripe/messages.dart';

import '../client.dart';
import '_resource.dart';

class CheckoutSessionResource extends Resource<CheckoutSession> {
  CheckoutSessionResource(Client client) : super(client);

  /// Creates a Stripe Checkout Session.
  Future<CheckoutSession> create(List<Map<String, dynamic>> lineItems) async {
    final response = await post(
      'checkout/sessions',
      data: {
        "success_url": "https://example.com/reauth",
        "cancel_url": "https://example.com/return",
        "mode": "payment",
        "line_items": lineItems,
      },
    );
    return CheckoutSession.fromJson(response);
  }

  Future<CheckoutSession> retrieve(String id) async {
    final response = await get('checkout/sessions/$id');
    return CheckoutSession.fromJson(response);
  }
}
