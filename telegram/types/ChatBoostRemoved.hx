package telegram.types;

/**
 * This object represents a boost removed from a chat.
 */
typedef ChatBoostRemoved = {
  /** Chat which was boosted */
  chat:Chat,
  /** Unique identifier of the boost */
  boost_id:String,
  /** Point in time (Unix timestamp) when the boost was removed */
  remove_date:Int,
  /** Source of the removed boost */
  source:ChatBoostSource,
}
