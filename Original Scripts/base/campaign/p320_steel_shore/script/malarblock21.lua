State
{
	StateName = "Init",
	OnFigureSpawnOnlyWhenEvent
	{
		-- Sorvina hat sich zum ersten mal teleportier und kloppt ihre Arme raus
		X = 178,
		Y = 394,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P319_SorvinaFirstTeleport"},
		},
		Actions =
		{
			FigurePathGoto
			{
				
    			Goto = FigurePatrolWalkToEntity {Tag = "MalarBlock21", TargetTag = "WPSecondBlock2"}, 
    			Tags = 
    			{
       	 			"WPSecondBlock3", 
        			"WPSecondBlock4", 
        			"WPSecondBlock5", 
        			"WPSecondBlock6",
        			"WPSecondBlock7",
        			"WPSecondBlock8",
        			"WPSecondBlock9",
        			"WPSecondBlock10",
        			"WPSecondBlock11",
					"WPSecondBlock12",
					"WPSecondBlock13",
					"WPSecondBlock14",
					"WPSecondBlock15",
					"WPSecondBlock16",
					"WPSecondBlock1",
    			}
			},
		}
	},
	-- Sorvina ist noch incht ins Pentagramm verdr�ngt
	OnFigureRespawnEvent
	{
		X = 178,
		Y = 394,
		WaitTime = 60,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P319_SorvinaFirstTeleport"},
			MapFlagIsFalse {Name = "mf_P319_SorvinaInFirstPentagram"}
		},
		Actions =
		{
			FigurePathGoto
			{
				
    			Goto = FigurePatrolWalkToEntity {Tag = "MalarBlock21", TargetTag = "WPSecondBlock2"}, 
    			Tags = 
    			{
       	 			"WPSecondBlock3", 
        			"WPSecondBlock4", 
        			"WPSecondBlock5", 
        			"WPSecondBlock6",
        			"WPSecondBlock7",
        			"WPSecondBlock8",
        			"WPSecondBlock9",
        			"WPSecondBlock10",
        			"WPSecondBlock11",
					"WPSecondBlock12",
					"WPSecondBlock13",
					"WPSecondBlock14",
					"WPSecondBlock15",
					"WPSecondBlock16",
					"WPSecondBlock1",
    			}
			},
		}
	},
}