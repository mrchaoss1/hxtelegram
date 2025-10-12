package telegram.types;

/**
 * Describes the physical address of a location.
 */
typedef LocationAddress = {
  /** The two-letter ISO 3166-1 alpha-2 country code of the country where the location is located */
  country_code:String,
  /** Optional . State of the location */
  ?state:String,
  /** Optional . City of the location */
  ?city:String,
  /** Optional . Street address of the location */
  ?street:String,
}
