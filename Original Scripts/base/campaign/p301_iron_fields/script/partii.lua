--Herstellen des Zustandes durch die Dunkelelfenbelagreung für Teil II

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "Change",
		Conditions = 
		{
			QuestIsKnown {Quest = "OnToIronFields"}
		},
		Actions = 
		{
			ObjectVanish {Tag = "House1"},
			ObjectVanish {Tag = "House2"},
			ObjectVanish {Tag = "TownGate"},
			ObjectVanish {Tag = "TownGate2"},
			ObjectVanish {Tag = "TownHouse1"},
			ObjectVanish {Tag = "TownHouse2"},
			ObjectVanish {Tag = "TownHouse3"},
			ObjectVanish {Tag = "LyasHouse"},
			ObjectVanish {Tag = "OldMonument"},
			ObjectVanish {Tag = "Bush"},
			ObjectVanish {Tag = "Bush2"},
			ObjectVanish {Tag = "Bush2"},
			ObjectVanish {Tag = "Tree"},
			ObjectVanish {Tag = "Rack1"},
			ObjectVanish {Tag = "Rack2"},
			ObjectVanish {Tag = "Lantern1"},
			ObjectVanish {Tag = "Flag1"},
			ObjectVanish {Tag = "Flag2"},
			-- Fahnen
			ObjectSpawn {X = 490.702, Y = 484.372, Direction = 0, ObjectId = 1132},
			ObjectSpawn {X = 502.389, Y = 484.372, Direction = 0, ObjectId = 1132},
			ObjectSpawn {X = 308.657, Y = 633.755, Direction = 90, ObjectId = 1132},
			ObjectSpawn {X = 309.199, Y = 649.028, Direction = 90, ObjectId = 1132},
			
			-- Ersetzen Haus eins
			ObjectSpawn {X = 372.489, Y = 597.384, Direction = 292.389, ObjectId = 684},
			ObjectSpawn {X = 376.292, Y = 598.018, Direction = 28.0749, ObjectId = 681},
			ObjectSpawn {X = 377.162, Y = 595.171, Direction = 17.1887, ObjectId = 681},
			ObjectSpawn {X = 374.217, Y = 592.621, Direction = 28.0749, ObjectId = 681},
			ObjectSpawn {X = 370.335, Y = 592.484, Direction = 18.3346, ObjectId = 683},
			ObjectSpawn {X = 376.292, Y = 598.018, Direction = 28.0749, ObjectId = 681},
			ObjectSpawn {X = 372.292, Y = 597.718, Direction = 28.0749, ObjectId = 1835},
			ObjectSpawn {X = 370.292, Y = 593.718, Direction = 28.0749, ObjectId = 1554},
			ObjectSpawn {X = 372.26, Y = 597.918, Direction = 28.0749, ObjectId = 1554},
			
			-- Ersetzen Haus zwei
			ObjectSpawn {X = 412.089, Y = 607.835, Direction = 0, ObjectId = 1587},
			ObjectSpawn {X = 311.951, Y = 607.018, Direction = 0, ObjectId = 1554},
			ObjectSpawn {X = 405.392, Y = 610.369, Direction = 0, ObjectId = 1554},	
			ObjectSpawn {X = 412.52, Y = 607.847, Direction = 131.78, ObjectId = 684},
			ObjectSpawn {X = 408.783, Y = 608.953, Direction = 121.467, ObjectId = 688},
			ObjectSpawn {X = 404.984, Y = 610.593, Direction = 313.016, ObjectId = 681},
			ObjectSpawn {X = 408.628, Y = 613.705, Direction = 138.835, ObjectId = 685},
			
			-- Stadt zerstören
			ObjectSpawn {X = 195.727, Y = 624.504, Direction = 0, ObjectId = 1502},
			ObjectSpawn {X = 262.461, Y = 647.692, Direction = 0, ObjectId = 1502},
			ObjectSpawn {X = 182.191, Y = 627.664, Direction = 0, ObjectId = 1554},
			ObjectSpawn {X = 182.191, Y = 627.018, Direction = 0, ObjectId = 1554},
			ObjectSpawn {X = 182.191, Y = 625.018, Direction = 0, ObjectId = 1554},
			ObjectSpawn {X = 182.191, Y = 627.835, Direction = 0, ObjectId = 1587},
			ObjectSpawn {X = 163.352, Y = 622.408, Direction = 138.083, ObjectId = 685},
			ObjectSpawn {X = 164.659, Y = 618.421, Direction = 319.892, ObjectId = 681},
			ObjectSpawn {X = 160.892, Y = 614.73, Direction = 318.173, ObjectId = 686},
			ObjectSpawn {X = 156.374, Y = 619.367, Direction = 317.6, ObjectId = 684},
			ObjectSpawn {X = 161.172, Y = 619.17, Direction = 0, ObjectId = 1835},
			ObjectSpawn {X = 157.345, Y = 620.097, Direction = 0, ObjectId = 1554},
			ObjectSpawn {X = 163.242, Y = 621.624, Direction = 0, ObjectId = 1554},
			ObjectSpawn {X = 183.447, Y = 627.835, Direction = 0, ObjectId = 1898},
			ObjectSpawn {X = 183.606, Y = 625.986, Direction = 76.7763, ObjectId = 1898},
			ObjectSpawn {X = 191.018, Y = 596.911, Direction = 0, ObjectId = 1554},
			ObjectSpawn {X = 191.028, Y = 598.836, Direction = 0, ObjectId = 1554},
			ObjectSpawn {X = 191.119, Y = 594.928, Direction = 0, ObjectId = 1554},
			ObjectSpawn {X = 191.02, Y = 599.438, Direction = 0, ObjectId = 1587},
			ObjectSpawn {X = 191.017, Y = 595.073, Direction = 0, ObjectId = 1587},
			ObjectSpawn {X = 191.078, Y = 599.244, Direction = 0, ObjectId = 1898},
			ObjectSpawn {X = 191.746, Y = 595.178, Direction = 42.3989, ObjectId = 1899},
			
			-- Militärlager der Dunkelelfen
			ObjectSpawn {X = 336.653, Y = 653.582, Direction = 0, ObjectId = 1730},
			ObjectSpawn {X = 327.462, Y = 649.072, Direction = 0, ObjectId = 1730},
			ObjectSpawn {X = 328.395, Y = 655.755, Direction = 0, ObjectId = 1730},
			ObjectSpawn {X = 334.953, Y = 659.852, Direction = 40.1071, ObjectId = 324},
			ObjectSpawn {X = 327.452, Y = 661.861, Direction = 103.132, ObjectId = 324},
			ObjectSpawn {X = 321.033, Y = 658.021, Direction = 137.51, ObjectId = 324},
			ObjectSpawn {X = 322.542, Y = 649.901, Direction = 200.535, ObjectId = 324},
			ObjectSpawn {X = 317.416, Y = 651.161, Direction = 148.006, ObjectId = 46},
			ObjectSpawn {X = 334.439, Y = 662.728, Direction = 0, ObjectId = 43},
			ObjectSpawn {X = 318.604, Y = 656.129, Direction = 165.195, ObjectId = 356},
			ObjectSpawn {X = 326.149, Y = 659.22, Direction = 0, ObjectId = 356},
			ObjectSpawn {X = 325.188, Y = 662.001, Direction = 274.056, ObjectId = 356},
			ObjectSpawn {X = 317.987, Y = 654.613, Direction = 17.1887, ObjectId = 348},
			ObjectSpawn {X = 332.075, Y = 663.186, Direction = 0, ObjectId = 348},
			ObjectSpawn {X = 326.62, Y = 661.484, Direction = 40.1071, ObjectId = 35},
			ObjectSpawn {X = 311.389, Y = 652.804, Direction = 314.163, ObjectId = 838},
			ObjectSpawn {X = 305.814, Y = 647.013, Direction = 154.699, ObjectId = 494},
			ObjectSpawn {X = 306.353, Y = 632.119, Direction = 171.887, ObjectId = 493},
			ObjectSpawn {X = 332.362, Y = 660.755, Direction = 337.082, ObjectId = 1132},
			ObjectSpawn {X = 321.616, Y = 655.858, Direction = 63.0254, ObjectId = 1132},
			ObjectSpawn {X = 311.837, Y = 646.828, Direction = 45.8366, ObjectId = 1919},
			ObjectSpawn {X = 311.46, Y = 632.785, Direction = 120.321, ObjectId = 1924},
			ObjectSpawn {X = 290.915, Y = 645.455, Direction = 126.051, ObjectId = 1924},
			ObjectSpawn {X = 290.374, Y = 638.874, Direction = 114.592, ObjectId = 1924},
			ObjectSpawn {X = 280.397, Y = 644.735, Direction = 126.051, ObjectId = 1924},
			ObjectSpawn {X = 280.247, Y = 638.907, Direction = 126.051, ObjectId = 1924},
			ObjectSpawn {X = 273.133, Y = 642.003, Direction = 91.6733, ObjectId = 1921},
			
			--Jetzt bin ich weg Weg ist die heile Mauer und Sorvina kann die Barriere bauen
			ObjectVanish {Tag = "BarrierGate"},
			ObjectVanish {Tag = "BarrierGate2"},
			ObjectVanish {Tag = "BarrierGate3"},
			ObjectVanish {Tag = "BarrierGate4"},
			
			-- Jetzt bin ich wieder da
			ObjectSpawn {X = 368.2, Y = 295.4, Direction = 45, ObjectId = 829},
			ObjectSpawn {X = 366.8, Y = 298.2, Direction = 225, ObjectId = 1502},
			ObjectSpawn {X = 273.133, Y = 642.003, Direction = 45, ObjectId = 2039},
			ObjectSpawn {X = 351.4, Y = 278.6, Direction = 225, ObjectId = 231},
		},
	};
}

State
{
	StateName = "Change",
	
}
