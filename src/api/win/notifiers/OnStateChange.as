package api.win.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.win.notifiers.OnStateChangeEvent;
	import api.win.Win;
	
	[Event(name="result", type="api.events.win.onStateChange.OnStateChangeEvent")]
	[Bindable]
	public class OnStateChange extends Win
	{
		// Result
		public var data:String = null;
		
		public function OnStateChange(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Win.setNotify( {event:"onStateChange"}
								 ,{callback:actionComplete, errorSTR:"onStateChangeError", code:"6041"} );
		}
		override protected function sendResult( r:Object ):void
		{
			data = r.result;
			var e : OnStateChangeEvent = new OnStateChangeEvent( OnStateChangeEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}		
	}
}