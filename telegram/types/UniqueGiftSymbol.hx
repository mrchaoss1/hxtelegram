package telegram.types;

/**
 * This object describes the symbol shown on the pattern of a unique gift.
 */
typedef UniqueGiftSymbol = {
  /** Name of the symbol */
  name:String,
  /** The sticker that represents the unique gift */
  sticker:Sticker,
  /** The number of unique gifts that receive this model for every 1000 gifts upgraded */
  rarity_per_mille:Int,
}
