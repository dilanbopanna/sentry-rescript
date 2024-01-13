/**
 * NOTE: These types are still considered Beta and subject to change.
 * @hidden
 */
type replayRecordingMode = [#session | #buffer]


/**
 * NOTE: These types are still considered Beta and subject to change.
 * @hidden
 */
type replayEvent<'a> = {
  ...Event.event<'a>,
  urls: array<string>,
  replay_start_timestamp?: float,
  error_ids:array<string>,
  trace_ids: array<string>,
  replay_id: string,
  segment_id: float,
  replay_type: replayRecordingMode,
}

/**
 * NOTE: These types are still considered Beta and subject to change.
 * @hidden
 */
type replayRecordingData<'a> = String(string) | Array(Js.TypedArray2.Uint8Array.typed_array<'a>);

