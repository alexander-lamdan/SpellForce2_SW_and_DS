--*******************************************************
--***                                                 ***
--***             		Haldor  	                  ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_HaldorCast"},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "BombJackUnit", Level = 7, UnitId = 1061, TargetTag = "Haldor", Team = "tm_Team1"},
			EntityFlagSetTrue {Name = "ef_BombJackPlayerChange"},
			MapFlagSetTrue {Name = "mf_HaldorPlayerChoice"},
			MapFlagSetTrue {Name = "mf_BombJackOutcryStart"},
		},	
	
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
			EntityFlagIsTrue {Name = "ef_BombJackPlayerChange"},
		},
		Actions =
		{
			FigurePlayerTransfer	{Tag = "BombJackUnit", Player = "pl_Human"},
			EntityFlagSetFalse {Name = "ef_BombJackPlayerChange"},
			DialogSetDisabled	{Tag = "Haldor"},
		},	
	
	},	

};

