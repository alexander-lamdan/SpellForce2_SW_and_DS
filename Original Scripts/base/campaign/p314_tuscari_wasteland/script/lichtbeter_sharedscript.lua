SoulReservoirX = 616 + (math.random(5)-2.5)
SoulReservoirY = 193 + (math.random(5)-2.5)
-- Hier stehen die Lichtbeter zu Beginn

if MyDyingPlace == 1 then
	SacrificeCaveX = 361.5
	SacrificeCaveY = 420.7
end

if MyDyingPlace == 2 then	
	SacrificeCaveX  = 306.1
	SacrificeCaveY  = 350
end

if MyDyingPlace == 3 then
	SacrificeCaveX = 295
	SacrificeCaveY = 213
end

if MyDyingPlace == 4 then
	SacrificeCaveX = 341.5
	SacrificeCaveY = 490
end

if MyDyingPlace == 5 then
	SacrificeCaveX = 392.7
	SacrificeCaveY = 581.2
end

if MyDyingPlace == 6 then
	SacrificeCaveX = 441
	SacrificeCaveY = 527
end
-- Die Koordinaten der sechs Soul-Sacrificer-Hoehlen

  

State
{
	StateName = "MainScript",


	OnIdleGoHomeFake
	{
		UpdateInterval = 30,
		X = SoulReservoirX,
		Y = SoulReservoirY,
		StopFigureWhenConditionsAreFalse = true,
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 0},
		},
	}, -- Am Anfang stehen die Lichtbeter in ihrem Reservoir
	

	OnFollowEvent
	{
		Tag = "default",
		TargetTag = "Sorok",
		OnConditions = 
		{
			AvatarValueIsNotEqual{Name = "av_P314_SorokReachedPoint", Value = MyDyingPlace},
			AvatarValueIsNotEqual{Name = "av_P314_SoroksSoulRun", Value = 0},
		},
		Actions = 
		{
		},
	};

	OnIdleGoHomeFake
	{
		UpdateInterval = 30,
		X = SacrificeCaveX,
		Y = SacrificeCaveY,
		StopFigureWhenConditionsAreFalse = true,
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P314_SorokReachedPoint", Value = MyDyingPlace},
			--AvatarValueIsEqual{Name = "av_P314_SoroksSoulRun", Value = 1},
		},
		OneTimeHomeActions =
		{
			EntityValueSet{Name = "ev_ReachedCave", Value = MyDyingPlace},
		},
	}, -- Sorok geht zur Höhle, wo der entsprechende Lichtbeter geopfert wird


	OnOneTimeEvent
	{
		Conditions =
		{
			EntityValueIsEqual{Name = "ev_ReachedCave", Value = MyDyingPlace},
			AvatarValueIsEqual{Name = "av_P314_SorokReachedPoint", Value = MyDyingPlace},
		},
		Actions =
		{
			AvatarValueAdd{Name = "av_P314_LichtbetersSacrificed", Value = 1},
			FigureKill{},
		},
	},
   
	

   
};
