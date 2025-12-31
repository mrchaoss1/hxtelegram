package telegram.types;

import telegram.types.MaybeInaccessibleMessage;

/**
 * This object describes a message that was deleted or is otherwise inaccessible to the bot.
 */
typedef InaccessibleMessage = {
  >MaybeInaccessibleMessage,
  /** Chat the message belonged to */
  chat:Chat,
  /** Unique message identifier inside the chat */
  message_id:Int,
  /** Always 0. The field can be used to differentiate regular and inaccessible messages. */
  date:Int,
}
