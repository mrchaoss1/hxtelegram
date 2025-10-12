package telegram.types;

/**
 * This object describes the colors of the backdrop of a unique gift.
 */
typedef UniqueGiftBackdropColors = {
  /** The color in the center of the backdrop in RGB format */
  center_color:Int,
  /** The color on the edges of the backdrop in RGB format */
  edge_color:Int,
  /** The color to be applied to the symbol in RGB format */
  symbol_color:Int,
  /** The color for the text on the backdrop in RGB format */
  text_color:Int,
}
