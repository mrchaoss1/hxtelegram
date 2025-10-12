package telegram.types;

/**
 * Describes the paid media added to a message.
 */
typedef PaidMediaInfo = {
  /** The number of Telegram Stars that must be paid to buy access to the media */
  star_count:Int,
  /** Information about the paid media */
  paid_media:Array<PaidMedia>,
}
