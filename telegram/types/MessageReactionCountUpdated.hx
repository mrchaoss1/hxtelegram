package telegram.types;

/**
 * This object represents reaction changes on a message with anonymous reactions.
 */
typedef MessageReactionCountUpdated = {
  /** The chat containing the message */
  chat:Chat,
  /** Unique message identifier inside the chat */
  message_id:Int,
  /** Date of the change in Unix time */
  date:Int,
  /** List of reactions that are present on the message */
  reactions:Array<ReactionCount>,
}
