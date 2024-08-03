--Geodentarnung despawnen
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RightTwistPart3SearchGeodes"},
    		AvatarHasItemMisc {ItemId = Item.Misc.MagnetFinder, Amount = 1},
    		FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "GeodeContainer5", Range = 5},
		},
		Actions =
		{
			EffectStart	{File = "Effect_Spawn_Unit"},
			ObjectVanish	{},
		}
	}