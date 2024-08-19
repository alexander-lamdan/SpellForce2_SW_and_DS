State
{
	StateName = "PATCH",

	OnPlayHeroAnimEvent
	{
		EventName = "special_idara_sleep",
		Tag = "SQPriest_Idara",
		Anim = "special_idara_sleep",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQPriest_IdaraIsSleeping"},
		},
		Actions = 
		{
		},
		Looped = true,
	};

	OnPlayHeroAnimEvent
	{
		EventName = "special_prisoned",
		Tag = "SQPriest_Barubas",
		Anim = "special_prisoned",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQPriest_BarubasIsPrisoned"},
		},
		Actions = 
		{
		},
		Looped = true,
	};
	OnPlayHeroAnimEvent
	{
		EventName = "special_prisoned_scream",
		Tag = "SQPriest_Barubas",
		Anim = "special_prisoned_scream",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQPriest_BarubasIsScreaming"},
		},
		Actions = 
		{
		},
		Looped = true,
	};
};
