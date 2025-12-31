package telegram.types;

/**
 * This object represents a gift that can be sent by the bot.
 */
typedef Gift = {
  /** Unique identifier of the gift */
  id:String,
  /** The sticker that represents the gift */
  sticker:Sticker,
  /** The number of Telegram Stars that must be paid to send the sticker */
  star_count:Int,
  /** Optional . The number of Telegram Stars that must be paid to upgrade the gift to a unique one */
  ?upgrade_star_count:Int,
  /** Optional . The total number of the gifts of this type that can be sent; for limited gifts only */
  ?total_count:Int,
  /** Optional . The number of remaining gifts of this type that can be sent; for limited gifts only */
  ?remaining_count:Int,
  /** Optional . Information about the chat that published the gift */
  ?publisher_chat:Chat,
}
