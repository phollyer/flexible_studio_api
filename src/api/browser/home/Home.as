package api.browser.home
{
	import api.browser.Browser;

	import api.events.browser.home.HomeEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_home.html Northcode Help Documentation
	*/
	public class Home extends Browser
	{
		/**
		* Constructor for Browser.Home()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_home.html Northcode Help Documentation
		*/
		public function Home(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_home.html Northcode Help Documentation
		*/
		public function home():void
		{
			ssCore.Browser.home( {} , {callback:actionComplete, errorSTR:"homeError", code:"10016"} );
		}
	}
}