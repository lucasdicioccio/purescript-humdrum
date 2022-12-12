module HumDrum where

import Prelude (bind, join, Unit, (=<<), (<$>))

import Data.Maybe (Maybe)
import Data.Traversable (traverse)
import Effect (Effect)

import Web.DOM.Element (getAttribute)
import Web.HTML.HTMLDocument (currentScript)
import Web.HTML.HTMLScriptElement as HTMLScript
import Web.HTML.Window as Window
import Web.HTML (window)

fetchDataArg :: String -> Effect (Maybe String)
fetchDataArg argname = do
  htmlDoc <- Window.document =<< window
  script <- currentScript htmlDoc
  join <$> traverse go script
  where
    go scriptelem = do
      let elem = HTMLScript.toElement scriptelem
      getAttribute argname elem

mainWithDataArg :: (Maybe String -> Effect Unit) -> Effect Unit
mainWithDataArg go = go =<< fetchDataArg "data-humdrum-arg"
