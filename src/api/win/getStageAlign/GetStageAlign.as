package api.win.getStageAlign
{
	import api.events.win.getStageAlign.GetStageAlignEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.win.getStageAlign.GetStageAlignEvent.RESULT
	*/
	[Event(name="result", type="api.events.win.getStageAlign.GetStageAlignEvent")]
	[Bindable]
	/**
	* Get the current stage alignment.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_getStageAlign.html Northcode Help Documentation
	*/
	public class GetStageAlign extends Win
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var alignment:String = null;
		
		/**
		* Constructor for Win.GetStageAlign()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_getStageAlign.html Northcode Help Documentation
		*/
		public function GetStageAlign(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Get the current stage alignment.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_getStageAlign.html Northcode Help Documentation
		*/
		public function getStageAlign():void
		{
			ssCore.Win.getStageAlign( {}
									 ,{callback:actionComplete, errorSTR:"getStageAlignError", code:"6006"} );
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
			alignment = r.result;
			
			var e : GetStageAlignEvent = new GetStageAlignEvent( GetStageAlignEvent.RESULT );
			e.alignment = alignment;
			dispatchEvent( e );
		}
	}
}