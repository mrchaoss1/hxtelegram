package telegram.types;

/**
 * This object represents a service message about the completion of a giveaway without public winners.
 */
typedef GiveawayCompleted = {
  /** Number of winners in the giveaway */
  winner_count:Int,
  /** Optional . Number of undistributed prizes */
  ?unclaimed_prize_count:Int,
  /** Optional . Message with the giveaway that was completed, if it wasn't deleted */
  ?giveaway_message:Message,
  /** Optional . True , if the giveaway is a Telegram Star giveaway. Otherwise, currently, the giveaway is a Telegram Premium giveaway. */
  ?is_star_giveaway:Bool,
}
