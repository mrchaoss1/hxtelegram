package telegram.types;

/**
 * Represents thescopeof bot commands, covering a specific member of a group or supergroup chat.
 */
typedef BotCommandScopeChatMember = {
  /** Scope type, must be chat_member */
  type:String,
  /** Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername ). Channel direct messages chats and channel chats aren't supported. */
  chat_id:Dynamic,
  /** Unique identifier of the target user */
  user_id:Int,
}
