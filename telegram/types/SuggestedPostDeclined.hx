package telegram.types;

/**
 * Describes a service message about the rejection of a suggested post.
 */
typedef SuggestedPostDeclined = {
  /** Optional . Message containing the suggested post. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply. */
  ?suggested_post_message:Message,
  /** Optional . Comment with which the post was declined */
  ?comment:String,
}
