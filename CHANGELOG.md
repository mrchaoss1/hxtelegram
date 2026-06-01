# Changelog

All notable changes to **hxtelegram** are documented here.

## 0.2.0

A large expansion of the client surface. Fully backward compatible — existing
`sendMessage` / `sendPhoto` / `getFile` / `answerCallbackQuery` calls keep working.

### Added

* **`ChatId` type** (`telegram.types.ChatId`) — accepts `Int`, `Float` and
  `String`, so channel `@usernames` and large supergroup/channel ids (which
  overflow signed 32-bit) work everywhere a chat id is taken. `m.chat.id`
  (an `Int`) still passes implicitly, so no call site changes.
* **Generic escape hatch** — `api<T>(method, ?params, cb)` calls any Bot API
  method, typed by `T`, for endpoints without a dedicated helper.
* **~40 typed methods**, including:
  * Bot/chat info: `getMe`, `logOut`, `close`, `getChat`, `getChatMember`,
    `getChatMemberCount`, `getUserProfilePhotos`, `fileLink`.
  * Sending: `sendDocument`, `sendAudio`, `sendVideo`, `sendAnimation`,
    `sendVoice`, `sendSticker`, `sendLocation`, `sendContact`, `sendDice`,
    `sendPoll`, `sendChatAction`, `sendMediaGroup`.
  * Forward/copy: `forwardMessage`, `copyMessage`.
  * Edit/delete: `editMessageText`, `editMessageCaption`,
    `editMessageReplyMarkup`, `deleteMessage`, `deleteMessages`,
    `setMessageReaction`.
  * Pinning: `pinChatMessage`, `unpinChatMessage`, `unpinAllChatMessages`.
  * Moderation: `banChatMember`, `unbanChatMember`, `restrictChatMember`,
    `leaveChat`.
  * Inline/commands/webhook: `answerInlineQuery`, `setMyCommands`,
    `getMyCommands`, `deleteMyCommands`, `setWebhook`, `deleteWebhook`,
    `getWebhookInfo`.
* **Event emitters for every `Update` kind** — `onUpdate` (raw stream),
  `onEditedMessage`, `onChannelPost`, `onEditedChannelPost`, `onInlineQuery`,
  `onChosenInlineResult`, `onShippingQuery`, `onPreCheckoutQuery`,
  `onPurchasedPaidMedia`, `onPoll`, `onPollAnswer`, `onMyChatMember`,
  `onChatMember`, `onChatJoinRequest`, `onChatBoost`, `onRemovedChatBoost`,
  `onMessageReaction`, `onMessageReactionCount`, `onBusinessConnection`,
  `onBusinessMessage`, `onEditedBusinessMessage`, `onDeletedBusinessMessages`,
  plus the existing `onMessage` and `onCallbackQuery`.
* **`onError`** emitter — fires on every network/API/parse failure.
* **`BotConfig` options** — `debug` (gate the HTTP/poll `trace()` logging) and
  `allowedUpdates` (forwarded to `getUpdates`).

### Changed

* Polling now retries with **exponential backoff** (1s → 30s cap) instead of a
  fixed 2s delay, and reset on the first successful cycle.
* Polling is driven iteratively on **sys targets** (cpp/hl/neko/python/jvm),
  where `haxe.Http` is synchronous, instead of recursing inside the response
  callback — the old recursion overflowed the stack and crashed (e.g. C++
  `0xC0000005`). On sys targets `startPolling` now blocks on the calling thread
  for the lifetime of the bot; on JS it stays asynchronous as before.
* `startPolling` is idempotent and honours `stopPolling` mid-flight.
* HTTP/poll `trace()` logging is now silent unless `debug: true` is set.

## 0.1.1

* Initial release: typed models, long polling, `onMessage`/`onCallbackQuery`,
  and `sendMessage` / `sendPhoto` / `getFile` / `answerCallbackQuery`.
