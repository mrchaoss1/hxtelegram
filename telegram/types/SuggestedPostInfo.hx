package telegram.types;

/**
 * Contains information about a suggested post.
 */
typedef SuggestedPostInfo = {
  /** State of the suggested post. Currently, it can be one of “pending”, “approved”, “declined”. */
  state:String,
  /** Optional . Proposed price of the post. If the field is omitted, then the post is unpaid. */
  ?price:SuggestedPostPrice,
  /** Optional . Proposed send date of the post. If the field is omitted, then the post can be published at any time within 30 days at the sole discretion of the user or administrator who approves it. */
  ?send_date:Int,
}
