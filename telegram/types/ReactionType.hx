package telegram.types;

/**
    This object describes the type of a reaction. Currently, it can be one of

    - ReactionTypeEmoji
    - ReactionTypeCustomEmoji
    - ReactionTypePaid
**/
typedef ReactionType = {}

/**
 * The reaction is based on a custom emoji.
 */
typedef ReactionTypeCustomEmoji = {
  >ReactionType,
  /** Type of the reaction, always “custom_emoji” */
  type:String,
  /** Custom emoji identifier */
  custom_emoji_id:String,
}

/**
 * The reaction is based on an emoji.
 */
typedef ReactionTypeEmoji = {
  >ReactionType,
  /** Type of the reaction, always “emoji” */
  type:String,
  /** Reaction emoji.*/
  emoji:String,
}

/**
 * The reaction is paid.
 */
typedef ReactionTypePaid = {
  >ReactionType,
  /** Type of the reaction, always “paid” */
  type:String,
}