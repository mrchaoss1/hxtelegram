package telegram.types;

/**
 * Represents a link to a sticker stored on the Telegram servers. By default, this sticker will be sent by the user. Alternatively, you can useinput_message_contentto send a message with the specified content instead of the sticker.
 */
typedef InlineQueryResultCachedSticker = {
  /** Type of the result, must be sticker */
  type:String,
  /** Unique identifier for this result, 1-64 bytes */
  id:String,
  /** A valid file identifier of the sticker */
  sticker_file_id:String,
  /** Optional . Inline keyboard attached to the message */
  ?reply_markup:InlineKeyboardMarkup,
  /** Optional . Content of the message to be sent instead of the sticker */
  ?input_message_content:InputMessageContent,
}
