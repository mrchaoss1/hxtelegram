package telegram.types;

/**
 * Represents an issue with the translated version of a document. The error is considered resolved when a file with the document translation change.
 */
typedef PassportElementErrorTranslationFiles = {
  /** Error source, must be translation_files */
  source:String,
  /** Type of element of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration” */
  type:String,
  /** List of base64-encoded file hashes */
  file_hashes:Array<String>,
  /** Error message */
  message:String,
}
