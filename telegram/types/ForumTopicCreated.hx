package telegram.types;

/**
 * This object represents a service message about a new forum topic created in the chat.
 */
typedef ForumTopicCreated = {
  /** Name of the topic */
  name:String,
  /** Color of the topic icon in RGB format */
  icon_color:Int,
  /** Optional . Unique identifier of the custom emoji shown as the topic icon */
  ?icon_custom_emoji_id:String,
}
