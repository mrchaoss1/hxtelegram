package telegram.types;

/**
 * Describes an inline message to be sent by a user of a Mini App.
 */
typedef PreparedInlineMessage = {
  /** Unique identifier of the prepared message */
  id:String,
  /** Expiration date of the prepared message, in Unix time. Expired prepared messages can no longer be used */
  expiration_date:Int,
}
