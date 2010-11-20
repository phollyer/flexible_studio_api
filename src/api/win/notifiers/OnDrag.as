package api.win.notifiers
{
	import api.events.win.notifiers.OnDragEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.win.notifiers.OnDragEvent.RESULT
	*/
	[Event(name="result", type="api.events.win.onDrag.OnDragEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_onDrag.html Northcode Help Documentation
	*/
	public class OnDrag extends Win
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		
		/**
		* Constructor for Win.OnDrag()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_onDrag.html Northcode Help Documentation
		*/
		public function OnDrag(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Win.setNotify( {event:"onDrag"}
								 ,{callback:actionComplete, errorSTR:"onDragError", code:"6037"} );
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
			data = r.result;
			
			var e : OnDragEvent = new OnDragEvent( OnDragEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}		
	}
}