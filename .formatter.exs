# Used by "mix format"
[
  inputs: ["{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}"],
  locals_without_parens: [field: :*],
  line_length: 120,
  import_deps: [:placebo]
]
