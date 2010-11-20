package api.browser.notifiers
{
	import api.browser.Browser;

	import api.events.browser.notifiers.OnDocumentCompleteEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onDocumentComplete.html Northcode Help Documentation
	*/
	public class OnDocumentComplete extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var url:String = null;
		
		/**
		* Constructor for Browser.OnDocumentComplete()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onDocumentComplete.html Northcode Help Documentation
		*/
		public function OnDocumentComplete(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_DOCUMENT_COMPLETE} , {callback:actionComplete, errorSTR:"onDocumentCompleteError", code:"10030"} );
		}	
	}
}