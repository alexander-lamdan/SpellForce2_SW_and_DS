
ISpawnWhen  = 30
ISpawnUntil = 1
IAppearAt = 4

MySpawnFlag = "af_P304_SilkQuestGiven"
-- nur wenn dieses Flag true ist, spawnt die Einheit
-- falls sie IMMER spawnen soll, sobald die ISpawnWhen-Zahl erreicht ist, dann bitte
-- MySpawnFlag = "af_P304_AlwaysTrue" nehmen

dofile(GetScriptPath() .. "SpiderCampSharedScript01.lua")