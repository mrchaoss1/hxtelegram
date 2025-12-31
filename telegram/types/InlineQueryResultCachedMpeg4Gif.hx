package telegram.types;

/**
 * Represents a link to a video animation (H.264/MPEG-4 AVC video without sound) stored on the Telegram servers. By default, this animated MPEG-4 file will be sent by the user with an optional caption. Alternatively, you can useinput_message_contentto send a message with the specified content instead of the animation.
 */
typedef InlineQueryResultCachedMpeg4Gif = {
  /** Type of the result, must be mpeg4_gif */
  type:String,
  /** Unique identifier for this result, 1-64 bytes */
  id:String,
  /** A valid file identifier for the MPEG4 file */
  mpeg4_file_id:String,
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
