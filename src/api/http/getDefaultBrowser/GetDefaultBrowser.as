package api.http.getDefaultBrowser
{
	import api.events.http.getDefaultBrowser.GetDefaultBrowserEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.http.getDefaultBrowser.GetDefaultBrowserEvent.RESULT
	*/
	[Event(name="result", type="api.events.http.getDefaultBrowser.GetDefaultBrowserEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getDefaultBrowser.html Northcode Help Documentation
	*/
	public class GetDefaultBrowser extends Http
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var browser:String = null;
		
		/**
		* Constructor for Http.GetDefaultBrowser()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getDefaultBrowser.html Northcode Help Documentation
		*/
		public function GetDefaultBrowser(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getDefaultBrowser.html Northcode Help Documentation
		*/
		public function getDefaultBrowser():void
		{
			ssCore.Http.getDefaultBrowser( {}
								 		  ,{callback:actionComplete, errorSTR:"getDefaultBrowserError", code:"4012"} );
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
			browser = r.result;
			
			var e : GetDefaultBrowserEvent = new GetDefaultBrowserEvent( GetDefaultBrowserEvent.RESULT );
			e.browser = browser;
			dispatchEvent( e );
		}
	}
}