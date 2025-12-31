package telegram.types;

/**
 * This object represents a service message about an edited forum topic.
 */
typedef ForumTopicEdited = {
  /** Optional . New name of the topic, if it was edited */
  ?name:String,
  /** Optional . New identifier of the custom emoji shown as the topic icon, if it was edited; an empty string if the icon was removed */
  ?icon_custom_emoji_id:String,
}
