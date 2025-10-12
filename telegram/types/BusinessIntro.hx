package telegram.types;

/**
 * Contains information about the start page settings of a Telegram Business account.
 */
typedef BusinessIntro = {
  /** Optional . Title text of the business intro */
  ?title:String,
  /** Optional . Message text of the business intro */
  ?message:String,
  /** Optional . Sticker of the business intro */
  ?sticker:Sticker,
}
