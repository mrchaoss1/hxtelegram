package telegram.types;

/**
 * This object represents a chat.
 */
typedef Chat = {
  /** Unique identifier for this chat. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier. */
  id:Int,
  /** Type of the chat, can be either “private”, “group”, “supergroup” or “channel” */
  type:String,
  /** Optional . Title, for supergroups, channels and group chats */
  ?title:String,
  /** Optional . Username, for private chats, supergroups and channels if available */
  ?username:String,
  /** Optional . First name of the other party in a private chat */
  ?first_name:String,
  /** Optional . Last name of the other party in a private chat */
  ?last_name:String,
  /** Optional . True , if the supergroup chat is a forum (has topics enabled) */
  ?is_forum:Bool,
  /** Optional . True , if the chat is the direct messages chat of a channel */
  ?is_direct_messages:Bool,
}
