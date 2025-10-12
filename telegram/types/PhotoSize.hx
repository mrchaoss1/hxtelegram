package telegram.types;

/**
 * This object represents one size of a photo or afile/stickerthumbnail.
 */
typedef PhotoSize = {
  /** Identifier for this file, which can be used to download or reuse the file */
  file_id:String,
  /** Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file. */
  file_unique_id:String,
  /** Photo width */
  width:Int,
  /** Photo height */
  height:Int,
  /** Optional . File size in bytes */
  ?file_size:Int,
}
