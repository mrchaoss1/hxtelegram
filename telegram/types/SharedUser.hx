package telegram.types;

/**
 * This object contains information about a user that was shared with the bot using aKeyboardButtonRequestUsersbutton.
 */
typedef SharedUser = {
  /** Identifier of the shared user. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so 64-bit integers or double-precision float types are safe for storing these identifiers. The bot may not have access to the user and could be unable to use this identifier, unless the user is already known to the bot by some other means. */
  user_id:Int,
  /** Optional . First name of the user, if the name was requested by the bot */
  ?first_name:String,
  /** Optional . Last name of the user, if the name was requested by the bot */
  ?last_name:String,
  /** Optional . Username of the user, if the username was requested by the bot */
  ?username:String,
  /** Optional . Available sizes of the chat photo, if the photo was requested by the bot */
  ?photo:Array<PhotoSize>,
}
