State
{
	StateName = "INIT",

	-- SI: Twiddle Dialog anschalten (weiss nicht ob nötig oder ob er nicht immer sofort an sein kann, ist just in case)
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions = 
		{
			QuestIsActive {Quest = "RightTwist4MeetProfSongglass"},
		},
		Actions = 
		{
			FigureSwappingDisable {},
		},
		DelayedActions =
		{
			DialogSetEnabled	{},
			DialogTypeSetSideQuest	{},
		},
	},
	
	-- SI: solver der "suche die gläser" quest wenn beide gläser gefunden
	-- SI: ab jetzt aktiv: zurück zu twiddle
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = Item.Misc.Sunglass, Amount = 1},
			AvatarHasItemMisc	{ItemId = Item.Misc.Moonglass, Amount = 1},
			QuestIsActive	{Quest = "RightTwist5FindGlasses"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "RightTwist5FindGlasses"},
			QuestSetActive	{Quest = "RightTwist5BringGlassesToTwiddle"},
		},
	},
	
	-- SI: Twiddle geht zum Portal und despawned dort
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_StartTwiddleJourney"},
		},
		Actions =
		{
			FigureWalk	{X = 437, Y = 459},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_StartTwiddleJourney"},
			FigureIsInRange	{Range = 2, X = 437, Y = 459},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_TwiddleSpawnTimer"},
			EffectStartAtEntityPosition	{File = "Effect_Spawn_Unit"},
			
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_TwiddleSpawnTimer", Seconds = 2.5},
		},
		Actions =
		{
			FigureVanish	{Tag = "default"},
			EffectStop	{Tag = "default"},
			ObjectChange	{Tag = "TeleportEffekt", ObjectId = 1588, X = 438, Y = 459, Direction = 0},
		},
		GotoState = "TwiddleEnde",
	},
}


State
{
	StateName = "TwiddleEnde",
}



