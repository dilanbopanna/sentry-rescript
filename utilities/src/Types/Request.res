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
    \"http.method": string,
    \"http.fragment"?: string,
    \"http.query"?: string
}