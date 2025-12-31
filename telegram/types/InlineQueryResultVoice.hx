package telegram.types;

/**
 * Represents a link to a voice recording in an .OGG container encoded with OPUS. By default, this voice recording will be sent by the user. Alternatively, you can useinput_message_contentto send a message with the specified content instead of the the voice message.
 */
typedef InlineQueryResultVoice = {
  /** Type of the result, must be voice */
  type:String,
  /** Unique identifier for this result, 1-64 bytes */
  id:String,
  /** A valid URL for the voice recording */
  voice_url:String,
  /** Recording title */
  title:String,
  /** Optional . Caption, 0-1024 characters after entities parsing */
  ?caption:String,
  /** Optional . Mode for parsing entities in the voice message caption. See formatting options for more details. */
  ?parse_mode:String,
  /** Optional . List of special entities that appear in the caption, which can be specified instead of parse_mode */
  ?caption_entities:Array<MessageEntity>,
  /** Optional . Recording duration in seconds */
  ?voice_duration:Int,
  /** Optional . Inline keyboard attached to the message */
  ?reply_markup:InlineKeyboardMarkup,
  /** Optional . Content of the message to be sent instead of the voice recording */
  ?input_message_content:InputMessageContent,
}
