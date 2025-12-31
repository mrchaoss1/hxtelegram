package telegram.types;

/**
 * This object represents changes in the status of a chat member.
 */
typedef ChatMemberUpdated = {
  /** Chat the user belongs to */
  chat:Chat,
  /** Performer of the action, which resulted in the change */
  from:User,
  /** Date the change was done in Unix time */
  date:Int,
  /** Previous information about the chat member */
  old_chat_member:ChatMember,
  /** New information about the chat member */
  new_chat_member:ChatMember,
  /** Optional . Chat invite link, which was used by the user to join the chat; for joining by invite link events only. */
  ?invite_link:ChatInviteLink,
  /** Optional . True , if the user joined the chat after sending a direct join request without using an invite link and being approved by an administrator */
  ?via_join_request:Bool,
  /** Optional . True , if the user joined the chat via a chat folder invite link */
  ?via_chat_folder_invite_link:Bool,
}
