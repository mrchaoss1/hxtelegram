package telegram.types;

/**
 * Contains the list of gifts received and owned by a user or a chat.
 */
typedef OwnedGifts = {
  /** The total number of gifts owned by the user or the chat */
  total_count:Int,
  /** The list of gifts */
  gifts:Array<OwnedGift>,
  /** Optional . Offset for the next request. If empty, then there are no more results */
  ?next_offset:String,
}
