package telegram.types;

/**
 * This object represents one row of the high scores table for a game.
 */
typedef GameHighScore = {
  /** Position in high score table for the game */
  position:Int,
  /** User */
  user:User,
  /** Score */
  score:Int,
}
