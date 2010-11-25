package api.browser.getBrowsers
{
	import api.browser.Browser;

	import api.events.browser.getBrowsers.GetBrowsersEvent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.browser.getBrowsers.GetBrowsersEvent.RESULT
	*/
	[Event(name="result", type="api.events.browser.getBrowsers.GetBrowsersEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_getBrowsers.html Northcode Help Documentation
	*/
	public class GetBrowsers extends Browser
	{
		public static const DELIMITER:String = ","; // SWF Studio default delimiter for result string
		
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var browserList:Array = new Array();
		
		/**
		* Constructor for Browser.GetBrowsers()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_getBrowsers.html Northcode Help Documentation
		*/
		public function GetBrowsers(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_getBrowsers.html Northcode Help Documentation
		*/
		public function getBrowsers():void
		{
			ssCore.Browser.getBrowsers( {} , {callback:actionComplete, errorSTR:"getBrowsersError", code:"10011"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			browserList = r.split( DELIMITER );
			var e : GetBrowsersEvent = new GetBrowsersEvent( GetBrowsersEvent.RESULT );
			e.browserList = browserList;
			dispatchEvent( e );
		}
	}
}