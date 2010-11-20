package api.win.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.win.notifiers.OnResizeEvent;
	import api.win.Win;
	
	[Event(name="result", type="api.events.win.onResize.OnResizeEvent")]
	[Bindable]
	public class OnResize extends Win
	{
		// Result
		public var clientHeight:Number = -1;
		public var clientWidth:Number = -1;
		public var height:Number = -1;
		public var width:Number = -1;
		
		public function OnResize(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Win.setNotify( {event:"onResize"}
								 ,{callback:actionComplete, errorSTR:"onResizeError", code:"6040"} );
		}
		override protected function sendResult( r:Object ):void
		{
			var __a:Array = r.result.split( COMMA );
			width = Number( __a[ 0 ] );
			height = Number( __a[ 1 ] );
			clientWidth = Number( __a[ 2 ] );
			clientHeight = Number( __a[ 3 ] );
			
			var e : OnResizeEvent = new OnResizeEvent( OnResizeEvent.RESULT );
			e.clientHeight = clientHeight;
			e.clientWidth = clientWidth;
			e.height = height;
			e.width = width;
			dispatchEvent( e );
		}		
	}
}