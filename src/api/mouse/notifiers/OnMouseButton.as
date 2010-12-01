package api.mouse.notifiers
{
	import api.events.mouse.notifiers.OnMouseButtonEvent;

	import api.mouse.Mouse;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.mouse.notifiers.OnMouseButtonEvent.RESULT
	*/
	[Event(name="result", type="api.events.mouse.onMouseButton.OnMouseButtonEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_onMouseButton.html Northcode Help Documentation
	*/
	public class OnMouseButton extends Mouse
	{
		public static const LEFT:String = "LEFT";
		public static const MIDDLE:String = "MIDDLE";
		public static const RIGHT:String = "RIGHT";
		
		public static const UP:String = "UP";
		public static const DOWN:String = "DOWN";
		public static const DOUBLE_CLICK:String = "DBLCLK";
		
		// Results
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var button:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var state:String = null;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var x:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var y:Number = 0;
		
		/**
		* Constructor for Mouse.OnMouseButton()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_onMouseButton.html Northcode Help Documentation
		*/
		public function OnMouseButton(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Mouse.setNotify( {event:"onMouseButton"}
								   ,{callback:actionComplete, errorSTR:"onMouseButtonError", code:"29012"} );
		}	
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			var __r:Array = r.result.split( COMMA );
			
			button = __r[ 0 ];
			state = __r[ 1 ];
			x = Number( __r[ 2 ] );
			y = Number( __r[ 3 ] );
			
			var e : OnMouseButtonEvent = new OnMouseButtonEvent( OnMouseButtonEvent.RESULT );
			e.button = button;
			e.state = state;
			e.x = x;
			e.y = y;
			dispatchEvent( e );
		}
	}
}