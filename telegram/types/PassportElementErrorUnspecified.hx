package telegram.types;

/**
 * Represents an issue in an unspecified place. The error is considered resolved when new data is added.
 */
typedef PassportElementErrorUnspecified = {
  /** Error source, must be unspecified */
  source:String,
  /** Type of element of the user's Telegram Passport which has the issue */
  type:String,
  /** Base64-encoded element hash */
  element_hash:String,
  /** Error message */
  message:String,
}
