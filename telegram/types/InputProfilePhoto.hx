package telegram.types;

/**
    This object describes a profile photo to set. Currently, it can be one of

    - InputProfilePhotoStatic
    - InputProfilePhotoAnimated
**/
typedef InputProfilePhoto = {}

/**
 * An animated profile photo in the MPEG4 format.
 */
typedef InputProfilePhotoAnimated = {
  >InputProfilePhoto,
  /** Type of the profile photo, must be animated */
  type:String,
  /** The animated profile photo. Profile photos can't be reused and can only be uploaded as a new file, so you can pass “attach://<file_attach_name>” if the photo was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files » */
  animation:String,
  /** Optional . Timestamp in seconds of the frame that will be used as the static profile photo. Defaults to 0.0. */
  ?main_frame_timestamp:Float,
}

/**
 * A static profile photo in the .JPG format.
 */
typedef InputProfilePhotoStatic = {
  >InputProfilePhoto,
  /** Type of the profile photo, must be static */
  type:String,
  /** The static profile photo. Profile photos can't be reused and can only be uploaded as a new file, so you can pass “attach://<file_attach_name>” if the photo was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files » */
  photo:String,
}