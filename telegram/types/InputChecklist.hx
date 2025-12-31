package telegram.types;

/**
 * Describes a checklist to create.
 */
typedef InputChecklist = {
  /** Title of the checklist; 1-255 characters after entities parsing */
  title:String,
  /** Optional . Mode for parsing entities in the title. See formatting options for more details. */
  ?parse_mode:String,
  /** Optional . List of special entities that appear in the title, which can be specified instead of parse_mode. Currently, only bold , italic , underline , strikethrough , spoiler , and custom_emoji entities are allowed. */
  ?title_entities:Array<MessageEntity>,
  /** List of 1-30 tasks in the checklist */
  tasks:Array<InputChecklistTask>,
  /** Optional . Pass True if other users can add tasks to the checklist */
  ?others_can_add_tasks:Bool,
  /** Optional . Pass True if other users can mark tasks as done or not done in the checklist */
  ?others_can_mark_tasks_as_done:Bool,
}
