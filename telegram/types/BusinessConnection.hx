package telegram.types;

/**
 * Describes the connection of the bot with a business account.
 */
typedef BusinessConnection = {
  /** Unique identifier of the business connection */
  id:String,
  /** Business account user that created the business connection */
  user:User,
  /** Identifier of a private chat with the user who created the business connection. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier. */
  user_chat_id:Int,
  /** Date the connection was established in Unix time */
  date:Int,
  /** Optional . Rights of the business bot */
  ?rights:BusinessBotRights,
  /** True , if the connection is active */
  is_enabled:Bool,
}
