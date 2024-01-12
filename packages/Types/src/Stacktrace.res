type stacktrace<'a> = {
  frames?: array<Stackframe.stackFrame<'a>>,
  frames_omitted?: (float, float),
}

type stackParser<'a> = (
  ~stack: string,
  ~skipFirst: float=?,
  unit,
) => array<Stackframe.stackFrame<'a>>

type stackLineParserFn<'a> = string => option<Stackframe.stackFrame<'a>>

type stackLineParser<'a> = (float, stackLineParserFn<'a>)
