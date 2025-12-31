package telegram.types;

/**
 * Describes an interval of time during which a business is open.
 */
typedef BusinessOpeningHoursInterval = {
  /** The minute's sequence number in a week, starting on Monday, marking the start of the time interval during which the business is open; 0 - 7 * 24 * 60 */
  opening_minute:Int,
  /** The minute's sequence number in a week, starting on Monday, marking the end of the time interval during which the business is open; 0 - 8 * 24 * 60 */
  closing_minute:Int,
}
