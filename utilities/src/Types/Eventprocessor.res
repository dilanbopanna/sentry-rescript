type eventProcessor<'a, 'b, 'c> = {
  processor: (~event: Event.event<'b>, ~hint: Event.eventHint<'c>) => 'a,
  id?: string, // This field can't be named "name" because functions already have this field natively
}
