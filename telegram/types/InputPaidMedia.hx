package telegram.types;

/**
    This object describes the paid media to be sent. Currently, it can be one of

    - InputPaidMediaPhoto
    - InputPaidMediaVideo
**/
typedef InputPaidMedia = {}

/**
 * The paid media to send is a photo.
 */
typedef InputPaidMediaPhoto = {
  >InputPaidMedia,
  /** Type of the media, must be photo */
  type:String,
  /** File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files » */
  media:String,
}

/**
 * The paid media to send is a video.
 */
typedef InputPaidMediaVideo = {
  >InputPaidMedia,
  /** Type of the media, must be video */
  type:String,
  /** File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files » */
  media:String,
  /** Optional . Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files » */
  ?thumbnail:String,
  /** Optional . Cover for the video in the message. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files » */
  ?cover:String,
  /** Optional . Start timestamp for the video in the message */
  ?start_timestamp:Int,
  /** Optional . Video width */
  ?width:Int,
  /** Optional . Video height */
  ?height:Int,
  /** Optional . Video duration in seconds */
  ?duration:Int,
  /** Optional . Pass True if the uploaded video is suitable for streaming */
  ?supports_streaming:Bool,
}