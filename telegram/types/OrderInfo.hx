package telegram.types;

/**
 * This object represents information about an order.
 */
typedef OrderInfo = {
  /** Optional . User name */
  ?name:String,
  /** Optional . User's phone number */
  ?phone_number:String,
  /** Optional . User email */
  ?email:String,
  /** Optional . User shipping address */
  ?shipping_address:ShippingAddress,
}
