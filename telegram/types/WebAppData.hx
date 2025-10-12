package telegram.types;

/**
 * Describes data sent from aWeb Appto the bot.
 */
typedef WebAppData = {
  /** The data. Be aware that a bad client can send arbitrary data in this field. */
  data:String,
  /** Text of the web_app keyboard button from which the Web App was opened. Be aware that a bad client can send arbitrary data in this field. */
  button_text:String,
}
