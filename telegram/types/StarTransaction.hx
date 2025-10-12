package telegram.types;

/**
 * Describes a Telegram Star transaction. Note that if the buyer initiates a chargeback with the payment provider from whom they acquired Stars (e.g., Apple, Google) following this transaction, the refunded Stars will be deducted from the bot's balance. This is outside of Telegram's control.
 */
typedef StarTransaction = {
  /** Unique identifier of the transaction. Coincides with the identifier of the original transaction for refund transactions. Coincides with SuccessfulPayment.telegram_payment_charge_id for successful incoming payments from users. */
  id:String,
  /** Integer amount of Telegram Stars transferred by the transaction */
  amount:Int,
  /** Optional . The number of 1/1000000000 shares of Telegram Stars transferred by the transaction; from 0 to 999999999 */
  ?nanostar_amount:Int,
  /** Date the transaction was created in Unix time */
  date:Int,
  /** Optional . Source of an incoming transaction (e.g., a user purchasing goods or services, Fragment refunding a failed withdrawal). Only for incoming transactions */
  ?source:TransactionPartner,
  /** Optional . Receiver of an outgoing transaction (e.g., a user for a purchase refund, Fragment for a withdrawal). Only for outgoing transactions */
  ?receiver:TransactionPartner,
}
