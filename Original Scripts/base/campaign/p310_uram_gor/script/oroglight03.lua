--
--
----Object/UnitIds
--local LightId = 1254
--local NoLightId = 1340 
--local Fire = 611
--
--
--State
--{
--	StateName = "OrogLightsInit",
--   	OnOneTimeEvent
--	{
--    	
--    	Conditions =
--    	{
--    	
--    	},
--    	Actions =
--    	{
--    		MapFlagSetTrue {Name = "mf_OrogLight03On"},
--       	},
--		GotoState = "OrogLight03Start"
--	},
--}
--
--State	
--{
--    StateName = "OrogLight03Start",
--    --An und Ausschalten der Fackeln
--    --OrogLight ausschalten
--   
--    OnEvent
--    {
--    	
--    	Conditions =
--    	{
--			SetUpdateInterval {Steps = 6},
--    		MapFlagIsTrue {Name = "mf_OrogLight03On"},
--    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 2, X = GetEntityX(), Y = GetEntityY()},
--    	},
--    	Actions =
--    	{
-- 			ObjectChange	{Tag = "OrogLight03", ObjectId = NoLightId, X = GetEntityX(), Y = GetEntityY()},
-- 			MapFlagSetFalse {Name = "mf_OrogLight03On"},
-- 			MapTimerStart	{Name = "mt_Burner03generateTimer"},
--   		},
--    },   
--    --OrogLight einschalten
--    OnEvent
--    {
--    	
--    	Conditions =
--    	{
--			SetUpdateInterval {Steps = 6},
--    		MapFlagIsFalse {Name = "mf_OrogLight03On"},
--    		FigureUnitNpcIsInRange	{UnitId = Fire, Range = 2, X = GetEntityX(), Y = GetEntityY()},
--    	},
--    	Actions =
--    	{
-- 			ObjectChange	{Tag = "OrogLight03", ObjectId = LightId, X = GetEntityX(), Y = GetEntityY()},
-- 			MapFlagSetTrue {Name = "mf_OrogLight03On"},
-- 			FigureVanish	{Tag = "OrogLight03burner"},
-- 			MapTimerStop	{Name = "mt_Burner03generateTimer"},
--   		},
--    },    
-- 
--
--};
