--------------------------------------------------------------
--
--		Seelen, die der Spieler ansprechen und in seine Armee verwandeln kann
--
---------------------------------------------------------------


State
{	
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			QuestIsActive {Quest = "FindMemoryBookstore"},
		},
		Actions = 
		{
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul1_Warrior"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul1", UnitId = 828, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul1_Archer"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul1", UnitId = 521, Level = 16},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul1_Mage"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul1", UnitId = 827, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul1_Priest"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul1", UnitId = 520, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul2_Warrior"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul2", UnitId = 828, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul2_Archer"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul2", UnitId = 521, Level = 16},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul2_Mage"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul2", UnitId = 827, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul2_Priest"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul2", UnitId = 520, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul3_Warrior"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul3", UnitId = 828, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul3_Archer"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul3", UnitId = 521, Level = 16},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul3_Mage"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul3", UnitId = 827, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul3_Priest"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul3", UnitId = 520, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul4_Warrior"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul4", UnitId = 828, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul4_Archer"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul4", UnitId = 521, Level = 16},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul4_Mage"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul4", UnitId = 827, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul4_Priest"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul4", UnitId = 520, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul5_Warrior"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul5", UnitId = 828, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul5_Archer"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul5", UnitId = 521, Level = 16},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul5_Mage"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul5", UnitId = 827, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul5_Priest"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul5", UnitId = 520, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul6_Warrior"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul6", UnitId = 828, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul6_Archer"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul6", UnitId = 521, Level = 16},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul6_Mage"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul6", UnitId = 827, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul6_Priest"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul6", UnitId = 520, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul7_Warrior"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul7", UnitId = 828, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul7_Archer"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul7", UnitId = 521, Level = 16},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul7_Mage"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul7", UnitId = 827, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul7_Priest"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul7", UnitId = 520, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul8_Warrior"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul8", UnitId = 828, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul8_Archer"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul8", UnitId = 521, Level = 16},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul8_Mage"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul8", UnitId = 827, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_MakeSoul8_Priest"},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Soul8", UnitId = 520, Level = 16}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P312_PlayerHasVisitedMagnetStones"},
		},
		Actions =
		{
			FigureVanish {Tag = "default"},
		}
	}
}