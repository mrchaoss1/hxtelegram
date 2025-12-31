package telegram.types;

/**
 * This object contains information about a chat boost.
 */
typedef ChatBoost = {
  /** Unique identifier of the boost */
  boost_id:String,
  /** Point in time (Unix timestamp) when the chat was boosted */
  add_date:Int,
  /** Point in time (Unix timestamp) when the boost will automatically expire, unless the booster's Telegram Premium subscription is prolonged */
  expiration_date:Int,
  /** Source of the added boost */
  source:ChatBoostSource,
}
