package api.win.notifiers
{
	import api.events.win.notifiers.OnStateChangeEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.win.notifiers.OnStateChangeEvent.RESULT
	*/
	[Event(name="result", type="api.events.win.onStateChange.OnStateChangeEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_onStateChange.html Northcode Help Documentation
	*/
	public class OnStateChange extends Win
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		
		/**
		* Constructor for Win.OnStateChange()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_onStateChange.html Northcode Help Documentation
		*/
		public function OnStateChange(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Win.setNotify( {event:"onStateChange"}
								 ,{callback:actionComplete, errorSTR:"onStateChangeError", code:"6041"} );
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
			var e : OnStateChangeEvent = new OnStateChangeEvent( OnStateChangeEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}		
	}
}