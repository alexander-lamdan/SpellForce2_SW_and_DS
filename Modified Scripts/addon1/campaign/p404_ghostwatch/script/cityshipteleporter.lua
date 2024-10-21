-- das Teleporter-Objekt (1432 ist noch ein Dummy...)
local iTeleporterObjectId = 1432


local CIsCityShipOnThisMap
local CIsCityShipNotOnThisMap

if GetPlatformId() == 401 then
	CIsCityShipNotOnThisMap = AvatarValueIsNotEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtWinterlight}
	CIsCityShipOnThisMap = AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtWinterlight}
elseif GetPlatformId() == 403 then
	CIsCityShipNotOnThisMap = AvatarValueIsNotEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtSevenkeeps}
	CIsCityShipOnThisMap = AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtSevenkeeps}
elseif GetPlatformId() == 404 then
	CIsCityShipNotOnThisMap = AvatarValueIsNotEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtGhostwatch}
	CIsCityShipOnThisMap = AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtGhostwatch}
elseif GetPlatformId() == 406 then
	CIsCityShipNotOnThisMap = AvatarValueIsNotEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtCitadel}
	CIsCityShipOnThisMap = AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtCitadel}
elseif GetPlatformId() == 407 then
	CIsCityShipNotOnThisMap = AvatarValueIsNotEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtDraghLur}
	CIsCityShipOnThisMap = AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtDraghLur}
elseif GetPlatformId() == 409 then
	CIsCityShipNotOnThisMap = AvatarValueIsNotEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtRefuge}
	CIsCityShipOnThisMap = AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtRefuge}
elseif GetPlatformId() == 410 then
	CIsCityShipNotOnThisMap = AvatarValueIsNotEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtWestguard}
	CIsCityShipOnThisMap = AvatarValueIsEqual{Name = "av_P405_CityShipLocation", Value = CityShipAtWestguard}
else
	MessageBox("Fehler! Ein City Ship Teleporter auf einer Karte, auf der die City Ship eigentlich nicht anlegen sollte!")
end


State
{
	StateName = "INIT",

	-- erstmal den Teleporter abschalten...
	OnEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			ObjectChange	{ObjectId = 1591},	-- unsichtbares Marker-Objekt
			DialogTypeSetMainQuest	{},
			DialogSetDisabled	{},
		},
		GotoState = "CityShipIsNotHere"
	},
};

State
{
	StateName = "CityShipIsNotHere",

	-- warte bis die City Ship auf dieser Platform anlegt
	OnEvent
	{
		Conditions =
		{
			CIsCityShipOnThisMap,
		},
		Actions =
		{
			ObjectChange	{ObjectId = iTeleporterObjectId},
			DialogTypeSetMainQuest	{},
			DialogSetEnabled	{},
		},
		GotoState = "CityShipIsOnThisMap"
	},
};

State
{
	StateName = "CityShipIsOnThisMap",
	
	-- wenn die City Ship ablegt ist der Teleporter nicht mehr zu sehen ...
	OnEvent
	{
		Conditions =
		{
			CIsCityShipNotOnThisMap,
		},
		Actions =
		{
			ObjectChange	{ObjectId = 1591},	-- unsichtbares Marker-Objekt
			DialogTypeSetMainQuest	{},
			DialogSetDisabled	{},
		},
		GotoState = "CityShipIsNotHere"
	},	

	-- wenn Reisen nicht erlaubt ist ...
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_PlayerTravelDisabled"},
		},
		Actions =
		{
			DebugMessage	{Caption = "City Ship Teleporter AUS", Message = "City Ship Teleporter ist jetzt AUS-geschaltet"},
			DialogTypeSetMainQuest	{},
			DialogSetDisabled	{},
		},
		GotoState = "TravelDisabled"
	},

	-- der Spieler will zurück zur City Ship
    OnEvent
    {
    	Conditions =
    	{
    		-- der Teleporter-Dialog setzt das flag, wenn Teleport gewünscht wird...
    		MapFlagIsTrue{Name = "mf_BeamMeUpTelepotty"},
    	},
    	Actions =
    	{
   		},
   		GotoState = "TeleportGo",
    },
};


State
{
	StateName = "TravelDisabled",

	-- wenn Reisen wieder erlaubt ist ...
	OnEvent
	{
		Conditions =
		{
			MapFlagIsFalse	{Name = "mf_PlayerTravelDisabled"},
		},
		Actions =
		{
			DebugMessage	{Caption = "City Ship Teleporter ANSPRECHBAR", Message = "City Ship Teleporter ist jetzt wieder AN-geschaltet!"},
			DialogTypeSetMainQuest	{},
			DialogSetEnabled	{},
		},
		GotoState = "CityShipIsOnThisMap"
	},
};

-- hier die States für die Teleportlogik einfügen...
dofile("addon1/map/Campaign/P405_The_City_Ship/script/Teleport.lua")
