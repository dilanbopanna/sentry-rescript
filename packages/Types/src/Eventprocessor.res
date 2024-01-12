type eventProcessor<'a, 'b, 'c> = {
  processor: (~event: Event.event<'a>, ~hint: Event.eventHint<'b>) => 'c,
  id?: string, // This field can't be named "name" because functions already have this field natively
}
