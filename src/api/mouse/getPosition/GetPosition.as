package api.mouse.getPosition
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.mouse.getPosition.GetPositionEvent;
	import api.mouse.Mouse;
	
	[Event(name="result", type="api.events.mouse.getPosition.GetPositionEvent")]
	[Bindable]
	public class GetPosition extends Mouse
	{
		public static const FLASH:String = "flash";
		public static const SCREEN:String = "screen";
		
		// Optional
		public var system:String = FLASH;
		
		// Results
		public var x:Number = 0;
		public var y:Number = 0;
		
		public function GetPosition(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getPosition():void
		{
			ssCore.Mouse.getPosition( {system:system}
									 ,{callback:actionComplete, errorSTR:"getPositionError", code:"29000"} );
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