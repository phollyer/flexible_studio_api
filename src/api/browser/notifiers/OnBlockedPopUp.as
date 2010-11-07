package api.browser.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	import api.events.browser.notifiers.OnBlockedPopUpEvent;
	
	[Bindable]
	public class OnBlockedPopUp extends Browser
	{
		public var url:String = null;
		
		public function OnBlockedPopUp(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_BLOCKED_POP_UP} , {callback:actionComplete, errorSTR:"onBlockedPopUpError", code:"10028"} );
		}
		}		
	}
}