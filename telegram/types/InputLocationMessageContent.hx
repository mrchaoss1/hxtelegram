package telegram.types;

/**
 * Represents thecontentof a location message to be sent as the result of an inline query.
 */
typedef InputLocationMessageContent = {
  /** Latitude of the location in degrees */
  latitude:Float,
  /** Longitude of the location in degrees */
  longitude:Float,
  /** Optional . The radius of uncertainty for the location, measured in meters; 0-1500 */
  ?horizontal_accuracy:Float,
  /** Optional . Period in seconds during which the location can be updated, should be between 60 and 86400, or 0x7FFFFFFF for live locations that can be edited indefinitely. */
  ?live_period:Int,
  /** Optional . For live locations, a direction in which the user is moving, in degrees. Must be between 1 and 360 if specified. */
  ?heading:Int,
  /** Optional . For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified. */
  ?proximity_alert_radius:Int,
}
