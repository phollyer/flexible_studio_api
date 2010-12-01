package api.browser.notifiers
{
	import api.browser.Browser;

	import api.events.browser.notifiers.OnActiveElementChangeEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onActiveElementChange.html Northcode Help Documentation
	*/
	public class OnActiveElementChange extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var href:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var html:String = null;
		
		/**
		* Constructor for Browser.OnActiveElementChange()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onActiveElementChange.html Northcode Help Documentation
		*/
		public function OnActiveElementChange(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_ACTIVE_ELEMENT_CHANGE} , {callback:actionComplete, errorSTR:"onActiveElementChangeError", code:"10027"} );
		}
	}
}