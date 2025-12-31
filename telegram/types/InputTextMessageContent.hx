package telegram.types;

/**
 * Represents thecontentof a text message to be sent as the result of an inline query.
 */
typedef InputTextMessageContent = {
  /** Text of the message to be sent, 1-4096 characters */
  message_text:String,
  /** Optional . Mode for parsing entities in the message text. See formatting options for more details. */
  ?parse_mode:String,
  /** Optional . List of special entities that appear in message text, which can be specified instead of parse_mode */
  ?entities:Array<MessageEntity>,
  /** Optional . Link preview generation options for the message */
  ?link_preview_options:LinkPreviewOptions,
}
