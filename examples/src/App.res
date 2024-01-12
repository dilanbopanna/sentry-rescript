type init = {
  dsn: string,
  tracesSampleRate: float,
  tracePropagationTargets: (string, string),
  replaysSessionSampleRate: float,
  replaysOnErrorSampleRate: float,
}

@react.component
let make = () => {
  SentryReact.init({
    dsn: "https://examplePublicKey@o0.ingest.sentry.io/0",
    tracesSampleRate: 1.0,
    tracePropagationTargets: ("localhost", "/^https:\/\/yourserver\.io\/api/"),
    replaysSessionSampleRate: 0.1,
    replaysOnErrorSampleRate: 1.0,
  })

  <div> {React.string("Hello World")} </div>
}
