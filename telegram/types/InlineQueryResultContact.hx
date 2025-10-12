package telegram.types;

/**
 * Represents a contact with a phone number. By default, this contact will be sent by the user. Alternatively, you can useinput_message_contentto send a message with the specified content instead of the contact.
 */
typedef InlineQueryResultContact = {
  /** Type of the result, must be contact */
  type:String,
  /** Unique identifier for this result, 1-64 Bytes */
  id:String,
  /** Contact's phone number */
  phone_number:String,
  /** Contact's first name */
  first_name:String,
  /** Optional . Contact's last name */
  ?last_name:String,
  /** Optional . Additional data about the contact in the form of a vCard , 0-2048 bytes */
  ?vcard:String,
  /** Optional . Inline keyboard attached to the message */
  ?reply_markup:InlineKeyboardMarkup,
  /** Optional . Content of the message to be sent instead of the contact */
  ?input_message_content:InputMessageContent,
  /** Optional . Url of the thumbnail for the result */
  ?thumbnail_url:String,
  /** Optional . Thumbnail width */
  ?thumbnail_width:Int,
  /** Optional . Thumbnail height */
  ?thumbnail_height:Int,
}
