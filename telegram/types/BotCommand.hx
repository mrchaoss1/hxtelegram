package telegram.types;

/**
 * This object represents a bot command.
 */
typedef BotCommand = {
  /** Text of the command; 1-32 characters. Can contain only lowercase English letters, digits and underscores. */
  command:String,
  /** Description of the command; 1-256 characters. */
  description:String,
}
