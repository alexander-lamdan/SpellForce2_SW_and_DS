BaseCoordX = 215
BaseCoordY = 256
-- Die Koordinaten, wo die Pferde die Ressourcen hinliefern

IAppearAtX = GetEntityX() 
IAppearAtY = GetEntityY()
-- Die Koordinaten, wo das Pferd spawnt

MySpawnCondition = "af_P307_KaranGiveRessource"
-- Condition, die wahr werden muﬂ, damit Pferde spawnen und ihre Ressourcen abliefern

--MyCampTag = "HQEinar"
MyCampTag = "HQKaran"

GiveLenya = 20
GiveIron = 40
GiveStone = 30
-- Was die Pferdchen so bei Erreichen des Lagers abliefern

dofile(GetScriptPath() .. "PackHorseSharedScript.lua")