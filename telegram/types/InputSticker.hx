package telegram.types;

/**
 * This object describes a sticker to be added to a sticker set.
 */
typedef InputSticker = {
  /** The added sticker. Pass a file_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new file using multipart/form-data under <file_attach_name> name. Animated and video stickers can't be uploaded via HTTP URL. More information on Sending Files » */
  sticker:String,
  /** Format of the added sticker, must be one of “static” for a .WEBP or .PNG image, “animated” for a .TGS animation, “video” for a .WEBM video */
  format:String,
  /** List of 1-20 emoji associated with the sticker */
  emoji_list:Array<String>,
  /** Optional . Position where the mask should be placed on faces. For “mask” stickers only. */
  ?mask_position:MaskPosition,
  /** Optional . List of 0-20 search keywords for the sticker with total length of up to 64 characters. For “regular” and “custom_emoji” stickers only. */
  ?keywords:Array<String>,
}
