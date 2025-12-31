package telegram.types;

/**
 * This object contains information about an incoming shipping query.
 */
typedef ShippingQuery = {
  /** Unique query identifier */
  id:String,
  /** User who sent the query */
  from:User,
  /** Bot-specified invoice payload */
  invoice_payload:String,
  /** User specified shipping address */
  shipping_address:ShippingAddress,
}
