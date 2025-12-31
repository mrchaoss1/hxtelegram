package telegram.types;

/**
 * Describes a service message about tasks added to a checklist.
 */
typedef ChecklistTasksAdded = {
  /** Optional . Message containing the checklist to which the tasks were added. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply. */
  ?checklist_message:Message,
  /** List of tasks added to the checklist */
  tasks:Array<ChecklistTask>,
}
