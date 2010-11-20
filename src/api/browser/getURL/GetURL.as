package api.browser.getURL
{
	import api.browser.Browser;

	import api.events.browser.getURL.GetURLEvent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.browser.getURL.GetURLEvent.RESULT
	*/
	[Event(name="result", type="api.events.browser.getURL.GetURLEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_getURL.html Northcode Help Documentation
	*/
	public class GetURL extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var url:String = null;
		
		/**
		* Constructor for Browser.GetURL()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_getURL.html Northcode Help Documentation
		*/
		public function GetURL(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_getURL.html Northcode Help Documentation
		*/
		public function getURL():void
		{
			ssCore.Browser.getURL( {} , {callback:actionComplete, errorSTR:"getURLError", code:"10015"} );
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
			url = result;
			var e : GetURLEvent = new GetURLEvent( GetURLEvent.RESULT );
			e.url = url;
			dispatchEvent( e );
		}
	}
}