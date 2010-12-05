package api.transparent.isMaskedMode
{
	import api.events.transparent.isMaskedMode.IsMaskedModeEvent;

	import api.transparent.Transparent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.transparent.isMaskedMode.IsMaskedModeEvent.RESULT
	*/
	[Event(name="result", type="api.events.transparent.isMaskedMode.IsMaskedModeEvent")]
	[Bindable]
	/**
	* Determine whether transparency is being rendered in masked mode or using layered windows.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_isMaskedMode.html Northcode Help Documentation
	*/
	public class IsMaskedMode extends Transparent
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var isMasked:Boolean = true;
		
		/**
		* Constructor for Transparent.IsMaskedMode()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_isMaskedMode.html Northcode Help Documentation
		*/
		public function IsMaskedMode(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Determine whether transparency is being rendered in masked mode or using layered windows.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Transparent_isMaskedMode.html Northcode Help Documentation
		*/
		public function isMaskedMode():void
		{
			ssCore.Transparent.isMaskedMode( {}
									  		,{callback:actionComplete, errorSTR:"isMaskedModeError", code:"42004"} );
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
			isMasked = checkBoolean( r.result );
			
			var e : IsMaskedModeEvent = new IsMaskedModeEvent( IsMaskedModeEvent.RESULT );
			e.isMasked = isMasked;
			dispatchEvent( e );
		}
	}
}