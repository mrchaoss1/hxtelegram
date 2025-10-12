package telegram.types;

/**
 * This object contains information about one answer option in a poll.
 */
typedef PollOption = {
  /** Option text, 1-100 characters */
  text:String,
  /** Optional . Special entities that appear in the option text . Currently, only custom emoji entities are allowed in poll option texts */
  ?text_entities:Array<MessageEntity>,
  /** Number of users that voted for this option */
  voter_count:Int,
}
