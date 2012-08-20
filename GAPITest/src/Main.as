package
{
	import flash.display.Sprite;
	
	import uk.co.bbc.GamesGrid;
	import uk.co.bbc.GamesGridFactory;
	import uk.co.bbc.gamesgrid.GamesGridService;
	import uk.co.bbc.gamesgrid.GamesGridTemporaryStorage;
	import uk.co.bbc.gamesgrid.Identity;
	import uk.co.bbc.gamesgrid.endpoint.HighscoreUser;
	import uk.co.bbc.gamesgrid.gamesgridevents.GamesGridErrorEvent;
	import uk.co.bbc.gamesgrid.gamesgridevents.GamesGridEvent;
	import uk.co.bbc.gamesgrid.highscores.HighscoreEntry;
	
	
	[SWF(frameRate="30", backgroundColor="#FFFFFF", width="944", height="577")]
	public class Main extends Sprite
	{
		
		public function Main()
		{
			var gamesGridService:GamesGridService = new GamesGridService("cbbcjuniorvets", "4b69d1f5ce57bc6c89329a4c376f12d46eceaa3d");
			var gamesGrid:GamesGrid = GamesGridFactory.getGamesGridInstance(gamesGridService, "Test", "JuniorVets", "GAPITest");
			
			
		}		
	}
}
