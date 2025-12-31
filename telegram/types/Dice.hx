package telegram.types;

/**
 * This object represents an animated emoji that displays a random value.
 */
typedef Dice = {
  /** Emoji on which the dice throw animation is based */
  emoji:String,
  /** Value of the dice, 1-6 for “ ”, “ ” and “ ” base emoji, 1-5 for “ ” and “ ” base emoji, 1-64 for “ ” base emoji */
  value:Int,
}
