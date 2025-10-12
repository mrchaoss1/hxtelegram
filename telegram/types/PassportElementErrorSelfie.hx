package telegram.types;

/**
 * Represents an issue with the selfie with a document. The error is considered resolved when the file with the selfie changes.
 */
typedef PassportElementErrorSelfie = {
  /** Error source, must be selfie */
  source:String,
  /** The section of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport” */
  type:String,
  /** Base64-encoded hash of the file with the selfie */
  file_hash:String,
  /** Error message */
  message:String,
}
