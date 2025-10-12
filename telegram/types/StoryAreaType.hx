package telegram.types;

/**
    Describes the type of a clickable area on a story. Currently, it can be one of

    - StoryAreaTypeLocation
    - StoryAreaTypeSuggestedReaction
    - StoryAreaTypeLink
    - StoryAreaTypeWeather
    - StoryAreaTypeUniqueGift
**/
typedef StoryAreaType = {}

/**
 * Describes a story area pointing to an HTTP or tg:// link. Currently, a story can have up to 3 link areas.
 */
typedef StoryAreaTypeLink = {
  >StoryAreaType,
  /** Type of the area, always “link” */
  type:String,
  /** HTTP or tg:// URL to be opened when the area is clicked */
  url:String,
}

/**
 * Describes a story area pointing to a location. Currently, a story can have up to 10 location areas.
 */
typedef StoryAreaTypeLocation = {
  >StoryAreaType,
  /** Type of the area, always “location” */
  type:String,
  /** Location latitude in degrees */
  latitude:Float,
  /** Location longitude in degrees */
  longitude:Float,
  /** Optional . Address of the location */
  ?address:LocationAddress,
}

/**
 * Describes a story area pointing to a suggested reaction. Currently, a story can have up to 5 suggested reaction areas.
 */
typedef StoryAreaTypeSuggestedReaction = {
  >StoryAreaType,
  /** Type of the area, always “suggested_reaction” */
  type:String,
  /** Type of the reaction */
  reaction_type:ReactionType,
  /** Optional . Pass True if the reaction area has a dark background */
  ?is_dark:Bool,
  /** Optional . Pass True if reaction area corner is flipped */
  ?is_flipped:Bool,
}

/**
 * Describes a story area pointing to a unique gift. Currently, a story can have at most 1 unique gift area.
 */
typedef StoryAreaTypeUniqueGift = {
  >StoryAreaType,
  /** Type of the area, always “unique_gift” */
  type:String,
  /** Unique name of the gift */
  name:String,
}

/**
 * Describes a story area containing weather information. Currently, a story can have up to 3 weather areas.
 */
typedef StoryAreaTypeWeather = {
  >StoryAreaType,
  /** Type of the area, always “weather” */
  type:String,
  /** Temperature, in degree Celsius */
  temperature:Float,
  /** Emoji representing the weather */
  emoji:String,
  /** A color of the area background in the ARGB format */
  background_color:Int,
}