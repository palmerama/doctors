package
{
	import com.wehaverhythm.utils.Debug;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	
	import uk.co.bbc.GamesGrid;
	import uk.co.bbc.GamesGridFactory;
	import uk.co.bbc.gamesgrid.GamesGridService;
	import uk.co.bbc.gamesgrid.GamesGridTemporaryStorage;
	import uk.co.bbc.gamesgrid.Identity;
	import uk.co.bbc.gamesgrid.User;
	import uk.co.bbc.gamesgrid.endpoint.Authenticate;
	import uk.co.bbc.gamesgrid.endpoint.GamesGridEndpointFactory;
	import uk.co.bbc.gamesgrid.endpoint.HighscoreUser;
	import uk.co.bbc.gamesgrid.gamesgridevents.GamesGridErrorEvent;
	import uk.co.bbc.gamesgrid.gamesgridevents.GamesGridEvent;
	import uk.co.bbc.gamesgrid.highscores.HighscoreEntry;
	
	
	[SWF(frameRate="30", backgroundColor="#FFFFFF", width="944", height="577")]
	public class Main extends Sprite
	{		
		private var gamesGrid:GamesGrid;
		private var auth:Authenticate;
		
		
		public function Main()
		{
			var menu:ContextMenu = new ContextMenu();
			menu.hideBuiltInItems();
			menu.customItems.push(new ContextMenuItem('Junior Vets GAPI Test v1.6'));			
			contextMenu = menu;
			
			var gamesGridService:GamesGridService = new GamesGridService("cbbcjuniorvets", "4b69d1f5ce57bc6c89329a4c376f12d46eceaa3d");
			gamesGrid = GamesGridFactory.getGamesGridInstance(gamesGridService, "Test", "JuniorVets", "GAPITest");			
			gamesGrid.addEventListener(GamesGridEvent.USER_LOGGED_IN, userLoggedIn);
			
			var identity:Identity = new Identity();
			identity.showSignInPanel();
		}
		
		private function userLoggedIn(e:GamesGridEvent):void
		{
			Debug.log('\n\nUser signed in. Authenticating...');
			doAuth();
		}
		
		private function doAuth():void 
		{
			auth = GamesGridEndpointFactory.getAuthenticate(gamesGrid);
			auth.addEventListener(GamesGridEvent.FETCH_COMPLETE, authHandler);
			auth.fetch();
		}
		
		private function authHandler(e:Event):void
		{
			Debug.log('Authentication done:');
			
			Debug.log('\tUser.isAuthenticated: ' + User.isAuthenticated);
			Debug.log('\tUser.isSignedIn: ' + User.isSignedIn);
			Debug.log('\tUser.udn: ' + User.udn);
			Debug.log('\tUser.id: ' + User.id);
		}
	}
}
