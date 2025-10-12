package telegram.types;

/**
 * This object represents a point on the map.
 */
typedef Location = {
  /** Latitude as defined by the sender */
  latitude:Float,
  /** Longitude as defined by the sender */
  longitude:Float,
  /** Optional . The radius of uncertainty for the location, measured in meters; 0-1500 */
  ?horizontal_accuracy:Float,
  /** Optional . Time relative to the message sending date, during which the location can be updated; in seconds. For active live locations only. */
  ?live_period:Int,
  /** Optional . The direction in which user is moving, in degrees; 1-360. For active live locations only. */
  ?heading:Int,
  /** Optional . The maximum distance for proximity alerts about approaching another chat member, in meters. For sent live locations only. */
  ?proximity_alert_radius:Int,
}
