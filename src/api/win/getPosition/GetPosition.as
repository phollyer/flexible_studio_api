package api.win.getPosition
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.win.getPosition.GetPositionEvent;
	import api.win.Win;
	
	[Event(name="result", type="api.events.win.getPosition.GetPositionEvent")]
	[Bindable]
	public class GetPosition extends Win
	{
		// Result
		public var x:Number = 0;
		public var y:Number = 0;
		
		public function GetPosition(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getPosition():void
		{
			ssCore.Win.getPosition( {}
								   ,{callback:actionComplete, errorSTR:"getPositionError", code:"6004"} );
		}
		override protected function sendResult( r:Object ):void
		{
			x = Number( r.x );
			y = Number( r.y );
			
			var e : GetPositionEvent = new GetPositionEvent( GetPositionEvent.RESULT );
			e.x = x;
			e.y = y;
			dispatchEvent( e );
		}
	}
}