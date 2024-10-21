

TagRequiredBuilding =
{
	Skeleton = "UndeadBuild01", -- Mausoleum
	Stalker = "UndeadBuild05", -- Stalkershrine
	Terror = "UndeadBuild06", -- Tomb
	Cryptlord = "UndeadBuild02", -- Undead Grave Mound
}

CoordSpawnBuilding =
{
	Skeleton = { X = 142.645, Y = 402.394, },   -- HIER M�SSEN RICHTIGE KOORDINATEN HIN
	Stalker = { X = 131.001, Y = 397.924, },    -- SOBALD SIDONIE DIE GEB�UDE RICHTIG PLAZIERT HAT
	Terror = { X = 123.218, Y = 406.621, },     -- HIER M�SSEN RICHTIGE KOORDINATEN HIN
	Cryptlord = { X = 150.64, Y = 388.426, },   -- SOBALD SIDONIE DIE GEB�UDE RICHTIG PLAZIERT HAT
}


--VT(CoordSpawnBuilding[MyType].X)

--MessageBox(GetScriptTag() .. ":\nCoordSpawnBuilding = " .. tostring(CoordSpawnBuilding))
--.. "\nMyType = " .. tostring(MyType) .. "\nCoordSpawnBuilding[MyType] = " .. tostring(CoordSpawnBuilding[MyType]))

function OnUndeadSpawnEvent()

	State
	{
		StateName = "INIT",

		OnFigureSpawnOnlyWhenEvent
		{
			X = CoordSpawnBuilding[MyType].X,
			Y = CoordSpawnBuilding[MyType].Y,
			Conditions =
			{
				BuildingIsAlive{Tag = TagRequiredBuilding[MyType]},
				MapTimerIsElapsed{Name = "mt_UndeadBuildStart", Seconds = MyWaitTime},
			},
			Actions =
			{
			},
			DelayedActions =
			{
			},
			NoSpawnEffect = false,
		};



		OnFigureRespawnEvent
		{
			WaitTime = 6,
			X = CoordSpawnBuilding[MyType].X,
			Y = CoordSpawnBuilding[MyType].Y,
			Conditions =
			{
				BuildingIsAlive{Tag = TagRequiredBuilding[MyType]},
			},
			Actions =
			{
			},
			DeathActions =
			{
			},
			DelayedActions =
			{
			},
			NoSpawnEffect = false,
		};

		OnIdleGoHomeFake
		{
			X = GetEntityX(),
			Y = GetEntityY(),
			Range = 8,
			UpdateInterval = 15,
			Conditions =
			{
			},
			Actions =
			{
			},
		};
	};
end

