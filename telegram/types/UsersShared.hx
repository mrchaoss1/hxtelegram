package telegram.types;

/**
 * This object contains information about the users whose identifiers were shared with the bot using aKeyboardButtonRequestUsersbutton.
 */
typedef UsersShared = {
  /** Identifier of the request */
  request_id:Int,
  /** Information about users shared with the bot. */
  users:Array<SharedUser>,
}
