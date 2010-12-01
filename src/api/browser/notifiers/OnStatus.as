package api.browser.notifiers
{
	import api.browser.Browser;

	import api.events.browser.notifiers.OnStatusEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onStatus.html Northcode Help Documentation
	*/
	public class OnStatus extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var text:String = null;
		
		/**
		* Constructor for Browser.OnStatus()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onStatus.html Northcode Help Documentation
		*/
		public function OnStatus(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_STATUS} , {callback:actionComplete, errorSTR:"onStatusError", code:"10034"} );
		}		
	}
}