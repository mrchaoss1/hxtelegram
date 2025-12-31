package telegram.types;

/**
 * Represents a reaction added to a message along with the number of times it was added.
 */
typedef ReactionCount = {
  /** Type of the reaction */
  type:ReactionType,
  /** Number of times the reaction was added */
  total_count:Int,
}
