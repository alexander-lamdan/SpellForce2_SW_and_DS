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
				
    			Goto = FigurePatrolWalkToEntity {Tag = "MalarBlock22", TargetTag = "WPSecondBlock16"}, 
    			Tags = 
    			{
       	 			"WPSecondBlock15", 
        			"WPSecondBlock14", 
        			"WPSecondBlock13", 
        			"WPSecondBlock12",
        			"WPSecondBlock11",
        			"WPSecondBlock10",
        			"WPSecondBlock9",
        			"WPSecondBlock8",
        			"WPSecondBlock7",
					"WPSecondBlock6",
					"WPSecondBlock5",
					"WPSecondBlock4",
					"WPSecondBlock3",
					"WPSecondBlock2",
					"WPSecondBlock1",
    			}
			},
		}
	},
	-- Sorvina ist noch incht ins Pentagramm verdrängt
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
				
    			Goto = FigurePatrolWalkToEntity {Tag = "MalarBlock22", TargetTag = "WPSecondBlock2"}, 
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