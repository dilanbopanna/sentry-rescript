module MetricInstance = {
  type t = {
    weight: float,
    add: float => unit,
    toString: unit => string,
  }

  let make = (): t => {
    weight: 1.0,
    add: _value => {
      ()
    },
    toString: () => "",
  }
}

type metricType = [#c | #g | #s | #d]
type metricBucketItem = {
  metric: MetricInstance.t,
  timestamp: float,
  metricType: metricType,
  name: string,
  unit: Measurement.measurementUnit,
  tags: Js.Dict.t<string>,
}

type metricsAggregator<'a> = {
  /**
   * Add a metric to the aggregator.
   */
  add: (
    ~metricType: metricType,
    ~name: string,
    ~value: float,
    ~unit: Measurement.measurementUnit=?,
    ~tags: Js.Dict.t<Misc.primitive<'a>>=?,
    ~timestamp: float=?,
    unit,
  ) => unit,
  /**
   * Flushes the current metrics to the transport via the transport.
   */
  flush: unit => unit,
  /**
   * Shuts down metrics aggregator and clears all metrics.
   */
  close: unit => unit,
  /**
   * Returns a string representation of the aggregator.
   */
  toString: unit => string,
}
