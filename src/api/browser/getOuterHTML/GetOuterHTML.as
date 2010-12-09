package api.browser.getOuterHTML
{
	import api.browser.Browser;

	import api.events.browser.getOuterHTML.GetOuterHTMLEvent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.browser.getOuterHTML.GetOuterHTMLEvent.RESULT
	*/
	[Event(name="result", type="api.events.browser.getOuterHTML.GetOuterHTMLEvent")]
	[Bindable]
	/**
	* Retrieve the outer HTML source of the active element.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_getOuterHTML.html Northcode Help Documentation
	*/
	public class GetOuterHTML extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var html:String = null;
		
		/**
		* Constructor for Browser.GetOuterHTML()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_getOuterHTML.html Northcode Help Documentation
		*/
		public function GetOuterHTML(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Retrieve the outer HTML source of the active element.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_getOuterHTML.html Northcode Help Documentation
		*/
		public function getOuterHTML():void
		{
			ssCore.Browser.getOuterHTML( {} , {callback:actionComplete, errorSTR:"getOuterHTMLError", code:"10013"} );
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
			html = r.result;
			var e : GetOuterHTMLEvent = new GetOuterHTMLEvent( GetOuterHTMLEvent.RESULT );
			e.outerHTML = html;
			dispatchEvent( e );
		}
	}
}