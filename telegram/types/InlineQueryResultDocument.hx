package telegram.types;

/**
 * Represents a link to a file. By default, this file will be sent by the user with an optional caption. Alternatively, you can useinput_message_contentto send a message with the specified content instead of the file. Currently, only.PDFand.ZIPfiles can be sent using this method.
 */
typedef InlineQueryResultDocument = {
  /** Type of the result, must be document */
  type:String,
  /** Unique identifier for this result, 1-64 bytes */
  id:String,
  /** Title for the result */
  title:String,
  /** Optional . Caption of the document to be sent, 0-1024 characters after entities parsing */
  ?caption:String,
  /** Optional . Mode for parsing entities in the document caption. See formatting options for more details. */
  ?parse_mode:String,
  /** Optional . List of special entities that appear in the caption, which can be specified instead of parse_mode */
  ?caption_entities:Array<MessageEntity>,
  /** A valid URL for the file */
  document_url:String,
  /** MIME type of the content of the file, either “application/pdf” or “application/zip” */
  mime_type:String,
  /** Optional . Short description of the result */
  ?description:String,
  /** Optional . Inline keyboard attached to the message */
  ?reply_markup:InlineKeyboardMarkup,
  /** Optional . Content of the message to be sent instead of the file */
  ?input_message_content:InputMessageContent,
  /** Optional . URL of the thumbnail (JPEG only) for the file */
  ?thumbnail_url:String,
  /** Optional . Thumbnail width */
  ?thumbnail_width:Int,
  /** Optional . Thumbnail height */
  ?thumbnail_height:Int,
}
