-- minimaler Range bevor Schutzkreis-weglauf-Aktivierung erfolgt
local minRange = 8

-- wie lange die Figur mit ForceGoto wegläuft, in Sekunden
local minForceWalkSeconds = 7


-- das Schutzkreisverhalten (optimiert)
function SchutzkreisVerhaltenEvent(params)

	assert(type(params) == "table", "SchutzkreisVerhaltenEvent: parameter is not a table!")

	-- wenn _Tag nicht explizit angegeben ist, dann nimm das default script tag
	if not params.Tag then params.Tag = GetScriptTag() end
	
	-- wenn X/Y nicht angegeben, dann nimm die default Position
	if not params.X then params.X = GetEntityX() end
	if not params.Y then params.Y = GetEntityY() end

	-- update interval pro Figur zufällig zwischen min, max erzeugen:
	local randomvalue = 3
	
	OnToggleEvent
	{
		OnConditions = 
		{
			SetUpdateInterval {Steps = randomvalue},
			-- folgende Abfrage verhindert, das InRange nur gecheckt wird, 
			-- wenn die Figur tatsächlich aktiv Spielerfiguren verfolgt! Major Performance-Saver!
			FigureIsInCombat	{Tag = params.Tag},
			MapFlagIsTrue	{Name = "mf_SchutzkreiseAktiviert"},
			OR	
			{
				-- auf InEntityRange umgeschaltet, daher Abfragen immer exakt auf Schutzkreismittelpunkt
				-- dadurch werden die Koordinaten überflüssig
				FigureIsInEntityRange	{Tag = params.Tag, Range = minRange, TargetTag = "SafetyArea01"},
				FigureIsInEntityRange	{Tag = params.Tag, Range = minRange, TargetTag = "SafetyArea02"},
				FigureIsInEntityRange	{Tag = params.Tag, Range = minRange, TargetTag = "SafetyArea03"},
				FigureIsInEntityRange	{Tag = params.Tag, Range = minRange, TargetTag = "SafetyArea04"},
				FigureIsInEntityRange	{Tag = params.Tag, Range = minRange, TargetTag = "SafetyArea05"},
			},
		},
		OnActions = 
		{
			EntityTimerStart	{Name = "et_ForceGotoTimer" .. params.Tag},
			EffectStart	{Tag = params.Tag, File = "Effect_Meditate_Hit"},
			FigureForcedWalk {Tag = params.Tag, X = params.X, Y = params.Y},
		},
	
		-- Damit sich die Untoten auf dem Rückzug nicht abschlachten lassen, 
		-- erlischt das Force Goto nach einer kurzen Zeit wieder.
		
		-- über Timer funktionert das ähnlich zuverlässig, denn wenn die Figur in der 
		-- gegebenen Zeit nicht ausserhalb des Schutzkreises ist, 
		-- wird sie sofort erneut rausgeschickt -> das spart dann 5 InRange Abfragen pro Figur!!
		-- ausserdem verhindert es den Bug, das die Figur evtl. nie aus dem Sicherheitsabstand rauskommt
		-- und daher dann wieder angreift und dann den Schutzkreis betreten kann
		OffConditions = 
		{
			EntityTimerIsElapsed	{Name = "et_ForceGotoTimer" .. params.Tag, Seconds = minForceWalkSeconds},
		},
		OffActions = 
		{
			EntityTimerStop	{Name = "et_ForceGotoTimer" .. params.Tag},
			FigureWalk {Tag = params.Tag, X = params.X, Y = params.Y},
		},
	}
end
