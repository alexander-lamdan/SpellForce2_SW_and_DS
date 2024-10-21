State
{
	StateName = "Init",
	-- Der Schattenkrieger ist so wichtig (Mainquest), der darf nicht sterben
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigureAbilityAdd {AbilityId = Ability.Immortal},
			--DialogBegin	{Player = "default", Tag = "default"},
		},
	},
	OnFigureRespawnEvent
	{
		WaitTime = 1,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			PlayerHasNotBuildingAmount {Player = "pl_Enemy1", Amount = 1},
			PlayerHasNotBuildingAmount {Player = "pl_Enemy2", Amount = 1},
			PlayerHasNotBuildingAmount {Player = "pl_Enemy3", Amount = 1},
			PlayerHasNotBuildingAmount {Player = "pl_Enemy4", Amount = 1},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P407_BladesDefeated"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P407_EndYashaCS"},
		},
		Actions =
		{
			DialogTypeSetMainQuest {},
			DialogSetEnabled {Tag = "ShadowWarrior"},
		},
	},
	-- Wenn der Spieler noch mal nach Dragh Lur zurückkehrt ist der Drachenkrieger weg
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "DraghLurA1_BackToCitadel"},
		},
		Actions =
		{
			FigureVanish{},
		},
	},
	
}