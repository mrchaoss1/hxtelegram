package telegram.types;

/**
 * This object represents a change of a reaction on a message performed by a user.
 */
typedef MessageReactionUpdated = {
  /** The chat containing the message the user reacted to */
  chat:Chat,
  /** Unique identifier of the message inside the chat */
  message_id:Int,
  /** Optional . The user that changed the reaction, if the user isn't anonymous */
  ?user:User,
  /** Optional . The chat on behalf of which the reaction was changed, if the user is anonymous */
  ?actor_chat:Chat,
  /** Date of the change in Unix time */
  date:Int,
  /** Previous list of reaction types that were set by the user */
  old_reaction:Array<ReactionType>,
  /** New list of reaction types that have been set by the user */
  new_reaction:Array<ReactionType>,
}
