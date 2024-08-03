--*******************************************************
--***                                                 ***
--***               Palace Addon1					  ***
--***			    FormerFight		                  ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_StartIntroCS"},
			FigureIsDead	{Tag = "EndGeweither1"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Geweihter1Dead"},
			ObjectChange	{Tag = "EndRoomStatue1", ObjectId = 2373, X = 154, Y = 308, Direction = 90},
			SoundGlobalPlayOnceAddon1	{File = "06_level/lvl_statue_destroy"},
			ObjectChange	{Tag = "EndRoomStatue2", ObjectId = 2373, X = 154, Y = 296.8, Direction = 90},
			ObjectChange	{Tag = "EndRoomStatue3", ObjectId = 2373, X = 154, Y = 285.6, Direction = 90},
			ObjectChange	{Tag = "EndRoomStatue4", ObjectId = 2373, X = 154, Y = 274.4, Direction = 90},
			MapTimerStart	{Name = "mt_Statue1_4"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_Statue1_4", Seconds = 80},
		},
		Actions =
		{
			ObjectVanish	{Tag = "EndRoomStatue1"},
			ObjectVanish	{Tag = "EndRoomStatue2"},
			ObjectVanish	{Tag = "EndRoomStatue3"},
			ObjectVanish	{Tag = "EndRoomStatue4"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_StartIntroCS"},
			FigureIsDead	{Tag = "EndGeweither2"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Geweihter2Dead"},
			ObjectChange	{Tag = "EndRoomStatue5", ObjectId = 2373, X = 166.6, Y = 267.4, Direction = 180},
			SoundGlobalPlayOnceAddon1	{File = "06_level/lvl_statue_destroy"},
			ObjectChange	{Tag = "EndRoomStatue6", ObjectId = 2373, X = 205.8, Y = 267.4, Direction = 180},
			ObjectChange	{Tag = "EndRoomStatue11", ObjectId = 2373, X = 181.173, Y = 287.504, Direction = 0},
			ObjectChange	{Tag = "EndRoomStatue12", ObjectId = 2373, X = 191.017, Y = 287.504, Direction = 0},
			MapTimerStart	{Name = "mt_Statue5_8"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_Statue5_8", Seconds = 80},
		},
		Actions =
		{
			ObjectVanish	{Tag = "EndRoomStatue5"},
			ObjectVanish	{Tag = "EndRoomStatue6"},
			ObjectVanish	{Tag = "EndRoomStatue11"},
			ObjectVanish	{Tag = "EndRoomStatue12"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_StartIntroCS"},
			FigureIsDead	{Tag = "EndGeweither3"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Geweihter3Dead"},
			ObjectChange	{Tag = "EndRoomStatue7", ObjectId = 2373, X = 218.4, Y = 274.4, Direction = 270},
			SoundGlobalPlayOnceAddon1	{File = "06_level/lvl_statue_destroy"},
			ObjectChange	{Tag = "EndRoomStatue8", ObjectId = 2373, X = 218.4, Y = 285.6, Direction = 270},
			ObjectChange	{Tag = "EndRoomStatue9", ObjectId = 2373, X = 218.4, Y = 296.8, Direction = 270},
			ObjectChange	{Tag = "EndRoomStatue10", ObjectId = 2373, X = 218.4, Y = 308, Direction = 270},
			MapTimerStart	{Name = "mt_Statue9_12"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_Statue9_12", Seconds = 80},
		},
		Actions =
		{
			ObjectVanish	{Tag = "EndRoomStatue7"},
			ObjectVanish	{Tag = "EndRoomStatue8"},
			ObjectVanish	{Tag = "EndRoomStatue9"},
			ObjectVanish	{Tag = "EndRoomStatue10"},
		},
		
	},
	
		OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_StartIntroCS"},
			FigureIsDead	{Tag = "EndGeweither4"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Geweihter4Dead"},
			ObjectChange	{Tag = "EndRoomStatue13", ObjectId = 2373, X = 173.6, Y = 306.6, Direction = 90},
			SoundGlobalPlayOnceAddon1	{File = "06_level/lvl_statue_destroy"},
			ObjectChange	{Tag = "EndRoomStatue14", ObjectId = 2373, X = 198.8, Y = 306.6, Direction = 270},
			ObjectChange	{Tag = "EndRoomStatue16", ObjectId = 2373, X = 173.6, Y = 320.6, Direction = 90},
			ObjectChange	{Tag = "EndRoomStatue15", ObjectId = 2373, X = 198.8, Y = 320.6, Direction = 270},
			MapTimerStart	{Name = "mt_Statue13_16"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_Statue13_16", Seconds = 80},
		},
		Actions =
		{
			ObjectVanish	{Tag = "EndRoomStatue13"},
			ObjectVanish	{Tag = "EndRoomStatue14"},
			ObjectVanish	{Tag = "EndRoomStatue15"},
			ObjectVanish	{Tag = "EndRoomStatue16"},
		},
		
	},
	
};

