package telegram.types;

/**
 * Represents a link to a page containing an embedded video player or a video file. By default, this video file will be sent by the user with an optional caption. Alternatively, you can useinput_message_contentto send a message with the specified content instead of the video.
 */
typedef InlineQueryResultVideo = {
  /** Type of the result, must be video */
  type:String,
  /** Unique identifier for this result, 1-64 bytes */
  id:String,
  /** A valid URL for the embedded video player or video file */
  video_url:String,
  /** MIME type of the content of the video URL, “text/html” or “video/mp4” */
  mime_type:String,
  /** URL of the thumbnail (JPEG only) for the video */
  thumbnail_url:String,
  /** Title for the result */
  title:String,
  /** Optional . Caption of the video to be sent, 0-1024 characters after entities parsing */
  ?caption:String,
  /** Optional . Mode for parsing entities in the video caption. See formatting options for more details. */
  ?parse_mode:String,
  /** Optional . List of special entities that appear in the caption, which can be specified instead of parse_mode */
  ?caption_entities:Array<MessageEntity>,
  /** Optional . Pass True , if the caption must be shown above the message media */
  ?show_caption_above_media:Bool,
  /** Optional . Video width */
  ?video_width:Int,
  /** Optional . Video height */
  ?video_height:Int,
  /** Optional . Video duration in seconds */
  ?video_duration:Int,
  /** Optional . Short description of the result */
  ?description:String,
  /** Optional . Inline keyboard attached to the message */
  ?reply_markup:InlineKeyboardMarkup,
  /** Optional . Content of the message to be sent instead of the video. This field is required if InlineQueryResultVideo is used to send an HTML-page as a result (e.g., a YouTube video). */
  ?input_message_content:InputMessageContent,
}
