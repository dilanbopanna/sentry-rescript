// Based on https://getsentry.github.io/relay/relay_metrics/enum.MetricUnit.html
// For more details, see measurement key in https://develop.sentry.dev/sdk/event-payloads/transaction/

/**
 * A time duration.
 */
type durationUnit = [
  | #nanosecond
  | #microsecond
  | #millisecond
  | #second
  | #minute
  | #hour
  | #day
  | #week
]

type informationUnit = [
  | #bit
  | #byte
  | #kilobyte
  | #kibibyte
  | #megabyte
  | #mebibyte
  | #gigabyte
  | #terabyte
  | #tebibyte
  | #petabyte
  | #exabyte
  | #exbibyte
]

type fractionUnit = [
  | #ratio
  | #percent
]

type noneUnit = [#"" | #none]

type literalUnion<'a> = Custom('a) | Dict(Js.Dict.t<'a>)

type unit_ = DurationUnit | InformationUnit | FractionUnit | NoneUnit

type measurementUnit = literalUnion<unit_>

type t = {value: float, unit: measurementUnit}
type measurements = Js.Dict.t<t>
