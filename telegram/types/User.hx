package telegram.types;

/**
 * This object represents a Telegram user or bot.
 */
typedef User = {
  /** Unique identifier for this user or bot. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier. */
  id:Int,
  /** True , if this user is a bot */
  is_bot:Bool,
  /** User's or bot's first name */
  first_name:String,
  /** Optional . User's or bot's last name */
  ?last_name:String,
  /** Optional . User's or bot's username */
  ?username:String,
  /** Optional . IETF language tag of the user's language */
  ?language_code:String,
  /** Optional . True , if this user is a Telegram Premium user */
  ?is_premium:Bool,
  /** Optional . True , if this user added the bot to the attachment menu */
  ?added_to_attachment_menu:Bool,
  /** Optional . True , if the bot can be invited to groups. Returned only in getMe . */
  ?can_join_groups:Bool,
  /** Optional . True , if privacy mode is disabled for the bot. Returned only in getMe . */
  ?can_read_all_group_messages:Bool,
  /** Optional . True , if the bot supports inline queries. Returned only in getMe . */
  ?supports_inline_queries:Bool,
  /** Optional . True , if the bot can be connected to a Telegram Business account to receive its messages. Returned only in getMe . */
  ?can_connect_to_business:Bool,
  /** Optional . True , if the bot has a main Web App. Returned only in getMe . */
  ?has_main_web_app:Bool,
}
