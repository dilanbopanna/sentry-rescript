open SentryType

@module("@sentry/react")
external init: 'a => unit = "init"

@module("@sentry/react")
external withProfiler: (
  ~wrappedComponent: React.element,
  ~options: withProfilerOptions=?,
  unit,
) => React.component<'a> = "withProfiler"

@module("@sentry/react")
external useProfiler: (~name: string, ~options: useProfilerOptions=?, unit) => unit = "useProfiler"

@module("@sentry/react")
external withErrorBoundary: (
  ~wrappedComponent: React.element=?,
  ~errorBoundaryOptions: errorBoundaryProps<'a, 'b, 'c>=?,
  unit,
) => React.component<'a> = "withErrorBoundary"

@module("@sentry/react")
external createReduxEnhancer: enhancerOptions<'a, 'b, 'c, 'd> => 'e = "createReduxEnhancer"

@module("@sentry/react")
external reactRouterV3Instrumentation: (
  ~history: Js.Json.t=?,
  ~routes: array<route>=?,
  ~match: match=?,
  unit,
) => 'd = "reactRouterV3Instrumentation"

@module("@sentry/react")
external reactRouterV4Instrumentation: (
  ~history: Js.Json.t,
  ~routes: array<'a>=?,
  ~matchPath: matchPath<'b>=?,
  unit,
) => 'c = "reactRouterV4Instrumentation"

@module("@sentry/react")
external reactRouterV5Instrumentation: (
  ~history: Js.Json.t,
  ~routes: array<'a>=?,
  ~matchPath: matchPath<'b>=?,
  unit,
) => 'c = "reactRouterV5Instrumentation"

@module("@sentry/react")
external withSentryRouting: 'a => React.component<'b> = "withSentryRouting"

module Profiler = {
  type profilerProps = {
    name: string,
    disabled?: bool,
    includeRender?: bool,
    includeUpdates?: bool,
    children?: React.element,
    updateProps: Js.Dict.t<Js.Json.t>,
  }

  @module("@sentry/react")
  external make: React.component<profilerProps> = "Profiler"
}

module ErrorBoundary = {
  @module("@sentry/react")
  external make: React.component<errorBoundaryProps<'a, 'b, 'c>> = "ErrorBoundary"
}
