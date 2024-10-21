
-- Blümchenwachen spawnen erst wenn das Orakel gesagt hat geh Blumen pflücken
State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			QuestIsActive {Quest = "SpeakToFalkmarAndIo"}
		},
		Actions = 
		{
		},
	};
}
	
