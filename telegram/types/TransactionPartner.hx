package telegram.types;

/**
    This object describes the source of a transaction, or its recipient for outgoing transactions. Currently, it can be one of

    - TransactionPartnerUser
    - TransactionPartnerChat
    - TransactionPartnerAffiliateProgram
    - TransactionPartnerFragment
    - TransactionPartnerTelegramAds
    - TransactionPartnerTelegramApi
    - TransactionPartnerOther
**/
typedef TransactionPartner = {}

/**
 * Describes a transaction with a user.
 */
typedef TransactionPartnerUser = {
  >TransactionPartner,
  /** Type of the transaction partner, always “user” */
  type:String,
  /** Type of the transaction, currently one of “invoice_payment” for payments via invoices, “paid_media_payment” for payments for paid media, “gift_purchase” for gifts sent by the bot, “premium_purchase” for Telegram Premium subscriptions gifted by the bot, “business_account_transfer” for direct transfers from managed business accounts */
  transaction_type:String,
  /** Information about the user */
  user:User,
  /** Optional . Information about the affiliate that received a commission via this transaction. Can be available only for “invoice_payment” and “paid_media_payment” transactions. */
  ?affiliate:AffiliateInfo,
  /** Optional . Bot-specified invoice payload. Can be available only for “invoice_payment” transactions. */
  ?invoice_payload:String,
  /** Optional . The duration of the paid subscription. Can be available only for “invoice_payment” transactions. */
  ?subscription_period:Int,
  /** Optional . Information about the paid media bought by the user; for “paid_media_payment” transactions only */
  ?paid_media:Array<PaidMedia>,
  /** Optional . Bot-specified paid media payload. Can be available only for “paid_media_payment” transactions. */
  ?paid_media_payload:String,
  /** Optional . The gift sent to the user by the bot; for “gift_purchase” transactions only */
  ?gift:Gift,
  /** Optional . Number of months the gifted Telegram Premium subscription will be active for; for “premium_purchase” transactions only */
  ?premium_subscription_duration:Int,
}

/**
 * Describes the affiliate program that issued the affiliate commission received via this transaction.
 */
typedef TransactionPartnerAffiliateProgram = {
  >TransactionPartner,
  /** Type of the transaction partner, always “affiliate_program” */
  type:String,
  /** Optional . Information about the bot that sponsored the affiliate program */
  ?sponsor_user:User,
  /** The number of Telegram Stars received by the bot for each 1000 Telegram Stars received by the affiliate program sponsor from referred users */
  commission_per_mille:Int,
}

/**
 * Describes a transaction with a chat.
 */
typedef TransactionPartnerChat = {
  >TransactionPartner,
  /** Type of the transaction partner, always “chat” */
  type:String,
  /** Information about the chat */
  chat:Chat,
  /** Optional . The gift sent to the chat by the bot */
  ?gift:Gift,
}

/**
 * Describes a withdrawal transaction with Fragment.
 */
typedef TransactionPartnerFragment = {
  >TransactionPartner,
  /** Type of the transaction partner, always “fragment” */
  type:String,
  /** Optional . State of the transaction if the transaction is outgoing */
  ?withdrawal_state:RevenueWithdrawalState,
}

/**
 * Describes a transaction with an unknown source or recipient.
 */
typedef TransactionPartnerOther = {
  >TransactionPartner,
  /** Type of the transaction partner, always “other” */
  type:String,
}

/**
 * Describes a withdrawal transaction to the Telegram Ads platform.
 */
typedef TransactionPartnerTelegramAds = {
  >TransactionPartner,
  /** Type of the transaction partner, always “telegram_ads” */
  type:String,
}

/**
 * Describes a transaction with payment forpaid broadcasting.
 */
typedef TransactionPartnerTelegramApi = {
  >TransactionPartner,
  /** Type of the transaction partner, always “telegram_api” */
  type:String,
  /** The number of successful requests that exceeded regular limits and were therefore billed */
  request_count:Int,
}