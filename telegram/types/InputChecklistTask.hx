package telegram.types;

/**
 * Describes a task to add to a checklist.
 */
typedef InputChecklistTask = {
  /** Unique identifier of the task; must be positive and unique among all task identifiers currently present in the checklist */
  id:Int,
  /** Text of the task; 1-100 characters after entities parsing */
  text:String,
  /** Optional . Mode for parsing entities in the text. See formatting options for more details. */
  ?parse_mode:String,
  /** Optional . List of special entities that appear in the text, which can be specified instead of parse_mode. Currently, only bold , italic , underline , strikethrough , spoiler , and custom_emoji entities are allowed. */
  ?text_entities:Array<MessageEntity>,
}
