gtCoords =
{
 
  [1] = { X = 324, Y = 426 }, 
  [2] = { X = 340, Y = 425 },   
  [3] = { X = 575, Y = 314 }, 
  [4] = { X = 388, Y = 438 }, 
  [5] = { X = 547, Y = 340 }, 
  [6] = { X = 552, Y = 311 }, 
  [7] = { X = 365, Y = 452 }, 
  [8] = { X = 355, Y = 482 }, 
  [9] = { X = 530, Y = 319 }, 
  [10] = { X = 572, Y = 388 },
 
         
}        

State
{	
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent	
	{
		X = GetEntityX(), Y = GetEntityY(),
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_ResidentTimerStart", Seconds = 180},
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