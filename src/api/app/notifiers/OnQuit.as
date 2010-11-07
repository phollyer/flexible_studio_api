package api.app.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.notifiers.OnQuitEvent;
	
	[Bindable]
	public class OnQuit extends App
	{
		public function OnQuit(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_QUIT} , {callback:actionComplete, errorSTR:"onQuitError", code:"8003"} );
		}
	}
}