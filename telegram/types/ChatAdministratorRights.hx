package telegram.types;

/**
 * Represents the rights of an administrator in a chat.
 */
typedef ChatAdministratorRights = {
  /** True , if the user's presence in the chat is hidden */
  is_anonymous:Bool,
  /** True , if the administrator can access the chat event log, get boost list, see hidden supergroup and channel members, report spam messages, ignore slow mode, and send messages to the chat without paying Telegram Stars. Implied by any other administrator privilege. */
  can_manage_chat:Bool,
  /** True , if the administrator can delete messages of other users */
  can_delete_messages:Bool,
  /** True , if the administrator can manage video chats */
  can_manage_video_chats:Bool,
  /** True , if the administrator can restrict, ban or unban chat members, or access supergroup statistics */
  can_restrict_members:Bool,
  /** True , if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly (promoted by administrators that were appointed by the user) */
  can_promote_members:Bool,
  /** True , if the user is allowed to change the chat title, photo and other settings */
  can_change_info:Bool,
  /** True , if the user is allowed to invite new users to the chat */
  can_invite_users:Bool,
  /** True , if the administrator can post stories to the chat */
  can_post_stories:Bool,
  /** True , if the administrator can edit stories posted by other users, post stories to the chat page, pin chat stories, and access the chat's story archive */
  can_edit_stories:Bool,
  /** True , if the administrator can delete stories posted by other users */
  can_delete_stories:Bool,
  /** Optional . True , if the administrator can post messages in the channel, approve suggested posts, or access channel statistics; for channels only */
  ?can_post_messages:Bool,
  /** Optional . True , if the administrator can edit messages of other users and can pin messages; for channels only */
  ?can_edit_messages:Bool,
  /** Optional . True , if the user is allowed to pin messages; for groups and supergroups only */
  ?can_pin_messages:Bool,
  /** Optional . True , if the user is allowed to create, rename, close, and reopen forum topics; for supergroups only */
  ?can_manage_topics:Bool,
  /** Optional . True , if the administrator can manage direct messages of the channel and decline suggested posts; for channels only */
  ?can_manage_direct_messages:Bool,
}
