gtCoords =
{  
  [1] = { X = 347, Y = 374 }, 
  [2] = { X = 368, Y = 380 },   
  [3] = { X = 405, Y = 389 }, 
  [4] = { X = 297, Y = 332 }, 
  [5] = { X = 256, Y = 339 }, 
  [6] = { X = 226, Y = 345 }, 
  [7] = { X = 195, Y = 347 }, 
  [8] = { X = 207, Y = 263 }, 
  [9] = { X = 330, Y = 373 }, 
  [10] = { X = 197, Y = 272 },


} 
 
State
{	
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent	
	{
		X = GetEntityX(), Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P403_EndCS"},	
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