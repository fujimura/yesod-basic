{-# LANGUAGE TypeFamilies, QuasiQuotes, MultiParamTypeClasses,
             TemplateHaskell, OverloadedStrings #-}
import Yesod

data HelloWorld = HelloWorld

makeYesod "HelloWorld" [parseRoutes|
/ Home GET
|]

instance Yesod HelloWorld

getHome :: Handler RepHtml
getHome = defaultLayout [whamlet|Hello world!|]

main :: IO ()
main = warpDebug 3000 HelloWorld