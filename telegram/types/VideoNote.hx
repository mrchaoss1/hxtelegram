package telegram.types;

/**
 * This object represents avideo message(available in Telegram apps as ofv.4.0).
 */
typedef VideoNote = {
  /** Identifier for this file, which can be used to download or reuse the file */
  file_id:String,
  /** Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file. */
  file_unique_id:String,
  /** Video width and height (diameter of the video message) as defined by the sender */
  length:Int,
  /** Duration of the video in seconds as defined by the sender */
  duration:Int,
  /** Optional . Video thumbnail */
  ?thumbnail:PhotoSize,
  /** Optional . File size in bytes */
  ?file_size:Int,
}
