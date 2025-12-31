package telegram.types;

/**
    This object describes the way a background is filled based on the selected colors. Currently, it can be one of

    - BackgroundFillSolid
    - BackgroundFillGradient
    - BackgroundFillFreeformGradient
**/
typedef BackgroundFill = {}

/**
 * The background is filled using the selected color.
 */
typedef BackgroundFillSolid = {
  >BackgroundFill,
  /** Type of the background fill, always “solid” */
  type:String,
  /** The color of the background fill in the RGB24 format */
  color:Int,
}

/**
 * The background is a gradient fill.
 */
typedef BackgroundFillGradient = {
  >BackgroundFill,
  /** Type of the background fill, always “gradient” */
  type:String,
  /** Top color of the gradient in the RGB24 format */
  top_color:Int,
  /** Bottom color of the gradient in the RGB24 format */
  bottom_color:Int,
  /** Clockwise rotation angle of the background fill in degrees; 0-359 */
  rotation_angle:Int,
}

/**
 * The background is a freeform gradient that rotates after every message in the chat.
 */
typedef BackgroundFillFreeformGradient = {
  >BackgroundFill,
  /** Type of the background fill, always “freeform_gradient” */
  type:String,
  /** A list of the 3 or 4 base colors that are used to generate the freeform gradient in the RGB24 format */
  colors:Array<Int>,
}