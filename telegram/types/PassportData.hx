package telegram.types;

/**
 * Describes Telegram Passport data shared with the bot by the user.
 */
typedef PassportData = {
  /** Array with information about documents and other Telegram Passport elements that was shared with the bot */
  data:Array<EncryptedPassportElement>,
  /** Encrypted credentials required to decrypt the data */
  credentials:EncryptedCredentials,
}
