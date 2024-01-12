@react.component
let make = () => {
  RescriptSentryReact.Sentry.init("")
  <div> {React.string("Hello World")} </div>
}
