package telegram.types;

/**
 * This object contains information about an incoming pre-checkout query.
 */
typedef PreCheckoutQuery = {
  /** Unique query identifier */
  id:String,
  /** User who sent the query */
  from:User,
  /** Three-letter ISO 4217 currency code, or “XTR” for payments in Telegram Stars */
  currency:String,
  /** Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145 . See the exp parameter in currencies.json , it shows the number of digits past the decimal point for each currency (2 for the majority of currencies). */
  total_amount:Int,
  /** Bot-specified invoice payload */
  invoice_payload:String,
  /** Optional . Identifier of the shipping option chosen by the user */
  ?shipping_option_id:String,
  /** Optional . Order information provided by the user */
  ?order_info:OrderInfo,
}
