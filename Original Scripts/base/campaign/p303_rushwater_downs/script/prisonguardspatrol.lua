gtCoords =
{
	
	-- FakeCoords zum falsche-Punkt-Testen   
	[1] = {X = 605, Y = 213}, 
	[2] = {X = 611, Y = 176},   
	[3] = {X = 605, Y = 161}, 
	[4] = {X = 579, Y = 179}, 
	[5] = {X = 602, Y = 161}, 
	[6] = {X = 596, Y = 119}, 
	[7] = {X = 617, Y = 115}, 
	[8] = {X = 605, Y = 159}, 
} 
  
  
  
  

State
{
	StateName = "StrollingAlong",
   

   
   -- Wenn Counter = 1, dann
   
	OnIdleGoHomeFake
	{
		X = (gtCoords[(gtPersonalCounter[1])].X),
		Y = (gtCoords[(gtPersonalCounter[1])].Y),
		Range = 3,
		Conditions = 
		{
			AvatarValueIsEqual {Name = "av_P303_ResidentCounter", Value = 0 + individualsumme},
		},
   		Actions = 
		{
		},
   },
   
   -- Wenn Counter = 2, dann
   
	OnIdleGoHomeFake
	{
		X = (gtCoords[(gtPersonalCounter[2])].X),
		Y = (gtCoords[(gtPersonalCounter[2])].Y),
		Range = 3,
		Conditions = 
		{
			AvatarValueIsEqual {Name = "av_P303_ResidentCounter", Value = 10 + individualsumme},
		},
   		Actions = 
		{
		},
	},
   
   -- Wenn Counter = 3, dann
   
	OnIdleGoHomeFake
	{
		X = (gtCoords[(gtPersonalCounter[3])].X),
		Y = (gtCoords[(gtPersonalCounter[3])].Y),
		Range = 3,
		Conditions = 
		{
			AvatarValueIsEqual {Name = "av_P303_ResidentCounter", Value = 20 + individualsumme},
		},
   		Actions = 
		{
		},
	},
   
   -- Wenn Counter = 4, dann
   
	OnIdleGoHomeFake
	{
		X = (gtCoords[(gtPersonalCounter[4])].X),
		Y = (gtCoords[(gtPersonalCounter[4])].Y),
		Range = 3,
		Conditions = 
		{
			AvatarValueIsEqual {Name = "av_P303_ResidentCounter", Value = 30 + individualsumme},
		},
   		Actions = 
		{
		},
	},
   
   -- Wenn Counter = 5, dann
   
	OnIdleGoHomeFake
	{
		X = (gtCoords [(gtPersonalCounter[5])].X),
		Y = (gtCoords [(gtPersonalCounter[5])].Y),
		Range = 3,
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P303_ResidentCounter", Value = 40 + individualsumme},
		},
   		Actions = 
		{
		},
	},
   
   -- Wenn Counter = 6, dann
   
	OnIdleGoHomeFake
	{
		X = (gtCoords [(gtPersonalCounter[6])].X),
		Y = (gtCoords [(gtPersonalCounter[6])].Y),
		Range = 3,
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P303_ResidentCounter", Value = 50 + individualsumme},
		},
   		Actions = 
		{
		},
	},
   
   -- Wenn Counter = 7, dann
   
	OnIdleGoHomeFake
	{
		X = (gtCoords [(gtPersonalCounter[7])].X),
		Y = (gtCoords [(gtPersonalCounter[7])].Y),
		Range = 3,
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P303_ResidentCounter", Value = 60 + individualsumme},
		},
   		Actions = 
		{
		},
	},
   
   -- Wenn Counter = 8, dann
   
	OnIdleGoHomeFake
	{
	   	X = (gtCoords [(gtPersonalCounter[8])].X),
		Y = (gtCoords [(gtPersonalCounter[8])].Y),
		Range = 3,
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P303_ResidentCounter", Value = 70 + individualsumme},
		},
		Actions = 
		{
		},
	},
}
   