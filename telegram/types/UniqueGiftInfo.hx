package telegram.types;

/**
 * Describes a service message about a unique gift that was sent or received.
 */
typedef UniqueGiftInfo = {
  /** Information about the gift */
  gift:UniqueGift,
  /** Origin of the gift. Currently, either “upgrade” for gifts upgraded from regular gifts, “transfer” for gifts transferred from other users or channels, or “resale” for gifts bought from other users */
  origin:String,
  /** Optional . For gifts bought from other users, the price paid for the gift */
  ?last_resale_star_count:Int,
  /** Optional . Unique identifier of the received gift for the bot; only present for gifts received on behalf of business accounts */
  ?owned_gift_id:String,
  /** Optional . Number of Telegram Stars that must be paid to transfer the gift; omitted if the bot cannot transfer the gift */
  ?transfer_star_count:Int,
  /** Optional . Point in time (Unix timestamp) when the gift can be transferred. If it is in the past, then the gift can be transferred now */
  ?next_transfer_date:Int,
}
