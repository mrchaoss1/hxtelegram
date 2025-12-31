package telegram.types;

/**
 * This object describes the model of a unique gift.
 */
typedef UniqueGiftModel = {
  /** Name of the model */
  name:String,
  /** The sticker that represents the unique gift */
  sticker:Sticker,
  /** The number of unique gifts that receive this model for every 1000 gifts upgraded */
  rarity_per_mille:Int,
}
