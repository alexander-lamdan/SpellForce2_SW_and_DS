-- Angriffstruppen, der Blades, die sich kleine Scharm�tzel in der Festung liefern

State
{
	StateName = "INIT",
	-- Wenn der Spieler in der N�he ist oder das Spawngeb�ude platt, dann kein Respawn
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRect {Top = 470, Left = 473, Bottom = 487, Right = 511},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P407_NoRespawn"},
			MapFlagSetTrue {Name = "mf_P407_OnlyLastBladeGroupKeepsOnSpawning"}
		},
	},
	OnFigureRespawnEvent
	{
		WaitTime = 4,
		X = 420,
		Y = 673,

		Conditions =
		{
-- 			FigureIsAlive {Tag = "GateBoss"},
			EntityFlagIsFalse {Name = "ef_P407_NoRespawn"}
		},
		Actions =
		{
		},
	},
	OnIdleRunHomeFake
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		GotoForced = false,
		Conditions =
		{
			FigureTeamIsInRange {X = 414, Y = 582, Range = 20, Team = "tm_Team2"}
		},
		Actions =
		{
		},
	},
	OnIdleRunHomeFake
	{
		X = 477,
		Y = 484,
		GotoForced = false,
		Conditions =
		{
			FigureTeamIsNotInRange {X = 414, Y = 582, Range = 20, Team = "tm_Team2"},
-- 			FigureIsAlive {Tag = "GateBoss"},
		},
		Actions =
		{
		},
	},

	OnIdleRunHomeFake
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		GotoForced = false,
		Conditions =
		{
-- 			FigureIsDead {Tag = "GateBoss"},
		},
		Actions =
		{
		},
	},
}