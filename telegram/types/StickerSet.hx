package telegram.types;

/**
 * This object represents a sticker set.
 */
typedef StickerSet = {
  /** Sticker set name */
  name:String,
  /** Sticker set title */
  title:String,
  /** Type of stickers in the set, currently one of “regular”, “mask”, “custom_emoji” */
  sticker_type:String,
  /** List of all set stickers */
  stickers:Array<Sticker>,
  /** Optional . Sticker set thumbnail in the .WEBP, .TGS, or .WEBM format */
  ?thumbnail:PhotoSize,
}
