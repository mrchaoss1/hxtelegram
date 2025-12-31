package telegram.types;

/**
 * Represents a link to an MP3 audio file. By default, this audio file will be sent by the user. Alternatively, you can useinput_message_contentto send a message with the specified content instead of the audio.
 */
typedef InlineQueryResultAudio = {
  /** Type of the result, must be audio */
  type:String,
  /** Unique identifier for this result, 1-64 bytes */
  id:String,
  /** A valid URL for the audio file */
  audio_url:String,
  /** Title */
  title:String,
  /** Optional . Caption, 0-1024 characters after entities parsing */
  ?caption:String,
  /** Optional . Mode for parsing entities in the audio caption. See formatting options for more details. */
  ?parse_mode:String,
  /** Optional . List of special entities that appear in the caption, which can be specified instead of parse_mode */
  ?caption_entities:Array<MessageEntity>,
  /** Optional . Performer */
  ?performer:String,
  /** Optional . Audio duration in seconds */
  ?audio_duration:Int,
  /** Optional . Inline keyboard attached to the message */
  ?reply_markup:InlineKeyboardMarkup,
  /** Optional . Content of the message to be sent instead of the audio */
  ?input_message_content:InputMessageContent,
}
