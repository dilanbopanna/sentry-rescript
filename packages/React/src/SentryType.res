type withProfilerOptions = {
  name: string,
  disabled?: bool,
  includeRender?: bool,
  includeUpdates?: bool,
}

type useProfilerOptions = {
  disabled?: bool,
  hasRenderSpan?: bool,
}

type errorBoundaryProps<'a, 'b, 'c> = {
  children?: React.element,
  showDialog?: bool,
  dialogOptions?: 'a,
  fallback?: React.element,
  onError?: (~error: Js.Exn.t, ~componentStack: string, ~eventId: string) => unit,
  onMount?: unit => unit,
  onReset?: (
    ~error: Js.Nullable.t<Js.Exn.t>,
    ~componentStack: Js.Nullable.t<string>,
    ~eventId: Js.Nullable.t<string>,
  ) => unit,
  onUnmount?: (
    ~error: Js.Nullable.t<Js.Exn.t>,
    ~componentStack: Js.Nullable.t<string>,
    ~eventId: Js.Nullable.t<string>,
  ) => unit,
  beforeCapture?: (
    ~scope: 'b,
    ~error: Js.Nullable.t<Js.Exn.t>,
    ~componentStack: Js.Nullable.t<string>,
  ) => unit,
  componentStack?: 'c,
  error?: Js.Exn.t,
  eventId?: string,
}

type enhancerOptions<'a, 'b, 'c, 'd> = {
  attachReduxState?: bool,
  stateTransformer?: 'a => 'b,
  actionTransformer?: 'c => Js.Nullable.t<'c>,
  configureScopeWithState?: (~scope: 'd, ~state: 'a) => unit,
}

type rec route = {path?: string, childRoutes?: array<route>}

type matchProps = {location: Js.Json.t, routes: array<route>}

type parent = {path: string, url: string, params: Js.Json.t, isExact: bool}

type matchPath<'b> = (
  ~pathname: string,
  ~props: 'b,
  ~parent: Js.Nullable.t<parent>=?,
) => Js.Nullable.t<parent>

type renderProps = {routes?: array<route>}

type match = (
  ~props: matchProps=?,
  ~cb: (
    ~error: Js.Exn.t=?,
    ~_redirectLocation: Js.Json.t=?,
    ~renderProps: renderProps=?,
    unit,
  ) => unit,
) => unit
