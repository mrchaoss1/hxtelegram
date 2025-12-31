package telegram.types;

/**
 * Describes data required for decrypting and authenticatingEncryptedPassportElement. See theTelegram Passport Documentationfor a complete description of the data decryption and authentication processes.
 */
typedef EncryptedCredentials = {
  /** Base64-encoded encrypted JSON-serialized data with unique user's payload, data hashes and secrets required for EncryptedPassportElement decryption and authentication */
  data:String,
  /** Base64-encoded data hash for data authentication */
  hash:String,
  /** Base64-encoded secret, encrypted with the bot's public RSA key, required for data decryption */
  secret:String,
}
