package api.browser.getHREF
{
	import api.browser.Browser;

	import api.events.browser.getHREF.GetHREFEvent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.browser.getHREF.GetHREFEvent.RESULT
	*/
	[Event(name="result", type="api.events.browser.getHREF.GetHREFEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_getHREF.html Northcode Help Documentation
	*/
	public class GetHREF extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var href:String = null;
		
		/**
		* Constructor for Browser.GetHREF()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_getHREF.html Northcode Help Documentation
		*/
		public function GetHREF(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_getHREF.html Northcode Help Documentation
		*/
		public function getHREF():void
		{
			ssCore.Browser.getHREF( {} , {callback:actionComplete, errorSTR:"getHREFError", code:"10012"} );
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
			href = result;
			var e : GetHREFEvent = new GetHREFEvent( GetHREFEvent.RESULT );
			e.href = href;
			dispatchEvent( e );
		}
	}
}