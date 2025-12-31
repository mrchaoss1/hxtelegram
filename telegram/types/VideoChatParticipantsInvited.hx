package telegram.types;

/**
 * This object represents a service message about new members invited to a video chat.
 */
typedef VideoChatParticipantsInvited = {
  /** New members that were invited to the video chat */
  users:Array<User>,
}
