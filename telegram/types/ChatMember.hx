package telegram.types;

/**
    This object contains information about one member of a chat. Currently, the following 6 types of chat members are supported:

    - ChatMemberOwner
    - ChatMemberAdministrator
    - ChatMemberMember
    - ChatMemberRestricted
    - ChatMemberLeft
    - ChatMemberBanned
**/
typedef ChatMember = {}

/**
 * Represents achat memberthat has some additional privileges.
 */
typedef ChatMemberAdministrator = {
  >ChatMember,
  /** The member's status in the chat, always “administrator” */
  status:String,
  /** Information about the user */
  user:User,
  /** True , if the bot is allowed to edit administrator privileges of that user */
  can_be_edited:Bool,
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
  /** Optional . Custom title for this user */
  ?custom_title:String,
}

/**
 * Represents achat memberthat was banned in the chat and can't return to the chat or view chat messages.
 */
typedef ChatMemberBanned = {
  >ChatMember,
  /** The member's status in the chat, always “kicked” */
  status:String,
  /** Information about the user */
  user:User,
  /** Date when restrictions will be lifted for this user; Unix time. If 0, then the user is banned forever */
  until_date:Int,
}

/**
 * Represents achat memberthat isn't currently a member of the chat, but may join it themselves.
 */
typedef ChatMemberLeft = {
  >ChatMember,
  /** The member's status in the chat, always “left” */
  status:String,
  /** Information about the user */
  user:User,
}

/**
 * Represents achat memberthat has no additional privileges or restrictions.
 */
typedef ChatMemberMember = {
  >ChatMember,
  /** The member's status in the chat, always “member” */
  status:String,
  /** Information about the user */
  user:User,
  /** Optional . Date when the user's subscription will expire; Unix time */
  ?until_date:Int,
}

/**
 * Represents achat memberthat owns the chat and has all administrator privileges.
 */
typedef ChatMemberOwner = {
  >ChatMember,
  /** The member's status in the chat, always “creator” */
  status:String,
  /** Information about the user */
  user:User,
  /** True , if the user's presence in the chat is hidden */
  is_anonymous:Bool,
  /** Optional . Custom title for this user */
  ?custom_title:String,
}

/**
 * Represents achat memberthat is under certain restrictions in the chat. Supergroups only.
 */
typedef ChatMemberRestricted = {
  >ChatMember,
  /** The member's status in the chat, always “restricted” */
  status:String,
  /** Information about the user */
  user:User,
  /** True , if the user is a member of the chat at the moment of the request */
  is_member:Bool,
  /** True , if the user is allowed to send text messages, contacts, giveaways, giveaway winners, invoices, locations and venues */
  can_send_messages:Bool,
  /** True , if the user is allowed to send audios */
  can_send_audios:Bool,
  /** True , if the user is allowed to send documents */
  can_send_documents:Bool,
  /** True , if the user is allowed to send photos */
  can_send_photos:Bool,
  /** True , if the user is allowed to send videos */
  can_send_videos:Bool,
  /** True , if the user is allowed to send video notes */
  can_send_video_notes:Bool,
  /** True , if the user is allowed to send voice notes */
  can_send_voice_notes:Bool,
  /** True , if the user is allowed to send polls and checklists */
  can_send_polls:Bool,
  /** True , if the user is allowed to send animations, games, stickers and use inline bots */
  can_send_other_messages:Bool,
  /** True , if the user is allowed to add web page previews to their messages */
  can_add_web_page_previews:Bool,
  /** True , if the user is allowed to change the chat title, photo and other settings */
  can_change_info:Bool,
  /** True , if the user is allowed to invite new users to the chat */
  can_invite_users:Bool,
  /** True , if the user is allowed to pin messages */
  can_pin_messages:Bool,
  /** True , if the user is allowed to create forum topics */
  can_manage_topics:Bool,
  /** Date when restrictions will be lifted for this user; Unix time. If 0, then the user is restricted forever */
  until_date:Int,
}

