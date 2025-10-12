package telegram.types;

/**
 * This object represents an incoming callback query from a callback button in aninline keyboard. If the button that originated the query was attached to a message sent by the bot, the fieldmessagewill be present. If the button was attached to a message sent via the bot (ininline mode), the fieldinline_message_idwill be present. Exactly one of the fieldsdataorgame_short_namewill be present.
 */
typedef CallbackQuery = {
  /** Unique identifier for this query */
  id:String,
  /** Sender */
  from:User,
  /** Optional . Message sent by the bot with the callback button that originated the query */
  ?message:MaybeInaccessibleMessage,
  /** Optional . Identifier of the message sent via the bot in inline mode, that originated the query. */
  ?inline_message_id:String,
  /** Global identifier, uniquely corresponding to the chat to which the message with the callback button was sent. Useful for high scores in games . */
  chat_instance:String,
  /** Optional . Data associated with the callback button. Be aware that the message originated the query can contain no callback buttons with this data. */
  ?data:String,
  /** Optional . Short name of a Game to be returned, serves as the unique identifier for the game */
  ?game_short_name:String,
}
