type crontab = [#crontab]

type crontabSchedule = {
  @as("type") type_: crontab,
  value: string,
}
type interval = [#interval]

type unit_ = [#year | #month | #week | #day | #hour | #minute]

type intervalSchedule = {
  @as("type") type_: interval,
  value: float,
  unit: unit_,
}

type monitorSchedule = CrontabSchedule(crontabSchedule) | IntervalSchedule(intervalSchedule)

type status = [#in_progress | #ok | #error]

type monitor_config = {
  schedule: monitorSchedule,
  checkin_margin?: float,
  max_runtime?: float,
  timezone?: string,
}
type context
type contexts = {trace?: context} //TODO Context.textContext

type checkInStatus = [#ok | #error]

type serializedCheckIn = {
  check_in_id: string,
  monitor_slug: string,
  status: status,
  duration?: float,
  release?: string,
  environment?: string,
  monitor_config?: monitor_config,
  contexts?: contexts,
}

type heartbeatCheckIn = {
  monitorSlug: string,
  status: checkInStatus,
}

type inProgressStatus = [#in_progress]

type inProgressCheckIn = {
  monitorSlug: string,
  status: checkInStatus,
}

type finishedCheckIn = {
  monitorSlug: string,
  status: checkInStatus,
  checkInId: string,
  duration?: float,
}

type checkIn =
  | HeartbeatCheckIn(heartbeatCheckIn)
  | InProgressCheckIn(inProgressCheckIn)
  | FinishedCheckIn(finishedCheckIn)

type serializedMonitorConfig = option<string>

type monitorConfig = {
  schedule: monitorSchedule,
  checkinMargin?: float,
  maxRuntime?: float,
  timezone?: string,
}
