State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "Messenger",
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P309_ZanzaSendsToMessenger"}
		},
		Actions =
		{
		},
	},
}
	
-- Cutscene Mit Mordecay gelaufen, jetzt kann Shadowsong ihren Dialog anschalten
State
{
	StateName = "Messenger",
	OnOneTimeEvent
	{
		--GotoState = "",
		Conditions =
		{
		},
		Actions =
		{
			
		},
	},
	
}