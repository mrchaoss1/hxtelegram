package telegram.types;

/**
 * This object represents a service message about a change in auto-delete timer settings.
 */
typedef MessageAutoDeleteTimerChanged = {
  /** New auto-delete time for messages in the chat; in seconds */
  message_auto_delete_time:Int,
}
