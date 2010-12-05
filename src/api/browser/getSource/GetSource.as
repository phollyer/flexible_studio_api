package api.browser.getSource
{
	import api.browser.Browser;

	import api.events.browser.getSource.GetSourceEvent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.browser.getSource.GetSourceEvent.RESULT
	*/
	[Event(name="result", type="api.events.browser.getSource.GetSourceEvent")]
	[Bindable]
	/**
	* Retrieve the HTML source of the currently displayed page.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_getSource.html Northcode Help Documentation
	*/
	public class GetSource extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var source:String = null;
		
		/**
		* Constructor for Browser.GetSource()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_getSource.html Northcode Help Documentation
		*/
		public function GetSource(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Retrieve the HTML source of the currently displayed page.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_getSource.html Northcode Help Documentation
		*/
		public function getSource():void
		{
			ssCore.Browser.getSource( {} , {callback:actionComplete, errorSTR:"getSourceError", code:"10014"} );
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
			source = r.result;
			var e : GetSourceEvent = new GetSourceEvent( GetSourceEvent.RESULT );
			e.source = source;
			dispatchEvent( e );
		}
	}
}