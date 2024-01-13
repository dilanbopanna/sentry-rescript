type tracePropagationTargets = array<string> //TODO array<Regex> ?

type propagationContext = {
  traceId: string,
  spanId: string,
  sampled?: bool,
  parentSpanId?: string,
  dsc?: Envelope.dynamicSamplingContext,
}
