package telegram.types;

/**
 * Represents thecontentof a venue message to be sent as the result of an inline query.
 */
typedef InputVenueMessageContent = {
  /** Latitude of the venue in degrees */
  latitude:Float,
  /** Longitude of the venue in degrees */
  longitude:Float,
  /** Name of the venue */
  title:String,
  /** Address of the venue */
  address:String,
  /** Optional . Foursquare identifier of the venue, if known */
  ?foursquare_id:String,
  /** Optional . Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.) */
  ?foursquare_type:String,
  /** Optional . Google Places identifier of the venue */
  ?google_place_id:String,
  /** Optional . Google Places type of the venue. (See supported types .) */
  ?google_place_type:String,
}
