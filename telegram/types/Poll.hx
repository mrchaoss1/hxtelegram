package telegram.types;

/**
 * This object contains information about a poll.
 */
typedef Poll = {
  /** Unique poll identifier */
  id:String,
  /** Poll question, 1-300 characters */
  question:String,
  /** Optional . Special entities that appear in the question . Currently, only custom emoji entities are allowed in poll questions */
  ?question_entities:Array<MessageEntity>,
  /** List of poll options */
  options:Array<PollOption>,
  /** Total number of users that voted in the poll */
  total_voter_count:Int,
  /** True , if the poll is closed */
  is_closed:Bool,
  /** True , if the poll is anonymous */
  is_anonymous:Bool,
  /** Poll type, currently can be “regular” or “quiz” */
  type:String,
  /** True , if the poll allows multiple answers */
  allows_multiple_answers:Bool,
  /** Optional . 0-based identifier of the correct answer option. Available only for polls in the quiz mode, which are closed, or was sent (not forwarded) by the bot or to the private chat with the bot. */
  ?correct_option_id:Int,
  /** Optional . Text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, 0-200 characters */
  ?explanation:String,
  /** Optional . Special entities like usernames, URLs, bot commands, etc. that appear in the explanation */
  ?explanation_entities:Array<MessageEntity>,
  /** Optional . Amount of time in seconds the poll will be active after creation */
  ?open_period:Int,
  /** Optional . Point in time (Unix timestamp) when the poll will be automatically closed */
  ?close_date:Int,
}
