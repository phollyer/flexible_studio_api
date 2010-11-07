package api.app.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.notifiers.OnExitWindowsEvent;
	
	[Event(name="result", type="api.events.app.onExitWindows.OnExitWindowsEvent")]
	[Bindable]
	public class OnExitWindows extends App
	{
		// Results
		public var method:String = null;
		
		public function OnExitWindows(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_EXIT_WINDOWS} , {callback:actionComplete, errorSTR:"onExitWindowsError", code:"8030"} );
		}
		override protected function sendResult( r:Object ):void
		{
			method = r.result;
			var e : OnExitWindowsEvent = new OnExitWindowsEvent( OnExitWindowsEvent.RESULT );
			e.method = method;
			dispatchEvent( e );
		}
		
	}
}