State
{
	StateName = "INIT",
	-- Die Beiden Bosse in der Festung fragen ob sie tot sind
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "PatrolMalar1"},
			FigureIsDead {Tag = "PatrolMalar2"},
		},
		Actions =
		{
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsNotInRange {Tag = "Altar1", X = 177.77, Y = 552.708, Range = 5},
			BuildingIsNotInRange {Tag = "Altar2", X = 208.053, Y = 531.22, Range = 5},
			BuildingIsNotInRange {Tag = "Altar3", X = 196.837, Y = 494.746, Range = 5},
			BuildingIsNotInRange {Tag = "Altar4", X = 158.63, Y = 494.691, Range = 5},
			BuildingIsNotInRange {Tag = "Altar5", X = 147.565, Y = 531.411, Range = 5},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P320_PentagramBossIsDead"}
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AND
			{
				--OR
				--{
				--	BuildingIsAlive	{Tag = "STurm1"},
				--	BuildingIsAlive	{Tag = "STurm2"},
				--	BuildingIsAlive	{Tag = "STurm3"},
				--	BuildingIsAlive	{Tag = "STurm4"},
				--	BuildingIsAlive	{Tag = "STurm5"},
				--	BuildingIsAlive	{Tag = "STurm6"},
				--	BuildingIsAlive	{Tag = "STurm7"},
				--	BuildingIsAlive	{Tag = "STurm8"},
				--	BuildingIsAlive	{Tag = "STurm9"},
				--	BuildingIsAlive	{Tag = "STurm10"},
				--	BuildingIsAlive	{Tag = "STurm11"},
				--	BuildingIsAlive	{Tag = "STurm12"},
				--	BuildingIsAlive	{Tag = "STurm13"},
				--	BuildingIsAlive	{Tag = "STurm14"},
				--	BuildingIsAlive	{Tag = "STurm15"},
				--	BuildingIsAlive	{Tag = "STurm16"},
				--	BuildingIsAlive	{Tag = "STurm17"},
				--	BuildingIsAlive	{Tag = "STurm18"},
				--	BuildingIsAlive	{Tag = "STurm19"},
				--	BuildingIsAlive	{Tag = "STurm20"},
				--},
				FigureIsDead {Tag = "Des1"},
				FigureIsDead {Tag = "Des2"},
				FigureIsDead {Tag = "Des3"},
				FigureIsDead {Tag = "Des4"},
				FigureIsDead {Tag = "Des5"},
				FigureIsDead {Tag = "Des6"},
				FigureIsDead {Tag = "Des7"},
				MapFlagIsFalse {Name = "mf_P319_SorvinaInFirstPentagram"},
			}


		},
		Actions =
		{
			PlayerGameOver {LocaTag = "GameOverSF2SSNoDestroyers"}
		},
	},
}