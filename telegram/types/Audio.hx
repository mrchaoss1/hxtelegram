package telegram.types;

/**
 * This object represents an audio file to be treated as music by the Telegram clients.
 */
typedef Audio = {
  /** Identifier for this file, which can be used to download or reuse the file */
  file_id:String,
  /** Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file. */
  file_unique_id:String,
  /** Duration of the audio in seconds as defined by the sender */
  duration:Int,
  /** Optional . Performer of the audio as defined by the sender or by audio tags */
  ?performer:String,
  /** Optional . Title of the audio as defined by the sender or by audio tags */
  ?title:String,
  /** Optional . Original filename as defined by the sender */
  ?file_name:String,
  /** Optional . MIME type of the file as defined by the sender */
  ?mime_type:String,
  /** Optional . File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value. */
  ?file_size:Int,
  /** Optional . Thumbnail of the album cover to which the music file belongs */
  ?thumbnail:PhotoSize,
}
