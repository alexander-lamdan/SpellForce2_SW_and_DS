-- SI: evtl. in States aufteilen, für jedes FightNumber == x event ein eigener State, just in case
-- !!! ^^ mach ich, wenn ich mal ganz viel Zeit und Langeweile habe

State
{
	StateName = "Init",
	OnOneTimeEvent
	{
		EventName = "PitFightInit",
		Conditions =
		{

		},
		Actions =
		{
			MapValueSet {Name = "mv_P309_FightNumber", Value = 1},
		}
	},
	OnOneTimeEvent
	{
		EventName = "PitFightAvatarWinsFight1",
		Conditions =
		{
			-- Figuren 1-x der Gruppe n sind tot
			-- und sind im Kampf gefallen
			-- und Kampf läuft
			MapFlagIsTrue {Name = "mf_P309_FightRunnning"},
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 1},
			MapFlagIsTrue {Name = "mf_P309_PitFighter1_1_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter1_2_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter1_3_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter1_4_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter1_5_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter1_6_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter1_7_HasDiedInFight"},
			--FigureIsDead {Tag = "PitFighter1_1"},
			--FigureIsDead {Tag = "PitFighter1_2"},
			--FigureIsDead {Tag = "PitFighter1_3"},
			--FigureIsDead {Tag = "PitFighter1_4"},
			--FigureIsDead {Tag = "PitFighter1_5"},
			--FigureIsDead {Tag = "PitFighter1_6"},
			--FigureIsDead {Tag = "PitFighter1_7"},
		},
		Actions =
		{
			MapValueSet {Name = "mv_P309_FightNumber", Value = 2},
			MapFlagSetFalse {Name = "mf_P309_FightRunnning"},
			MapValueAdd {Name = "mv_P309_PitFightsWon", Value = 1},
			ObjectSpawn {ObjectId = 1433, X = 572, Y = 336, Direction = 90, Tag = "ArenaRoundOne"},
    		ObjectLootItemMiscAdd {Tag = "ArenaRoundOne", ItemId = 183},
		},
	},
	OnOneTimeEvent
	{
		EventName = "PitFightAvatarWinsFight2",
		Conditions =
		{
			-- Figuren 1-x der Gruppe n sind tot
			-- und sind im Kampf gefallen
			-- und Kampf läuft
			MapFlagIsTrue {Name = "mf_P309_FightRunnning"},
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 2},
			MapFlagIsTrue {Name = "mf_P309_PitFighter2_1_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter2_2_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter2_3_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter2_4_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter2_5_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter2_6_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter2_7_HasDiedInFight"},
			--FigureIsDead {Tag = "PitFighter2_1"},
			--FigureIsDead {Tag = "PitFighter2_2"},
			--FigureIsDead {Tag = "PitFighter2_3"},
			--FigureIsDead {Tag = "PitFighter2_4"},
			--FigureIsDead {Tag = "PitFighter2_5"},
			--FigureIsDead {Tag = "PitFighter2_6"},
			--FigureIsDead {Tag = "PitFighter2_7"},
		},
		Actions =
		{
			MapValueSet {Name = "mv_P309_FightNumber", Value = 3},
			MapFlagSetFalse {Name = "mf_P309_FightRunnning"},
			MapValueAdd {Name = "mv_P309_PitFightsWon", Value = 1},
			ObjectSpawn {ObjectId = 1433, X = 572, Y = 336, Direction = 90, Tag = "ArenaRoundTwo"},
    		ObjectLootItemMiscAdd {Tag = "ArenaRoundTwo", ItemId = 183},
		}
	},
	OnOneTimeEvent
	{
		EventName = "PitFightAvatarWinsFight3",
		Conditions =
		{
			-- Figuren 1-x der Gruppe n sind tot
			-- und sind im Kampf gefallen
			-- und Kampf läuft
			MapFlagIsTrue {Name = "mf_P309_FightRunnning"},
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 3},
			MapFlagIsTrue {Name = "mf_P309_PitFighter3_1_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter3_2_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter3_3_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter3_4_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter3_5_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter3_6_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter3_7_HasDiedInFight"},
			--FigureIsDead {Tag = "PitFighter3_1"},
			--FigureIsDead {Tag = "PitFighter3_2"},
			--FigureIsDead {Tag = "PitFighter3_3"},
			--FigureIsDead {Tag = "PitFighter3_4"},
			--FigureIsDead {Tag = "PitFighter3_5"},
			--FigureIsDead {Tag = "PitFighter3_6"},
			--FigureIsDead {Tag = "PitFighter3_7"},
			
		},
		Actions =
		{
			MapValueSet {Name = "mv_P309_FightNumber", Value = 4},
			MapFlagSetFalse {Name = "mf_P309_FightRunnning"},
			MapValueAdd {Name = "mv_P309_PitFightsWon", Value = 1},
			ObjectSpawn {ObjectId = 1433, X = 572, Y = 336, Direction = 90, Tag = "ArenaRoundThree"},
    		ObjectLootItemMiscAdd {Tag = "ArenaRoundThree", ItemId = 183},
		}
	},
	OnOneTimeEvent
	{
		EventName = "PitFightAvatarWinsFight4",
		Conditions =
		{
			-- Figuren 1-x der Gruppe n sind tot
			-- und sind im Kampf gefallen
			-- und Kampf läuft
			MapFlagIsTrue {Name = "mf_P309_FightRunnning"},
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 4},
			MapFlagIsTrue {Name = "mf_P309_PitFighter4_1_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter4_2_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter4_3_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter4_4_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter4_5_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter4_6_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter4_7_HasDiedInFight"},
			--FigureIsDead {Tag = "PitFighter4_1"},
			--FigureIsDead {Tag = "PitFighter4_2"},
			--FigureIsDead {Tag = "PitFighter4_3"},
			--FigureIsDead {Tag = "PitFighter4_4"},
			--FigureIsDead {Tag = "PitFighter4_5"},
			--FigureIsDead {Tag = "PitFighter4_6"},
			--FigureIsDead {Tag = "PitFighter4_7"},
		},
		Actions =
		{
			MapValueSet {Name = "mv_P309_FightNumber", Value = 5},
			MapFlagSetFalse {Name = "mf_P309_FightRunnning"},
			MapValueAdd {Name = "mv_P309_PitFightsWon", Value = 1},
			ObjectSpawn {ObjectId = 1433, X = 572, Y = 336, Direction = 90, Tag = "ArenaRoundFour"},
    		ObjectLootItemMiscAdd {Tag = "ArenaRoundFour", ItemId = 183},
		}
	},
	OnOneTimeEvent
	{
		EventName = "PitFightAvatarWinsFight5",
		Conditions =
		{
			-- Figuren 1-x der Gruppe n sind tot
			-- und sind im Kampf gefallen
			-- und Kampf läuft
			MapFlagIsTrue {Name = "mf_P309_FightRunnning"},
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 5},
			MapFlagIsTrue {Name = "mf_P309_PitFighter5_1_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter5_2_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter5_3_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter5_4_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter5_5_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter5_6_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter5_7_HasDiedInFight"},
			--FigureIsDead {Tag = "PitFighter5_1"},
			--FigureIsDead {Tag = "PitFighter5_2"},
			--FigureIsDead {Tag = "PitFighter5_3"},
			--FigureIsDead {Tag = "PitFighter5_4"},
			--FigureIsDead {Tag = "PitFighter5_5"},
			--FigureIsDead {Tag = "PitFighter5_6"},
			--FigureIsDead {Tag = "PitFighter5_7"},
			
		},
		Actions =
		{
			MapValueSet {Name = "mv_P309_FightNumber", Value = 6},
			MapFlagSetFalse {Name = "mf_P309_FightRunnning"},
			MapValueAdd {Name = "mv_P309_PitFightsWon", Value = 1},
			ObjectSpawn {ObjectId = 1433, X = 572, Y = 336, Direction = 90, Tag = "ArenaRoundFive"},
    		ObjectLootItemMiscAdd {Tag = "ArenaRoundFive", ItemId = 183},
		}
	},
	OnOneTimeEvent
	{
		EventName = "PitFightAvatarWinsFight6",
		Conditions =
		{
			-- Figuren 1-x der Gruppe n sind tot
			-- und sind im Kampf gefallen
			-- und Kampf läuft
			MapFlagIsTrue {Name = "mf_P309_FightRunnning"},
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 6},
			MapFlagIsTrue {Name = "mf_P309_PitFighter6_1_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter6_2_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter6_3_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter6_4_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter6_5_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter6_6_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter6_7_HasDiedInFight"},
			--FigureIsDead {Tag = "PitFighter6_1"},
			--FigureIsDead {Tag = "PitFighter6_2"},
			--FigureIsDead {Tag = "PitFighter6_3"},
			--FigureIsDead {Tag = "PitFighter6_4"},
			--FigureIsDead {Tag = "PitFighter6_5"},
			--FigureIsDead {Tag = "PitFighter6_6"},
			--FigureIsDead {Tag = "PitFighter6_7"},
		},
		Actions =
		{
			MapValueSet {Name = "mv_P309_FightNumber", Value = 7},
			MapFlagSetFalse {Name = "mf_P309_FightRunnning"},
			MapValueAdd {Name = "mv_P309_PitFightsWon", Value = 1},
			ObjectSpawn {ObjectId = 1433, X = 572, Y = 336, Direction = 90, Tag = "ArenaRoundSix"},
    		ObjectLootItemMiscAdd {Tag = "ArenaRoundSix", ItemId = 180},
		}
	},
	OnOneTimeEvent
	{
		EventName = "PitFightAvatarWinsFight7",
		Conditions =
		{
			-- Figuren 1-x der Gruppe n sind tot
			-- und sind im Kampf gefallen
			-- und Kampf läuft
			MapFlagIsTrue {Name = "mf_P309_FightRunnning"},
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 7},
			MapFlagIsTrue {Name = "mf_P309_PitFighter7_1_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter7_2_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter7_3_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter7_4_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter7_5_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter7_6_HasDiedInFight"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter7_7_HasDiedInFight"},
			--FigureIsDead {Tag = "PitFighter7_1"},
			--FigureIsDead {Tag = "PitFighter7_2"},
			--FigureIsDead {Tag = "PitFighter7_3"},
			--FigureIsDead {Tag = "PitFighter7_4"},
			--FigureIsDead {Tag = "PitFighter7_5"},
			--FigureIsDead {Tag = "PitFighter7_6"},
			--FigureIsDead {Tag = "PitFighter7_7"},
		},
		Actions =
		{
			MapValueSet {Name = "mv_P309_FightNumber", Value = 8},
			MapFlagSetFalse {Name = "mf_P309_FightRunnning"},
			MapValueAdd {Name = "mv_P309_PitFightsWon", Value = 1},
			ObjectSpawn {ObjectId = 1433, X = 572, Y = 336, Direction = 90, Tag = "ArenaRoundSeven"},
    		ObjectLootItemMiscAdd {Tag = "ArenaRoundSeven", ItemId = 180},
		}
	},
	OnOneTimeEvent
    {
		EventName = "PitFightAvatarWinsFight8",
    	Conditions =
    	{
    		-- Figuren 1-x der Gruppe n sind tot
    		-- und sind im Kampf gefallen
    		-- und Kampf läuft
    		MapFlagIsTrue {Name = "mf_P309_FightRunnning"},
    		MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 8},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter8_1_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter8_2_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter8_3_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter8_4_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter8_5_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter8_6_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter8_7_HasDiedInFight"},
    		--FigureIsDead {Tag = "PitFighter8_1"},
    		--FigureIsDead {Tag = "PitFighter8_2"},
    		--FigureIsDead {Tag = "PitFighter8_3"},
    		--FigureIsDead {Tag = "PitFighter8_4"},
    		--FigureIsDead {Tag = "PitFighter8_5"},
    		--FigureIsDead {Tag = "PitFighter8_6"},
    		--FigureIsDead {Tag = "PitFighter8_7"},
    		
    	},
    	Actions =
    	{
    		MapValueSet {Name = "mv_P309_FightNumber", Value = 9},
    		MapFlagSetFalse {Name = "mf_P309_FightRunnning"},
			MapValueAdd {Name = "mv_P309_PitFightsWon", Value = 1},
			ObjectSpawn {ObjectId = 1433, X = 572, Y = 336, Direction = 90, Tag = "ArenaRoundEight"},
    		ObjectLootItemMiscAdd {Tag = "ArenaRoundEight", ItemId = 180},
    	}
    },
    OnOneTimeEvent
    {
		EventName = "PitFightAvatarWinsFight9",
    	Conditions =
    	{
    		-- Figuren 1-x der Gruppe n sind tot
    		-- und sind im Kampf gefallen
    		-- und Kampf läuft
    		MapFlagIsTrue {Name = "mf_P309_FightRunnning"},
    		MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 9},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter9_1_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter9_2_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter9_3_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter9_4_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter9_5_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter9_6_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter9_7_HasDiedInFight"},
    		--FigureIsDead {Tag = "PitFighter9_1"},
    		--FigureIsDead {Tag = "PitFighter9_2"},
    		--FigureIsDead {Tag = "PitFighter9_3"},
    		--FigureIsDead {Tag = "PitFighter9_4"},
    		--FigureIsDead {Tag = "PitFighter9_5"},
    		--FigureIsDead {Tag = "PitFighter9_6"},
    		--FigureIsDead {Tag = "PitFighter9_7"},
    	},
    	Actions =
    	{
    		MapValueSet {Name = "mv_P309_FightNumber", Value = 10},
    		MapFlagSetFalse {Name = "mf_P309_FightRunnning"},
			MapValueAdd {Name = "mv_P309_PitFightsWon", Value = 1},
			ObjectSpawn {ObjectId = 1433, X = 572, Y = 336, Direction = 90, Tag = "ArenaRoundNine"},
    		ObjectLootItemMiscAdd {Tag = "ArenaRoundNine", ItemId = 182},
    	}
    },
    OnOneTimeEvent
    {
		EventName = "PitFightAvatarWinsFight10",
    	Conditions =
    	{
    		-- Figuren 1-x der Gruppe n sind tot
    		-- und sind im Kampf gefallen
    		-- und Kampf läuft
    		MapFlagIsTrue {Name = "mf_P309_FightRunnning"},
    		MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 10},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter10_1_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter10_2_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter10_3_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter10_4_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter10_5_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter10_6_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter10_7_HasDiedInFight"},
    		--FigureIsDead {Tag = "PitFighter10_1"},
    		--FigureIsDead {Tag = "PitFighter10_2"},
    		--FigureIsDead {Tag = "PitFighter10_3"},
    		--FigureIsDead {Tag = "PitFighter10_4"},
    		--FigureIsDead {Tag = "PitFighter10_5"},
    		--FigureIsDead {Tag = "PitFighter10_6"},
    		--FigureIsDead {Tag = "PitFighter10_7"},
    	},
    	Actions =
    	{
    		MapValueSet {Name = "mv_P309_FightNumber", Value = 11},
    		MapFlagSetFalse {Name = "mf_P309_FightRunnning"},
			MapValueAdd {Name = "mv_P309_PitFightsWon", Value = 1},
			ObjectSpawn {ObjectId = 1433, X = 572, Y = 336, Direction = 90, Tag = "ArenaRoundTen"},
    		ObjectLootItemMiscAdd {Tag = "ArenaRoundTen", ItemId = 182},
    	}
    },
    OnOneTimeEvent
    {
		EventName = "PitFightAvatarWinsFight11",
    	Conditions =
    	{
    		-- Figuren 1-x der Gruppe n sind tot
    		-- und sind im Kampf gefallen
    		-- und Kampf läuft
    		MapFlagIsTrue {Name = "mf_P309_FightRunnning"},
    		MapValueIsEqual {Name = "mv_P309_FightNumber", Value = 11},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter11_1_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter11_2_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter11_3_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter11_4_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter11_5_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter11_6_HasDiedInFight"},
    		MapFlagIsTrue {Name = "mf_P309_PitFighter11_7_HasDiedInFight"},
    		--FigureIsDead {Tag = "PitFighter11_1"},
    		--FigureIsDead {Tag = "PitFighter11_2"},
    		--FigureIsDead {Tag = "PitFighter11_3"},
    		--FigureIsDead {Tag = "PitFighter11_4"},
    		--FigureIsDead {Tag = "PitFighter11_5"},
    		--FigureIsDead {Tag = "PitFighter11_6"},
    		--FigureIsDead {Tag = "PitFighter11_7"},
    	},
    	Actions =
    	{
    		MapValueSet {Name = "mv_P309_FightNumber", Value = 12},
    		MapFlagSetFalse {Name = "mf_P309_FightRunnning"},
			MapValueAdd {Name = "mv_P309_PitFightsWon", Value = 1},
			ObjectSpawn {ObjectId = 1433, X = 572, Y = 336, Direction = 90, Tag = "ArenaRoundEleven"},
    		ObjectLootItemMiscAdd {Tag = "ArenaRoundEleven", ItemId = 179},
    	},
    	-- SI: script ordentlich geparkt, just in case und bißchen performance gespart
    	GotoState = "PitFightEnd",
    },
}

-- SI: endstate zum parken
State{StateName = "PitFightEnd"};
