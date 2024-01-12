type textEncoderCommon = {
  /**
   * Returns "utf-8".
   */
  encoding: string,
}

// Combination of global TextEncoder and Node require('util').TextEncoder
type textEncoderInternal = {
  ...textEncoderCommon,
  encode: (~input: string=?, unit) => int,
}
