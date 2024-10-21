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
				
    			Goto = FigurePatrolWalkToEntity {Tag = "MalarBlock28", TargetTag = "WPSecondBlock17"}, 
    			Tags = 
    			{
       	 			"WPSecondBlock18", 
        			"WPSecondBlock13", 
        			"WPSecondBlock14", 
        			"WPSecondBlock15",
        			"WPSecondBlock16",
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
				
    			Goto = FigurePatrolWalkToEntity {Tag = "MalarBlock28", TargetTag = "WPSecondBlock17"}, 
    			Tags = 
    			{
       	 			"WPSecondBlock18", 
        			"WPSecondBlock13", 
        			"WPSecondBlock14", 
        			"WPSecondBlock15",
        			"WPSecondBlock16",
    			}
			},
		}
	},
}