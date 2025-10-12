package telegram.types;

/**
 * This object describes the types of gifts that can be gifted to a user or a chat.
 */
typedef AcceptedGiftTypes = {
  /** True , if unlimited regular gifts are accepted */
  unlimited_gifts:Bool,
  /** True , if limited regular gifts are accepted */
  limited_gifts:Bool,
  /** True , if unique gifts or gifts that can be upgraded to unique for free are accepted */
  unique_gifts:Bool,
  /** True , if a Telegram Premium subscription is accepted */
  premium_subscription:Bool,
}
