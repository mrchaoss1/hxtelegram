package telegram.types;

/**
 * Represents thecontentof an invoice message to be sent as the result of an inline query.
 */
typedef InputInvoiceMessageContent = {
  /** Product name, 1-32 characters */
  title:String,
  /** Product description, 1-255 characters */
  description:String,
  /** Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use it for your internal processes. */
  payload:String,
  /** Optional . Payment provider token, obtained via @BotFather . Pass an empty string for payments in Telegram Stars . */
  ?provider_token:String,
  /** Three-letter ISO 4217 currency code, see more on currencies . Pass “XTR” for payments in Telegram Stars . */
  currency:String,
  /** Price breakdown, a JSON-serialized list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.). Must contain exactly one item for payments in Telegram Stars . */
  prices:Array<LabeledPrice>,
  /** Optional . The maximum accepted amount for tips in the smallest units of the currency (integer, not float/double). For example, for a maximum tip of US$ 1.45 pass max_tip_amount = 145 . See the exp parameter in currencies.json , it shows the number of digits past the decimal point for each currency (2 for the majority of currencies). Defaults to 0. Not supported for payments in Telegram Stars . */
  ?max_tip_amount:Int,
  /** Optional . A JSON-serialized array of suggested amounts of tip in the smallest units of the currency (integer, not float/double). At most 4 suggested tip amounts can be specified. The suggested tip amounts must be positive, passed in a strictly increased order and must not exceed max_tip_amount . */
  ?suggested_tip_amounts:Array<Int>,
  /** Optional . A JSON-serialized object for data about the invoice, which will be shared with the payment provider. A detailed description of the required fields should be provided by the payment provider. */
  ?provider_data:String,
  /** Optional . URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service. */
  ?photo_url:String,
  /** Optional . Photo size in bytes */
  ?photo_size:Int,
  /** Optional . Photo width */
  ?photo_width:Int,
  /** Optional . Photo height */
  ?photo_height:Int,
  /** Optional . Pass True if you require the user's full name to complete the order. Ignored for payments in Telegram Stars . */
  ?need_name:Bool,
  /** Optional . Pass True if you require the user's phone number to complete the order. Ignored for payments in Telegram Stars . */
  ?need_phone_number:Bool,
  /** Optional . Pass True if you require the user's email address to complete the order. Ignored for payments in Telegram Stars . */
  ?need_email:Bool,
  /** Optional . Pass True if you require the user's shipping address to complete the order. Ignored for payments in Telegram Stars . */
  ?need_shipping_address:Bool,
  /** Optional . Pass True if the user's phone number should be sent to the provider. Ignored for payments in Telegram Stars . */
  ?send_phone_number_to_provider:Bool,
  /** Optional . Pass True if the user's email address should be sent to the provider. Ignored for payments in Telegram Stars . */
  ?send_email_to_provider:Bool,
  /** Optional . Pass True if the final price depends on the shipping method. Ignored for payments in Telegram Stars . */
  ?is_flexible:Bool,
}
