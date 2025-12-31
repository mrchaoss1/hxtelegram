package telegram.types;

/**
 * This object is received when messages are deleted from a connected business account.
 */
typedef BusinessMessagesDeleted = {
  /** Unique identifier of the business connection */
  business_connection_id:String,
  /** Information about a chat in the business account. The bot may not have access to the chat or the corresponding user. */
  chat:Chat,
  /** The list of identifiers of deleted messages in the chat of the business account */
  message_ids:Array<Int>,
}
