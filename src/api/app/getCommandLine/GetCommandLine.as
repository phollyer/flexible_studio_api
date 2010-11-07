package api.app.getCommandLine
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.getCommandLine.GetCommandLineEvent;

	[Event(name="result", type="api.events.app.getCommandLine.GetCommandLineEvent")]
	[Bindable]
	public class GetCommandLine extends App
	{
		// Result
		public var commandLine:String = null;
		
		public function GetCommandLine(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getCommandLine():void
		{
			ssCore.App.getCommandLine( {} , {callback:actionComplete, errorSTR:"getCommandLineError", code:"8012"} );
		}
		override protected function sendResult( r:Object ):void
		{
			commandLine = r.result;
			var e : GetCommandLineEvent = new GetCommandLineEvent( GetCommandLineEvent.RESULT );
			e.commandLine = commandLine;
			dispatchEvent( e );
		}
	}
}