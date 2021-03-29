library stripe;

import 'package:meta/meta.dart';

import 'src/client.dart';
import 'src/resources/balance_transaction.dart';
import 'src/resources/charge.dart';
import 'src/resources/payment_intent.dart';
import 'src/resources/refund.dart';
import 'src/resources/session.dart';

export 'messages.dart';
export 'src/webhook.dart';

/// [Stripe] is the Class that provides the Interface for external calls via the
/// Stripe API.
///
/// Create an instance of this class, and use it like this:
///
///     final stripe = Stripe('privateApiKey');
///     final charge = await stripe.charge.retrieve(chargeId);
class Stripe {
  /// Our actual client implementation that communicates with Stripe.
  ///
  /// You should not need to access this, it is mostly exposed for testing, but
  /// you can use it to make requests that have not yet been implemented.
  final Client client;

  /// https://stripe.com/docs/api/checkout/sessions
  final SessionResource session;

  /// https://stripe.com/docs/api/refunds
  final RefundResource refund;

  /// https://stripe.com/docs/api/payment_intents
  final PaymentIntentResource paymentIntent;

  /// https://stripe.com/docs/api/charges
  final ChargeResource charge;

  /// https://stripe.com/docs/api/balance_transactions
  final BalanceTransactionResource balanceTransaction;

  factory Stripe(String apiKey) {
    final client = Client(apiKey: apiKey);
    return Stripe.withClient(client);
  }

  @visibleForTesting
  Stripe.withClient(this.client)
      : session = SessionResource(client),
        refund = RefundResource(client),
        paymentIntent = PaymentIntentResource(client),
        charge = ChargeResource(client),
        balanceTransaction = BalanceTransactionResource(client);
}
