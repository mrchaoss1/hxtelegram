package telegram.types;

/**
 * Represents a link to a photo. By default, this photo will be sent by the user with optional caption. Alternatively, you can useinput_message_contentto send a message with the specified content instead of the photo.
 */
typedef InlineQueryResultPhoto = {
  /** Type of the result, must be photo */
  type:String,
  /** Unique identifier for this result, 1-64 bytes */
  id:String,
  /** A valid URL of the photo. Photo must be in JPEG format. Photo size must not exceed 5MB */
  photo_url:String,
  /** URL of the thumbnail for the photo */
  thumbnail_url:String,
  /** Optional . Width of the photo */
  ?photo_width:Int,
  /** Optional . Height of the photo */
  ?photo_height:Int,
  /** Optional . Title for the result */
  ?title:String,
  /** Optional . Short description of the result */
  ?description:String,
  /** Optional . Caption of the photo to be sent, 0-1024 characters after entities parsing */
  ?caption:String,
  /** Optional . Mode for parsing entities in the photo caption. See formatting options for more details. */
  ?parse_mode:String,
  /** Optional . List of special entities that appear in the caption, which can be specified instead of parse_mode */
  ?caption_entities:Array<MessageEntity>,
  /** Optional . Pass True , if the caption must be shown above the message media */
  ?show_caption_above_media:Bool,
  /** Optional . Inline keyboard attached to the message */
  ?reply_markup:InlineKeyboardMarkup,
  /** Optional . Content of the message to be sent instead of the photo */
  ?input_message_content:InputMessageContent,
}
