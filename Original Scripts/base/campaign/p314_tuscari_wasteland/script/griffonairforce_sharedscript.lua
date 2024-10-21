


AttackCoordX = 74 + (math.random(15)-7.5)
AttackCoordY = 244 + (math.random(15)-7.5)
-- Angriffskoordinate: Hierhin fliegen die Griffons
-- (es sind die Koordinaten des Spieler-Haupthauses)
  

State
{
	StateName = "MainScript",

   	OnOneTimeEvent
   	{
   		Conditions =
   		{
   			AvatarFlagIsTrue {Name = "af_P314_GriffonsAttack"},
   		},
   		Actions =
   		{
   			EntityTimerStart{Name = "et_WaitTillAttack"},
   		},
   	},
  
  
  	OnOneTimeEvent
   	{
   		Conditions =
   		{
   			AvatarFlagIsTrue {Name = "af_P314_CS01Finished"},
  			EntityTimerIsElapsed{Name = "et_WaitTillAttack", Seconds = (20*MyNumber)}
   		},
   		Actions =
   		{
   			FigurePathGoto
				{
				    Goto = FigurePatrolWalk{Tag = "default", X = AttackCoordX, Y = AttackCoordY}, 
				    Points = 
				    {
				        "64.975, 253.101",
				        "139.216, 195.013",
				        "159.943, 158.237",
				        "178.454, 217.199",
				       	"217.061, 94.5048",
				       	"350.759, 143.523",
				       	"477.177, 45.5827",
				    },
				}, 
   		},
   	},
  
--	OnIdleGoHomeFake
--  	{
--  		UpdateInterval = 30,
--  		X = AttackCoordX, Y = AttackCoordY,
--  		Conditions = 
--  		{
--  			AvatarFlagIsTrue {Name = "af_P314_CS01Finished"},
--  			EntityTimerIsElapsed{Name = "et_WaitTillAttack", Seconds = (20*MyNumber)}
--  		},
--  		Actions = 
--		{
--		},
--  	},

	
	
  
   
};
