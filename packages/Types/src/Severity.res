@deprecated(
  "Please use a `severityLevel` type instead of the `Severity`. Acceptable values are 'fatal', 'error', 'warning', 'log', 'info', and 'debug'."
)
type severity = [#fatal | #error | #warning | #log | #info | #debug]

type severityLevel = [#fatal | #error | #warning | #log | #info | #debug]
