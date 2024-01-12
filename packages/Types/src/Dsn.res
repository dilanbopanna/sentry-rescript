/** Supported Sentry transport protocols in a Dsn. */
type dsnProtocol = [#http | #https]

type dsnComponents = {
  /** Protocol used to connect to Sentry. */
  protocol: dsnProtocol,
  /** Public authorization key. */
  publicKey?: string,
  /** Private authorization key (deprecated, optional). */
  pass?: string,
  /** Hostname of the Sentry instance. */
  host: string,
  /** Port of the Sentry instance. */
  port?: string,
  /** Sub path/ */
  path?: string,
  /** Project ID */
  projectId: string,
}

type dsnLike = String(string) | Object(dsnComponents)
