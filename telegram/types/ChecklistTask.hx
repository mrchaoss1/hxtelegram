package telegram.types;

/**
 * Describes a task in a checklist.
 */
typedef ChecklistTask = {
  /** Unique identifier of the task */
  id:Int,
  /** Text of the task */
  text:String,
  /** Optional . Special entities that appear in the task text */
  ?text_entities:Array<MessageEntity>,
  /** Optional . User that completed the task; omitted if the task wasn't completed */
  ?completed_by_user:User,
  /** Optional . Point in time (Unix timestamp) when the task was completed; 0 if the task wasn't completed */
  ?completion_date:Int,
}
