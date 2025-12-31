package telegram.types;

/**
 * This object represents a venue.
 */
typedef Venue = {
  /** Venue location. Can't be a live location */
  location:Location,
  /** Name of the venue */
  title:String,
  /** Address of the venue */
  address:String,
  /** Optional . Foursquare identifier of the venue */
  ?foursquare_id:String,
  /** Optional . Foursquare type of the venue. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.) */
  ?foursquare_type:String,
  /** Optional . Google Places identifier of the venue */
  ?google_place_id:String,
  /** Optional . Google Places type of the venue. (See supported types .) */
  ?google_place_type:String,
}
