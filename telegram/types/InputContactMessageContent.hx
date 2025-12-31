package telegram.types;

/**
 * Represents thecontentof a contact message to be sent as the result of an inline query.
 */
typedef InputContactMessageContent = {
  /** Contact's phone number */
  phone_number:String,
  /** Contact's first name */
  first_name:String,
  /** Optional . Contact's last name */
  ?last_name:String,
  /** Optional . Additional data about the contact in the form of a vCard , 0-2048 bytes */
  ?vcard:String,
}
