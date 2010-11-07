package api.win.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.win.notifiers.OnDragEvent;
	import api.win.Win;
	
	[Event(name="result", type="api.events.win.onDrag.OnDragEvent")]
	[Bindable]
	public class OnDrag extends Win
	{
		// Result
		public var data:String = null;
		
		public function OnDrag(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Win.setNotify( {event:"onDrag"}
								 ,{callback:actionComplete, errorSTR:"onDragError", code:"6037"} );
		}
		override protected function sendResult( r:Object ):void
		{
			data = r.result;
			
			var e : OnDragEvent = new OnDragEvent( OnDragEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}		
	}
}