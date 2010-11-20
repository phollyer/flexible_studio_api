package api.browser.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	import api.events.browser.notifiers.OnStatusEvent;

	[Bindable]
	public class OnStatus extends Browser
	{
		public var text:String = null;
		
		public function OnStatus(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_STATUS} , {callback:actionComplete, errorSTR:"onStatusError", code:"10034"} );
		}
		}		
	}
}