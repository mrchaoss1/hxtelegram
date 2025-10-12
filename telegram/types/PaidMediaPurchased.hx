package telegram.types;

/**
 * This object contains information about a paid media purchase.
 */
typedef PaidMediaPurchased = {
  /** User who purchased the media */
  from:User,
  /** Bot-specified paid media payload */
  paid_media_payload:String,
}
