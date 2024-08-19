gtCoords =
{
 
  [1] = { X = 619, Y = 415 }, 
  [2] = { X = 617, Y = 405 },   
  [3] = { X = 362, Y = 217 }, 
  [4] = { X = 418, Y = 156 }, 
  [5] = { X = 491, Y = 293 }, 
  [6] = { X = 343, Y = 171 }, 
  [7] = { X = 413, Y = 121 }, 
  [8] = { X = 635, Y = 406 }, 
  [9] = { X = 439, Y = 156 }, 
  [10] = { X = 408, Y = 186 },
 
 

}

State
{	
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent	
	{
		X = GetEntityX(), Y = GetEntityY(),
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_ResidentTimerStart", Seconds = 300},
		},
		Actions = 
		{
			
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = false
		
	},


dofile(GetScriptPath() .. "ResidentSharedAllNew.lua")	

};