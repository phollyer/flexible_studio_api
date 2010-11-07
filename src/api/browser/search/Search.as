package api.browser.search
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	[Bindable]
	public class Search extends Browser
	{
		public function Search(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function search():void
		{
			ssCore.Browser.search( {} , {callback:actionComplete, errorSTR:"searchError", code:"10023"} );
		}
	}
}