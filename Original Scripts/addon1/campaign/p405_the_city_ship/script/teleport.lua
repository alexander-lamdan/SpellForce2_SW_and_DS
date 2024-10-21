-- ACHTUNG: dieses script wird von allen Teleportern aufgerufen!

local sDespawnEffect = "Effect_DeSpawn_Unit"

local IsCityShipMap = false
if GetPlatformId() == 405 then
	IsCityShipMap = true
end

State
{
	StateName = "TeleportGo",
    
    OnEvent
    {
    	Conditions =
    	{
    		-- der Teleporter-Dialog setzt das flag, wenn Teleport gewünscht wird...
    		MapFlagIsTrue{Name = "mf_BeamMeUpTelepotty"},
    		AvatarIsNotTalking	{},
    	},
    	Actions =
    	{
    		MapFlagSetFalse{Name = "mf_BeamMeUpTelepotty"},
    		
    		--CutsceneBegin	{},
    		
    		-- Effekthascherei auf Avatar und Helden:
    		EffectStart	{Tag = "pl_HumanAvatar", File = sDespawnEffect},
    		EffectStart	{Tag = "pl_HumanUr", File = sDespawnEffect},
    		EffectStart	{Tag = "pl_HumanHeroMordecay", File = sDespawnEffect},
    		EffectStart	{Tag = "pl_HumanHeroWhisper", File = sDespawnEffect},
    		EffectStart	{Tag = "pl_HumanHeroWind", File = sDespawnEffect},
    		EffectStart	{Tag = "pl_HumanHeroCaine", File = sDespawnEffect},
    		EffectStart	{Tag = "pl_HumanHeroYasha", File = sDespawnEffect},
    		EffectStart	{Tag = "pl_HumanNightsong", File = sDespawnEffect},
    		
    		EntityTimerStart	{Name = "et_WaitForMyCommand"},
   		},
   		GotoState = "WaitForMyCommand",
    },
};


State
{
	StateName = "WaitForMyCommand",    

    OnEvent
    {
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_WaitForMyCommand", Seconds = 2.5},
    	},
    	Actions =
    	{
    		EntityTimerStop	{Name = "et_WaitForMyCommand"},
    		--CutsceneEnd	{},
   		},
   		GotoState = "BeamMeUpPotty",
    },
};


if IsCityShipMap then
	-- Also, wohin solls denn gehen??
    OnEvent
    {
    	Conditions =
    	{
    		AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtGhostwatch},
    	},
    	Actions =
    	{
 			PlayerMapTravelAddon1{Map = "Campaign/P404_Ghostwatch", TargetTag = "Ghostwatch_CityShip"},
   		},
		GotoState = "TeleporterDialogReEnable",
    };
    OnEvent
    {
    	Conditions =
    	{
    		AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtCitadel},
    	},
    	Actions =
    	{
 			PlayerMapTravelAddon1{Map = "Campaign/P406_The_Citadel", TargetTag = "Citadel_CityShip"},
   		},
		GotoState = "TeleporterDialogReEnable",
    };
    OnEvent
    {
    	Conditions =
    	{
    		AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtDraghLur},
    	},
    	Actions =
    	{
    		PlayerMapTravelAddon1{Map = "Campaign/P407_DraghLur", TargetTag = "DraghLur_CityShip"},
   		},
		GotoState = "TeleporterDialogReEnable",
    };
    OnEvent
    {
    	Conditions =
    	{
    		AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtRefuge},
    	},
    	Actions =
    	{
 			PlayerMapTravelAddon1{Map = "Campaign/P409_The_Refuge", TargetTag = "Refuge_CityShip"},
   		},
		GotoState = "TeleporterDialogReEnable",
    };
	OnEvent
    {
    	Conditions =
    	{
    		AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtWestguard},
    	},
    	Actions =
    	{
 			PlayerMapTravelAddon1{Map = "Campaign/P410_Westguard", TargetTag = "Westguard_CityShip"},
   		},
		GotoState = "TeleporterDialogReEnable",
    };
    OnEvent
    {
    	Conditions =
    	{
    		AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtSevenkeeps},
    	},
    	Actions =
    	{
 			PlayerMapTravelAddon1{Map = "Campaign/P403_Sevenkeeps", TargetTag = "Sevenkeeps_CityShip"},
   		},
		GotoState = "TeleporterDialogReEnable",
    };
	OnEvent
    {
    	Conditions =
    	{
    		AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtWinterlight},
    	},
    	Actions =
    	{
 			PlayerMapTravelAddon1{Map = "Campaign/P401_Winterlight_Peak", TargetTag = "Winterlight_CityShip"},
   		},
		GotoState = "TeleporterDialogReEnable",
    };

else
	-- von allen anderen Karten gehts natürlich nur zurück zur City Ship
    OnEvent
    {
    	Conditions =
    	{
    	},
    	Actions =
    	{
 			PlayerMapTravelAddon1{Map = "Campaign/P405_The_City_Ship", TargetTag = "CityShip_Ghostwatch"},
   		},
		GotoState = "TeleporterDialogReEnable",
    };
end

State
{
	StateName = "BeamMeUpPotty",
	
	
	-- hier wird entschieden auf welche Map verzweigt wird (siehe oben) ...


	-- wenn das Teleport Target Value nicht stimmt, dann Fehler (sollte nie passieren):
	OnEvent
    {
    	Conditions =
    	{
    	},
    	Actions =
    	{
    		DebugMessage	{Caption = "City Ship Teleporter", Message = "Unable to teleport: unknown teleport destination !!!"},
   		},
		GotoState = "TeleporterDialogReEnable",
    },
};


-- auf den anderen Karten ist der Zielstate ein anderer, damit dort bei ablegen
-- der City Ship Teleporter dort deaktiviert wird ...
local sFinalState = "CityShipIsOnThisMap"
if IsCityShipMap then
	sFinalState = "TeleportGo"
end

State
{
	StateName = "TeleporterDialogReEnable",
	
	-- Teleporter Dialog nach erfolgtem Teleport und Rückkehr wieder aktivieren:
    OnEvent
    {
    	Conditions =
    	{
    	},
    	Actions =
    	{
    		-- Teleporter-Dialog wieder anschalten ...
 			DialogSetEnabled	{},
   		},
		GotoState = sFinalState,
    },
};
