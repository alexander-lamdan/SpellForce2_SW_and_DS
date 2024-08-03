


  

State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_SpawnShygallasServants"},
			-- Flag wird in Shygallas Script gesetzt
		},
		Actions = 
		{
		},
	};

}
