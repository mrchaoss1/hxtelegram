package telegram.types;

/**
    This object describes the content of a story to post. Currently, it can be one of

    - InputStoryContentPhoto
    - InputStoryContentVideo
**/
typedef InputStoryContent = {}

/**
 * Describes a video to post as a story.
 */
typedef InputStoryContentVideo = {
  >InputStoryContent,
  /** Type of the content, must be video */
  type:String,
  /** The video to post as a story. The video must be of the size 720x1280, streamable, encoded with H.265 codec, with key frames added each second in the MPEG4 format, and must not exceed 30 MB. The video can't be reused and can only be uploaded as a new file, so you can pass “attach://<file_attach_name>” if the video was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files » */
  video:String,
  /** Optional . Precise duration of the video in seconds; 0-60 */
  ?duration:Float,
  /** Optional . Timestamp in seconds of the frame that will be used as the static cover for the story. Defaults to 0.0. */
  ?cover_frame_timestamp:Float,
  /** Optional . Pass True if the video has no sound */
  ?is_animation:Bool,
}

/**
 * Describes a photo to post as a story.
 */
typedef InputStoryContentPhoto = {
  >InputStoryContent,
  /** Type of the content, must be photo */
  type:String,
  /** The photo to post as a story. The photo must be of the size 1080x1920 and must not exceed 10 MB. The photo can't be reused and can only be uploaded as a new file, so you can pass “attach://<file_attach_name>” if the photo was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files » */
  photo:String,
}