-- Mit diesem Skript werden die Marker für die einzelnen UI Elemente verwaltet

local MinimapMarker = 1
local buttonsize = 43

State
{
	StateName = "INIT",
	-- Erster Marker Log
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 1},
			TutorialTaskTextIsOnScreen {Take = 2},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 846, Top = 27, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 1},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 1},
			TutorialTaskTextIsNotOnScreen {Take = 2},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 2},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 3},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 2},
			TutorialUIPointerHide {},
		}
	},
	-- Zweiter Marker auf den Avatar
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 2},
			TutorialTaskTextIsOnScreen {Take = 3},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 563, Top = 383, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 2},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 2},
			FigureIsSelected {Tag = "pl_HumanAvatar"}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 3},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 5},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 3},
			TutorialUIPointerHide {},
		}
	},
	-- Dritter Marker Selektionsfenster
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 3},
			TutorialTaskTextIsOnScreen {Take = 5},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 204, Top = 521, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 3},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 3},
			TutorialTaskTextIsNotOnScreen {Take = 5},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 4},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 9},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 4},
			TutorialUIPointerHide {},
		}
	},
	-- Vierter Marker Minimap
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 4},
			TutorialTaskTextIsOnScreen {Take = 9},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 774, Top = 521, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_down"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 4},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 4},
			TutorialTaskTextIsNotOnScreen {Take = 9},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 5},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 11},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 5},
			TutorialUIPointerHide {},
		}
	},
	-- Fuenfter Marker Ava Portrait
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 5},
			TutorialTaskTextIsOnScreen {Take = 11},
		},
		Actions =
		{
			TutorialUIPointerShow { Left = 58, Top = 94, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 5},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 5},
			TutorialStateIsSet	{TutorialState = AvatarPortraitButtonClicked},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 100},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 22},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 100},
			TutorialUIPointerHide {},
		}
	},
	-- Fuenftereinhalbter Marker Ava XP
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 100},
			TutorialTaskTextIsOnScreen {Take = 22},
			FigureIsSelected {Tag = "pl_HumanAvatar"}
		},
		Actions =
		{
			TutorialUIPointerShow { Left = 191, Top = 706, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 100},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 100},
			TutorialTaskTextIsNotOnScreen {Take = 22},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 6},
		}
	},
	-- Early Out, wenn der Spieler Avatar deselektiert
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 100},
			FigureIsNotSelected {Tag = "pl_HumanAvatar"}
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 25},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 6},
			TutorialUIPointerHide {},
		}
	},
	-- Sechster Marker Stufenaufstiegsplus
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 6},
			TutorialTaskTextIsOnScreen {Take = 25},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 867, Top = 90, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 6},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 6},
			DialogEquipmentIsVisible {},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P301_PlusMarkerDeleteable"}
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 6},
			DialogInventoryIsNotVisible {},
			EntityFlagIsTrue {Name = "ef_P301_PlusMarkerDeleteable"}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 7},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt oder schon LEvel Up hatte
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AvatarHasSkill {Skill = 75}, -- Magie Anfang
				AvatarHasSkill {Skill = 6}, -- Combat Anfang
				TutorialTaskTextIsOnScreen {Take = 27},
			}
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 7},
			TutorialUIPointerHide {},
		}
	},
	--Siebtens Die beiden Marker auf dem Inventar zeigen
	OnToggleEvent
	{
		OnConditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 7},
			TutorialTaskTextIsOnScreen {Take = 27},
			DialogSkillTreeIsVisible	{},
		},
		OnActions =
		{
			EntityTimerStart {Name = "et_P301_Blink"},
			TutorialUIPointerShow {Left = 506, Top = 147, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
		},
		OffConditions =
		{
			DialogSkillTreeIsNotVisible	{},
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 7},
		},
		OffActions =
		{
			TutorialUIPointerHide {},
			EntityTimerStop {Name = "et_P301_Blink"},
		}
	},
	OnToggleEvent
	{
		OnConditions =
		{
			EntityTimerIsElapsed {Name = "et_P301_Blink", Seconds = 2},
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 7},
		},
		OnActions =
		{
			TutorialUIPointerShow {Left = 650, Top = 147, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 7},
		},
		OffConditions =
		{
			EntityTimerIsElapsed {Name = "et_P301_Blink", Seconds = 4},
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 7},
		},
		OffActions =
		{
			TutorialUIPointerShow {Left = 506, Top = 147, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			EntityTimerStart {Name = "et_P301_Blink"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AND
				{
					MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 7},
					TutorialTaskTextIsOnScreen {Take = 32},
				},
				DialogSkillTreeIsVisible	{},
			},
			
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 8},
			TutorialUIPointerHide {},
			EntityTimerStop {Name = "et_P301_Blink"},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 31},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 8},
			TutorialUIPointerHide {},
		}
	},
	-- 7.5 Marker um den Punkt zu zeigen, wo man klicken muss um die XP zu vergeben
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 8},
			TutorialTaskTextIsOnScreen {Take = 31},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 596, Top = 234, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 110},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 110},
			OR
			{
				AvatarHasSkill {Skill = 75}, -- Magie Anfang
				AvatarHasSkill {Skill = 6} -- Combat Anfang
			}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 111},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 33},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 111},
			TutorialUIPointerHide {},
		}
	},
	-- Early out, falls der Spieler das Inventar schließt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 110},
			DialogEquipmentIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Achter Marker Mana und Lebenspunkte
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 111},
			TutorialTaskTextIsOnScreen {Take = 33},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 149, Top = 448, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 8},
			EntityTimerStart {Name = "et_P301_ManaLive"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P301_ManaLive", Seconds = 3},
			DialogEquipmentIsVisible {},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 249, Top = 448, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			EntityTimerStop {Name = "et_P301_ManaLive"},
			EntityFlagSetTrue {Name = "ef_ManaMarkerEarlyOut"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 8},
			TutorialTaskTextIsNotOnScreen {Take = 33},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 9},
		}
	},
	-- Early out, falls der Spieler das Inventar schließt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 8},
			DialogEquipmentIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn SPieler Inventar wieder aufmacht und genau dann wir Marker nummer Zwei angezeigt
	OnOneTimeEvent
	{
		Conditions =
		{
			DialogEquipmentIsNotVisible	{},
			EntityFlagIsTrue {Name = "ef_ManaMarkerEarlyOut"}
		},
		Actions =
		{
			TutorialUIPointerHide {},
		},
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 34},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 9},
			TutorialUIPointerHide {},
		}
	},
	-- Neunter Marker Beutel
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 9},
			TutorialTaskTextIsOnScreen {Take = 34},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 50, Top = 26, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 9},
			EntityTimerStop {Name = "et_P301_ManaLive"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 9},
			DialogEquipmentIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 10},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 40},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 10},
		}
	},
	-- Zehnter Marker Click'n'Fight
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 10},
			TutorialTaskTextIsOnScreen {Take = 40},
			FigureIsSelected	{Tag = "SecondEncounter1"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 53, Top = 145, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 10},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AND
				{
					MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 10},
					TutorialTaskTextIsNotOnScreen {Take = 40},
				},
				AND 
				{
					MapFlagIsTrue {Name = "mf_P301_IdiotOut"},
					MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 10},
				},
				AND
				{
					FigureIsNotSelected	{Tag = "SecondEncounter1"},
					MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 10},
				},
				AND
				{
					FigureIsDead {Tag = "SecondEncounter1"},
					MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 10},
				}
			}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 11},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 43},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 11},
			TutorialUIPointerHide {},
		}
	},
	-- Elfter Marker Lootwindow
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 11},
			TutorialTaskTextIsOnScreen {Take = 43},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 897, Top = 240, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 11},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 11},
			AvatarHasItemEquipment {ItemId = 258, Amount = 1},
			AvatarHasItemEquipment {ItemId = 259, Amount = 1},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 12},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 44},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 12},
			TutorialUIPointerHide {},
		}
	},
	-- Zwölfter Marker Beutel
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 12},
			TutorialTaskTextIsOnScreen {Take = 44},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 50, Top = 30, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 12},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 12},
			DialogEquipmentIsVisible {},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 13},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 45},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 13},
			TutorialUIPointerHide {},
		}
	},
	-- Dreizenter Marker (Block) Inventar Symbole
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 13},
			TutorialTaskTextIsOnScreen {Take = 45},
			DialogEquipmentIsVisible {},
			EntityFlagIsFalse {Name = "ef_P301_ClearInventoryMarkers"}
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 309, Top = 239, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			EntityTimerStart {Name = "et_P301_InventoryButtons"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 13},
		}
	},
	-- Early out, falls der Spieler das Inventar schließt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 13},
			DialogEquipmentIsNotVisible	{},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P301_ClearInventoryMarkers"},
			TutorialUIPointerHide {},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 13},
			DialogEquipmentIsVisible {},
			EntityTimerIsElapsed {Name = "et_P301_InventoryButtons", Seconds = 2},
			EntityFlagIsFalse {Name = "ef_P301_ClearInventoryMarkers"}
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 309, Top = 289, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 13},
			DialogEquipmentIsVisible {},
			EntityTimerIsElapsed {Name = "et_P301_InventoryButtons", Seconds = 4},
			EntityFlagIsFalse {Name = "ef_P301_ClearInventoryMarkers"}
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 309, Top = 338, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 13},
			DialogEquipmentIsVisible {},
			EntityTimerIsElapsed {Name = "et_P301_InventoryButtons", Seconds = 6},
			EntityFlagIsFalse {Name = "ef_P301_ClearInventoryMarkers"}
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 309, Top = 239, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 13},
			TutorialTaskTextIsNotOnScreen {Take = 46},
			TutorialTaskTextIsNotOnScreen {Take = 45},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 14},
			EntityFlagSetTrue {Name = "ef_P301_ClearInventoryMarkers"},
			EntityTimerStop {Name = "et_P301_InventoryButtons"},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 47},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 14},
			TutorialUIPointerHide {},
		}
	},
	-- Vierzehnter Marker InventorySlots
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 14},
			DialogEquipmentIsVisible {},
			TutorialTaskTextIsOnScreen {Take = 47},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 425, Top = 217, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 14},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 14},
			DialogInventoryIsNotVisible {},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 15},
		}
	},
	-- Early out, falls der Spieler das Inventar schließt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 14},
			DialogInventoryIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 49},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 15},
			TutorialUIPointerHide {},
		}
	},
	-- Fünfzehnter Marker Dolch
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 15},
			TutorialTaskTextIsOnScreen {Take = 49},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 484, Top = 217, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 15},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 15},
			TutorialTaskTextIsNotOnScreen {Take = 49},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 16},
		}
	},
	-- Early out, falls der Spieler das Inventar schließt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 15},
			DialogInventoryIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 51},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 16},
			TutorialUIPointerHide {},
		}
	},
	-- Sechzehnter Marker Hand
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 16},
			TutorialTaskTextIsOnScreen {Take = 51},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 159, Top = 417, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 16},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 16},
			OR
			{
				AvatarHasItemEquipped {ItemId = 258},
				AvatarHasItemEquipped {ItemId = 259},
			},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 17},
		}
	},
	-- Early out, falls der Spieler das Inventar schließt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 16},
			DialogInventoryIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 54},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 17},
			TutorialUIPointerHide {},
		}
	},
	-- Siebzehnter Marker Lya
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 17},
			TutorialTaskTextIsOnScreen {Take = 54},
		},
		Actions =
		{
			TutorialCameraCenterOnEntity {Tag = "LyaMarker"},
			TutorialStateSet {TutorialState = FreezeIsoCameraPosition},
			TutorialUIPointerShow {Left = 517, Top = 394, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 17},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AND
				{
					MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 17},
					FigureIsSelected {Tag = "pl_HumanHeroLya_DEAD"},
				},
				AND
				{
					MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 17},
					FigureIsAlive {Tag = "pl_HumanHeroLya"},
				},
			}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 18},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 55},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 18},
			TutorialUIPointerHide {},
		}
	},
	-- Achtzehnter Marker Wiederbelebenbutton
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 18},
			TutorialTaskTextIsOnScreen {Take = 55},
		},
		Actions =
		{
			TutorialStateClear	{TutorialState = FreezeIsoCameraPosition},
			TutorialUIPointerShow {Left = 53, Top = 145, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 18},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 18},
			FigureIsAlive {Tag = "pl_HumanHeroLya"},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 19},
		}
	},
	-- Early Out, wenn der Spieler zwischendurch deselektiert
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 18},
			FigureIsNotSelected {Tag = "pl_HumanHeroLya"},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 62},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 19},
			TutorialUIPointerHide {},
		}
	},
	-- Neunzehnter Marker Lya Herbeirufen
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 19},
			TutorialTaskTextIsOnScreen {Take = 62},
			FigureIsSelected {Tag = "pl_HumanHeroLya"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 53, Top = 145, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 19},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AND
				{
					MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 19},
					TutorialTaskTextIsNotOnScreen {Take = 62},
				},
				AND
				{
					MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 19},
					FigureIsInEntityRange {Tag = "pl_HumanHeroLya", TargetTag = "pl_HumanAvatar", Range = 5}
				},
				
			}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 20},
		}
	},
	-- Early Out, deselektion
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 19},
			FigureIsNotSelected {Tag = "pl_HumanHeroLya"},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 64},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 20},
			TutorialUIPointerHide {},
		}
	},
	-- Zwanzigster Marker Questbuch
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 20},
			TutorialTaskTextIsOnScreen {Take = 64},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 94, Top = 26, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 20},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 20},
			DialogQuestBookIsVisible {},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 21},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 66},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 21},
			TutorialUIPointerHide {},
		}
	},
	-- 21 Marker Questbuch/Quest selbst
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 21},
			TutorialTaskTextIsOnScreen {Take = 66},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 182, Top = 307, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 21},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 21},
			DialogQuestBookDescriptionIsVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 22},
		}
	},
	-- Early Out, wenn der Spieler Questbuch kurz schließt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 21},
			DialogQuestBookIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 67},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 22},
			TutorialUIPointerHide {},
		}
	},
	-- 22 Marker für Minimapmarker 
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 22},
			TutorialTaskTextIsOnScreen {Take = 67},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 884, Top = 606, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 22},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 22},
			TutorialTaskTextIsNotOnScreen {Take = 67},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 23},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 69},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 23},
			TutorialUIPointerHide {},
		}
	},
	-- 22 Marker zweitesmal Plus
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 23},
			TutorialTaskTextIsOnScreen {Take = 69},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 866, Top = 88, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 23},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 23},
			OR
			{
				TutorialTaskTextIsNotOnScreen {Take = 69},
				DialogEquipmentIsVisible {},
			}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 24},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 70},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 24},
			TutorialUIPointerHide {},
		}
	},
	-- 22 Marker Portrait Lya
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 24},
			TutorialTaskTextIsOnScreen {Take = 70},
			DialogEquipmentIsVisible {},
		},
		Actions =
		{
			TutorialUIPointerShow { Left = 204, Top = 149, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 24},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 24},
			TutorialTaskTextIsNotOnScreen {Take = 70},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 25},
		}
	},
	-- Early out, falls der Spieler das Inventar schließt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 24},
			DialogEquipmentIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 71},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 25},
			TutorialUIPointerHide {},
		}
	},
	-- 22 Marker Zauberbuch Lya
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 25},
			TutorialTaskTextIsOnScreen {Take = 71},
			
			DialogEquipmentIsVisible {},
		},
		Actions =
		{
			TutorialUIPointerShow { Left = 313, Top = 297, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 25},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 25},
			TutorialTaskTextIsNotOnScreen {Take = 71},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 26},
		}
	},
	-- Early out, falls der Spieler das Inventar schließt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 25},
			DialogEquipmentIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 74},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 26},
			TutorialUIPointerHide {},
		}
	},
	-- 23 Marker Zaubergedächtnis Lya
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 26},
			TutorialTaskTextIsOnScreen {Take = 74},
			DialogSpellBookIsVisible {},
		},
		Actions =
		{
			TutorialUIPointerShow { Left = 450, Top = 155, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 26},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 26},
			TutorialTaskTextIsNotOnScreen {Take = 74},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 27},
		}
	},
	-- Early out, falls der Spieler das Inventar schließt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 26},
			DialogSpellBookIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 75},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 27},
			TutorialUIPointerHide {},
		}
	},
	-- 24 Marker Blitz in Zauberbuch
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 27},
			TutorialTaskTextIsOnScreen {Take = 75},
			DialogSpellBookIsVisible {},
		},
		Actions =
		{
			TutorialUIPointerShow { Left = 424, Top = 275, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 27},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 27},
			TutorialTaskTextIsNotOnScreen {Take = 75},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 28},
		}
	},
	-- Early out, falls der Spieler das Inventar schließt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 27},
			DialogSpellBookIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 78},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 28},
			TutorialUIPointerHide {},
		}
	},
	-- 25 Marker Blitzsymbol in der Aktionsleiste
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 28},
			TutorialTaskTextIsOnScreen {Take = 78},
			FigureIsSelected {Tag = "pl_HumanHeroLya"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 344, Top = 669, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 28},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 28},
			TutorialTaskTextIsNotOnScreen {Take = 78},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 29},
		}
	},
	-- Early Out, wenn der Spieler die Selektion ändert
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 28},
			FigureIsNotSelected {Tag = "pl_HumanHeroLya"}
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 79},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 29},
			TutorialUIPointerHide {},
		}
	},
	-- 25 Marker Manabalken
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 29},
			TutorialTaskTextIsOnScreen {Take = 79},
			FigureIsSelected {Tag = "pl_HumanHeroLya"},
		},
		Actions =
		{
			TutorialUIPointerShow { Left = 178, Top = 588, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 29},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 29},
			TutorialTaskTextIsNotOnScreen {Take = 79},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 30},
		}
	},
	-- Early Out, wenn der Spieler die Selektion ändert
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 29},
			FigureIsNotSelected {Tag = "pl_HumanHeroLya"}
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 80},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 30},
			TutorialUIPointerHide {},
		}
	},
	-- 25 Marker Blitzsymbol in der Aktionsleiste zweites Mal
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 30},
			TutorialTaskTextIsOnScreen {Take = 80},
			FigureIsSelected {Tag = "pl_HumanHeroLya"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 344, Top = 669, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 30},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 30},
			FigureIsDead {Tag = "Encounter4"}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 31},
		}
	},
	-- Early Out, wenn der Spieler die Selektion ändert
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 30},
			FigureIsNotSelected {Tag = "pl_HumanHeroLya"}
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 81},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 31},
			TutorialUIPointerHide {},
		}
	},
	-- 25 Marker Blitz Click'n'Fight
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 31},
			TutorialTaskTextIsOnScreen {Take = 81},
			FigureIsSelected {Tag = "Encounter5"}
		},
		Actions =
		{
			TutorialUIPointerShow { Left = 163, Top = 143, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 31},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 31},
			FigureIsDead {Tag = "Encounter5"},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 32},
		}
	},
	-- Early out, falls der Spieler die Selektion abbricht, damit der Pfeil nicht auf dem Bildschirmrumhängt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 31},
			FigureIsNotSelected {Tag = "Encounter5"}
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 87},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 32},
			TutorialUIPointerHide {},
		}
	},
	-- Schattenlied Porträt (Steady Companion)
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 32},
			TutorialTaskTextIsOnScreen {Take = 87},
		},
		Actions =
		{
			TutorialUIPointerShow { Left = 352, Top = 95, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 32},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 32},
			TutorialTaskTextIsNotOnScreen {Take = 87},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 33},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 100},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 33},
			TutorialUIPointerHide {},
		}
	},
	-- Silber in der Hinweisleiste
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 33},
			TutorialTaskTextIsOnScreen {Take = 100},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 273, Top = 26, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 33},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 33},
			PlayerHasResourceSilver {Amount = 50},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 34},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 103},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 34},
			TutorialUIPointerHide {},
		}
	},
	-- Standarthandwerker
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 34},
			TutorialTaskTextIsOnScreen {Take = 103},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 344, Top = 668, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 34},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 34},
			TutorialTaskTextIsNotOnScreen {Take = 103},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 35},
		}
	},
	-- Early out, falls der Spieler die Selektion abbricht, damit der Pfeil nicht auf dem Bildschirmrumhängt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 34},
			BuildingIsNotSelected {BuildingId = Building.RTS.RealmHeadquarter},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 104},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 35},
			TutorialUIPointerHide {},
		}
	},
	-- Arbeiter --> Spezialisten
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 35},
			TutorialTaskTextIsOnScreen {Take = 104},
			EntityFlagIsFalse {Name = "ef_P301_ClearWorkerMarkers"}
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 400, Top = 668, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			EntityTimerStart {Name = "et_P301_WorkerButtons"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 35},
		}
	},
	-- Early out, falls der Spieler die Selektion abbricht, damit der Pfeil nicht auf dem Bildschirmrumhängt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 34},
			BuildingIsNotSelected {BuildingId = Building.RTS.RealmHeadquarter},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P301_HQDeselected"},
			TutorialUIPointerHide {},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 35},
			EntityTimerIsElapsed {Name = "et_P301_WorkerButtons", Seconds = 2},
			EntityFlagIsFalse {Name = "ef_P301_HQDeselected"},
			EntityFlagIsFalse {Name = "ef_P301_ClearWorkerMarkers"}
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 455, Top = 668, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 35},
			EntityTimerIsElapsed {Name = "et_P301_WorkerButtons", Seconds = 4},
			EntityFlagIsFalse {Name = "ef_P301_HQDeselected"},
			EntityFlagIsFalse {Name = "ef_P301_ClearWorkerMarkers"}
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 512, Top = 668, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 35},
			TutorialTaskTextIsNotOnScreen {Take = 104},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 36},
			EntityFlagSetTrue {Name = "ef_P301_ClearInventoryMarkers"}
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 105},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 36},
			TutorialUIPointerHide {},
		}
	},
	-- Steinhandwerker
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 36},
			TutorialTaskTextIsOnScreen {Take = 105},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 400, Top = 668, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 36},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 36},
			-- !!! Eigentlich in Que
			PlayerHasUnitAmount {Amount = 10, UnitId = 69},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 37},
		}
	},
	-- Early out, falls der Spieler die Selektion abbricht, damit der Pfeil nicht auf dem Bildschirmrumhängt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 36},
			BuildingIsNotSelected {BuildingId = Building.RTS.RealmHeadquarter},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 109},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 37},
			TutorialUIPointerHide {},
		}
	},
	-- Bauleiste
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 37},
			TutorialTaskTextIsOnScreen {Take = 109},
			PlayerUnitIsInGroup {Group = 0, UnitId = 69, Amount = 1},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 738, Top = 608, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 37},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 37},
			OR
			{
				PlayerUnitIsNotInGroup {Group = 0, UnitId = 69, Amount = 1},
				TutorialTaskTextIsNotOnScreen {Take = 109},
			}

		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 38},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 112},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 38},
			TutorialUIPointerHide {},
		}
	},
	-- Schmiedesymbol
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 38},
			TutorialTaskTextIsOnScreen {Take = 112},
			PlayerUnitIsInGroup {Group = 0, UnitId = 69, Amount = 1},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 680, Top = 608, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 38},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 38},
			OR
			{
				PlayerUnitIsNotInGroup {Group = 0, UnitId = 69, Amount = 1},
				TutorialTaskTextIsNotOnScreen {Take = 112},
			}

		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 39},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 116},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 39},
			TutorialUIPointerHide {},
		}
	},
	-- Soldatenproduktion
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 39},
			TutorialTaskTextIsOnScreen {Take = 116},
			BuildingIsSelected {BuildingId = Building.RTS.RealmHeadquarter},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 344, Top = 608, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 39},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 39},
			OR
			{
				TutorialTaskTextIsNotOnScreen {Take = 116},
				BuildingIsNotSelected {BuildingId = Building.RTS.RealmHeadquarter},
			}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 120},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 120},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 120},
			TutorialUIPointerHide {},
		}
	},
	-- 39.5 Minimap --> Pfeil wo der Feind steht
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 120},
			TutorialTaskTextIsOnScreen {Take = 119},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 915, Top = 622, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 120},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 120},
			TutorialTaskTextIsNotOnScreen {Take = 119},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 40},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 121},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 40},
			TutorialUIPointerHide {},
		}
	},
	-- Armbrustschützen
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 40},
			TutorialTaskTextIsOnScreen {Take = 121},
			BuildingIsSelected {BuildingId = Building.RTS.RealmHeadquarter},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 344, Top = 608, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 40},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AND
				{
					MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 40},
					TutorialTaskTextIsNotOnScreen {Take = 121},
				},
				AND
				{
					MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 40},
					PlayerHasUnitAmount	{UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				},
			}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 41},
		}
	},
	-- Early Out, Deselektion
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 40},
			BuildingIsNotSelected {BuildingId = Building.RTS.RealmHeadquarter},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 41},
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 122},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 41},
			TutorialUIPointerHide {},
		}
	},
	-- Werkstattsymbol
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 41},
			TutorialTaskTextIsOnScreen {Take = 122},
			BuildingIsSelected {BuildingId = Building.RTS.RealmBlacksmith},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 735, Top = 669, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 41},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 41},
			OR
			{
				TutorialTaskTextIsNotOnScreen {Take = 122},
				BuildingIsNotSelected {BuildingId = Building.RTS.RealmBlacksmith},
			}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 42},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 124},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 42},
			TutorialUIPointerHide {},
		}
	},
	-- Einheitenlimit
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 42},
			TutorialTaskTextIsOnScreen {Take = 124},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 498, Top = 25, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 42},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 42},
			TutorialTaskTextIsNotOnScreen {Take = 124},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 43},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 127},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 43},
			TutorialUIPointerHide {},
		}
	},
	-- Idle Worker
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 43},
			TutorialTaskTextIsOnScreen {Take = 127},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 276, Top = 633, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 43},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 43},
			TutorialTaskTextIsNotOnScreen {Take = 127},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 44},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 129},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 44},
			TutorialUIPointerHide {},
		}
	},
	-- Bauernhofsymbol
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 44},
			TutorialTaskTextIsOnScreen {Take = 129},
			PlayerUnitIsInGroup {Group = 0, UnitId = 69, Amount = 1},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 624, Top = 608, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 44},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 44},
			OR
			{
				PlayerUnitIsNotInGroup {Group = 0, UnitId = 69, Amount = 1},
				TutorialTaskTextIsNotOnScreen {Take = 129},
			}

		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 45},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 121},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 46},
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 133},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 46},
			TutorialUIPointerHide {},
		}
	},
	-- Gruppenselektion Button
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 46},
			TutorialTaskTextIsOnScreen {Take = 133},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 441, Top = 45, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 46},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 46},
			TutorialTaskTextIsNotOnScreen {Take = 133},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 47},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 135},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 47},
			TutorialUIPointerHide {},
		}
	},
	-- Gruppenselektion Soldaten
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 47},
			TutorialTaskTextIsOnScreen {Take = 135},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 444, Top = 95, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 47},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 47},
			TutorialTaskTextIsNotOnScreen {Take = 135},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 48},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 136},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 48},
			TutorialUIPointerHide {},
		}
	},
	-- Gruppenselektion Armbrustschützen
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 48},
			TutorialTaskTextIsOnScreen {Take = 136},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 490, Top = 45, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 48},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 48},
			OR
			{
				PlayerUnitIsInGroup {Group = 1, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 2, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 3, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 4, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 5, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 6, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 7, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 8, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 9, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 10, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
			}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 49},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 139},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 49},
			TutorialUIPointerHide {},
		}
	},
	--Selektionsfenster
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 49},
			TutorialTaskTextIsOnScreen {Take = 139},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 204, Top = 521, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 49},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 49},
			TutorialTaskTextIsNotOnScreen {Take = 139},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 50},
		}
	},
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 140},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P301_Marker", Value = 50},
			TutorialUIPointerHide {},
		}
	},
	-- Zehnter Marker Click'n'Fight
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P301_Marker", Value = 50},
			TutorialTaskTextIsOnScreen {Take = 140},
			OR
			{
				FigureIsSelected	{Tag = "LastTuztorialArmy1"},
				FigureIsSelected	{Tag = "LastTuztorialArmy2"},
				FigureIsSelected	{Tag = "LastTuztorialArmy3"},
				FigureIsSelected	{Tag = "LastTuztorialArmy4"},
				FigureIsSelected	{Tag = "LastTuztorialArmy5"},
				FigureIsSelected	{Tag = "LastTuztorialArmy6"},
				FigureIsSelected	{Tag = "LastTuztorialArmy7"},
			}
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 53, Top = 145, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P301_MarkerShown", Value = 50},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
				MapValueIsEqual	{Name = "mv_P301_MarkerShown", Value = 50},
				TutorialTaskTextIsNotOnScreen {Take = 140},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P301_Marker", Value = 51},
		}
	},
}
