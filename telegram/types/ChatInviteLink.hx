package telegram.types;

/**
 * Represents an invite link for a chat.
 */
typedef ChatInviteLink = {
  /** The invite link. If the link was created by another chat administrator, then the second part of the link will be replaced with “…”. */
  invite_link:String,
  /** Creator of the link */
  creator:User,
  /** True , if users joining the chat via the link need to be approved by chat administrators */
  creates_join_request:Bool,
  /** True , if the link is primary */
  is_primary:Bool,
  /** True , if the link is revoked */
  is_revoked:Bool,
  /** Optional . Invite link name */
  ?name:String,
  /** Optional . Point in time (Unix timestamp) when the link will expire or has been expired */
  ?expire_date:Int,
  /** Optional . The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999 */
  ?member_limit:Int,
  /** Optional . Number of pending join requests created using this link */
  ?pending_join_request_count:Int,
  /** Optional . The number of seconds the subscription will be active for before the next payment */
  ?subscription_period:Int,
  /** Optional . The amount of Telegram Stars a user must pay initially and after each subsequent subscription period to be a member of the chat using the link */
  ?subscription_price:Int,
}
