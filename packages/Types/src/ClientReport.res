type eventDropReason = [
  | #before_send
  | #event_processor
  | #network_error
  | #queue_overflow
  | #ratelimit_backoff
  | #sample_rate
  | #send_error
  | #internal_sdk_error
]

type outcome = {
    reason: eventDropReason,
    category: DataCategory.dataCategory,
    qauntity: float
}

type clienReport = {
    timestamp: float,
    discarded_events: array<outcome>
}