package telegram.types;

/**
 * This object represents aninline keyboardthat appears right next to the message it belongs to.
 */
typedef InlineKeyboardMarkup = {
  /** Array of button rows, each represented by an Array of InlineKeyboardButton objects */
  inline_keyboard:Array<Array<InlineKeyboardButton>>,
}
