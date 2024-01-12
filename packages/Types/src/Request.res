type queryParams =
  | String(string)
  | DictString(Js.Dict.t<string>)
  | TupleArray(array<(string, string)>)

type request = {
  url?: string,
  method?: string,
  data?: Js.Json.t,
  query_string?: queryParams,
  cookies?: Js.Dict.t<string>,
  env?: Js.Dict.t<string>,
  headers?: Js.Dict.t<string>,
}

type sanitizedRquestData = {
  url: string,
  @as("http.method") httpMethod: string,
  @as("http.fragment") httpFragment?: string,
  @as("http.query") httpQuery?: string,
}
