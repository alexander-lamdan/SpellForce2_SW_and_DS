State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue	 {Name = "af_P303_FirstAmbushDead"},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Falkmar10", Tag = "Falkmar"},		
		},	
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_SecondAmbushDead"},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Falkmar12", Tag = "Falkmar"},		
		},	
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_ThirdAmbushDead"},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Falkmar11", Tag = "Falkmar"},		
		},	
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_FourthAmbushDead"},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Falkmar13", Tag = "Falkmar"},		
		},	
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_FifthhAmbushDead"},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Falkmar14", Tag = "Falkmar"},		
		},	
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_BowAmbushDead"},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Falkmar12", Tag = "Falkmar"},		
		},	
	},
}