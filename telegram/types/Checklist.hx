package telegram.types;

/**
 * Describes a checklist.
 */
typedef Checklist = {
  /** Title of the checklist */
  title:String,
  /** Optional . Special entities that appear in the checklist title */
  ?title_entities:Array<MessageEntity>,
  /** List of tasks in the checklist */
  tasks:Array<ChecklistTask>,
  /** Optional . True , if users other than the creator of the list can add tasks to the list */
  ?others_can_add_tasks:Bool,
  /** Optional . True , if users other than the creator of the list can mark tasks as done or not done */
  ?others_can_mark_tasks_as_done:Bool,
}
