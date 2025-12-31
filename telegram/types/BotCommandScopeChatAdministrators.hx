package telegram.types;

/**
 * Represents thescopeof bot commands, covering all administrators of a specific group or supergroup chat.
 */
typedef BotCommandScopeChatAdministrators = {
  /** Scope type, must be chat_administrators */
  type:String,
  /** Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername ). Channel direct messages chats and channel chats aren't supported. */
  chat_id:Dynamic,
}
