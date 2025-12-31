package telegram.types;

/**
 * Represents an issue in one of the data fields that was provided by the user. The error is considered resolved when the field's value changes.
 */
typedef PassportElementErrorDataField = {
  /** Error source, must be data */
  source:String,
  /** The section of the user's Telegram Passport which has the error, one of “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport”, “address” */
  type:String,
  /** Name of the data field which has the error */
  field_name:String,
  /** Base64-encoded data hash */
  data_hash:String,
  /** Error message */
  message:String,
}
