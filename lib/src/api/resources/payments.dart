// GENERATED FILE. Do not edit by hand.
// Regenerate with: dart run tool/generate_resources.dart

import '../../core/resource.dart';

/// Project payment orders: create an order, read one or a list, and start a
/// provider checkout for it.
class PaymentsResource extends Resource {
  PaymentsResource(super.transport);

  /// `POST /{version}/payments/orders`
  ///
  /// Creates a payment order for a buyer. The body carries `buyerUserId`,
  /// `merchantReference`, `currency`, `priceVersion`, `lines` (each
  /// `{sku?, title?, quantity, unitAmountMinor}`), and optionally
  /// `idempotencyKey` and `metadata` (a string map).
  ///
  /// Answers `IdResponse` — `{ "id": "ord_…" }`. The same body sent again
  /// with the same `idempotencyKey` answers the same id (no second order).
  Future<Object?> createPaymentOrder(
      {Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/payments/orders',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: null,
    );
  }

  /// `GET /{version}/payments/orders/{id}`
  ///
  /// Reads one payment order by its `ord_…` id. Answers `{ "item":
  /// PaymentOrderDto }` — lines, total, status, checkouts, settled and
  /// refunded amounts.
  Future<Object?> getPaymentOrder(
      {required Object id,
      Map<String, Object?>? query,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/payments/orders/{id}',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }

  /// `GET /{version}/payments/orders`
  ///
  /// Lists payment orders. Filters go in [query]: `buyerUserId`,
  /// `merchantReference`, `status` (plus the usual paging). Answers
  /// `{ "list": Paginated<PaymentOrderDto> }`.
  Future<Object?> getPaymentOrders(
      {Map<String, Object?>? query, Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/payments/orders',
      method: 'GET',
      query: query,
      headers: headers,
      pathParams: null,
    );
  }

  /// `POST /{version}/payments/orders/{id}/checkout`
  ///
  /// Starts (or reuses) a provider checkout for the order. The body carries
  /// `integrationId`, `returnUrl`, and optionally `method`,
  /// `preferredCountry` and `preferredProvider`.
  ///
  /// Answers `{ "checkout": PaymentOrderCheckoutDto, "reused": bool,
  /// "order": PaymentOrderDto }` — send the buyer to `checkout.paymentUrl`.
  /// `reused` is true when a still-open checkout was handed back.
  Future<Object?> startPaymentCheckout(
      {required Object id,
      Map<String, Object?>? query,
      Object? body,
      Map<String, String>? headers}) {
    return transport.send(
      route: '/{version}/payments/orders/{id}/checkout',
      method: 'POST',
      query: query,
      body: body,
      headers: headers,
      pathParams: <String, Object?>{'id': id},
    );
  }
}
