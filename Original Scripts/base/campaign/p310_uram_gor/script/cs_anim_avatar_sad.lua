State
{	
	StateName = "Avatar_Anim",
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim1",
		Tag = "pl_HumanAvatar",
		Anim = "emote_sad",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_02_Sad_Avatar"},
		},
		Actions = 
		{
		},
		GotoState = "EndScript"
	};
};
	
State
{	
	StateName = "EndScript",
};