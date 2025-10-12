package telegram.types;

/**
 * Represents aGame.
 */
typedef InlineQueryResultGame = {
  /** Type of the result, must be game */
  type:String,
  /** Unique identifier for this result, 1-64 bytes */
  id:String,
  /** Short name of the game */
  game_short_name:String,
  /** Optional . Inline keyboard attached to the message */
  ?reply_markup:InlineKeyboardMarkup,
}
