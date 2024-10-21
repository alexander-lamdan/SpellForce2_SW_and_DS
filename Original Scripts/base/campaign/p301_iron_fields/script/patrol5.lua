State
{
	StateName = "Init",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigurePatrolWalk{X = GetEntityX()+1, Y = GetEntityY()+1}, 
    			Points = 
    			{ 
        			"225, 638",
        			"190, 642",
        			"189, 620", 
        			"203, 600",
        			"194, 582",
	       			"163, 590",
        			"173, 614", 
        			"189, 620", 
        			"190, 642",
        			
    			}
			}
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Mission",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Mission"}
		},
		Actions = 
		{
			FigureAbilityAdd {AbilityId = Ability.Immortal},
		}
	},
}
State
{
	StateName = "Mission",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Mission"},
			OR
			{
				PlayerFigureIsInRange {X = 200, Y = 578, Range = 20},
				PlayerFigureIsInRange {X = 200, Y = 592, Range = 20},
				PlayerFigureIsInRange {X = 200, Y = 610, Range = 20},
				PlayerFigureIsInRange {X = 187, Y = 618, Range = 20},
				PlayerFigureIsInRange {X = 200, Y = 618, Range = 20},
				PlayerFigureIsInRange {X = 159, Y = 607, Range = 20},
				PlayerFigureIsInRange {X = 159, Y = 589, Range = 20},
				PlayerFigureIsInRange {X = 156, Y = 575, Range = 20},
				PlayerFigureIsInRange {X = 165, Y = 568, Range = 20},
				PlayerFigureIsInRange {X = 184, Y = 571, Range = 20},
			}
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_P301_Dying"}
		}
	},
	OnOneTimeEvent
	{
		GotoState = "DeadEnd",
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P301_Dying", Seconds = 7}
		},
		Actions =
		{
			FigureAbilityRemove {AbilityId = Ability.Immortal},
			EntityTimerStop {Name = "et_P301_Dying"}
		}
	}
	
}

State
{
	StateName = "DeadEnd"
}