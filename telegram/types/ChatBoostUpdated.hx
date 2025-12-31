package telegram.types;

/**
 * This object represents a boost added to a chat or changed.
 */
typedef ChatBoostUpdated = {
  /** Chat which was boosted */
  chat:Chat,
  /** Information about the chat boost */
  boost:ChatBoost,
}
