package telegram.types;

/**
 * This object represent a user's profile pictures.
 */
typedef UserProfilePhotos = {
  /** Total number of profile pictures the target user has */
  total_count:Int,
  /** Requested profile pictures (in up to 4 sizes each) */
  photos:Array<Array<PhotoSize>>,
}
