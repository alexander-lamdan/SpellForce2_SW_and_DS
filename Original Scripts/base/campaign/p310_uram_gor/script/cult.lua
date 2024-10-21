
 

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
   			AvatarHasItemMisc	{ItemId = 159, Amount = 1},
   			QuestIsActive	{Quest = "CultProphecyOfTheStewart"},
   		},
   		Actions =
   		{
   			QuestSetSolved {Quest = "CultProphecyOfTheStewart"},
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
