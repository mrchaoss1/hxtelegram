package telegram.types;

/**
    This object describes the state of a revenue withdrawal operation. Currently, it can be one of

    - RevenueWithdrawalStatePending
    - RevenueWithdrawalStateSucceeded
    - RevenueWithdrawalStateFailed
**/
typedef RevenueWithdrawalState = {}

/**
 * The withdrawal failed and the transaction was refunded.
 */
typedef RevenueWithdrawalStateFailed = {
  >RevenueWithdrawalState,
  /** Type of the state, always “failed” */
  type:String,
}

/**
 * The withdrawal is in progress.
 */
typedef RevenueWithdrawalStatePending = {
  >RevenueWithdrawalState,
  /** Type of the state, always “pending” */
  type:String,
}

/**
 * The withdrawal succeeded.
 */
typedef RevenueWithdrawalStateSucceeded = {
  >RevenueWithdrawalState,
  /** Type of the state, always “succeeded” */
  type:String,
  /** Date the withdrawal was completed in Unix time */
  date:Int,
  /** An HTTPS URL that can be used to see transaction details */
  url:String,
}