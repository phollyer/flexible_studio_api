package api.browser.notifiers
{
	import api.browser.Browser;

	import api.events.browser.notifiers.OnBlockedPopUpEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onBlockedPopUp.html Northcode Help Documentation
	*/
	public class OnBlockedPopUp extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var url:String = null;
		
		/**
		* Constructor for Browser.OnBlockedPopUp()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onBlockedPopUp.html Northcode Help Documentation
		*/
		public function OnBlockedPopUp(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_BLOCKED_POP_UP} , {callback:actionComplete, errorSTR:"onBlockedPopUpError", code:"10028"} );
		}
	}
}