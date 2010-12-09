package api.win.getPosition
{
	import api.events.win.getPosition.GetPositionEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.win.getPosition.GetPositionEvent.RESULT
	*/
	[Event(name="result", type="api.events.win.getPosition.GetPositionEvent")]
	[Bindable]
	/**
	* Get the current position of the application window.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_getPosition.html Northcode Help Documentation
	*/
	public class GetPosition extends Win
	{
		// Result
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
		* Constructor for Win.GetPosition()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_getPosition.html Northcode Help Documentation
		*/
		public function GetPosition(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Get the current position of the application window.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_getPosition.html Northcode Help Documentation
		*/
		public function getPosition():void
		{
			ssCore.Win.getPosition( {}
								   ,{callback:actionComplete, errorSTR:"getPositionError", code:"6004"} );
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