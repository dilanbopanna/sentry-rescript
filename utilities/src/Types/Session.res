type sessionStatus = [#ok | #exited | #crashed | #abnormal]
type requestSessionStatus = [#ok | #errored | #crashed]

type requestSession = {status?: requestSessionStatus}

type attrs = {
  release?: string,
  environment?: string,
  user_agent?: string,
  ip_address?: string,
}

type serializedSession = {
  init: bool,
  sid: string,
  did?: string,
  timestamp: string,
  started: string,
  duration?: float,
  status: sessionStatus,
  errors: float,
  abnormal_mechanism?: string,
  attrs?: attrs,
}

type session = {
  sid: string,
  did?: float,
  init: bool,
  // seconds since the UNIX epoch
  timestamp: float,
  // seconds since the UNIX epoch
  started: float,
  duration?: float,
  status: sessionStatus,
  release?: string,
  environment?: string,
  userAgent?: string,
  ipAddress?: string,
  errors: float,
  user?: Js.Nullable.t<User.user>,
  ignoreDuration: bool,
  abnormal_mechanism?: string,
  toJSON: unit => serializedSession,
}

type sessionContext = option<session>

type aggregationCounts = {
  started: string,
  errored?: float,
  exited?: float,
  crashed?: float,
}

type sessionAggregates = {
  attrs?: attrs,
  aggregates: array<aggregationCounts>,
}

type sessionFlusherLike = {
  /**
   * Increments the Session Status bucket in SessionAggregates Object corresponding to the status of the session
   * captured
   */
  incrementSessionStatusCount: unit => unit,
  /** Empties Aggregate Buckets and Sends them to Transport Buffer */
  flush: unit => unit,
  /** Clears setInterval and calls flush */
  close: unit => unit,
}
