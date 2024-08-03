-- hier werden die Flags angegeben, die bestimmen welche anderen Hebel umgelegt werden
-- wenn der Spieler diesen hier betätigt
InfluenceLevers =
{
	MapFlagSetTrue	{Name = "mf_ToggleTransformLever3"},
	MapFlagSetTrue	{Name = "mf_ToggleTransformLever4"},
}

dofile(GetScriptPath() .. "TransformLeverShared.lua")
