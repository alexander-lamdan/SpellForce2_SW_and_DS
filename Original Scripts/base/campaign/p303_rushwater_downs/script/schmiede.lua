-----------------------------------------------------------------------
--
--	Sammelskript für die Schmiede, die sich nach den Orkangriffen nach Cronach aufmachen
--
-----------------------------------------------------------------------

State
{	
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = _X,
		Y = _Y,
		Conditions = 
		{
			OR
			{
				AND
				{
					AvatarFlagIsTrue  {Name = "af_P303_OrcPrisonAttackDead"},	
					BuildingIsNotInRange {Tag = "OrcHeadquater", X = 570, Y = 561, Range = 1}
				},
				AND
				{
					AvatarFlagIsTrue {Name = "af_P303_PrisonerFreed"},
					MapTimerIsElapsed {Name = "mt_P303_PrisonerFreedTimer", Seconds = 10},
					
				}
			}
			
		},
		Actions = 
		{
		},
	},
	OnIdleGoHomeFake
	{
		X = homeposx,
		Y = homeposy,
		Conditions = 
		{
		},
   		Actions = 
		{
		},
   },
}