package telegram.types;

/**
 * This object represents one shipping option.
 */
typedef ShippingOption = {
  /** Shipping option identifier */
  id:String,
  /** Option title */
  title:String,
  /** List of price portions */
  prices:Array<LabeledPrice>,
}
