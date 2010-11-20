package api.browser.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	import api.events.browser.notifiers.OnProgressEvent;

	[Bindable]
	public class OnProgress extends Browser
	{
		public var bytesLoaded:Number = 0;
		public var bytesTotal:Number = 0;
		
		public function OnProgress(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_PROGRESS} , {callback:actionComplete, errorSTR:"onProgressError", code:"10033"} );
		}
		}		
	}
}