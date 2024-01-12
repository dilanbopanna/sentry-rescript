type browserClientReplayOptions = {
  /**
   * The sample rate for session-long replays.
   * 1.0 will record all sessions and 0 will record none.
   */
  replaysSessionSampleRate?: float,
  /**
   * The sample rate for sessions that has had an error occur.
   * This is independent of `sessionSampleRate`.
   * 1.0 will record all sessions and 0 will record none.
   */
  replaysOnErrorSampleRate?: float,
}

type browserClientProfilingOptions = {
  /**
   * The sample rate for profiling
   * 1.0 will profile all transactions and 0 will profile none.
   */
  profilesSampleRate?: float,
}
