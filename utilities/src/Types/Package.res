type package = {
  name: string,
  version: string,
  dependencies?: Js.Dict.t<string>,
  devDependencies?: Js.Dict.t<string>,
}
