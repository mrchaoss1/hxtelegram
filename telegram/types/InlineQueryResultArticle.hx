package telegram.types;

/**
 * Represents a link to an article or web page.
 */
typedef InlineQueryResultArticle = {
  /** Type of the result, must be article */
  type:String,
  /** Unique identifier for this result, 1-64 Bytes */
  id:String,
  /** Title of the result */
  title:String,
  /** Content of the message to be sent */
  input_message_content:InputMessageContent,
  /** Optional . Inline keyboard attached to the message */
  ?reply_markup:InlineKeyboardMarkup,
  /** Optional . URL of the result */
  ?url:String,
  /** Optional . Short description of the result */
  ?description:String,
  /** Optional . Url of the thumbnail for the result */
  ?thumbnail_url:String,
  /** Optional . Thumbnail width */
  ?thumbnail_width:Int,
  /** Optional . Thumbnail height */
  ?thumbnail_height:Int,
}
