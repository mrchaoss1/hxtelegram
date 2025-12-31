package telegram.types;

/**
 * This object contains information about one answer option in a poll to be sent.
 */
typedef InputPollOption = {
  /** Option text, 1-100 characters */
  text:String,
  /** Optional . Mode for parsing entities in the text. See formatting options for more details. Currently, only custom emoji entities are allowed */
  ?text_parse_mode:String,
  /** Optional . A JSON-serialized list of special entities that appear in the poll option text. It can be specified instead of text_parse_mode */
  ?text_entities:Array<MessageEntity>,
}
