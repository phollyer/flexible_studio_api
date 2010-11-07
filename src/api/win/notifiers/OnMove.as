package api.win.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.win.notifiers.OnMoveEvent;
	import api.win.Win;
	
	[Event(name="result", type="api.events.win.onMove.OnMoveEvent")]
	[Bindable]
	public class OnMove extends Win
	{
		// Result
		public var x:Number = -1;
		public var y:Number = -1;
		
		public function OnMove(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Win.setNotify( {event:"onMove"}
								 ,{callback:actionComplete, errorSTR:"onMoveError", code:"6039"} );
		}
		override protected function sendResult( r:Object ):void
		{
			var __a:Array = r.result.split( COMMA );
			x = Number( __a[ 0 ] );
			y = Number( __a[ 1 ] );
			
			var e : OnMoveEvent = new OnMoveEvent( OnMoveEvent.RESULT );
			e.y = y;
			e.x = x;
			dispatchEvent( e );
		}		
	}
}