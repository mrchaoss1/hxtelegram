package telegram.types;

/**
 * Represents a venue. By default, the venue will be sent by the user. Alternatively, you can useinput_message_contentto send a message with the specified content instead of the venue.
 */
typedef InlineQueryResultVenue = {
  /** Type of the result, must be venue */
  type:String,
  /** Unique identifier for this result, 1-64 Bytes */
  id:String,
  /** Latitude of the venue location in degrees */
  latitude:Float,
  /** Longitude of the venue location in degrees */
  longitude:Float,
  /** Title of the venue */
  title:String,
  /** Address of the venue */
  address:String,
  /** Optional . Foursquare identifier of the venue if known */
  ?foursquare_id:String,
  /** Optional . Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.) */
  ?foursquare_type:String,
  /** Optional . Google Places identifier of the venue */
  ?google_place_id:String,
  /** Optional . Google Places type of the venue. (See supported types .) */
  ?google_place_type:String,
  /** Optional . Inline keyboard attached to the message */
  ?reply_markup:InlineKeyboardMarkup,
  /** Optional . Content of the message to be sent instead of the venue */
  ?input_message_content:InputMessageContent,
  /** Optional . Url of the thumbnail for the result */
  ?thumbnail_url:String,
  /** Optional . Thumbnail width */
  ?thumbnail_width:Int,
  /** Optional . Thumbnail height */
  ?thumbnail_height:Int,
}
