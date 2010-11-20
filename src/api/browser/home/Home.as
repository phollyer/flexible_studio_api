package api.browser.home
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	[Bindable]
	public class Home extends Browser
	{
		public function Home(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function home():void
		{
			ssCore.Browser.home( {} , {callback:actionComplete, errorSTR:"homeError", code:"10016"} );
		}
	}
}