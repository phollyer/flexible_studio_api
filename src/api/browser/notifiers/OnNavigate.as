package api.browser.notifiers
{
	import api.browser.Browser;

	import api.events.browser.notifiers.OnNavigateEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onNavigate.html Northcode Help Documentation
	*/
	public class OnNavigate extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var url:String = null;
		
		/**
		* Constructor for Browser.OnNavigate()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onNavigate.html Northcode Help Documentation
		*/
		public function OnNavigate(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_NAVIGATE} , {callback:actionComplete, errorSTR:"onNavigateError", code:"10031"} );
		}	
	}
}