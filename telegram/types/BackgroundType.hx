package telegram.types;

/**
    This object describes the type of a background. Currently, it can be one of

    - BackgroundTypeFill
    - BackgroundTypeWallpaper
    - BackgroundTypePattern
    - BackgroundTypeChatTheme
**/
typedef BackgroundType = {}

/**
 * The background is automatically filled based on the selected colors.
 */
typedef BackgroundTypeFill = {
  >BackgroundType,
  /** Type of the background, always “fill” */
  type:String,
  /** The background fill */
  fill:BackgroundFill,
  /** Dimming of the background in dark themes, as a percentage; 0-100 */
  dark_theme_dimming:Int,
}

/**
 * The background is a wallpaper in the JPEG format.
 */
typedef BackgroundTypeWallpaper = {
  >BackgroundType,
  /** Type of the background, always “wallpaper” */
  type:String,
  /** Document with the wallpaper */
  document:Document,
  /** Dimming of the background in dark themes, as a percentage; 0-100 */
  dark_theme_dimming:Int,
  /** Optional . True , if the wallpaper is downscaled to fit in a 450x450 square and then box-blurred with radius 12 */
  ?is_blurred:Bool,
  /** Optional . True , if the background moves slightly when the device is tilted */
  ?is_moving:Bool,
}

/**
 * The background is a .PNG or .TGV (gzipped subset of SVG with MIME type “application/x-tgwallpattern”) pattern to be combined with the background fill chosen by the user.
 */
typedef BackgroundTypePattern = {
  >BackgroundType,
  /** Type of the background, always “pattern” */
  type:String,
  /** Document with the pattern */
  document:Document,
  /** The background fill that is combined with the pattern */
  fill:BackgroundFill,
  /** Intensity of the pattern when it is shown above the filled background; 0-100 */
  intensity:Int,
  /** Optional . True , if the background fill must be applied only to the pattern itself. All other pixels are black in this case. For dark themes only */
  ?is_inverted:Bool,
  /** Optional . True , if the background moves slightly when the device is tilted */
  ?is_moving:Bool,
}

/**
 * The background is taken directly from a built-in chat theme.
 */
typedef BackgroundTypeChatTheme = {
  >BackgroundType,
  /** Type of the background, always “chat_theme” */
  type:String,
  /** Name of the chat theme, which is usually an emoji */
  theme_name:String,
}