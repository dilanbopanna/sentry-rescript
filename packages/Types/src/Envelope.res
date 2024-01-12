type dynamicSamplingContext = {
  trace_id: string,
  public_key: string,
  sample_rate?: string,
  release?: string,
  environment?: string,
  transaction?: string,
  user_segment?: string,
  replay_id?: string,
  sampled?: string,
}

type envelopeItemType = [
  | #client_report
  | #user_report
  | #feedback
  | #session
  | #sessions
  | #transaction
  | #attachment
  | #event
  | #profile
  | #replay_event
  | #replay_recording
  | #check_in
  | #statsd
]

type baseEnvelopeHeaders = {
  dsn?: string,
  sdk?: Sdkinfo.sdkInfo,
}

type baseEnvelopeItemHeaders = {
  @as("type") type_: envelopeItemType,
  length?: float,
}

type baseEnvelopeItem<'a, 'b> = ('a, 'b)

type baseEnvelope<'a, 'b> = ('a, 'b)

type itemHeaders = {
  @as("type") type_: envelopeItemType,
  length?: float,
  filename?: string,
  content_type?: string,
  attachment_type?: string,
}

type item<'a> = baseEnvelopeItem<itemHeaders, 'a>

type envelopeHeaders = {
  event_id?: string,
  sent_at?: string,
  trace?: dynamicSamplingContext,
  ...baseEnvelopeHeaders,
}

type envelope<'a> = baseEnvelope<envelopeHeaders, item<'a>>

type envelopeItem<'a> = 'a
