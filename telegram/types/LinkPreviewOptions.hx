package telegram.types;

/**
 * Describes the options used for link preview generation.
 */
typedef LinkPreviewOptions = {
  /** Optional . True , if the link preview is disabled */
  ?is_disabled:Bool,
  /** Optional . URL to use for the link preview. If empty, then the first URL found in the message text will be used */
  ?url:String,
  /** Optional . True , if the media in the link preview is supposed to be shrunk; ignored if the URL isn't explicitly specified or media size change isn't supported for the preview */
  ?prefer_small_media:Bool,
  /** Optional . True , if the media in the link preview is supposed to be enlarged; ignored if the URL isn't explicitly specified or media size change isn't supported for the preview */
  ?prefer_large_media:Bool,
  /** Optional . True , if the link preview must be shown above the message text; otherwise, the link preview will be shown below the message text */
  ?show_above_text:Bool,
}
