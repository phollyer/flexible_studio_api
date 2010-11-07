package api.browser.getURL
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	import api.events.browser.getURL.GetURLEvent;
	
	[Event(name="result", type="api.events.browser.getURL.GetURLEvent")]
	[Bindable]
	public class GetURL extends Browser
	{
		public var url:String = null;
		
		public function GetURL(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getURL():void
		{
			ssCore.Browser.getURL( {} , {callback:actionComplete, errorSTR:"getURLError", code:"10015"} );
		}
		override protected function sendResult( r:Object ):void
		{
			url = result;
			var e : GetURLEvent = new GetURLEvent( GetURLEvent.RESULT );
			e.url = url;
			dispatchEvent( e );
		}
	}
}