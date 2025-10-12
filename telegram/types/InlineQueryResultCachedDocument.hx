package telegram.types;

/**
 * Represents a link to a file stored on the Telegram servers. By default, this file will be sent by the user with an optional caption. Alternatively, you can useinput_message_contentto send a message with the specified content instead of the file.
 */
typedef InlineQueryResultCachedDocument = {
  /** Type of the result, must be document */
  type:String,
  /** Unique identifier for this result, 1-64 bytes */
  id:String,
  /** Title for the result */
  title:String,
  /** A valid file identifier for the file */
  document_file_id:String,
  /** Optional . Short description of the result */
  ?description:String,
  /** Optional . Caption of the document to be sent, 0-1024 characters after entities parsing */
  ?caption:String,
  /** Optional . Mode for parsing entities in the document caption. See formatting options for more details. */
  ?parse_mode:String,
  /** Optional . List of special entities that appear in the caption, which can be specified instead of parse_mode */
  ?caption_entities:Array<MessageEntity>,
  /** Optional . Inline keyboard attached to the message */
  ?reply_markup:InlineKeyboardMarkup,
  /** Optional . Content of the message to be sent instead of the file */
  ?input_message_content:InputMessageContent,
}
