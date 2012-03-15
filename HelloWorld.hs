{-# LANGUAGE TypeFamilies, QuasiQuotes, MultiParamTypeClasses,
             TemplateHaskell, OverloadedStrings #-}
import Yesod

data HelloWorld = HelloWorld

mkYesod "HelloWorld" [parseRoutes|
/#String HomeR GET
|]

instance Yesod HelloWorld

getHomeR :: String -> Handler RepHtmlJson
getHomeR name = do
    let json = object ["name" .= name]
    defaultLayoutJson [whamlet|Hello #{name}|] json

main :: IO ()
main = warpDebug 3000 HelloWorld