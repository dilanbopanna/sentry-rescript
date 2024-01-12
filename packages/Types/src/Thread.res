type thread<'a> = {
  id?: float,
  name?: string,
  stacktrace?: Stacktrace.stacktrace<'a>,
  crashed?: bool,
  current?: bool,
}
