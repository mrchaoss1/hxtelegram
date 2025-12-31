package telegram.types;

/**This object describes the origin of a message. It can be one of

    - MessageOriginUser
    - MessageOriginHiddenUser
    - MessageOriginChat
    - MessageOriginChannel
**/
typedef MessageOrigin = {}

/**
 * The message was originally sent to a channel chat.
 */
typedef MessageOriginChannel = {
  >MessageOrigin,
  /** Type of the message origin, always “channel” */
  type:String,
  /** Date the message was sent originally in Unix time */
  date:Int,
  /** Channel chat to which the message was originally sent */
  chat:Chat,
  /** Unique message identifier inside the chat */
  message_id:Int,
  /** Optional . Signature of the original post author */
  ?author_signature:String,
}

/**
 * The message was originally sent on behalf of a chat to a group chat.
 */
typedef MessageOriginChat = {
  >MessageOrigin,
  /** Type of the message origin, always “chat” */
  type:String,
  /** Date the message was sent originally in Unix time */
  date:Int,
  /** Chat that sent the message originally */
  sender_chat:Chat,
  /** Optional . For messages originally sent by an anonymous chat administrator, original message author signature */
  ?author_signature:String,
}

/**
 * The message was originally sent by an unknown user.
 */
typedef MessageOriginHiddenUser = {
  >MessageOrigin,
  /** Type of the message origin, always “hidden_user” */
  type:String,
  /** Date the message was sent originally in Unix time */
  date:Int,
  /** Name of the user that sent the message originally */
  sender_user_name:String,
}

/**
 * The message was originally sent by a known user.
 */
typedef MessageOriginUser = {
  >MessageOrigin,
  /** Type of the message origin, always “user” */
  type:String,
  /** Date the message was sent originally in Unix time */
  date:Int,
  /** User that sent the message originally */
  sender_user:User,
}