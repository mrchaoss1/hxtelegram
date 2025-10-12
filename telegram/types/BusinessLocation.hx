package telegram.types;

/**
 * Contains information about the location of a Telegram Business account.
 */
typedef BusinessLocation = {
  /** Address of the business */
  address:String,
  /** Optional . Location of the business */
  ?location:Location,
}
