--*******************************************************
--***                                                 ***
--***             		Askan  	                      ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndRiddengardCS"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
			
		},
		Actions =
		{
			PlayerMapTravelAddon1	{Player = "pl_Human", Map = "Campaign/P404_Ghostwatch", TargetTag = "Ghostwatch_Sevenkeeps"},
		},	
	
	},	
	
	
	
};

