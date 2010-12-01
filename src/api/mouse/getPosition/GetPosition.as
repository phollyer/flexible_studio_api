package api.mouse.getPosition
{
	import api.events.mouse.getPosition.GetPositionEvent;

	import api.mouse.Mouse;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.mouse.getPosition.GetPositionEvent.RESULT
	*/
	[Event(name="result", type="api.events.mouse.getPosition.GetPositionEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_getPosition.html Northcode Help Documentation
	*/
	public class GetPosition extends Mouse
	{
		public static const FLASH:String = "flash";
		public static const SCREEN:String = "screen";
		
		// Optional
		/**
		* 
		*
		* @defaultValue <code>FLASH</code>
		*/
		public var system:String = FLASH;
		
		// Results
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
		* Constructor for Mouse.GetPosition()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_getPosition.html Northcode Help Documentation
		*/
		public function GetPosition(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_getPosition.html Northcode Help Documentation
		*/
		public function getPosition():void
		{
			ssCore.Mouse.getPosition( {system:system}
									 ,{callback:actionComplete, errorSTR:"getPositionError", code:"29000"} );
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
			x = Number( r.x );
			y = Number( r.y );
			
			var e : GetPositionEvent = new GetPositionEvent( GetPositionEvent.RESULT );
			e.x = x;
			e.y = y;
			dispatchEvent( e );
		}
	}
}