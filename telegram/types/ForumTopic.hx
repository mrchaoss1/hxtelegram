package telegram.types;

/**
 * This object represents a forum topic.
 */
typedef ForumTopic = {
  /** Unique identifier of the forum topic */
  message_thread_id:Int,
  /** Name of the topic */
  name:String,
  /** Color of the topic icon in RGB format */
  icon_color:Int,
  /** Optional . Unique identifier of the custom emoji shown as the topic icon */
  ?icon_custom_emoji_id:String,
}
