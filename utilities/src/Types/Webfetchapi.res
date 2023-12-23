type rec webFetchHeaders = {
  append: (~name: string, ~value: string) => unit,
  delete: (~name: string) => unit,
  get: (~name: string) => Js.Nullable.t<string>,
  has: (~name: string) => bool,
  set: (~name: string, ~value: string) => unit,
  forEach: ((~value: string, ~key: string, ~parent: webFetchHeaders) => unit) => unit,
}

type rec webFetchRequest = {
  headers: webFetchHeaders,
  method: string,
  url: string,
  clone: unit => webFetchRequest,
}
