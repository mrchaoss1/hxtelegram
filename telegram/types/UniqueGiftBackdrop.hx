package telegram.types;

/**
 * This object describes the backdrop of a unique gift.
 */
typedef UniqueGiftBackdrop = {
  /** Name of the backdrop */
  name:String,
  /** Colors of the backdrop */
  colors:UniqueGiftBackdropColors,
  /** The number of unique gifts that receive this backdrop for every 1000 gifts upgraded */
  rarity_per_mille:Int,
}
