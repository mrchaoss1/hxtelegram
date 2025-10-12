package telegram.types;

/**
 * This object represents an answer of a user in a non-anonymous poll.
 */
typedef PollAnswer = {
  /** Unique poll identifier */
  poll_id:String,
  /** Optional . The chat that changed the answer to the poll, if the voter is anonymous */
  ?voter_chat:Chat,
  /** Optional . The user that changed the answer to the poll, if the voter isn't anonymous */
  ?user:User,
  /** 0-based identifiers of chosen answer options. May be empty if the vote was retracted. */
  option_ids:Array<Int>,
}
