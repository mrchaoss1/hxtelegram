package telegram.types;

/**
    This object describes a gift received and owned by a user or a chat. Currently, it can be one of

    - OwnedGiftRegular
    - OwnedGiftUnique
**/
typedef OwnedGift = {}

/**
 * Describes a regular gift owned by a user or a chat.
 */
typedef OwnedGiftRegular = {
  >OwnedGift,
  /** Type of the gift, always “regular” */
  type:String,
  /** Information about the regular gift */
  gift:Gift,
  /** Optional . Unique identifier of the gift for the bot; for gifts received on behalf of business accounts only */
  ?owned_gift_id:String,
  /** Optional . Sender of the gift if it is a known user */
  ?sender_user:User,
  /** Date the gift was sent in Unix time */
  send_date:Int,
  /** Optional . Text of the message that was added to the gift */
  ?text:String,
  /** Optional . Special entities that appear in the text */
  ?entities:Array<MessageEntity>,
  /** Optional . True , if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them */
  ?is_private:Bool,
  /** Optional . True , if the gift is displayed on the account's profile page; for gifts received on behalf of business accounts only */
  ?is_saved:Bool,
  /** Optional . True , if the gift can be upgraded to a unique gift; for gifts received on behalf of business accounts only */
  ?can_be_upgraded:Bool,
  /** Optional . True , if the gift was refunded and isn't available anymore */
  ?was_refunded:Bool,
  /** Optional . Number of Telegram Stars that can be claimed by the receiver instead of the gift; omitted if the gift cannot be converted to Telegram Stars */
  ?convert_star_count:Int,
  /** Optional . Number of Telegram Stars that were paid by the sender for the ability to upgrade the gift */
  ?prepaid_upgrade_star_count:Int,
}

/**
 * Describes a unique gift received and owned by a user or a chat.
 */
typedef OwnedGiftUnique = {
  >OwnedGift,
  /** Type of the gift, always “unique” */
  type:String,
  /** Information about the unique gift */
  gift:UniqueGift,
  /** Optional . Unique identifier of the received gift for the bot; for gifts received on behalf of business accounts only */
  ?owned_gift_id:String,
  /** Optional . Sender of the gift if it is a known user */
  ?sender_user:User,
  /** Date the gift was sent in Unix time */
  send_date:Int,
  /** Optional . True , if the gift is displayed on the account's profile page; for gifts received on behalf of business accounts only */
  ?is_saved:Bool,
  /** Optional . True , if the gift can be transferred to another owner; for gifts received on behalf of business accounts only */
  ?can_be_transferred:Bool,
  /** Optional . Number of Telegram Stars that must be paid to transfer the gift; omitted if the bot cannot transfer the gift */
  ?transfer_star_count:Int,
  /** Optional . Point in time (Unix timestamp) when the gift can be transferred. If it is in the past, then the gift can be transferred now */
  ?next_transfer_date:Int,
}