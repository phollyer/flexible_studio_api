package api.mouse.show
{
	import api.events.mouse.show.ShowEvent;

	import api.mouse.Mouse;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.mouse.show.ShowEvent.RESULT
	*/
	[Event(name="result", type="api.events.mouse.show.ShowEvent")]
	[Bindable]
	/**
	* Make the system mouse cursor visible.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_show.html Northcode Help Documentation
	*/
	public class Show extends Mouse
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var displayCounter:Number = 0;
		
		/**
		* Constructor for Mouse.Show()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_show.html Northcode Help Documentation
		*/
		public function Show(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Make the system mouse cursor visible.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_show.html Northcode Help Documentation
		*/
		public function show():void
		{
			ssCore.Mouse.show( {}
							  ,{callback:actionComplete, errorSTR:"showError", code:"29008"} );
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
			
			var e : ShowEvent = new ShowEvent( ShowEvent.RESULT );
			e.displayCounter = displayCounter;
			dispatchEvent( e );
		}
	}
}