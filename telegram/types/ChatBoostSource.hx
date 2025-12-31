package telegram.types;

/**
    This object describes the source of a chat boost. It can be one of

    - ChatBoostSourcePremium
    - ChatBoostSourceGiftCode
    - ChatBoostSourceGiveaway
**/
typedef ChatBoostSource = {}

/**
 * The boost was obtained by the creation of Telegram Premium gift codes to boost a chat. Each such code boosts the chat 4 times for the duration of the corresponding Telegram Premium subscription.
 */
typedef ChatBoostSourceGiftCode = {
  >ChatBoostSource,
  /** Source of the boost, always “gift_code” */
  source:String,
  /** User for which the gift code was created */
  user:User,
}

/**
 * The boost was obtained by the creation of a Telegram Premium or a Telegram Star giveaway. This boosts the chat 4 times for the duration of the corresponding Telegram Premium subscription for Telegram Premium giveaways andprize_star_count/ 500 times for one year for Telegram Star giveaways.
 */
typedef ChatBoostSourceGiveaway = {
  >ChatBoostSource,
  /** Source of the boost, always “giveaway” */
  source:String,
  /** Identifier of a message in the chat with the giveaway; the message could have been deleted already. May be 0 if the message isn't sent yet. */
  giveaway_message_id:Int,
  /** Optional . User that won the prize in the giveaway if any; for Telegram Premium giveaways only */
  ?user:User,
  /** Optional . The number of Telegram Stars to be split between giveaway winners; for Telegram Star giveaways only */
  ?prize_star_count:Int,
  /** Optional . True , if the giveaway was completed, but there was no user to win the prize */
  ?is_unclaimed:Bool,
}

/**
 * The boost was obtained by subscribing to Telegram Premium or by gifting a Telegram Premium subscription to another user.
 */
typedef ChatBoostSourcePremium = {
  >ChatBoostSource,
  /** Source of the boost, always “premium” */
  source:String,
  /** User that boosted the chat */
  user:User,
}