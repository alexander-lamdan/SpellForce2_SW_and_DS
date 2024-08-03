delay = 30


-- 
State
{
	StateName = "Main",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P313_Cutscene01Ended"},
		},
		Actions =
		{
			FigureVanish{},
		},-- Sorvina verschwindet nach 1. Cutscene
	},
}