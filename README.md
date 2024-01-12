# ReScript Bindings for Sentry

This library provides [ReScript](https://rescript-lang.org/) bindings for [Sentry](https://docs.sentry.io/).

## Installation

1. Install all necessary packages according to the official Sentry installation guide: https://docs.sentry.io/product/cli/installation/.
2. Install `@rescript-sentry/[framework]`

Example:

```sh
npm install @rescript-sentry/[framework]
```

3. Add it to `dependencies` in your `bsconfig.json` or `rescript.json`:

```json
{
  "bs-dependencies": ["@rescript-sentry/[framework]"]
}
```

This library provides [ReScript](https://rescript-lang.org/) bindings for [SENTRY](https://docs.sentry.io/).

## What's inside?

| Sentry package  | ReScript bindings package                       | Namespace             | Progress |
| --------------- | ----------------------------------------------- | --------------------- | -------: |
| @sentry/react   | [@rescript-sentry/react](./packages/React/)     | rescript-sentry-react |     99 % |
| @sentry/browser | [@rescript-sentry/browser](./packages/Browser/) | -                     |      1 % |
| @sentry/types   | [@rescript-sentry/types](./packages/Types/)     | rescript-sentry-types |     70 % |

NOTE: Other Sentry framework bindings will be coming soon
