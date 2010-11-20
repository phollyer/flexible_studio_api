package api.browser.notifiers
{
	import api.browser.Browser;

	import api.events.browser.notifiers.OnPreviewEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onPreview.html Northcode Help Documentation
	*/
	public class OnPreview extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var url:String = null;
		
		/**
		* Constructor for Browser.OnPreview()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onPreview.html Northcode Help Documentation
		*/
		public function OnPreview(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_PREVIEW} , {callback:actionComplete, errorSTR:"onPreviewError", code:"10032"} );
		}	
	}
}