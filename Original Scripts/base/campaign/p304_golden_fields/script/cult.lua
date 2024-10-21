

State
{
	StateName = "CultStart",
--*******************************************************
--***                                                 ***
--***         			NQ Der Kult	                  ***
--***                                                 ***
--******************************************************* 
-- Der Spieler hat beide Bücher gefunden und kommt auf die Westguard zurück.
	
	OnOneTimeEvent
   	{
   		Conditions =
   		{
   			AvatarHasItemMisc	{ItemId = 158, Amount = 1},
   			QuestIsActive	{Quest = "CultBookOfTheRedHorde"},
   		},
   		Actions =
   		{
   			QuestSetSolved {Quest = "CultBookOfTheRedHorde"},
   		}	
	},
	
	
	OnOneTimeEvent
   	{
   		Conditions =
   		{
   			QuestIsSolved {Quest = "CultBookOfTheRedHorde"},
   			QuestIsSolved {Quest = "CultProphecyOfTheStewart"},
   			QuestIsNotActive {Quest = "CultReturnBooksThur"},
   			
   		},
   		Actions =
   		{
   			QuestSetActive {Quest = "CultReturnBooksThur"},
   			
   		}	
	},

 
};
