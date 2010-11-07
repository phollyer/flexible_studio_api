package api.app.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.notifiers.OnDesktopChangeEvent;
	
	[Bindable]
	public class OnDesktopChange extends App
	{
		public function OnDesktopChange(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_DESKTOP_CHANGE} , {callback:actionComplete, errorSTR:"onDesktopChangeError", code:"8026"} );
		}
		
	}
}