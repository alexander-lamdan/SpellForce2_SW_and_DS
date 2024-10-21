
State
{
	StateName = "MainState",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_Cutscene02_Figure_Spawn"},
		},
		Actions = 
		{
			CutsceneFigureWeaponsHide {Tag = "Schattenlied"},
		},
	},
	--Schattenlied begibt sich nach der 2 Cutszene zum Startpunkt der dritten Cutscene
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneSchattenliedEnded"},
		},
		Actions =
		{
			--FigureRun	{Tag = "Schattenlied", X = 165, Y = 81},
			--FigureRun	{Tag = "Rebelle01", X = 165, Y = 81},
			--FigureRun	{Tag = "Rebelle02", X = 165, Y = 81},
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_PlayerUnit"},  
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_PlayerUnit"},  
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_PlayerUnit"}, 
			MapFlagSetTrue {Name = "mf_SchattenliedPlayerUnit"}, 
		},
		
	},
   
				
   
};

