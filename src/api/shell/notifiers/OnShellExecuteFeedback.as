package api.shell.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.shell.notifiers.OnShellExecuteFeedbackEvent;
	import api.shell.Shell;
	
	[Event(name="result", type="api.events.shell.onShellExecuteFeedback.OnShellExecuteFeedbackEvent")]
	[Bindable]
	public class OnShellExecuteFeedback extends Shell
	{
		// Result
		public var data:String = null;
		
		public function OnShellExecuteFeedback(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Shell.setNotify( {event:"onShellExecuteFeedback"}
								   ,{callback:actionComplete, errorSTR:"onShellExecuteFeedbackError", code:"3009"} );
		}
		override protected function sendResult( r:Object ):void
		{
			data = r.result;
			
			var e : OnShellExecuteFeedbackEvent = new OnShellExecuteFeedbackEvent( OnShellExecuteFeedbackEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}