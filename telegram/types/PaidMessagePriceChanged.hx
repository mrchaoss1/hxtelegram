package telegram.types;

/**
 * Describes a service message about a change in the price of paid messages within a chat.
 */
typedef PaidMessagePriceChanged = {
  /** The new number of Telegram Stars that must be paid by non-administrator users of the supergroup chat for each sent message */
  paid_message_star_count:Int,
}
