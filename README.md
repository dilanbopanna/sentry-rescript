# ReScript Bindings for Sentry (WIP)


This library provides [ReScript](https://rescript-lang.org/) bindings for [Sentry](https://docs.sentry.io/).

These bindings will only work with ReScript 11 (uncurried mode) and JSX version 4, as it enables us to utilize [untagged variants](https://rescript-lang.org/blog/improving-interop#untagged-variants), optional record fields, and record props spread. The latter is especially important, as we are finally able to inherit props from one component to another more easily.
\
