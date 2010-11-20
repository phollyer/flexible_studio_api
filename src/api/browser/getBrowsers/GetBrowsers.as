package api.browser.getBrowsers
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	import api.events.browser.getBrowsers.GetBrowsersEvent;
	
	[Event(name="result", type="api.events.browser.getBrowsers.GetBrowsersEvent")]
	[Bindable]
	public class GetBrowsers extends Browser
	{
		public static const DELIMITER:String = ","; // SWF Studio default delimiter for result string
		
		public var browserList:Array = new Array();
		
		public function GetBrowsers(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getBrowsers():void
		{
			ssCore.Browser.getBrowsers( {} , {callback:actionComplete, errorSTR:"getBrowsersError", code:"10011"} );
		}
		override protected function sendResult( r:Object ):void
		{
			browserList = result.split( DELIMITER );
			var e : GetBrowsersEvent = new GetBrowsersEvent( GetBrowsersEvent.RESULT );
			e.browserList = browserList;
			dispatchEvent( e );
		}
	}
}