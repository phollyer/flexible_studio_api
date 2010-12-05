package api.mouse.hide
{
	import api.events.mouse.hide.HideEvent;

	import api.mouse.Mouse;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.mouse.hide.HideEvent.RESULT
	*/
	[Event(name="result", type="api.events.mouse.hide.HideEvent")]
	[Bindable]
	/**
	* Hide the system mouse cursor.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_hide.html Northcode Help Documentation
	*/
	public class Hide extends Mouse
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var displayCounter:Number = 0;
		
		/**
		* Constructor for Mouse.Hide()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_hide.html Northcode Help Documentation
		*/
		public function Hide(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Hide the system mouse cursor.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_hide.html Northcode Help Documentation
		*/
		public function hide():void
		{
			ssCore.Mouse.hide( {}
							  ,{callback:actionComplete, errorSTR:"hideError", code:"29001"} );
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
			displayCounter = Number( r.result );
			
			var e : HideEvent = new HideEvent( HideEvent.RESULT );
			e.displayCounter = displayCounter;
			dispatchEvent( e );
		}
	}
}