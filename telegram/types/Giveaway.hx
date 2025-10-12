package telegram.types;

/**
 * This object represents a message about a scheduled giveaway.
 */
typedef Giveaway = {
  /** The list of chats which the user must join to participate in the giveaway */
  chats:Array<Chat>,
  /** Point in time (Unix timestamp) when winners of the giveaway will be selected */
  winners_selection_date:Int,
  /** The number of users which are supposed to be selected as winners of the giveaway */
  winner_count:Int,
  /** Optional . True , if only users who join the chats after the giveaway started should be eligible to win */
  ?only_new_members:Bool,
  /** Optional . True , if the list of giveaway winners will be visible to everyone */
  ?has_public_winners:Bool,
  /** Optional . Description of additional giveaway prize */
  ?prize_description:String,
  /** Optional . A list of two-letter ISO 3166-1 alpha-2 country codes indicating the countries from which eligible users for the giveaway must come. If empty, then all users can participate in the giveaway. Users with a phone number that was bought on Fragment can always participate in giveaways. */
  ?country_codes:Array<String>,
  /** Optional . The number of Telegram Stars to be split between giveaway winners; for Telegram Star giveaways only */
  ?prize_star_count:Int,
  /** Optional . The number of months the Telegram Premium subscription won from the giveaway will be active for; for Telegram Premium giveaways only */
  ?premium_subscription_month_count:Int,
}
