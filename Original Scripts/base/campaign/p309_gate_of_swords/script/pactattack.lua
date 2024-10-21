print (tostring(offsetX).."SuchMich")

State
{
	StateName = "Attack",
	-- Figuren suchen den Avatar, um ihn unter Druck zu setzen nach Westen zu gehn
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P309_CutsceneEnd", Seconds = 40+timerOffset},
			AvatarFlagIsFalse {Name = "af_P309_CutsceneKorEnd"},
			
		},
		Actions =
		{
			FigureRun {X = 462+offsetX, Y = 668+offsetY},
			--FigureRunToEntity	{TargetTag = "pl_HumanAvatar"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Range = 1,X = 462+offsetX, Y = 668+offsetY},
			AvatarFlagIsFalse {Name = "af_P309_CutsceneKorEnd"},
		},
		Actions =
		{
			FigureRun {X = 291+offsetX, Y = 631+offsetY},
		},
	},
	-- Wenn die Cutscene gelaufen ist gehen die gescripteten Einheiten nach Hause und überlassen der KI das Feld
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P309_CutsceneKorEnd"},
		},
		Actions =
		{
			FigureRun {X = 291+offsetX, Y = 631+offsetY},
		},
	},
}