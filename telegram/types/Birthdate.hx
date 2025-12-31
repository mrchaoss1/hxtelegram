package telegram.types;

/**
 * Describes the birthdate of a user.
 */
typedef Birthdate = {
  /** Day of the user's birth; 1-31 */
  day:Int,
  /** Month of the user's birth; 1-12 */
  month:Int,
  /** Optional . Year of the user's birth */
  ?year:Int,
}
