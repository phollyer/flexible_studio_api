package api.app.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.notifiers.OnOtherInstanceEvent;
	
	[Event(name="result", type="api.events.app.onOtherInstance.OnOtherInstanceEvent")]
	[Bindable]
	public class OnOtherInstance extends App
	{
		// Result
		public var commandLine:String = null;
		
		public function OnOtherInstance(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_OTHER_INSTANCE} , {callback:actionComplete, errorSTR:"onOtherInstanceError", code:"8031"} );
		}
		override protected function sendResult( r:Object ):void
		{
			commandLine = r.result;
			var e : OnOtherInstanceEvent = new OnOtherInstanceEvent( OnOtherInstanceEvent.RESULT );
			e.commandLine = commandLine;
			dispatchEvent( e );
		}
	}
}