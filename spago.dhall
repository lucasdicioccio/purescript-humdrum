{ name = "my-project"
, dependencies =
  [ "console"
  , "effect"
  , "foldable-traversable"
  , "maybe"
  , "prelude"
  , "web-dom"
  , "web-html"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
, license = "Apache-2.0"
, repository = "https://github.com/lucasdicioccio/purescript-humdrum"
}
