State
{
	StateName = "Init",
	OnFigureSpawnOnlyWhenEvent
	{
		-- Sorvina steht in der Mitte des ersten Pentagramms, vielleicht kann man dan noch was anders dazu finden
		X = myX,
		Y = myY,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P319_SorvinaInFirstPentagram"},
		},
		Actions =
		{
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerFigureIsInRange {Range = 10, X = 177, Y = 476}
		},
		Actions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanAvatar"},
		}
	},
	-- Stehen alle Altare noch spawnen die Viecher lansagmer
	OnFigureRespawnEvent
	{
		X = myX,
		Y = myY,
		WaitTime = 30,
		Conditions =
		{
			MapValueIsEqual {Name = "mv_P320_DestroyedAltars", Value = 0},
			-- Der jeweilige ALtar steht auch noch
			BuildingIsInRange {Tag = "Altar"..altarNumber, X = myX, Y = MyY, Range = 10}
		},
		Actions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanAvatar"},
		}
	},
	-- Stehen nur noch vier Altare spawnen die Viecher etwas schneller
	OnFigureRespawnEvent
	{
		X = myX,
		Y = myY,
		WaitTime = 20,
		Conditions =
		{
			MapValueIsEqual {Name = "mv_P320_DestroyedAltars", Value = 1},
			-- Der jeweilige ALtar steht auch noch
			BuildingIsInRange {Tag = "Altar"..altarNumber, X = myX, Y = MyY, Range = 10}
		},
		Actions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanAvatar"},
		}
	},
	-- Stehen nur noch drei Altare spawnen die Viecher etwas schneller
	OnFigureRespawnEvent
	{
		X = myX,
		Y = myY,
		WaitTime = 15,
		Conditions =
		{
			MapValueIsEqual {Name = "mv_P320_DestroyedAltars", Value = 2},
			-- Der jeweilige ALtar steht auch noch
			BuildingIsInRange {Tag = "Altar"..altarNumber, X = myX, Y = MyY, Range = 10}
		},
		Actions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanAvatar"},
		}
	},
	-- Stehen nur noch zwei Altare spawnen die Viecher etwas schneller
	OnFigureRespawnEvent
	{
		X = myX,
		Y = myY,
		WaitTime = 10,
		Conditions =
		{
			MapValueIsEqual {Name = "mv_P320_DestroyedAltars", Value = 3},
			-- Der jeweilige ALtar steht auch noch
			BuildingIsInRange {Tag = "Altar"..altarNumber, X = myX, Y = MyY, Range = 10}
		},
		Actions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanAvatar"},
		}
	},
	-- Steht nur noch ein Altar spawnen die Viecher am schnellsten
	OnFigureRespawnEvent
	{
		X = myX,
		Y = myY,
		--Direction = GetEntityDirection(),
		WaitTime = 5,
		Conditions =
		{
			MapValueIsEqual {Name = "mv_P320_DestroyedAltars", Value = 4},
			-- Der jeweilige ALtar steht auch noch
			BuildingIsInRange {Tag = "Altar"..altarNumber, X = myX, Y = MyY, Range = 10}
		},
		Actions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanAvatar"},
		}
	},
	-- Alle Altare weg, kein respawn mehr
	OnOneTimeEvent
	{
		GotoState = "DeadEnd",
		Conditions =
		{
			MapValueIsEqual {Name = "mv_P320_DestroyedAltars", Value = 5}
		},
		Actions =
		{
		}
	},
}

State
{
	StateName = "DeadEnd",
}