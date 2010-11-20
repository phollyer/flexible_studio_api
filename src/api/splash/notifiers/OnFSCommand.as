package api.splash.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.splash.notifiers.OnFSCommandEvent;
	import api.splash.Splash;

	[Event(name="result", type="api.events.splash.onFSCommand.OnFSCommandEvent")]
	[Bindable]
	public class OnFSCommand extends Splash
	{
		public static const ON_FS_COMMAND:String = "onFSCommand";
		
		public var args:String = null;
		public var command:String = null;
		public var data:String = null;
		
		public function OnFSCommand(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Splash.setNotify( {event:ON_FS_COMMAND} , {callback:actionComplete, errorSTR:"onFSCommandError", code:"5005"} );
		}
		private function sendResults( result:String ):void
		{
			data = result;
			command = data.split( "," )[ 0 ];
			args = data.split( "," )[ 1 ];
			
			var event : OnFSCommandEvent = new OnFSCommandEvent( OnFSCommandEvent.RESULT )
			events.args = args;
			events.command = command;
			events.result = data;
			dispatchEvent( event );
		}
	}
}