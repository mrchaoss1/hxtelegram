package telegram.types;

/**
 * Represents an issue with a list of scans. The error is considered resolved when the list of files containing the scans changes.
 */
typedef PassportElementErrorFiles = {
  /** Error source, must be files */
  source:String,
  /** The section of the user's Telegram Passport which has the issue, one of “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration” */
  type:String,
  /** List of base64-encoded file hashes */
  file_hashes:Array<String>,
  /** Error message */
  message:String,
}
