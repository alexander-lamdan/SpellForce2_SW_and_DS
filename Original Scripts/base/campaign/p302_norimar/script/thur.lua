State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "TalkToPlayer",
		Conditions = 
		{
		},
		Actions = 
		{
			DialogSetEnabled{},
			DialogTypeSetMainQuest{},			  
		},
	};
};

State
{
	StateName = "TalkToPlayer",

	
	OnOneTimeEvent
	{
		GotoState = "Fight",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_RunnersReachedNecro"},		
		},
		Actions = 
		{
			DialogSetDisabled	{},
			
			FigureNpcSpawn	{Tag = "NecroGuard01", Level = 3, UnitId = 81, X = 80, Y = 547, Team = "tm_BadGuys"},
			FigureNpcSpawn	{Tag = "NecroGuard02", Level = 3, UnitId = 81, X = 82, Y = 544, Team = "tm_BadGuys"},
			FigureNpcSpawn	{Tag = "NecroGuard03", Level = 3, UnitId = 81, X = 84, Y = 546, Team = "tm_BadGuys"},
			FigureNpcSpawn	{Tag = "NecroGuard04", Level = 3, UnitId = 81, X = 79, Y = 548, Team = "tm_BadGuys"},
			FigureNpcSpawn	{Tag = "NecroGuard05", Level = 3, UnitId = 81, X = 80, Y = 550, Team = "tm_BadGuys"},
			FigureNpcSpawn	{Tag = "NecroGuard06", Level = 3, UnitId = 81, X = 81, Y = 549, Team = "tm_BadGuys"},
			FigureNpcSpawn	{Tag = "NecroGuard07", Level = 3, UnitId = 91, X = 82, Y = 551, Team = "tm_BadGuys"},
			FigureNpcSpawn	{Tag = "NecroGuard08", Level = 3, UnitId = 91, X = 82, Y = 550, Team = "tm_BadGuys"},
			FigureNpcSpawn	{Tag = "NecroGuard09", Level = 3, UnitId = 91, X = 84, Y = 551, Team = "tm_BadGuys"},
			FigureNpcSpawn	{Tag = "NecroGuard10", Level = 3, UnitId = 91, X = 84, Y = 549, Team = "tm_BadGuys"},
		},
	};
	OnOneTimeEvent
	{
		GotoState = "Fight",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_PlayerFightsNecromancer"},
		},
		Actions = 
		{
		},
	},	
	OnOneTimeEvent
	{
		GotoState = "NoFight",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_NecroIsBuddy"},
		},
		
		Actions = 
		{
		},
	},
	
	
	-- Wenn der Spieler den Necro angreift

	
			
			
	
	
	-- Wenn der Spieler dem Necro vertraut

	

};
State
{
	StateName = "Fight",
	
	OnOneTimeEvent
	{
		Actions =
		{
			PlayerKitTransfer	{PlayerKit = "pk_Necromancer", Player = "pl_Undead"},
			EntityFlagSetTrue   {Name = "ef_ThurFights"},
		},
		Conditions =
		{
		},
	},
	-- Necro ist tot
	OnFigureDeadOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue   {Name = "ef_ThurFights"},
		},
		Actions = 
		{
			AvatarFlagSetFalse	{Name = "af_P302_ThurNotKilled"},
			FigureOutcry 		{Tag  = "pl_HumanNightSong", TextTag = "Nightsong8a"},
			MapFlagSetTrue		{Name = "mf_ThurKilled"},
		},
	},
		OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {},
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 46, Amount = 1},
		},
		Actions = 
		{
			FigureOutcry {Tag = "pl_HumanNightSong", TextTag = "Nightsong9a"},
		},
	},
	
	

};

State
{
	StateName = "NoFight",
		OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_NecroIsBuddy"},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P302_ThurNotKilled"},
			FigureVanish {},
			AvatarItemMiscGive	{Player = "pl_Human", ItemId = 46, Amount = 1},
		},
	},
	
};


