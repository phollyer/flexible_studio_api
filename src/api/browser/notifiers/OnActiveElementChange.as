package api.browser.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	import api.events.browser.notifiers.OnActiveElementChangeEvent;
	
	[Bindable]
	public class OnActiveElementChange extends Browser
	{
		public var href:String = null;
		public var html:String = null;
		
		public function OnActiveElementChange(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_ACTIVE_ELEMENT_CHANGE} , {callback:actionComplete, errorSTR:"onActiveElementChangeError", code:"10027"} );
		}
	}
}