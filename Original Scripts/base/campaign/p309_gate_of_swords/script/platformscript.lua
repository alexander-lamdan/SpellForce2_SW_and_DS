State
{
	StateName = "INIT",
	-- Hat nichts mit Final zu tun, aber da die Cutscene zur Zeit crasht mal hier rein
	OnOneTimeEvent
	{
			Conditions =
			{
				EntityTimerIsElapsed {Name = "et_CutsceneIntro", Seconds = 25},
			},
			Actions =
			{
				AvatarFlagSetTrue {Name = "af_P303_Todesblocker"},
			},
	},
	
}