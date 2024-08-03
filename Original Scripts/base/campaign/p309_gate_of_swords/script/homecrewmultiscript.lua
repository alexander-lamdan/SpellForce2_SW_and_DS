State
{
	StateName = "Ounit",

	-- Einfach wieder auf den alten Posten zurück gehn
	OnIdleGoHomeFake
	{
		Conditions =
		{
			AvatarFlagIsFalse {Name = "af_P309_CutsceneKorEnd"},
		},
		Actions =
		{
		}
	},
}