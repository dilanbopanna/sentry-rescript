type feedbackContext = {
  message: string,
  contact_email?: string,
  name?: string,
  replay_id?: string,
  url?: string,
}

type feedbackEvent = {
  @as("type") type_: string,
  contexts: Js.Json.t,
}
