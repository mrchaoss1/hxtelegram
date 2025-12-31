package telegram.types;

/**
 * Represents an issue with the reverse side of a document. The error is considered resolved when the file with reverse side of the document changes.
 */
typedef PassportElementErrorReverseSide = {
  /** Error source, must be reverse_side */
  source:String,
  /** The section of the user's Telegram Passport which has the issue, one of “driver_license”, “identity_card” */
  type:String,
  /** Base64-encoded hash of the file with the reverse side of the document */
  file_hash:String,
  /** Error message */
  message:String,
}
