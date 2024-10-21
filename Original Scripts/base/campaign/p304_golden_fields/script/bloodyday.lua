

State
{
	StateName = "MainState",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_SecondReturnToGoldenFields"},
		},
		Actions =
		{
			ObjectVanish	{Tag = "DeadWorker01"},
			ObjectVanish	{Tag = "DeadWorker02"},
			ObjectVanish	{Tag = "DeadWorker03"},
			ObjectVanish	{Tag = "DeadWorker04"},
			ObjectVanish	{Tag = "DeadWorker05"},
			ObjectVanish	{Tag = "DeadWorker06"},
			ObjectVanish	{Tag = "DeadWorker07"},
			ObjectVanish	{Tag = "DeadWorker08"},
			ObjectChange	{Tag = "DeadWorker09", ObjectId = 1862, X = 156.5, Y = 209, Direction = 188.113},
			ObjectVanish	{Tag = "DeadWorker10"},
			ObjectVanish	{Tag = "DeadWorker11"},
			ObjectVanish	{Tag = "DeadWorker12"},
			ObjectVanish	{Tag = "DeadWorker13"},
			ObjectVanish	{Tag = "DeadWorker14"},
			ObjectVanish	{Tag = "DeadWorker15"},
			ObjectVanish	{Tag = "DeadWorker16"},
			ObjectChange	{Tag = "DeadWorker17", ObjectId = 1861, X = 153.8, Y = 187.8, Direction = 51.5},
			ObjectChange	{Tag = "DeadWorker18", ObjectId = 1862, X = 153.7, Y = 184.5, Direction = 331.352},
			ObjectVanish	{Tag = "DeadWorker19"},
			ObjectVanish	{Tag = "DeadWorker20"},
			ObjectChange	{Tag = "DeadWorker21", ObjectId = 1856, X = 166.5, Y = 195, Direction = 137.51},
			ObjectVanish	{Tag = "DeadWorker22"},
			ObjectVanish	{Tag = "DeadWorker23"},
			ObjectChange	{Tag = "DeadWorker24", ObjectId = 1861, X = 170, Y = 201.3, Direction = 143},
			ObjectVanish	{Tag = "DeadWorker25"},
			ObjectVanish	{Tag = "DeadWorker26"},
			--Handwerksviertel
			
			ObjectChange	{Tag = "Flag05", ObjectId = 1952, X = 409.8, Y = 89, Direction = 15.5},
			ObjectChange	{Tag = "Flag06", ObjectId = 1952, X = 419.3, Y = 88.3, Direction = 324},
			
			
			
			--Elfenviertel
			ObjectChange	{Tag = "Flag20", ObjectId = 1945, X = 105.6, Y = 393.6, Direction = 278},
			ObjectChange	{Tag = "Flag21", ObjectId = 1945, X = 105.7, Y = 381.8, Direction = 238},
			
			--Palastviertel
			ObjectChange	{Tag = "Flag22", ObjectId = 1954, X = 436.5, Y = 292, Direction = 355},
			ObjectChange	{Tag = "Flag23", ObjectId = 1954, X = 445, Y = 292, Direction = 3},
			ObjectChange	{Tag = "Flag24", ObjectId = 1954, X = 436.8, Y = 327.7, Direction = 355},
			ObjectChange	{Tag = "Flag25", ObjectId = 1954, X = 445, Y = 327.8, Direction = 2},
			ObjectChange	{Tag = "Flag26", ObjectId = 1954, X = 420.8, Y = 308.3, Direction = 326},
			ObjectChange	{Tag = "Flag27", ObjectId = 1954, X = 415.4, Y = 328.8, Direction = 269},
			ObjectChange	{Tag = "Flag28", ObjectId = 1954, X = 419.8, Y = 340.2, Direction = 235},
			ObjectChange	{Tag = "Flag29", ObjectId = 1954, X = 425.3, Y = 345.7, Direction = 223},
			ObjectChange	{Tag = "Flag30", ObjectId = 1954, X = 474, Y = 332.5, Direction = 40},
			ObjectChange	{Tag = "Flag31", ObjectId = 1954, X = 466.5, Y = 319, Direction = 92},
			
			--Milit‰rviertel
			ObjectChange	{Tag = "Flag01", ObjectId = 1948, X = 160, Y = 210.5, Direction = 11},
			ObjectChange	{Tag = "Flag02", ObjectId = 1948, X = 175.5, Y = 211, Direction = 337},
			ObjectChange	{Tag = "Flag03", ObjectId = 1948, X = 161.5, Y = 185.5, Direction = 63},
			ObjectChange	{Tag = "Flag04", ObjectId = 1948, X = 159.5, Y = 194, Direction = 23},
			ObjectChange	{Tag = "Flag32", ObjectId = 1948, X = 171.8, Y = 237.2, Direction = 193},
			ObjectChange	{Tag = "Flag33", ObjectId = 1948, X = 162.5, Y = 237.4, Direction = 158},
			ObjectChange	{Tag = "Flag34", ObjectId = 1948, X = 122, Y = 199, Direction = 49},
			ObjectChange	{Tag = "Flag35", ObjectId = 1948, X = 122, Y = 190, Direction = 124},
			ObjectChange	{Tag = "Flag36", ObjectId = 1948, X = 90, Y = 159, Direction = 21},
			ObjectChange	{Tag = "Flag37", ObjectId = 1948, X = 98.5, Y = 159, Direction = 347},
			ObjectChange	{Tag = "Flag38", ObjectId = 1948, X = 175, Y = 116, Direction = 11},
			ObjectChange	{Tag = "Flag39", ObjectId = 1948, X = 181.5, Y = 116, Direction = 348},
			--Palastviertel
			
			ObjectVanish	{Tag = "LockingWood01"},
			ObjectVanish	{Tag = "LockingWood02"},
			ObjectVanish	{Tag = "LockingWood03"},
			ObjectVanish	{Tag = "LockingWood04"},
			ObjectVanish	{Tag = "LockingWood05"},
			ObjectVanish	{Tag = "LockingWood06"},
			ObjectVanish	{Tag = "LockingWood07"},
			ObjectVanish	{Tag = "LockingWood08"},
			ObjectVanish	{Tag = "LockingWood09"},
			ObjectVanish	{Tag = "LockingWood10"},
			ObjectVanish	{Tag = "LockingWood11"},
			ObjectVanish	{Tag = "LockingWood12"},
			ObjectVanish	{Tag = "LockingWood13"},
			ObjectVanish	{Tag = "LockingWood14"},
			ObjectVanish	{Tag = "LockingWood16"},
			ObjectVanish	{Tag = "LockingWood17"},
			ObjectVanish	{Tag = "LockingWood19"},
			ObjectVanish	{Tag = "LockingWood20"},
			ObjectVanish	{Tag = "LockingWood21"},
			ObjectVanish	{Tag = "LockingWood22"},
			ObjectVanish	{Tag = "LockingWood23"},
			ObjectVanish	{Tag = "LockingWood24"},
			ObjectVanish	{Tag = "LockingWood25"},
			ObjectVanish	{Tag = "LockingWood26"},
			ObjectVanish	{Tag = "LockingWood27"},
			ObjectVanish	{Tag = "LockingWood29"},
			ObjectVanish	{Tag = "LockingWood30"},
			ObjectVanish	{Tag = "LockingWood31"},
			ObjectVanish	{Tag = "LockingWood32"},
			ObjectVanish	{Tag = "LockingWood33"},
			ObjectVanish	{Tag = "LockingWood34"},
			ObjectVanish	{Tag = "LockingWood35"},
			ObjectVanish	{Tag = "LockingWood36"},
			ObjectVanish	{Tag = "LockingWood37"},
			ObjectVanish	{Tag = "LockingWood38"},
			ObjectVanish	{Tag = "LockingWood39"},
			ObjectVanish	{Tag = "LockingWood40"},
			ObjectVanish	{Tag = "DeadWorker31"},
			ObjectVanish	{Tag = "DeadWorker32"},
			ObjectVanish	{Tag = "DeadWorker33"},
			ObjectVanish	{Tag = "DeadWorker34"},
			ObjectVanish	{Tag = "DeadWorker35"},
			ObjectVanish	{Tag = "DeadWorker36"},
			
			ObjectVanish	{Tag = "DeadWorker38"},
			ObjectVanish	{Tag = "DeadWorker39"},
			ObjectVanish	{Tag = "DeadWorker40"},
			ObjectVanish	{Tag = "DeadWorker41"},
			ObjectVanish	{Tag = "DeadWorker42"},
		
			ObjectVanish	{Tag = "DeadDecal01"},	
			ObjectVanish	{Tag = "DeadDecal02"},	
			ObjectVanish	{Tag = "DeadDecal03"},	
			ObjectVanish	{Tag = "DeadDecal04"},	
			ObjectVanish	{Tag = "DeadDecal05"},	
			ObjectVanish	{Tag = "DeadDecal06"},	
			ObjectVanish	{Tag = "DeadDecal07"},	
			ObjectVanish	{Tag = "DeadDecal08"},	
			ObjectVanish	{Tag = "DeadDecal09"},	
			ObjectVanish	{Tag = "DeadDecal10"},	
			ObjectVanish	{Tag = "DeadDecal11"},	
			ObjectVanish	{Tag = "DeadDecal12"},	
			ObjectVanish	{Tag = "DeadDecal13"},	
			ObjectVanish	{Tag = "DeadDecal14"},	
			ObjectVanish	{Tag = "Fly01"},	
			ObjectVanish	{Tag = "Fly02"},	
			ObjectVanish	{Tag = "Fly03"},	
			ObjectVanish	{Tag = "Fly04"},	
			ObjectVanish	{Tag = "Fly05"},	
			ObjectVanish	{Tag = "Fly06"},
			ObjectVanish	{Tag = "Fly07"},	
			ObjectVanish	{Tag = "Fly08"},	
			ObjectVanish	{Tag = "Fly09"},
			ObjectVanish	{Tag = "Fly10"},	
			ObjectVanish	{Tag = "Fly11"},	
			ObjectVanish	{Tag = "Fly12"},
			ObjectVanish	{Tag = "Fly13"},
			ObjectVanish	{Tag = "Fly14"},
			ObjectVanish	{Tag = "Cart01"},
			ObjectVanish	{Tag = "Cart02"},
			ObjectVanish	{Tag = "Cart03"},
			ObjectVanish	{Tag = "Cart04"},
			ObjectVanish	{Tag = "Cart05"},
			
			ObjectVanish	{Tag = "Burning01"},
			ObjectVanish	{Tag = "Burning02"},
			ObjectVanish	{Tag = "Burning03"},
			ObjectVanish	{Tag = "Burning04"},
			ObjectVanish	{Tag = "Burning05"},
			ObjectVanish	{Tag = "Burning06"},
			ObjectVanish	{Tag = "Burning07"},
			ObjectVanish	{Tag = "Burning08"},
		
			
		},
	},
	--Start schieﬂende Ranger 01-03
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_shooting01Start"},
			MapTimerStart	{Name = "mt_A02Shooting01"},
			MapTimerStart	{Name = "mt_ShootingStart"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_ShootingStart", Seconds = 1},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_shooting02Start"},
			MapTimerStart	{Name = "mt_A02Shooting02"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_ShootingStart", Seconds = 2},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_shooting03Start"},
			MapTimerStart	{Name = "mt_A02Shooting03"},
		},
	},
	--Schieﬂende Ranger 01
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_A02Shooting01", Seconds = 1.5},
			MapFlagIsFalse {Name = "mf_shooting01Once"},
			MapFlagIsTrue {Name = "mf_shooting01Start"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "Ranger01", File = "base/gfx/figures/fraction_1/figure_human_scout_aim.ska"},
			MapFlagSetTrue {Name = "mf_shooting01Once"},
			MapTimerStop	{Name = "mt_A02Shooting01"},
			MapTimerStart	{Name = "mt_Shooting01"},
			
		},
	},
	--Schieﬂende Ranger 01
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_Shooting01", Seconds = 1.5},
			MapFlagIsTrue {Name = "mf_shooting01Once"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "Ranger01", File = "base/gfx/figures/fraction_1/figure_human_scout_shoot.ska"},
			MapFlagSetFalse {Name = "mf_shooting01Once"},
			MapTimerStop	{Name = "mt_Shooting01"},
			MapTimerStart	{Name = "mt_A02Shooting01"},
		},
	},
	--Schieﬂende Ranger 02
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_A02Shooting02", Seconds = 1.5},
			MapFlagIsFalse {Name = "mf_shooting02Once"},
			MapFlagIsTrue {Name = "mf_shooting02Start"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "Ranger02", File = "base/gfx/figures/fraction_1/figure_human_scout_aim.ska"},
			MapFlagSetTrue {Name = "mf_shooting02Once"},
			MapTimerStop	{Name = "mt_A02Shooting02"},
			MapTimerStart	{Name = "mt_Shooting02"},
			
		},
	},
	--Schieﬂende Ranger 02
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_Shooting02", Seconds = 1.5},
			MapFlagIsTrue {Name = "mf_shooting02Once"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "Ranger02", File = "base/gfx/figures/fraction_1/figure_human_scout_shoot.ska"},
			MapFlagSetFalse {Name = "mf_shooting02Once"},
			MapTimerStop	{Name = "mt_Shooting02"},
			MapTimerStart	{Name = "mt_A02Shooting02"},
		},
	},
	--Schieﬂende Ranger 03
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_A02Shooting03", Seconds = 1.5},
			MapFlagIsFalse {Name = "mf_shooting03Once"},
			MapFlagIsTrue {Name = "mf_shooting03Start"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_A02Shooting03"},
			FigureAnimPlayOnce	{Tag = "Ranger03", File = "base/gfx/figures/fraction_1/figure_human_scout_aim.ska"},
			MapFlagSetTrue {Name = "mf_shooting03Once"},
			MapTimerStart	{Name = "mt_Shooting03"},
			
		},
	},
	--Schieﬂende Ranger 03
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_Shooting03", Seconds = 1.5},
			MapFlagIsTrue {Name = "mf_shooting03Once"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "Ranger03", File = "base/gfx/figures/fraction_1/figure_human_scout_shoot.ska"},
			MapFlagSetFalse {Name = "mf_shooting03Once"},
			MapTimerStop	{Name = "mt_Shooting03"},
			MapTimerStart	{Name = "mt_A02Shooting03"},
		},
	},
}
