package api.browser.close
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	[Bindable]
	public class Close extends Browser
	{
		public function Close(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function closeBrowser():void
		{
			ssCore.Browser.close( {} , {callback:actionComplete, errorSTR:"closeError", code:"10009"} );
		}
	}
}