--*******************************************************
--***                                                 ***
--***               Palace Addon1					  ***
--***			    TeleportFight2	                  ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
	
	--Room36
	OnToggleEvent	
	{
		OnConditions =
		{
			NotAND
			{
			FigureIsNotInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "MarkerRaum36", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroYasha", TargetTag = "MarkerRaum36", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWhisper", TargetTag = "MarkerRaum36", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWind", TargetTag = "MarkerRaum36", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "MarkerRaum36", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroMordecay", TargetTag = "MarkerRaum36", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanNightsong", TargetTag = "MarkerRaum36", Range = 2},
			},
		},
		OnActions = 
		{
			ObjectVanish	{Tag = "teleporterRoom36A"},
 			ObjectVanish	{Tag = "teleporterRoom36"},
		},
		OffConditions =
		{
			FigureIsNotInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "MarkerRaum36", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroYasha", TargetTag = "MarkerRaum36", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWhisper", TargetTag = "MarkerRaum36", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWind", TargetTag = "MarkerRaum36", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "MarkerRaum36", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroMordecay", TargetTag = "MarkerRaum36", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanNightsong", TargetTag = "MarkerRaum36", Range = 2},
		},
		OffActions = 
		{
			ObjectSpawn	{ObjectId = 1432, X = 103.752, Y = 275.666, Direction = 0, Tag = "teleporterRoom36"},
			ObjectSpawn	{ObjectId = 1432, X = 134.52, Y = 313.522, Direction = 0, Tag = "teleporterRoom36A"},
		},
	},
	
	--Room37
	OnToggleEvent	
	{
		OnConditions =
		{
			NotAND
			{
			FigureIsNotInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "MarkerRaum37", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroYasha", TargetTag = "MarkerRaum37", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWhisper", TargetTag = "MarkerRaum37", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWind", TargetTag = "MarkerRaum37", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "MarkerRaum37", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroMordecay", TargetTag = "MarkerRaum37", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanNightsong", TargetTag = "MarkerRaum37", Range = 2},
			},
		},
		OnActions = 
		{
			ObjectVanish	{Tag = "teleporterRoom37A"},
 			ObjectVanish	{Tag = "teleporterRoom37"},
		},
		OffConditions =
		{
			FigureIsNotInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "MarkerRaum37", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroYasha", TargetTag = "MarkerRaum37", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWhisper", TargetTag = "MarkerRaum37", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWind", TargetTag = "MarkerRaum37", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "MarkerRaum37", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroMordecay", TargetTag = "MarkerRaum37", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanNightsong", TargetTag = "MarkerRaum37", Range = 2},
		},
		OffActions = 
		{
			ObjectSpawn	{ObjectId = 1432, X = 86.9012, Y = 275.846, Direction = 0, Tag = "teleporterRoom37"},
			ObjectSpawn	{ObjectId = 1432, X = 102.529, Y = 313.117, Direction = 0, Tag = "teleporterRoom37A"},
		},
	},
	
	
	--Room41
	OnToggleEvent	
	{
		OnConditions =
		{
			NotAND
			{
			FigureIsNotInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "MarkerRaum41", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroYasha", TargetTag = "MarkerRaum41", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWhisper", TargetTag = "MarkerRaum41", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWind", TargetTag = "MarkerRaum41", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "MarkerRaum41", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroMordecay", TargetTag = "MarkerRaum41", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanNightsong", TargetTag = "MarkerRaum41", Range = 2},
			},	
		},
		OnActions = 
		{
			ObjectVanish	{Tag = "teleporterRoom41A"},
 			ObjectVanish	{Tag = "teleporterRoom41"},
		},
		OffConditions =
		{
			FigureIsNotInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "MarkerRaum41", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroYasha", TargetTag = "MarkerRaum41", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWhisper", TargetTag = "MarkerRaum41", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWind", TargetTag = "MarkerRaum41", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "MarkerRaum41", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroMordecay", TargetTag = "MarkerRaum41", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanNightsong", TargetTag = "MarkerRaum41", Range = 2},
		},
		OffActions = 
		{
			ObjectSpawn	{ObjectId = 1432, X = 69.8041, Y = 275.658, Direction = 0, Tag = "teleporterRoom41"},
			ObjectSpawn	{ObjectId = 1432, X = 72.2843, Y = 313.387, Direction = 0, Tag = "teleporterRoom41A"},
		},
	},
	
	
	--Room40
	OnToggleEvent	
	{
		OnConditions =
		{
			NotAND
			{
			FigureIsNotInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "MarkerRaum40", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroYasha", TargetTag = "MarkerRaum40", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWhisper", TargetTag = "MarkerRaum40", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWind", TargetTag = "MarkerRaum40", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "MarkerRaum40", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroMordecay", TargetTag = "MarkerRaum40", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanNightsong", TargetTag = "MarkerRaum40", Range = 2},
			},
		},
		OnActions = 
		{
			ObjectVanish	{Tag = "teleporterRoom40A"},
 			ObjectVanish	{Tag = "teleporterRoom40"},
		},
		OffConditions =
		{
			FigureIsNotInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "MarkerRaum40", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroYasha", TargetTag = "MarkerRaum40", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWhisper", TargetTag = "MarkerRaum40", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWind", TargetTag = "MarkerRaum40", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "MarkerRaum40", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroMordecay", TargetTag = "MarkerRaum40", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanNightsong", TargetTag = "MarkerRaum40", Range = 2},
		},
		OffActions = 
		{
			ObjectSpawn	{ObjectId = 1432, X = 61.7576, Y = 250.736, Direction = 0, Tag = "teleporterRoom40"},
			ObjectSpawn	{ObjectId = 1432, X = 36.2454, Y = 275.713, Direction = 0, Tag = "teleporterRoom40A"},
		},
	},
	
	
	--Room39
	OnToggleEvent	
	{
		OnConditions =
		{
			NotAND
			{
			FigureIsNotInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "MarkerRaum39", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroYasha", TargetTag = "MarkerRaum39", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWhisper", TargetTag = "MarkerRaum39", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWind", TargetTag = "MarkerRaum39", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "MarkerRaum39", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroMordecay", TargetTag = "MarkerRaum39", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanNightsong", TargetTag = "MarkerRaum39", Range = 2},
			},
		},
		OnActions = 
		{
			ObjectVanish	{Tag = "teleporterRoom39A"},
 			ObjectVanish	{Tag = "teleporterRoom39"},
		},
		OffConditions =
		{
			FigureIsNotInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "MarkerRaum39", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroYasha", TargetTag = "MarkerRaum39", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWhisper", TargetTag = "MarkerRaum39", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWind", TargetTag = "MarkerRaum39", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "MarkerRaum39", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroMordecay", TargetTag = "MarkerRaum39", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanNightsong", TargetTag = "MarkerRaum39", Range = 2},
		},
		OffActions = 
		{
			ObjectSpawn	{ObjectId = 1432, X = 61.7495, Y = 233.625, Direction = 0, Tag = "teleporterRoom39"},
			ObjectSpawn	{ObjectId = 1432, X = 35.6519, Y = 247.373, Direction = 0, Tag = "teleporterRoom39A"},
		},
	},
	
	
	--Room38
	OnToggleEvent	
	{
		OnConditions =
		{
			NotAND
			{
			FigureIsNotInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "MarkerRaum38", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroYasha", TargetTag = "MarkerRaum38", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWhisper", TargetTag = "MarkerRaum38", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWind", TargetTag = "MarkerRaum38", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "MarkerRaum38", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroMordecay", TargetTag = "MarkerRaum38", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanNightsong", TargetTag = "MarkerRaum38", Range = 2},
			},
		},
		OnActions = 
		{
			ObjectVanish	{Tag = "teleporterRoom38A"},
 			ObjectVanish	{Tag = "teleporterRoom38"},
		},
		OffConditions =
		{
			FigureIsNotInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "MarkerRaum38", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroYasha", TargetTag = "MarkerRaum38", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWhisper", TargetTag = "MarkerRaum38", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroWind", TargetTag = "MarkerRaum38", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "MarkerRaum38", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanHeroMordecay", TargetTag = "MarkerRaum38", Range = 2},
			FigureIsNotInEntityRange	{Tag = "pl_HumanNightsong", TargetTag = "MarkerRaum38", Range = 2},
		},
		OffActions = 
		{
			ObjectSpawn	{ObjectId = 1432, X = 61.7609, Y = 216.619, Direction = 0, Tag = "teleporterRoom38"},
			ObjectSpawn	{ObjectId = 1432, X = 35.842, Y = 219.482, Direction = 0, Tag = "teleporterRoom38A"},
		},
	},
	
	
};