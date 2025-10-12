package telegram.types;

/**
 * Describes an inline message sent by aWeb Appon behalf of a user.
 */
typedef SentWebAppMessage = {
  /** Optional . Identifier of the sent inline message. Available only if there is an inline keyboard attached to the message. */
  ?inline_message_id:String,
}
