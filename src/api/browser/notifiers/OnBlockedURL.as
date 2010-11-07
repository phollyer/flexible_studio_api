package api.browser.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	import api.events.browser.notifiers.OnBlockedURLEvent;

	[Bindable]
	public class OnBlockedURL extends Browser
	{
		public var url:String = null;
		
		public function OnBlockedURL(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_BLOCKED_URL} , {callback:actionComplete, errorSTR:"onBlockedURLError", code:"10029"} );
		}
	}
}