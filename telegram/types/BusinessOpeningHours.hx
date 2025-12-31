package telegram.types;

/**
 * Describes the opening hours of a business.
 */
typedef BusinessOpeningHours = {
  /** Unique name of the time zone for which the opening hours are defined */
  time_zone_name:String,
  /** List of time intervals describing business opening hours */
  opening_hours:Array<BusinessOpeningHoursInterval>,
}
