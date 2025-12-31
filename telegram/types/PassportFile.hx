package telegram.types;

/**
 * This object represents a file uploaded to Telegram Passport. Currently all Telegram Passport files are in JPEG format when decrypted and don't exceed 10MB.
 */
typedef PassportFile = {
  /** Identifier for this file, which can be used to download or reuse the file */
  file_id:String,
  /** Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file. */
  file_unique_id:String,
  /** File size in bytes */
  file_size:Int,
  /** Unix time when the file was uploaded */
  file_date:Int,
}
