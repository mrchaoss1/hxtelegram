package telegram.types;

/**
 * Represents thescopeof bot commands, covering a specific chat.
 */
typedef BotCommandScopeChat = {
  /** Scope type, must be chat */
  type:String,
  /** Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername ). Channel direct messages chats and channel chats aren't supported. */
  chat_id:Dynamic,
}
