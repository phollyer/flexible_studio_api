package api.win.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.win.notifiers.OnFocusChangeEvent;
	import api.win.Win;
	
	[Event(name="result", type="api.events.win.onFocusChange.OnFocusChangeEvent")]
	[Bindable]
	public class OnFocusChange extends Win
	{
		// Result
		public var data:String = null;
		
		public function OnFocusChange(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Win.setNotify( {event:"onFocusChange"}
								 ,{callback:actionComplete, errorSTR:"onFocusChangeError", code:"6038"} );
		}
		override protected function sendResult( r:Object ):void
		{
			data = r.result;
			
			var e : OnFocusChangeEvent = new OnFocusChangeEvent( OnFocusChangeEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}		
	}
}