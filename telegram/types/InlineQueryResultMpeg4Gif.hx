package telegram.types;

/**
 * Represents a link to a video animation (H.264/MPEG-4 AVC video without sound). By default, this animated MPEG-4 file will be sent by the user with optional caption. Alternatively, you can useinput_message_contentto send a message with the specified content instead of the animation.
 */
typedef InlineQueryResultMpeg4Gif = {
  /** Type of the result, must be mpeg4_gif */
  type:String,
  /** Unique identifier for this result, 1-64 bytes */
  id:String,
  /** A valid URL for the MPEG4 file */
  mpeg4_url:String,
  /** Optional . Video width */
  ?mpeg4_width:Int,
  /** Optional . Video height */
  ?mpeg4_height:Int,
  /** Optional . Video duration in seconds */
  ?mpeg4_duration:Int,
  /** URL of the static (JPEG or GIF) or animated (MPEG4) thumbnail for the result */
  thumbnail_url:String,
  /** Optional . MIME type of the thumbnail, must be one of “image/jpeg”, “image/gif”, or “video/mp4”. Defaults to “image/jpeg” */
  ?thumbnail_mime_type:String,
  /** Optional . Title for the result */
  ?title:String,
  /** Optional . Caption of the MPEG-4 file to be sent, 0-1024 characters after entities parsing */
  ?caption:String,
  /** Optional . Mode for parsing entities in the caption. See formatting options for more details. */
  ?parse_mode:String,
  /** Optional . List of special entities that appear in the caption, which can be specified instead of parse_mode */
  ?caption_entities:Array<MessageEntity>,
  /** Optional . Pass True , if the caption must be shown above the message media */
  ?show_caption_above_media:Bool,
  /** Optional . Inline keyboard attached to the message */
  ?reply_markup:InlineKeyboardMarkup,
  /** Optional . Content of the message to be sent instead of the video animation */
  ?input_message_content:InputMessageContent,
}
