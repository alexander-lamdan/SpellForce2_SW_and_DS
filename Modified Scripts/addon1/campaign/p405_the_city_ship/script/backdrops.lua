local tBackdropsHide =
{
	-- hiermit einfach alle backdrops abschalten
	BackdropHide	{Tag = "Backdrop_Winterlight"},
	BackdropHide	{Tag = "Backdrop_Sevenkeeps"},
	BackdropHide	{Tag = "Backdrop_Ghostwatch"},
	BackdropHide	{Tag = "Backdrop_Citadel"},
	BackdropHide	{Tag = "Backdrop_DraghLur"},
	BackdropHide	{Tag = "Backdrop_Refuge"},
	BackdropHide	{Tag = "Backdrop_Westguard"},
}

State
{
	StateName = "INIT",
	
	OnEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			unpack(tBackdropsHide)	-- muss die letzte Action sein!!
		},
		GotoState = "WaitForBackdropChange",
	},
};

State
{
	StateName = "WaitForBackdropChange",
	
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ChangeBackdrop"},
		},
		Actions =
		{
		},
		GotoState = "ChangeBackdrop",
	},
};

State
{
	StateName = "ChangeBackdrop",

	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ChangeBackdrop"},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_ChangeBackdrop"},

			-- hier erstmal alle backdrops abschalten
			unpack(tBackdropsHide)	-- muss die letzte Action sein!!
		},
	},
	
	OnEvent
    {
    	Conditions =
    	{
    		AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtWinterlight},
    	},
    	Actions =
    	{
			BackdropShow	{Tag = "Backdrop_Winterlight"},
   		},
		GotoState = "WaitForBackdropChange",
    };
    OnEvent
    {
    	Conditions =
    	{
    		AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtSevenkeeps},
    	},
    	Actions =
    	{
			BackdropShow	{Tag = "Backdrop_Sevenkeeps"},
   		},
		GotoState = "WaitForBackdropChange",
    };
    OnEvent
    {
    	Conditions =
    	{
    		AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtGhostwatch},
    	},
    	Actions =
    	{
			BackdropShow	{Tag = "Backdrop_Ghostwatch"},
   		},
		GotoState = "WaitForBackdropChange",
    };
    OnEvent
    {
    	Conditions =
    	{
    		AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtCitadel},
    	},
    	Actions =
    	{
			BackdropShow	{Tag = "Backdrop_Citadel"},
   		},
		GotoState = "WaitForBackdropChange",
    };
    OnEvent
    {
    	Conditions =
    	{
    		AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtDraghLur},
    	},
    	Actions =
    	{
			BackdropShow	{Tag = "Backdrop_DraghLur"},
   		},
		GotoState = "WaitForBackdropChange",
    };
    OnEvent
    {
    	Conditions =
    	{
    		AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtRefuge},
    	},
    	Actions =
    	{
			BackdropShow	{Tag = "Backdrop_Refuge"},
   		},
		GotoState = "WaitForBackdropChange",
    };
	OnEvent
    {
    	Conditions =
    	{
    		AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtWestguard},
    	},
    	Actions =
    	{
			BackdropShow	{Tag = "Backdrop_Westguard"},
   		},
		GotoState = "WaitForBackdropChange",
    };


	-- wenn was nicht stimmt, dann Fehler (sollte nie passieren):
	OnEvent
    {
    	Conditions =
    	{
    	},
    	Actions =
    	{
    		DebugMessage	{Caption = "City Ship Backdrops", Message = "unknown destination !!!"},
   		},
		GotoState = "WaitForBackdropChange",
    },
};
