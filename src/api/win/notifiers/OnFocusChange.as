package api.win.notifiers
{
	import api.events.win.notifiers.OnFocusChangeEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.win.notifiers.OnFocusChangeEvent.RESULT
	*/
	[Event(name="result", type="api.events.win.onFocusChange.OnFocusChangeEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_onFocusChange.html Northcode Help Documentation
	*/
	public class OnFocusChange extends Win
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		
		/**
		* Constructor for Win.OnFocusChange()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_onFocusChange.html Northcode Help Documentation
		*/
		public function OnFocusChange(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Win.setNotify( {event:"onFocusChange"}
								 ,{callback:actionComplete, errorSTR:"onFocusChangeError", code:"6038"} );
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
			
			var e : OnFocusChangeEvent = new OnFocusChangeEvent( OnFocusChangeEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}		
	}
}