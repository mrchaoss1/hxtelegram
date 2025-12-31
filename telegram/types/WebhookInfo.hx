package telegram.types;

/**
 * Describes the current status of a webhook.
 */
typedef WebhookInfo = {
  /** Webhook URL, may be empty if webhook is not set up */
  url:String,
  /** True , if a custom certificate was provided for webhook certificate checks */
  has_custom_certificate:Bool,
  /** Number of updates awaiting delivery */
  pending_update_count:Int,
  /** Optional . Currently used webhook IP address */
  ?ip_address:String,
  /** Optional . Unix time for the most recent error that happened when trying to deliver an update via webhook */
  ?last_error_date:Int,
  /** Optional . Error message in human-readable format for the most recent error that happened when trying to deliver an update via webhook */
  ?last_error_message:String,
  /** Optional . Unix time of the most recent error that happened when trying to synchronize available updates with Telegram datacenters */
  ?last_synchronization_error_date:Int,
  /** Optional . The maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery */
  ?max_connections:Int,
  /** Optional . A list of update types the bot is subscribed to. Defaults to all update types except chat_member */
  ?allowed_updates:Array<String>,
}
