

State
{
	StateName = "MainState",
	
	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			EntityFlagIsFalse {Name ="ef_DialogOff"},
		},
		OnActions = 
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
		},
		OffConditions = 
		{
			EntityFlagIsTrue {Name ="ef_DialogOff"},
		},
		OffActions = 
		{
			DialogSetDisabled{},
		},
	},

	
	OnOneTimeEvent
	{
		Conditions = {},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, -- zu Beginn der Karte Dialog abschalten
	},
  
  
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarValueIsGreaterOrEqual{Name = "av_P304_NesselQuestionCounter", Value = 5} 
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, 	-- EINSCHALTBEDINGUNG: Sobald alle fünf Gildenmeister nach der Nessel gefragt wurden
},    
 
     OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P304_TalkedWithFool"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
			EntityFlagSetFalse{Name = "ef_FollowAvatar"},
		}, 	-- sobald mit Narr gesprochen wurde
		-- wird er abgeschaltet, und er folgt auch nicht mehr
	},    
    
    
    --- Narr macht seine Outcries
    OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P304_NesselQuestionCounter", Value = 3},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions =
		{
			FigureOutcry{TextTag = "Clownesque01", Tag = "Narr"},
			FigureOutcry{TextTag = "Clownesque02", Tag = "Narr"},
			FigureOutcry{TextTag = "Clownesque03", Tag = "Narr"},
			
			EntityFlagSetTrue{Name = "ef_FollowAvatar"},
		},     
	},
	
	OnFollowEvent
	{
		TargetTag = "pl_HumanAvatar",
		OnConditions = 
		{
			EntityFlagIsTrue{Name = "ef_FollowAvatar"},
		},
		Actions = 
		{
		},
	};



	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P304_NesselQuestionCounter", Value = 4},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions =
		{
			FigureOutcry{TextTag = "Clownesque04", Tag = "Narr"},
		},  
	},
	
	OnOneTimeEvent
	{	
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P304_NesselQuestionCounter", Value = 5},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions =
		{
			FigureOutcry{TextTag = "Clownesque05", Tag = "Narr"},
		},
	},      
	
	----------------------------------------------- TELEPORTIEREN DES NARRS
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual{Name = "mv_TeleportFool", Value = 1},
		},
		Actions = 
		{
			FigureTeleport	{Tag = "default", X = 347.107, Y = 616.716 },
			--FigureTeleportToEntity	{Tag = "default", TargetTag = "pl_HumanAvatar"},
		},
		-- zu Patriarch Alastar
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual{Name = "mv_TeleportFool", Value = 2},
		},
		Actions = 
		{
			FigureTeleport	{Tag = "default", X = 588.395, Y = 328.417 },
			--FigureTeleportToEntity	{Tag = "default", TargetTag = "pl_HumanAvatar"},
		},
		-- zu Markt Laudinia
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual{Name = "mv_TeleportFool", Value = 3},
		},
		Actions = 
		{
			FigureTeleport	{Tag = "default", X = 326.444, Y = 447.255 },
			--FigureTeleportToEntity	{Tag = "default", TargetTag = "pl_HumanAvatar"},
		},
		-- zu Magie Alyre
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual{Name = "mv_TeleportFool", Value = 4},
		},
		Actions = 
		{
			FigureTeleport	{Tag = "default", X = 416.344, Y = 153.254 },
			--FigureTeleportToEntity	{Tag = "default", TargetTag = "pl_HumanAvatar"},
		},
		-- zu Handwerker Cardogan
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual{Name = "mv_TeleportFool", Value = 5},
		},
		Actions = 
		{
			FigureTeleport	{Tag = "default", X = 107.292, Y = 183.144 },
			--FigureTeleportToEntity	{Tag = "default", TargetTag = "pl_HumanAvatar"},
		},
		-- zu General Redmund
	},
                                         
};                                                                         