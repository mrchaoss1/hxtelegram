package telegram.types;

/**
 * Describes documents or other Telegram Passport elements shared with the bot by the user.
 */
typedef EncryptedPassportElement = {
  /** Element type. One of “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport”, “address”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”, “phone_number”, “email”. */
  type:String,
  /** Optional . Base64-encoded encrypted Telegram Passport element data provided by the user; available only for “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport” and “address” types. Can be decrypted and verified using the accompanying EncryptedCredentials . */
  ?data:String,
  /** Optional . User's verified phone number; available only for “phone_number” type */
  ?phone_number:String,
  /** Optional . User's verified email address; available only for “email” type */
  ?email:String,
  /** Optional . Array of encrypted files with documents provided by the user; available only for “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration” and “temporary_registration” types. Files can be decrypted and verified using the accompanying EncryptedCredentials . */
  ?files:Array<PassportFile>,
  /** Optional . Encrypted file with the front side of the document, provided by the user; available only for “passport”, “driver_license”, “identity_card” and “internal_passport”. The file can be decrypted and verified using the accompanying EncryptedCredentials . */
  ?front_side:PassportFile,
  /** Optional . Encrypted file with the reverse side of the document, provided by the user; available only for “driver_license” and “identity_card”. The file can be decrypted and verified using the accompanying EncryptedCredentials . */
  ?reverse_side:PassportFile,
  /** Optional . Encrypted file with the selfie of the user holding a document, provided by the user; available if requested for “passport”, “driver_license”, “identity_card” and “internal_passport”. The file can be decrypted and verified using the accompanying EncryptedCredentials . */
  ?selfie:PassportFile,
  /** Optional . Array of encrypted files with translated versions of documents provided by the user; available if requested for “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration” and “temporary_registration” types. Files can be decrypted and verified using the accompanying EncryptedCredentials . */
  ?translation:Array<PassportFile>,
  /** Base64-encoded element hash for using in PassportElementErrorUnspecified */
  hash:String,
}
