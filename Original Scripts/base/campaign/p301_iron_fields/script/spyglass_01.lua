State
{
	StateName = "INIT",
	OnLeverEvent
	{
		--Delay = 1,
		Lever = "Spyglass_01",
		OnConditions = 
		{
			MapFlagIsTrue {Name = "mf_P301_SignalFireCutsceneShown"},
		},
		Actions = 
		{
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "Spyglass_01", Tag = "default", TargetTag = "default"}, -- 7s
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_Spyglass_timer"},
		},
	};
	OnEvent
	{
		EventName = Spyglass_01,
		GotoState = self,
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_Spyglass_timer", Seconds = 7},
		},
		Actions = 
		{
			EntityTimerStop {Name = "et_Spyglass_timer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd {},
		},
	};
};