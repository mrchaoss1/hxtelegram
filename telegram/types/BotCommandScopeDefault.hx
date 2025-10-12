package telegram.types;

/**
 * Represents the defaultscopeof bot commands. Default commands are used if no commands with anarrower scopeare specified for the user.
 */
typedef BotCommandScopeDefault = {
  /** Scope type, must be default */
  type:String,
}
