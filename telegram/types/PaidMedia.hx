package telegram.types;

/**
    This object describes paid media. Currently, it can be one of

    - PaidMediaPreview
    - PaidMediaPhoto
    - PaidMediaVideo
**/
typedef PaidMedia = {} 

/**
 * The paid media isn't available before the payment.
 */
typedef PaidMediaPreview = {
  >PaidMedia,
  /** Type of the paid media, always “preview” */
  type:String,
  /** Optional . Media width as defined by the sender */
  ?width:Int,
  /** Optional . Media height as defined by the sender */
  ?height:Int,
  /** Optional . Duration of the media in seconds as defined by the sender */
  ?duration:Int,
}

/**
 * The paid media is a video.
 */
typedef PaidMediaVideo = {
  >PaidMedia,
  /** Type of the paid media, always “video” */
  type:String,
  /** The video */
  video:Video,
}

/**
 * The paid media is a photo.
 */
typedef PaidMediaPhoto = {
  >PaidMedia,
  /** Type of the paid media, always “photo” */
  type:String,
  /** The photo */
  photo:Array<PhotoSize>,
}